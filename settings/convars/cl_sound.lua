local Add = AMB.Opti.Settings.AddConVar
local Warning = AMB.Opti.Settings.AddConVarWarning
local NO_D, MEDIUM_D, VERY_D, BLOCK_D = 0, 1, 2, 3 -- Dangerous Levels

local type = 'Sound'
Add( 'volume', type, 'Громкость звука', NO_D, false, 'numeric = 0,10' )

local type = 'ExtraSound'
Add( 'snd_mix_async', type, 'Асинхронное наложение звуковых дорожек DSP', NO_D, true, 'numeric = 0,1' )