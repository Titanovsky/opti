local Add = AMB.Opti.Settings.AddConVar
local Warning = AMB.Opti.Settings.AddConVarWarning
local NO_D, MEDIUM_D, VERY_D, BLOCK_D = 0, 1, 2, 3 -- Dangerous Levels

local type = 'Rates'
Add( 'rate', type, 'Максимальный размер принимаемого/отправленного пакета от сервера: байт/сек', NO_D, true )
Add( 'cl_updaterate', type, 'Сколько раз клиент будет получать пакетов от сервера в секунду', NO_D, true )
Add( 'cl_cmdrate', type, 'Сколько раз клиент будет отправлять пакеты на сервер в секунду', NO_D, true )

local type = 'Interpolation'
Add( 'cl_interp', type, 'Указать минимальное значение интерполяций пакетов ( 1 / cl_updaterate )', NO_D, true )
Add( 'cl_interp_ratio', type, 'Сколько областей надо интерполировать от 0 до 2, cl_interp', NO_D, true )