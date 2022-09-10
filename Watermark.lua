--Setup shit
local function clamp(x, min, max)
	return x < min and min or x > max and max or x
end
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
--Create fonts
local MainFont = create_font("Tahoma", 14, 400, 20) --20 for antiailias?

register_callback(e_callbacks.PAINT, function() 
    local extra_width = 6;
    local line_size = 2;
    local text = "Implicity.win [" .. client.get_power_level() .. "] / " .. client.get_username() .. " (" .. client.get_userid() .. ")"
    local text_size = render.custom_font_get_text_size(MainFont, text)
    render.rectangle_gradient(((1920 - 15) - text_size.x) - extra_width, 15 - line_size, text_size.x + extra_width, line_size, 255, 0, 100, 255, --[[color 2]] 255, 0, 0, 255)
    render.rectangle_filled(((1920 - 15) - text_size.x) - extra_width, 15, text_size.x + extra_width, 16, 0, 0, 0, 150)
    render.custom_text(MainFont, text, ((1920 - 15) - text_size.x) - extra_width / 2, 15, 255, 255, 255, 255, 0)
end)