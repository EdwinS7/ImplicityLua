local print, create_font, register_callback = client.log, render.create_custom_font, client.set_event_callback
local e_callbacks = {
    FRAME_NET_UPDATE_START = "frame_net_update_start",
    FRAME_NET_UPDATE_POSTDATAUPDATE_START = "frame_net_update_postdataupdate_start",
    FRAME_NET_UPDATE_POSTDATAUPDATE_END = "frame_net_update_postdataupdate_end",
    FRAME_NET_UPDATE_END = "frame_net_update_end",
    FRAME_RENDER_START = "frame_render_start",
    FRAME_RENDER_END = "frame_render_end",
    PAINT = "paint_traverse",
    PRE_PREDICTION = "pre_engine_prediction",
    IN_PREDICTION = "in_engine_prediction",
    POST_PREDICTION = "post_engine_prediction",
    AIMBOT_HIT = "aim_hurt",
    AIMBOT_MISS = "aim_fire",
    AIMBOT_SHOOT = "aim_miss",
    LOCAL_ANIM_START = "local_anim_start",
    LOCAL_ANIM_PRE_UPDATE = "local_anim_pre_update",
    LOCAL_ANIM_POST_UPDATE = "local_anim_post_update",
    LOCAL_ANIM_END = "local_anim_end",
}

local function switch(case)
    return function(codetable)
        local f
        f = codetable[case] or codetable.default
        if f then
            if type(f)=="function" then
                return f(case)
            else
                error("case "..tostring(case).." not a function")
            end
        end
    end
end

local miss_table = {}
register_callback( "aim_hurt", function(event)
    local aim_player = event.aim_player
    local enemy = entity.get_entity(aim_player)
    if miss_table[entity.get_player_name(enemy)] == nil then miss_table[entity.get_player_name(enemy)] = 0 end

    local delta = 0;
    local miss_idx = miss_table[entity.get_player_name(enemy)]
    miss_idx = miss_idx + 1

    --Restart when we go over 9 misses.
    if miss_idx > 9 then miss_idx = 1 end

    for case = 1, 10 do
        switch(miss_idx) {
            [1] = function() delta = 60 end,
            [2] = function() delta = -60 end,
            [3] = function() delta = 30 end,
            [4] = function() delta = -30 end,
            [5] = function() delta = 0 end,
            [6] = function() delta = 15 end,
            [7] = function() delta = -15 end,
            [8] = function() delta = 45 end,
            [9] = function() delta = -45 end,
        }
    end

    plist.set(enemy, "Override Body Yaw", 1);
    plist.set(enemy, "Body Yaw Value", delta);

    --Dumb ik but deal with it nn!
    miss_table[entity.get_player_name(enemy)] = miss_idx;
end)