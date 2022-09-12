--Change (screen_x, screen_y) values to your native resoloution for renderer to work properly.
--use debug to find errors while coding.
local developer_data = {
    debug = true,
    screen_x = 1920,
    screen_y = 1080,
    bigboynumber = 999999999, --no touch!
}

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

local DpiScale = {}

register_callback(e_callbacks.PAINT, function() 
    local screen = engine.get_screen_size()

    DpiScale.x = screen.x / developer_data.screen_x
    DpiScale.y = screen.y / developer_data.screen_y
end)

local default_data = {
    default_font = create_font("Tahoma", 14, 400, 20),
}

local myclient = {}; myclient.__index = {};
local renderer = {}; renderer.__index = {};
local mathmatics = {}; mathmatics.__index = {};
local raytracing = {}; raytracing.__index = {};

function myclient.SetCameraOffset(pos)
    client.set_camera_offset(pos.x, pos.y, pos.z)
end

function renderer.Color(r, g, b, a)
    local args = {}
    args.r = mathmatics.Clamp(r, 0, 255)
    args.g = mathmatics.Clamp(g, 0, 255)
    args.b = mathmatics.Clamp(b, 0, 255)
    args.a = mathmatics.Clamp(a, 0, 255)

    return args
end

function renderer.Colour(r, g, b, a)
    local args = {}
    args.r = mathmatics.Clamp(r, 0, 255)
    args.g = mathmatics.Clamp(g, 0, 255)
    args.b = mathmatics.Clamp(b, 0, 255)
    args.a = mathmatics.Clamp(a, 0, 255)

    return args
end

function Vec2(x, y)
    local args = {}
    args.x = mathmatics.Clamp(x, 0, developer_data.bigboynumber)
    args.y = mathmatics.Clamp(y, 0, developer_data.bigboynumber)
    
    return args
end

function Vec3(x, y, z)
    local args = {}
    args.x = mathmatics.Clamp(x, 0, developer_data.bigboynumber)
    args.y = mathmatics.Clamp(y, 0, developer_data.bigboynumber)
    args.z = mathmatics.Clamp(z, 0, developer_data.bigboynumber)

    return args
end

--todo: use bit.bore for multiple flags, example: bit.bore(1, 2, 3)
function renderer.CreateFont(fontname, size, weight, flags)
    if fontname == nil then if developer_data.debug == true then print("ERROR: argument 'fontname' not found!") end fontname = "Tahoma" end
    if size == nil then if developer_data.debug == true then print("ERROR: argument 'size' not found!") end size = 14 end
    if weight == nil then if developer_data.debug == true then print("ERROR: argument 'weight' not found!") end weight = 400 end
    if flags == nil then if developer_data.debug == true then print("ERROR: argument 'flags' not found!") end flags = 20 end

    render.create_custom_font(fontname, size, weight, flags)
end

function renderer.GetTextSize(font, text)
    if font == nil then font = default_data.default_font end
    if text == nil then if developer_data.debug == true then print("ERROR: argument 'text' not found!") end text = false end

    return render.custom_font_get_text_size(font, text)
end

function renderer.Text(font, text, pos, color, shadow)
    if font == nil then font = default_data.default_font end
    if text == nil then if developer_data.debug == true then print("ERROR: argument 'text' not found!") end text = "ERROR: argument 'text' not found!" end
    if pos == nil then if developer_data.debug == true then print("ERROR: argument 'pos' not found!") end pos = Vec2(0, 0) end
    if color == nil then if developer_data.debug == true then print("ERROR: argument 'color' / 'colour' not found!") end color = renderer.Color(255, 255, 255, 255) end
    if shadow == nil then if developer_data.debug == true then print("ERROR: argument 'shadow' not found!") end shadow = false end

    if not shadow then
        render.custom_text(font, text, pos.x, pos.y, color.r, color.g, color.b, color.a)
    else
        render.custom_text(font, text, pos.x+1, pos.y+1, 0, 0, 0, color.a)
        render.custom_text(font, text, pos.x, pos.y, color.r, color.g, color.b, color.a)
    end
end

function renderer.Rectangle(pos, size, color, filled)
    if pos == nil then if developer_data.debug == true then print("ERROR: argument 'pos' not found!") end pos = Vec2(0, 0) end
    if size == nil then if developer_data.debug == true then print("ERROR: argument 'pos2' not found!") end size = Vec2(50, 50) end
    if color == nil then if developer_data.debug == true then print("ERROR: argument 'color' / 'colour' not found!") end color = renderer.Color(255, 255, 255, 255) end
    if filled == nil then if developer_data.debug == true then print("ERROR: argument 'filled' not found!") end filled = false end

    if not filled then
        render.rectangle(pos.x, pos.y, size.x, size.y, color.r, color.g, color.b, color.a)
    else
        render.rectangle_filled(pos.x, pos.y, size.x, size.y, color.r, color.g, color.b, color.a)
    end
end

--Request: add gradient horizontal support for normal render.
function renderer.Gradient(pos, size, color, color2, horizontal)
    if pos == nil then if developer_data.debug == true then print("ERROR: argument 'pos' not found!") end pos = Vec2(0, 0) end
    if size == nil then if developer_data.debug == true then print("ERROR: argument 'pos2' not found!") end size = Vec2(50, 50) end
    if color == nil then if developer_data.debug == true then print("ERROR: argument 'color' / 'colour' not found!") end color = renderer.Color(255, 255, 255, 255) end
    if color2 == nil then if developer_data.debug == true then print("ERROR: argument 'color2' / 'colour2' not found!") end color2 = renderer.Color(255, 255, 255, 255) end
    if horizontal == nil then if developer_data.debug == true then print("ERROR: argument 'horizontal' not found!") end horizontal = false end

    
    --This code is broken because timefall needs to fix "Color tables" or make it read from mine.
    --[[if not horizontal then
        directx.gradient_rectangle(pos.x, pos.y, size.x, size.y, color, color, color2, color2)
    else
        directx.gradient_rectangle(pos.x, pos.y, size.x, size.y, color, color2, color, color2)
    end
    ]]

    --No horizontal sorry!
    render.rectangle_gradient(pos.x, pos.y, size.x, size.y, color.r, color.g, color.b, color.a, color2.r, color2.g, color2.b, color2.a)
end

function renderer.Line(pos, pos2, color, thickness)
    if pos == nil then if developer_data.debug == true then print("ERROR: argument 'pos' not found!") end pos = Vec2(0, 0) end
    if pos2 == nil then if developer_data.debug == true then print("ERROR: argument 'pos2' not found!") end pos2 = Vec2(0, 0) end
    if color == nil then if developer_data.debug == true then print("ERROR: argument 'color' / 'colour' not found!") end color = renderer.Color(255, 255, 255, 255) end
    if thickness == nil then if developer_data.debug == true then print("ERROR: argument 'thickness' not found!") end thickness = Vec2(0, 0) end

    render.line(pos.x, pos.y, pos2.x, pos2.y, color.r, color.g, color.b, color.a, thickness)
end

--Request: Timefall fix these, its broken because you can not have a number first in the name. it MUST be a letter.
--[[
function renderer.Circle3D(pos, radius, segments, color, thickness, filled)
    if pos == nil then if developer_data.debug == true then print("ERROR: argument 'pos' not found!") end pos = Vec3(0, 0, 0) end
    if radius == nil then if developer_data.debug == true then print("ERROR: argument 'radius' not found!") end radius = 20 end
    if segments == nil then if developer_data.debug == true then print("ERROR: argument 'segments' not found!") end segments = 10 end
    if color == nil then if developer_data.debug == true then print("ERROR: argument 'color' not found!") end color = renderer.Color(255, 255, 255, 180) end
    if thickness == nil then if developer_data.debug == true then print("ERROR: argument 'thickness' not found!") end thickness = 1 end
    if filled == nil then if developer_data.debug == true then print("ERROR: argument 'filled' not found!") end filled = true end
    
    if not filled then
        directx.3d_circle(pos.x, pos.y, pos.z, radius, segments, color, thickness)
    else
        directx.3d_circle_filled(pos.x, pos.y, pos.z, radius, segments, color, thickness)
    end
end

function renderer.Circle2D(pos, radius, segments, color, thickness, filled)
    if pos == nil then if developer_data.debug == true then print("ERROR: argument 'pos' not found!") end pos = Vec2(0, 0) end
    if radius == nil then if developer_data.debug == true then print("ERROR: argument 'radius' not found!") end radius = 20 end
    if segments == nil then if developer_data.debug == true then print("ERROR: argument 'segments' not found!") end segments = 10 end
    if color == nil then if developer_data.debug == true then print("ERROR: argument 'color' not found!") end color = renderer.Color(255, 255, 255, 180) end
    if thickness == nil then if developer_data.debug == true then print("ERROR: argument 'thickness' not found!") end thickness = 1 end
    if filled == nil then if developer_data.debug == true then print("ERROR: argument 'filled' not found!") end filled = true end
    
    if not filled then
        directx.2d_circle(pos.x, pos.y, radius, segments, color, thickness)
    else
        directx.2d_circle_filled(pos.x, pos.y, radius, segments, color, thickness)
    end
end
]]

function renderer.WorldToScreen(pos)
    if pos == nil then if developer_data.debug == true then print("ERROR: argument 'pos' not found!") end pos = Vec3(0, 0, 0) end

    return render.world_to_screen(pos.x, pos.y, pos.z)
end

function mathmatics.CalculateAngle(from, to)
    if from == nil then if developer_data.debug == true then print("ERROR: argument 'from' not found!") end from = Vec3(0, 0, 0) end
    if to == nil then if developer_data.debug == true then print("ERROR: argument 'to' not found!") end to = Vec3(0, 0, 0) end

    return math.calculate_angle(from.x, from.y, from.z, to.x, to.y, to.z)
end

function mathmatics.GetFov(viewangle, aimangle)
    if viewangle == nil then if developer_data.debug == true then print("ERROR: argument 'viewangle' not found!") end viewangle = Vec3(0, 0, 0) end
    if aimangle == nil then if developer_data.debug == true then print("ERROR: argument 'aimangle' not found!") end aimangle = Vec3(0, 0, 0) end
    
    return math.calculate_angle(viewangle.x, viewangle.y, viewangle.z, aimangle.x, aimangle.y, aimangle.z)
end

function mathmatics.GetPointDistance(from, to)
    if from == nil then if developer_data.debug == true then print("ERROR: argument 'from' not found!") end from = Vec3(0, 0, 0) end
    if to == nil then if developer_data.debug == true then print("ERROR: argument 'to' not found!") end to = Vec3(0, 0, 0) end

    return math.get_point_distance(from.x, from.y, from.z, to.x, to.y, to.z)
end

function mathmatics.Random(min, max, type)
    if min == nil then if developer_data.debug == true then print("ERROR: argument 'min' not found!") end min = 0 end
    if max == nil then if developer_data.debug == true then print("ERROR: argument 'max' not found!") end max = 10 end
    if type == nil then type = "int" end

    if string.tolower(type) == "int" then
        math.random_int(min, max)
    else
        math.random_float(min, max)
    end
end

function mathmatics.Clamp(cur, min, max)
    if cur == nil then if developer_data.debug == true then print("ERROR: argument 'cur' not found!") end cur = 0 end
    if min == nil then if developer_data.debug == true then print("ERROR: argument 'min' not found!") end min = 0 end
    if max == nil then if developer_data.debug == true then print("ERROR: argument 'max' not found!") end max = 10 end

	return cur < min and min or cur > max and max or cur
end

function raytracing.TraceRay(from, to)
    return trace.trace_ray(from.x, from.y, from.z, to.x, to.y, to.z)
end

function raytracing.ClipRayToEntity(from, to)
    return trace.clip_ray_to_entity(from.x, from.y, from.z, to.x, to.y, to.z)
end

--Run our renderer demo!
register_callback(e_callbacks.PAINT, function()

    myclient.SetCameraOffset(Vec3(0, 0, 0))

    local DemoFont = renderer.CreateFont("Tahoma", 14, 400, 20)

    local TextSize = renderer.GetTextSize(DemoFont, "Test string")
    
    renderer.Rectangle(Vec2(0, 0), Vec2(1, TextSize.y), renderer.Color(255, 0, 0, 255), true)

    renderer.Gradient(Vec2(1, 0), Vec2(TextSize.x, TextSize.y), renderer.Color(0, 0, 0, 200), renderer.Color(0, 0, 0, 0), true)

    renderer.Text(DemoFont, "Test string", Vec2(0, 0), renderer.Color(255, 255, 255, 255), true)

    renderer.Line(Vec2(0, 0), Vec2(1920, 1080), renderer.Color(255, 255, 255, 255), 1)

    --renderer.Circle3D(Vec3(0, 0, 0), 20, 10, renderer.Color(255, 255, 255, 180), 1, true) --Broken don't use!

    --renderer.Circle2D(Vec3(0, 0), 20, 10, renderer.Color(255, 255, 255, 180), 1, true) --Broken don't use!

    local WorldToScreenResult = renderer.WorldToScreen(Vec3(0, 0, 0))

    local CalculatedAngle = mathmatics.CalculateAngle(Vec3(0, 0, 0), Vec3(0, 0, 0))

    local CalculatedFov = mathmatics.GetFov(Vec3(0, 0, 0), Vec3(0, 0, 0))

    local CalculatedPointDistance = mathmatics.GetPointDistance(Vec3(0, 0, 0), Vec3(0, 0, 0))

    local RandomInt = mathmatics.Random(0, 10, "int")

    local RandomFloat = mathmatics.Random(0, 10, "float")

    local ClampedValue = mathmatics.Clamp(99, 0, 10)

    local TracedRay = raytracing.TraceRay(Vec3(0, 0, 0), Vec3(0, 0, 0))

    local ClippedRayToEntity = raytracing.ClipRayToEntity(Vec3(0, 0, 0), Vec3(0, 0, 0))
end)