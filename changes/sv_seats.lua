local CFG, C = AMB.Opti.Config, AMB.G.C

hook.Add( 'OnEntityCreated', 'AMB.Opti.SeatsOptimized', function( eSeat )

    if IsValid( eSeat ) and ( eSeat:GetClass() == 'prop_vehicle_prisoner_pod' ) then 
    
        print( '[Seats] added engine flag -> '..tostring( eSeat ) )
        eSeat:AddEFlags( EFL_NO_THINK_FUNCTION ) 
        
    end

end )