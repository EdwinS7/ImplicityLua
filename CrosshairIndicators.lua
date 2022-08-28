--custom definitions
local print, get_int = client.log, menu.get_value_int

local e_cheat = {
    screen_size = engine.get_screen_size(), --This can change but not in the script because this is only set on load.
}
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

local e_data = {
    indicator_height = 0,
}

local function test_func(Str, Cond, ClrR, ClrG, ClrB, ClrA)
    if ClrR == nil then ClrR = 255 end
    if ClrG == nil then ClrG = 255 end
    if ClrB == nil then ClrB = 255 end
    if ClrA == nil then ClrA = 255 end

    if Cond then
        e_data.indicator_height = e_data.indicator_height + 1
        render.text(Str, e_cheat.screen_size.x / 2, e_cheat.screen_size.y / 2 + (10 * e_data.indicator_height), ClrR, ClrG, ClrB, ClrA, 0, 0, 0, 0, 0, 0)
    end
end

client.set_event_callback( e_callbacks.PAINT, function()
    if not engine.is_in_game() then return end

    local e_binds = {
        ["doubletap"] = get_int(menu.create_reference("AIMBOT", "Exploits", "##DoubletapKey")) == 1,
        ["hideshots"] = get_int(menu.create_reference("AIMBOT", "Exploits", "##HideshotsKey")) == 1,
        ["damageoverride"] = get_int(menu.create_reference("AIMBOT", "General", "Damage Override Key")) == 1,
        --["forcebodyaim"] = get_int(menu.create_reference("AIMBOT", "General", "Force Body Aim Key")) == 1,
        --["forcesafepoint"] = get_int(menu.create_reference("AIMBOT", "General", "Force Safepoint Key")) == 1,
        ["autopeek"] = get_int(menu.create_reference("MISC", "Miscellaneous", "##PeekAssistKey")) == 1,
        ["freestand"] = get_int(menu.create_reference("ANTI-AIMBOT", "Anti-Aimbot Angles", "##RealYawFreestandingKey")) == 1,
        ["slowwalk"] = get_int(menu.create_reference("ANTI-AIMBOT", "Others", "##Slowwalkey")) == 1,
        ["fakeduck"] = get_int(menu.create_reference("ANTI-AIMBOT", "Others", "##FakeDuckKey")) == 1,
        ["thirdperson"] = get_int(menu.create_reference("VISUALS_PLAYERS", "View", "##ThirdPersonKey")) == 1,
    }
    
    test_func("DT", e_binds["doubletap"], 255, 255, 255, 255)
    test_func("HS", e_binds["hideshots"], 255, 255, 255, 255)
    test_func("DMG", e_binds["damageoverride"], 255, 255, 255, 255)
    --test_func("SAFE", e_binds["forcesafepoint"], 255, 255, 255, 255)
    --test_func("BAIM", e_binds["forcebodyaim"], 255, 255, 255, 255)
    test_func("PEEK", e_binds["autopeek"], 255, 255, 255, 255)
    test_func("FREESTAND", e_binds["freestand"], 255, 255, 255, 255)
    test_func("FD", e_binds["fakeduck"], 255, 255, 255, 255)

    e_data.indicator_height = 0;
end)