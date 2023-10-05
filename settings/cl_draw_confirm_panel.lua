local C, GUI, Draw, UI = Ambi.Packages.Out( '@d' )
local COLOR_PANEL = Color( 20, 20, 20, 210 )

-- --------------------------------------------------------------------------------------------------------------------------------------------
function Ambi.Opti.DrawConfirmPanel( sText, sAgree, sDisagree, fAgree, fDisagree )
    sText = sText or ''
    sAgree = sAgree..' [F1]' or 'Yes [F1]'
    sDisagree = sDisagree..' [F2]' or 'No [F2]'

    local main_size_w = Draw.GetTextSizeX( UI.SafeFont( '25 Ambi' ), sText )
    local agree_size_w = Draw.GetTextSizeX( UI.SafeFont( '20 Ambi' ), sAgree ) + 8
    local disagree_size_w = Draw.GetTextSizeX( UI.SafeFont( '20 Ambi' ),  sDisagree ) + 8

    gui.EnableScreenClicker( true )

    local main = vgui.Create( 'DPanel' )
    main:SetSize( main_size_w + 24, 70 )
    main.Paint = function( self, w, h )
        draw.RoundedBox( 0, 0, 0, w, h, COLOR_PANEL )
        draw.SimpleTextOutlined( sText, UI.SafeFont( '25 Ambi' ), w / 2, 4, C.AMBI_WHITE, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, C.ABS_BLACK )
    end
    main:SetKeyboardInputEnabled( true )
    main:SetMouseInputEnabled( true )
    main:Center()
    main.OnRemove = function()
        gui.EnableScreenClicker( false )
    end

    main.Think = function( self )
        if input.IsKeyDown( KEY_F1 ) then self:Remove() if fAgree then fAgree() end
        elseif input.IsKeyDown( KEY_F2 ) then self:Remove() if fDisagree then fDisagree() end
        end
    end

    local agree = vgui.Create( 'DButton', main )
    agree:SetSize( agree_size_w, 28 )
    agree:SetPos( 4, main:GetTall() - 28 - 4 )
    agree:SetText( '' )
    agree.Paint = function( self, w, h )
        draw.RoundedBox( 4, 0, 0, w, h, C.ABS_BLACK )
        draw.SimpleText( sAgree, UI.SafeFont( '20 Ambi' ), w / 2 - 1, h / 2, C.AMBI_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
    end
    agree.DoClick = function()
        if fAgree then fAgree() end
        main:Remove()
    end

    local dis = vgui.Create( 'DButton', main )
    dis:SetSize( disagree_size_w, 28 )
    dis:SetPos( main:GetWide() - disagree_size_w - 4, main:GetTall() - 28 - 4 )
    dis:SetText( '' )
    dis.Paint = function( self, w, h )
        draw.RoundedBox( 4, 0, 0, w, h, C.ABS_BLACK )
        draw.SimpleText( sDisagree, UI.SafeFont( '20 Ambi' ), w / 2 - 1, h / 2, C.AMBI_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, C.ABS_BLACK )
    end
    dis.DoClick = function()
        if fDisagree then fDisagree() end
        main:Remove()
    end

    return main
end