local Add = AMB.Opti.Settings.AddConVar
local Warning = AMB.Opti.Settings.AddConVarWarning
local Prf = function( sConVar ) return 'amb_'..AMB.Config.prefix..'_'..sConVar end

local NO_D, MEDIUM_D, VERY_D = 0, 1, 2 -- Dangerous Levels

Add( Prf( '3d2d_players' ), 'AMB.Render.Player', 'Указать максимальное количество кадров, которые рендерятся', 0 )