local Add = AMB.Opti.Settings.AddConVar
local Warning = AMB.Opti.Settings.AddConVarWarning
local NO_D, MEDIUM_D, VERY_D, BLOCK_D = 0, 1, 2, 3 -- Dangerous Levels

local type = 'Limits'
Add( 'fps_max', type, 'Указать максимальное количество кадров, которые подлежат к рендеру', MEDIUM_D )

local type = 'Render'
Add( 'r_3dsky', type, 'Вкл/Выкл рендер 3D SkyBox', NO_D, true )
Add( 'r_shadows', type, 'Вкл/Выкл динамические Тени и Фонарик', MEDIUM_D, true )

local type = 'Material'
Add( 'mat_specular', type, 'Вкл/Выкл полноэкранные отражения (cubemaps), спасает от эмо-теней', VERY_D, true )
Add( 'mat_reducefillrate', type, 'Ограничивает частоту заполнения пикселя', BLOCK_D )