local CFG, C = AMB.Opti.Config, AMB.G.C

function AMB.Opti.SetPhysEnvrionmentSettings()

    MsgC( C.AMB_RED, '\n[PhysEnvironment] ', C.ABS_WHITE, 'Set custom optimized physenv settings\n' )

    physenv.SetPerformanceSettings( CFG.physenv_settings )
    physenv.SetAirDensity( CFG.physenv_air_density )
    physenv.SetGravity( CFG.physenv_gravity )

end
concommand.Add( 'amb_opti_setphysenv', AMB.Opti.SetPhysEnvrionmentSettings )

hook.Add( 'PostGamemodeLoaded', 'AMB.Opti.SetPhysEnvrionmentSettings', function()

    timer.Simple( 1, AMB.Opti.SetPhysEnvrionmentSettings )

end )