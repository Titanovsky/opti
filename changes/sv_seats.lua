hook.Add( 'OnEntityCreated', 'Ambi.Opti.SeatsOptimized', function( eSeat )
    if Ambi.Opti.Config.optimize_seats and IsValid( eSeat ) and ( eSeat:GetClass() == 'prop_vehicle_prisoner_pod' ) then 
        print( '[Opti] Seats added engine\'s flag -> '..tostring( eSeat ) )
        eSeat:AddEFlags( EFL_NO_THINK_FUNCTION ) 
    end
end )