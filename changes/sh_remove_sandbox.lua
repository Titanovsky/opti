local CFG, C = AMB.Opti.Config, AMB.G.C 
local HookDel = hook.Remove

local function SetHook( sName, fCallback )

    hook.Add( 'PostGamemodeLoaded', 'AMB.Opti.'..sName, function()

        timer.Simple( 1, fCallback )

    end )

end

SetHook( 'RemoveSandboxFeatures', function() 

    if CFG.remove_sandbox_timer_hostname_think then timer.Remove( 'HostnameThink' ) end

    for _, tab in ipairs( CFG.remove_sandbox_hooks_clients ) do 
    
        MsgC( C.AMB_RED, '\n[Settings] ', C.ABS_WHITE, 'Removed hook: ', C.AMB_RED, tab.name )
        HookDel( tab.hook, tab.name ) 
        
    end

end )
