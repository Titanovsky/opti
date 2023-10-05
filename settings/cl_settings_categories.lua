local C, GUI = AMB.G.C, AMB.UI.GUI
AddCmd, RunCmd = concommand.Add, RunConsoleCommand

local function SetSettings( sCategory )

    local confirm = GUI.Ambition.DrawConfirmPanel( 0, 0, 'При изменений настроек может залагать/крашнуться игра! На свой страх и риск!', 'Изменить', 'Отказаться', function() 

        chat.AddText( C.AMB_RED, '[Settings] ', C.ABS_WHITE, 'Настройки выставляются, подождите..' )

        RunCmd( 'stopsound' )
        RunCmd( 'snd_restart' )
        RunCmd( 'r_cleardecals' )
        RunCmd( 'r_cleardecals' )

        local convars = AMB.Opti.Config.settings_convars
        for i, tab in ipairs( convars ) do 

            timer.Simple( math.Round( i / 10, 1 ), function() 
            
                MsgC( C.AMB_RED, '[Settings] ', C.ABS_WHITE, tab.cmd..' ', C.AMB_RED, tab[ sCategory ]..'\n'  )
                RunCmd( tab.cmd, tab[ sCategory ] ) 
                
            end )
            
            if ( i == #convars ) then chat.AddText( C.AMB_RED, '[Settings] ', C.ABS_WHITE, 'Настройки выставлены (autoexec.cfg создан)' ) end

        end

    end )
    confirm:Center()

end

local function SetMulticore()

    local enable = ( GetConVarString( 'gmod_mcore_test' ) == '0' ) and true or false
    local word = enable and 'Включить' or 'Выключить'

    gui.EnableScreenClicker( true )
    local confirm = GUI.Ambition.DrawConfirmPanel( 0, 0, 'Вы точно хотите '..word..' многоядерную обработку? На свой страх и риск!', word, 'Отказаться', function() 

        chat.AddText( C.AMB_RED, '[Settings] ', C.ABS_WHITE, 'Многоядерная обработка изменяется, подождите..' )

        RunCmd( 'stopsound' )
        RunCmd( 'snd_restart' )
        RunCmd( 'r_cleardecals' )
        RunCmd( 'r_cleardecals' )

        if enable then

            RunCmd( 'gmod_mcore_test', '1' )
            RunCmd( 'mat_queue_mode', '2' )
            RunCmd( 'cl_threaded_client_leaf_system', '1' )
            RunCmd( 'cl_threaded_bone_setup', '1' )
            RunCmd( 'r_queued_ropes', '1' )
            RunCmd( 'r_threaded_client_shadow_manager', '1' )
            RunCmd( 'r_threaded_particles', '1' )
            RunCmd( 'r_threaded_renderables', '1' )
            RunCmd( 'studio_queue_mode', '1' )
            RunCmd( 'snd_mix_async', '1' )

            chat.AddText( C.AMB_RED, '[Settings] ', C.ABS_WHITE, 'Многоядерная обработка ', C.ABS_GREEN, 'включена' )

        else

            RunCmd( 'gmod_mcore_test', '0' )
            RunCmd( 'mat_queue_mode', '-1' )
            RunCmd( 'cl_threaded_client_leaf_system', '0' )
            RunCmd( 'cl_threaded_bone_setup', '0' )
            RunCmd( 'r_queued_ropes', '0' )
            RunCmd( 'r_threaded_client_shadow_manager', '0' )
            RunCmd( 'r_threaded_particles', '0' )
            RunCmd( 'r_threaded_renderables', '0' )
            RunCmd( 'studio_queue_mode', '0' )
            RunCmd( 'snd_mix_async', '0' )

            chat.AddText( C.AMB_RED, '[Settings] ', C.ABS_WHITE, 'Многоядерная обработка ', C.ABS_RED, 'выключена' )

        end

        gui.EnableScreenClicker( false )

    end, function() gui.EnableScreenClicker( false ) end )
    confirm:Center()

end

AddCmd( 'amb_opti_settings_set_multicore', function() SetMulticore() end )
AddCmd( 'amb_opti_settings_set_potato', function() SetSettings( 'potato' ) end )
AddCmd( 'amb_opti_settings_set_easy', function() SetSettings( 'easy' ) end )
AddCmd( 'amb_opti_settings_set_medium', function() SetSettings( 'medium' ) end )
AddCmd( 'amb_opti_settings_set_high', function() SetSettings( 'high' ) end )
AddCmd( 'amb_opti_settings_set_ultra', function() SetSettings( 'ultra' ) end )