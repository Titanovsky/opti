Ambi.Opti.Settings = Ambi.Opti.Settings or {}
Ambi.Opti.Settings.settings_convars = Ambi.Opti.Settings.settings_convars or {}

-- --------------------------------------------------------------------------------------------------------------------------------------------
local C = Ambi.Packages.Out( 'colors' )

local changeconvars = true

local AddCallback, RemoveCallback = cvars.AddChangeCallback, cvars.RemoveChangeCallback

local show_message = CreateClientConVar( 'ambi_opti_settings_show_message', '1', true, false, 'Показать сообщение при изменений настройки' )
local auto_set_convars = CreateClientConVar( 'ambi_opti_settings_auto_set_convars', '1', true, false, 'При авторизаций у игрока сетаются конвары' )

-- --------------------------------------------------------------------------------------------------------------------------------------------
function Ambi.Opti.Settings.AddConVar( sConVar, sType, sDescription, nDangerous, bWrapConVar, sPanelType )
    if Ambi.Opti.Settings.settings_convars[ sConVar ] then 
        RemoveCallback( 'ambi_wrap_'..sConVar, 'WrapConVar' )
        RemoveCallback( sConVar, 'RunWrapConVar' ) 
    end

    Ambi.Opti.Settings.settings_convars[ sConVar ] = {
        type = sType,
        desc = sDescription,
        dangerous = nDangerous or 0,
        wrap = bWrapConVar,
        panel = sPanelType,
        default = anyDefault,
        min = nMin,
        max = nMax
    }

    if bWrapConVar then 
        CreateClientConVar( 'ambi_wrap_'..sConVar, 'nan', true, false, sDescription )

        AddCallback( 'ambi_wrap_'..sConVar, function( _, sOldValue, sNewValue )
            if not changeconvars then return end

            if show_message:GetBool() then MsgC( C.AMBI_RED, '[Opti] ', C.ABS_WHITE, sConVar..' ', C.AMBI_RED, tostring( sOldValue ), C.ABS_WHITE, ' >> ', C.AMBI_RED, tostring( sNewValue )..'\n' ) end

            RunConsoleCommand( sConVar, sNewValue )
        end, 'WrapConVar' )

        AddCallback( sConVar, function( _, sOldValue, sNewValue )
            changeconvars = false -- для того, чтобы просто изменить конвару без стэка оверфлоу, так как оригинальная не сохраняется, а wrap наоборот, но при изменений конвары и оригинал меняется, может зациклиться
            RunConsoleCommand( 'ambi_wrap_'..sConVar, sNewValue )

            if show_message:GetBool() then MsgC( C.AMBI_RED, '[Opti] ', C.ABS_WHITE, sConVar..' ', C.AMBI_RED, tostring( sOldValue ), C.ABS_WHITE, ' >> ', C.AMBI_RED, tostring( sNewValue )..'\n' ) end

            timer.Simple( 0.1, function() changeconvars = true end )
        end, 'RunWrapConVar' )
    end
end

function Ambi.Opti.Settings.AddConVarWarning( sConVar, sWarning )
    if not Ambi.Opti.Settings.settings_convars[ sConVar ] then Ambi.Opti.Settings.settings_convars[ sConVar ] = {} end

    Ambi.Opti.Settings.settings_convars[ sConVar ].warning = sWarning or ''
end

hook.Add( 'InitPostEntity', 'Ambi.Opti.Settings.SetConVars', function()
    if not auto_set_convars:GetBool() then return end
    
    timer.Simple( 0.1, function()
        local convars = Ambi.Opti.Settings.settings_convars
        local i = 0
        for convar, tab in pairs( convars ) do
            if not tab.wrap then continue end

            i = i + 1

            local orig_value, value = GetConVar( convar ):GetString(), GetConVar( 'ambi_wrap_'..convar ):GetString()
            if ( value == 'nan' ) or ( value == 'NaN' ) or ( orig_value == value ) then continue end

            timer.Simple( math.Round( i / 50, 2 ), function()
                RunConsoleCommand( convar, value )
            end )
        end
    end )
end )