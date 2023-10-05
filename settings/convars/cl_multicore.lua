local Add = AMB.Opti.Settings.AddConVar
local Warning = AMB.Opti.Settings.AddConVarWarning
local NO_D, MEDIUM_D, VERY_D, BLOCK_D = 0, 1, 2, 3 -- Dangerous Levels

local type = 'Multicore'
Add( 'gmod_mcore_test', type, 'Вкл/выкл многоядерность, при одноядерном процессоре будут проблемы', VERY_D, true )
Add( 'cl_threaded_bone_setup', type, 'Вкл/выкл обработку матрицы костей в разных потоках', VERY_D, true )
Add( 'r_threaded_particles', type, 'Вкл/выкл обработку частиц в разных потоках', VERY_D, true )
Add( 'r_queued_ropes', type, 'Вкл/выкл обработку верёвок в разных потоках', VERY_D, true )
Add( 'cl_threaded_client_leaf_system', type, 'Вкл/выкл обработку PVS в разных потоках', VERY_D, true )
Add( 'mat_queue_mode', type, 'Разрешить движку сортирования очереди текстур (При большой нагрузки на видеокарту юзать 1)', VERY_D, true )
Add( 'studio_queue_mode', type, 'Не нашёл описание, связанно с многопоточностью, на свой страх и риск', VERY_D, true )