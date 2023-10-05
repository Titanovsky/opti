function Ambi.Opti.SetPhysEnvrionmentSettings()
    if not Ambi.Opti.Config.physenv_enable then return end

    print( '[Opti] Set custom physenv settings\n' )

    physenv.SetPerformanceSettings( Ambi.Opti.Config.physenv_settings )
    physenv.SetAirDensity( Ambi.Opti.Config.physenv_air_density )
    physenv.SetGravity( Ambi.Opti.Config.physenv_gravity )
end
concommand.Add( 'ambi_opti_setphysenv', Ambi.Opti.SetPhysEnvrionmentSettings )

hook.Add( 'PostGamemodeLoaded', 'Ambi.Opti.SetPhysEnvrionmentSettings', function()
    timer.Simple( 1, Ambi.Opti.SetPhysEnvrionmentSettings )
end )