local function lerp(start, vend, time)
    return start + (vend - start) * time
end

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

local block_data = {
    x = 0,
    y = 0,
    w = 50,
    h = 50,
}

register_callback(e_callbacks.PAINT, function() 
    local screen = engine.get_screen_size()
    local dpi = {}
    dpi.x = screen.x / 1920
    dpi.y = screen.y / 1080

    render.rectangle_filled(block_data.x, block_data.y,  block_data.w * dpi.x,  block_data.h * dpi.y, 255, 255, 255, 255)
    block_data.x = lerp(block_data.x, 1920 - block_data.w * dpi.x, globals.abs_frame_time());
    block_data.y = lerp(block_data.y, 1080 - block_data.h * dpi.y, globals.abs_frame_time());
end)