 local HookDel = hook.Remove

local function SetHook( sName, fCallback )
    hook.Add( 'PostGamemodeLoaded', 'Ambi.Opti.'..sName, function()
        timer.Simple( 1, fCallback )
    end )
end

SetHook( 'RemoveSandboxFeatures', function() 
    if Ambi.Opti.Config.remove_sandbox_timer_hostname_think then timer.Remove( 'HostnameThink' ) end

    for _, tab in ipairs( Ambi.Opti.Config.remove_sandbox_hooks_clients ) do 
        print( '[Opti] Removed hook: ' .. tab.name )
        HookDel( tab.hook, tab.name ) 
    end
end )
