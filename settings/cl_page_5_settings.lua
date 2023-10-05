local C, GUI, UT = AMB.G.C, AMB.UI.GUI, AMB.Utility

local w = ScrW()
local h = ScrH()

local DrawBox, DrawText, DrawTextOutline = draw.RoundedBox, draw.SimpleText, draw.SimpleTextOutlined

local tooltip = 'Настройки клиентской части игры\n• Здесь настройки служат для оптимизаций вашей игры: Повышение производительности, понижение качества картинки, повышение скорости работы\n• Если Вы хотите быстро настроить игру, можете воспользоваться Быстрым Качеством и нажать нужную конфигурацию для себя\n• А если душа лежит на полный контроль, нажимаете на нужный раздел и настраиваете'

local function ShowMenuBind()

    local frame = AMB.UI.GUI.DrawFrame( nil, 640, 320, w/2-320, h/2-320/2, nil, true, true, true )

end
concommand.Add( 'amb_opti_settings_bind', ShowMenuBind )

local function ShowMenuNotify()

    local w_frame, h_frame = w/1.8, h/1.4

    local frame = AMB.UI.GUI.DrawFrame( nil, w_frame, h_frame, w/2-w_frame/2, h/2-h_frame/2, 'Logs of Notifications', true, true, true, function( self, w, h ) draw.RoundedBox( 0, 0, 0, w, h, C.AMB_BLACK ) end )
    local panel = AMB.UI.GUI.DrawScrollPanel( frame, frame:GetWide(), frame:GetTall()-48, 0, 24 )
    for id, tab in pairs( AMB.UI.Notify.log_notify ) do
        
        local log = AMB.UI.GUI.DrawPanel( panel, panel:GetWide()-8, panel:GetTall()/12, 4, -44+id*(panel:GetTall()/12+4), function( self, w, h ) 

            draw.RoundedBox( 4, 0, 0, w, h, C.AMB_PANEL )
            draw.SimpleTextOutlined( tab.time..'  —  '..tab.text, 'Trebuchet18', 8, h/2, C.FLAT_WHITE, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )

    end

end
concommand.Add( 'amb_opti_settings_notify', ShowMenuNotify )

-- todo ShowMenuChat()
concommand.Add( 'amb_opti_settings_chat', ShowMenuNotify )

local function CreateCheckBox( sConVar )
end

local function CreateNumSlider( sConVar )
end

local function OpenPanel( sType )

    local convars = AMB.Opti.Settings.settings_convars

    for name, tab in pairs( convars ) do

        if ( tab.type ~= sType ) then continue end

    end

end

local quick_settings_buttons = {

    [ 1 ] = { name = 'Картошка', cmd = 'potato', color = C.FLAT_GREEN, color_text = C.AMB_GREEN, tooltip = 'Для ОЧЕНЬ слабых машин' },
    [ 2 ] = { name = 'Низкое', cmd = 'easy', color = C.FLAT_YELLOW, color_text = C.AMBITION, tooltip = 'Для слабых машин' },
    [ 3 ] = { name = 'Среднее', cmd = 'medium', color = C.FLAT_BLUE, color_text = C.AMB_BLUE, tooltip = 'Стандартная конфигурация под сервер' },
    [ 4 ] = { name = 'Мощное', cmd = 'high', color = C.FLAT_RED, color_text = C.AMB_BLOOD, tooltip = 'Включение большинства параметров' },
    [ 5 ] = { name = 'Ультра', cmd = 'ultra', color = Color( 168, 116, 173 ), color_text = Color( 126, 54, 133 ), tooltip = 'Почти все параметры на max + (скоро будут) визуальные фичи + (скоро будут) текстурки', replace_name = '( ͡° ͜ʖ ͡°)' }

}

local font_text_buttons = '22 Arial'

local page_font = '16 Ambition'
local page_color_game = ColorAlpha( C.AMB_BLUE, 50 )
local page_color_server = ColorAlpha( C.AMB_RED, 50 )
local pages_game = {

    { name = 'Звук', type = 'Sound' },
    { name = 'Рендер', type = 'Render' }

}

local pages_server = {

    { name = 'Bind', type = 'Bind' },
    { name = 'Chat', type = 'Chat' },
    { name = 'Notify', type = 'Notify' },
    { name = 'Музыка', type = 'AMB.Music' },
    { name = 'Рендер', type = 'AMB.Render' },
    { name = 'Меню', type = 'AMB.Menu' },
    { name = 'HUD', type = 'AMB.HUD' },

}

local page = AMB.UI.MainMenu.Pages.AddPage( 5, 'Настройки', C.ABS_WHITE )
AMB.UI.MainMenu.Pages.SetPage( page, function( vguiFrame ) 

    local frame, main = GUI.Ambition.DrawFrame( vguiFrame, 512, 600, 0, 0, 'Настройки', tooltip, function() 

        AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )

    end )
    frame:Center()

    -- ## Div Quick Quality
    local panel_buttons = GUI.DrawPanel( main, main:GetWide(), 60, 0, 0, function( self, w, h ) 

        DrawBox( 0, 0, 0, w, h, C.AMB_PANEL )
        DrawText( 'Быстрое Качество', '26 Arial', w / 2, 24, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )

    end )

    local margin_x = panel_buttons:GetWide() / 9
    local last_offset = 0
    for i, tab in SortedPairs( quick_settings_buttons ) do

        local text_x = UT.GetTextSizeX( tab.name, font_text_buttons ) + 12
        local button = GUI.DrawButton( panel_buttons, text_x, 26, margin_x + last_offset, panel_buttons:GetTall() - 26 - 8, nil, nil, nil, function()

            AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )
            AMB.UI.MainMenu.CloseMenu()

            RunConsoleCommand( 'amb_opti_settings_set_'..tab.cmd )

        end, function( self, w, h )

            DrawBox( 0, 0, 0, w, h, tab.color_text )
            DrawBox( 0, 2, 2, w - 4, h - 4, tab.color )
            DrawTextOutline( self.name, font_text_buttons, w / 2, h / 2, tab.color_text or C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )
        button.name = tab.name
        button:SetTooltip( tab.tooltip )
        GUI.OnCursorButton( button, function()

            local replace = tab.replace_name
            if replace then button.name = replace end

        end, function()

            button.name = tab.name

        end )

        last_offset = last_offset + text_x + 8

    end

    local multicore = GUI.DrawButton( panel_buttons, 100, 18, 4, 4, nil, nil, nil, function()

        AMB.UI.MainMenu.Pages.ClosePage( page, vguiFrame )
        AMB.UI.MainMenu.CloseMenu()

        RunConsoleCommand( 'amb_opti_settings_set_multicore' )

    end, function( self, w, h )

        DrawBox( 0, 0, 0, w, h, C.AMB_BLUE )
        DrawBox( 0, 2, 2, w - 4, h - 4, C.FLAT_BLUE )
        DrawTextOutline( 'Multicore', '16 Arial', w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

    end )

    --  ## Div Two Panels: Settings Server Experience and Settings Game
    local div_two_panels = GUI.DrawPanel( main, main:GetWide(), main:GetTall() - panel_buttons:GetTall() - 8, 0, panel_buttons:GetTall() + 8, function( self, w, h ) end ) 

    local settings_game = GUI.DrawPanel( div_two_panels, div_two_panels:GetWide(), div_two_panels:GetTall() / 2, 0, 0, function( self, w, h ) 
    
        DrawBox( 0, 0, 0, w, h, C.AMB_PANEL ) 
        DrawText( 'Настройки Игры', '24 Arial', w / 2, 24, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )

    end ) 

    local margin_y = 0
    local last_offset = 0
    for i, tab in SortedPairs( pages_game ) do

        if ( i % 24 == 0 ) then 
        
            last_offset = 0
            margin_y = margin_y + 20 + 4 
            
        end

        local text_x = UT.GetTextSizeX( tab.name, page_font ) + 6
        local button = GUI.DrawButton( settings_game, text_x, 20, 4 + last_offset, 28 + margin_y, nil, nil, nil, function()
        end, function( self, w, h )

            DrawBox( 4, 0, 0, w, h, page_color_game )
            DrawTextOutline( tab.name, page_font, w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )

        last_offset = last_offset + text_x + 4

    end

    local settings_server = GUI.DrawPanel( div_two_panels, div_two_panels:GetWide(), div_two_panels:GetTall() - settings_game:GetTall() - 8, 0, settings_game:GetTall() + 8, function( self, w, h ) 
    
        DrawBox( 0, 0, 0, w, h, C.AMB_PANEL ) 
        DrawText( 'Настройки Сервера', '24 Arial', w / 2, 24, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM, 1, C.ABS_BLACK )
        
    end )

    local margin_y = 0
    local last_offset = 0
    for i, tab in SortedPairs( pages_server ) do

        if ( i % 24 == 0 ) then 
        
            last_offset = 0
            margin_y = margin_y + 20 + 4 
            
        end

        local text_x = UT.GetTextSizeX( tab.name, page_font ) + 6
        local button = GUI.DrawButton( settings_server, text_x, 20, 4 + last_offset, 28 + margin_y, nil, nil, nil, function()

            if ( tab.type == 'Notify' ) then ShowMenuNotify() end
            if ( tab.type == 'Chat' ) then ShowMenuNotify() end
            if ( tab.type == 'Bind' ) then ShowMenuBind() end

        end, function( self, w, h )

            DrawBox( 4, 0, 0, w, h, page_color_server )
            DrawTextOutline( tab.name, page_font, w / 2, h / 2, C.ABS_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )

        end )

        last_offset = last_offset + text_x + 4

    end

end )