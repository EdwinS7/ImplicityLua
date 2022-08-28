engine.execute_command("clear");
local print = client.log

--I know you could just use http to get it but Hah, figure it out yourself.
--Copy and paste documentation here below.
local Documentation = [[
    Function List
Client : 
client.set_event_callback(szCallbackName, pCallback) 
​
client.get_camera_offset() : Vector3D
​
client.set_camera_offset(float xOffset, float yOffset , float zOffset) 
​
client.get_username() : string
​
client.get_userid() : int
​
client.get_power_level() : string
​
client.log(string szLog)
​
client.set_clantag(string szClanTag)
​
client.get_string_size(string szString) : int returns string size
​
client.send_network_request(string szRequest) : string returns body
​
client.is_vk_down(int iKey);
Accessible Elements : 
menu.is_menu_open() : bool
​
menu.create_checkbox(tab , subsection , name) : reference
​
menu.create_colorpicker(tab , subsection , name , [optional] red ,  [optional] green,  [optional] blue,  [optional] alpha)  : reference
​
menu.create_keybind(tab , subsection , name) : reference
​
menu.create_slider_int(tab , subsection , name , default value , min val , max val)  : reference
​
menu.create_slider_float(tab , subsection , name , default value , min val , max val)  : reference
​
menu.create_single_select(tab , subsection , name , element one , [optional] elements...)  : reference
​
menu.create_multi_select(tab , subsection , name , element one , [optional] elements...)  : reference
​
menu.create_spacing(tab , subsection)
​
menu.create_text(tab , subsection , element one )
	
menu.create_spacing(tab , subsection) : void
​
menu.set_visible(string reference , bool value) 
​
To get the element reference use the following method
    local reference = menu.create_reference("MISC","Miscellaneous","Anti Untrusted")
​
To get the value of a color picker
    menu.get_colorpicker_value(reference) :  returns .r , .g , .b , .a on success
​
To set the value of a color picker
    menu.set_value(reference , r , [optional]g, [optional]b, [optional]a)
​
To get the value of multiselect
    menu.get_value_int(reference, index of element)
​
To set the value of a multiselect
    menu.set_value(reference , int index , bool value)
​
To get the value of checkbox
    menu.get_value_int(reference)
    
To get the value of float slider
    menu.get_value_float(reference)
    
To get the value of int slider
    menu.get_value_int(reference)
    
To get the value of single select
    menu.get_value_int(reference)
    
To get the value of keybind
    menu.get_value_int(reference)
    
To set the value of elements
    menu.set_value(reference , int / float / bool / string)
GameRules : 
gamerules.is_in_matchmaking() : bool
​
gamerules.is_freezetime() : bool
Net :
net.get_send_packet() : bool  // gives current packet state (NOTE! It can change according to the callback)
​
net.force_send_packet_this_tick() : void
​
net.force_delay_packet_this_tick() : void
​
net.get_choked_commands() : int
​
net.get_choked_packets() : int
​
net.get_name() : string
​
net.get_address() : string
​
net.get_time() : float
​
net.get_time_connected() : float
​
net.get_data_rate() : int
​
net.get_latency(int flow) : float
​
net.get_average_latency(int flow) : float
​
net.get_average_loss(int flow) : float
​
net.get_average_choke(int flow) : float
​
net.get_average_data(int flow) : float
​
net.get_average_packets(int flow) : float
​
net.get_total_data(int flow) : int
​
net.get_total_packets(int flow) : int
​
net.get_sequence_nr(int flow) : int
Engine : 
engine.get_local_player() : int
​
engine.get_player_for_user_id(iUserId) : int
​
engine.is_connected() : bool
​
engine.is_in_game() : bool
​
engine.execute_command(cmd) : void
​
engine.execute_command_unrestricted(cmd) : void
​
engine.get_local_view_angles() : Vector3D
​
engine.is_playing_demo() : bool
​
engine.is_hltv() : bool
​
engine.is_paused() : bool
​
engine.get_screen_size() : Vector2D
Render : 
render.line(int xStart, int yStart, int xEnd, int yEnd, float r, float g, float b, float a, float flThickness) : void
​
render.rectangle(int xStart, int yStart, int iWidth, int iHeight, float r, float g, float b, float a) : void
​
render.rectangle_filled(int xStart, int yStart, int iWidth, int iHeight, float r, float g, float b, float a) : void
​
render.rectangle_gradient(int xStart, int yStart, int iWidth, int iHeight,float r1,float g1,float b1,float a1, float r2, float g2, float b2, float a2) : void
​
render.text(string szText, int xStart, int yStart, float r, float g, float b, float a, int iFontIndex, int uFlags, int rOutline, int gOutline, int bOutline, int aOutline) : void
​
render.world_to_screen(float xPos,float yPos,float zPos) : Vector2D
​
render.create_custom_font(std::string szFontName, int iSize, int iWidth, int uFlags) : HFont
​
render.custom_font(HFont uFont, std::string szText) : Vector2D
​
render.custom_text(HFont uFont, std::string szText, int xStart, int yStart, float r, float g, float b, float a)
	
Font Flags :
0 = shadow
1 = outline
​
Render Font Index :
0 = verdana
1 = smallest pixel
2 = smallest pixel small
3 = player name esp
4 = verdana big
5 = console clean shadow
23 = thin and medium font
30 = big and bold
31 = medium bold with shadow
Surface : 
surface.draw_set_color(float r, float g, float b, float a) : void
​
surface.draw_filled_rectangle(int x0, int y0, int x1, int y1) : void
​
surface.draw_filled_rectangle_fade(int x0, int y0, int x1, int y1, uint32_t uAlpha0, uint32_t uAlpha1, bool bHorizontal) : void
​
surface.draw_outlined_rectange(int x0, int y0, int x1, int y1) : void
​
surface.draw_line(int x0, int y0, int x1, int y1) : void
​
surface.draw_polyline(int* x, int* y, int nPoints) : void
​
surface.draw_set_text_font(unsigned long hFont) : void
​
surface.draw_set_text_color(float r, float g, float b, float a) : void
​
surface.draw_set_text_position(int x, int y) : void
​
surface.draw_render_text(const wchar_t* wszText, int nTextLength, int drawType) : void
​
surface.draw_set_text_rgba(int nIndex, const unsigned char* rgba, int iWide, int iTall) : void
​
surface.draw_set_texture(int nIndex) : void
​
surface.draw_create_new_texture_id(bool bProcedural)  : int
​
surface.draw_create_font()  : unsigned long
​
surface.draw_set_font_glyph_set(HFont hFont, const char* szWindowsFontName, int iTall, int iWeight, int iBlur, int nScanLines, int iFlags, int nRangeMin, int nRangeMax)  : bool
​
surface.draw_get_text_size(HFont hFont, const wchar_t* wszText) : Vector2D
​
surface.play_sound(const char* szFileName) : void
​
surface.draw_outlined_circle(int x, int y, int iRadius, int nSegments) : void
​
surface.draw_textured_polygon(int n, Vertex_t* pVertice, bool bClipVertices) : void
Entity : 
entity.get_local_player() : uintptr iPtr
​
entity.get_entity(int iIndex) : uintptr iPtr
​
entity.get_weapon(uintptr_t iPtr) : uintptr iPtr
​
entity.get_class_name(uintptr_t iPtr) : string
​
entity.get_class_id(uintptr_t iPtr) : int
​
entity.get_max_entities() : int
​
entity.get_highest_entity_index() : int
​
entity.is_valid(uintptr_t iPtr) : bool
​
entity.is_player(uintptr_t iPtr) : bool
​
entity.is_dormant(uintptr_t iPtr) : bool
​
entity.is_alive(uintptr_t iPtr) : bool
​
entity.is_enemy(uintptr_t iPtr) : bool
​
entity.is_player_bot(uintptr_t iPtr) : bool
​
entity.get_bounding_box(uintptr_t iPtr) : BBox_t
​
entity.get_hitbox_position(uintptr_t iPtr , int iHitbox) : Vector3D
​
entity.get_player_name(uintptr_t iPtr) : string
​
entity.get_player_userid(uintptr_t iPtr) : int
	
NOTE! Use the given style to get or set a prop
Example Prop "DT_BasePlayer" , "m_vecVelocity[0]"
szProp is going to be "CBasePlayer->m_vecVelocity[0]"
​
entity.get_prop_float(uintptr_t iPtr, string szProp) : float or error
​
entity.get_prop_int(uintptr_t iPtr, string szProp) : int or error
​
entity.get_prop_vector3d(uintptr_t iPtr, string szProp) : vector3d or error
​
entity.get_prop_vector2d(uintptr_t iPtr, string szProp) : vector2d or error
​
entity.get_prop_string(uintptr_t iPtr, string szProp) : string or error
​
entity.set_prop_float(uintptr_t iPtr, string szProp , float flValue) : string or error
​
entity.set_prop_int(uintptr_t iPtr, string szProp , int iValue) : string or error
​
entity.set_prop_vector3d(uintptr_t iPtr, string szProp , Vector3D vecValue) : string or error
​
entity.set_prop_vector2d(uintptr_t iPtr, string szProp , Vector2D vecValue) : string or error
​
entity.set_prop_string(uintptr_t iPtr, string szProp , std::string szValue) : string or error
​
entity.get_prop_array_int(uintptr ptr , string szProp ,int index) : int or error
​
entity.get_prop_array_float(uintptr ptr , string szProp ,int index) : float or error
​
entity.set_prop_array_int(uintptr ptr , string szProp ,int index , int iValue)  : void or error
​
entity.set_prop_array_float(uintptr ptr , string szProp ,int index , float flValue)  : void or error
Globals : 
globals.real_time() : float
​
globals.frame_count() : int
​
globals.abs_frame_time() : float
​
globals.abs_frame_start_time() : float
​
globals.current_time() : float
​
globals.frame_time() : float
​
globals.maximum_clients() : int
​
globals.tick_count() : int
​
globals.interval_per_tick() : float
​
globals.interpolation_amount() : float
​
globals.simulation_ticks_this_frame() : int
​
globals.network_protocol() : int
​
globals.is_client() : bool
​
globals.is_remote_client() : bool
​
globals.time_stamp_networking_base() : int
​
globals.time_stamp_randomize_window() : int
Memory : 
memory.find_signature(string szModule, string szPattern) : uintptr_t
​
memory.get_virtual_function_address(void* pClassPtr,int iIndex) : uintptr_t
​
memory.create_interface(const char* szModule, string szInterface) : uintptr_t
​
Math : 
math.calculate_angle(float xFrom , float yFrom ,float zFrom, float xTo, float yTo, float zTo) : Vector3D
​
math.get_fov(float xViewAngle, float yViewAngle, float zViewAngle, float xAngleAim, float yAngleAim, float zAngleAim) : float
​
math.get_point_distance(float xFrom, float yFrom, float zFrom, float xTo, float yTo, float zTo) : float
​
math.random_float(float f1,float f2) : float
​
math.random_int(int i1,int i2) : int
Trace : 
trace.trace_ray(float xStart , float yStart , float zStart , float xEnd, float yEnd, float zEnd , uintptr_t pSkipPlayer) : CGameTrace
​
trace.clip_ray_to_entity(float xStart, float yStart, float zStart, float xEnd, float yEnd, float zEnd, uintptr_t pSkipPlayer) : CGameTrace
​
Convars : 
cvar.get_var(string var) : uintptr_t
​
cvar.get_name(uintptr_t uVar) : string
​
cvar.get_float(uintptr_t uVar) : float
​
cvar.get_int(uintptr_t uVar) : int
​
cvar.get_string(uintptr_t uVar) : string
​
cvar.set_string(uintptr_t uVar , string szValue) : void
​
cvar.set_float(uintptr_t uVar , float flValue) : void
​
cvar.set_int(uintptr_t uVar , int iValue) : void
​
cvar.set_color(uintptr_t uVar , float r , float g , float b , float a) : void
Exploits : 
exploits.is_hideshots_active() : bool
​
exploits.is_doubletap_active() : bool
​
exploits.did_shift_current_tick() : bool
​
exploits.does_require_recharge() : bool
​
exploits.get_recharge_ticks() : int
​
exploits.set_recharge_ticks(int m_nProcessTicks) : void
​
exploits.force_recharge_this_tick() : void
​
exploits.shift_tickbase(int m_nTicksToShift)  : void
​
exploits.shift_tickbase_teleport(int m_nTicksToShift) : void
Player List : 
plist.is_in_playerlist() : bool
​
plist.get(uintptr_t uptr , string szElement) : int / bool
​
plist.set(uintptr_t uptr , string szElement , int / bool value)
​
Playerlist Elements : 
​
"Ignore Aimbot"  : int (0 / 1)
"Force Safe Point"  : int (0 / 1)
"Force Body Aim"  : int (0 / 1)
"Override Body Yaw"  : int (0 / 1)
"Body Yaw Value" : int 
"Override Pitch"  : int (0 / 1)
"Pitch Value"  : int 
"Force Roll"  : int (0 / 1)
"Roll Value"  : int 
"Override Minimum Damage" : int (0 / 1)
"Override Minimum Damage Value"  : int 
]]

local undocumented_str = [[
Undocumented lua.

]]

local function getTableName(tbl)
    for k, v in pairs(_G) do
        if v == tbl then
            return k
        end
    end

    return nil
end

function GetArgs(func)
    if func == nil then return "Error" end
    local args = {}
    for i = 1, debug.getinfo(func).nparams, 1 do
        table.insert(args, debug.getlocal(func, i));
    end
    local data = ""
    for k, v in pairs(args) do
        data = data .. v .. " "
    end

    if data == nil then data = "error" end
    return data;
end

local function dump_table(name, node)
    if node == nil then print("Error: Table not found! (" .. name .. ")") return end

    local cache, stack, output = {}, {}, {}
    local depth = 1
    local output_str = name .. " {\n"

    while true do
        local size = 0
        for k, v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k, v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then
                if (string.find(output_str, "}", output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str, "\n", output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output, output_str)
                output_str = ""

                local key = tostring(k)
                if not string.find(Documentation, getTableName(node) .. "." .. k) then undocumented_str = undocumented_str .. "NOT FOUND IN DOCS: " .. getTableName(node) .. "--> " .. k .. "\n" end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep("\t", depth) .. key
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep("\t", depth) .. key
                    table.insert(stack, node)
                    table.insert(stack, v)
                    cache[node] = cur_index + 1
                    break
                else
                    output_str = output_str .. string.rep("\t", depth) .. key
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep("\t", depth - 1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep("\t", depth - 1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep("\t", depth - 1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output, output_str)
    output_str = table.concat(output)

    print(output_str)
end

dump_table("Client", client)
dump_table("Menu", menu)
dump_table("GameRules", gamerules)
dump_table("Net", net)
dump_table("Engine", engine)
dump_table("Render", render)
dump_table("Surface", surface)
dump_table("Entity", entity)
dump_table("Globals", globals)
dump_table("Memory", memory)
dump_table("Math", math)
dump_table("Trace", trace)
dump_table("Convars", cvar)
dump_table("Exploits", exploits)
dump_table("Player list", plist)

print(undocumented_str)

print("Successfully dumped API! " .. _VERSION)