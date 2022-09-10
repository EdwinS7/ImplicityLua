local print, create_font, register_callback = client.log, render.create_custom_font, client.set_event_callback

local screen = engine.get_screen_size()

local dpi = {}
dpi.x = screen.x / 1920
dpi.y = screen.y / 1080

local e_callbacks = { --Based off prims.
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

local bullet_impact = {}
register_callback(e_callbacks.AIMBOT_HIT, function(event) 
    table.insert(bullet_impact, {event.bullet_impact_position.x, event.bullet_impact_position.y, event.bullet_impact_position.z, globals.real_time()})
end)

local settings = {
    size = 8,
    width = 2,
    r = 255,
    g = 255,
    b = 255,
    a = 255,
    time = 2.5,
}

register_callback(e_callbacks.PAINT, function() 
    for i = 1,#bullet_impact do
        if bullet_impact[i][4] + settings.time < globals.real_time() then table.remove(bullet_impact, i) end

        local pos = render.world_to_screen(bullet_impact[i][1], bullet_impact[i][2], bullet_impact[i][3])
        render.rectangle_filled((pos.x - settings.size / 2) - settings.width / 2, pos.y - settings.width / 2, settings.size + 2, settings.width, settings.r, settings.g, settings.b, settings.a)
        render.rectangle_filled(pos.x - settings.width / 2, (pos.y - settings.size / 2) - settings.width / 2, settings.width, settings.size + 2, settings.r, settings.g, settings.b, settings.a)
    end
end)