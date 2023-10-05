local CFG, C = AMB.Opti.Config, AMB.G.C 

hook.Add( 'OnEntityCreated', 'AMB.Opti.DisableRenderPlayers', function( eObj )

    if ( CFG.disable_render_players == false ) then return end
    if eObj:IsPlayer() then return end

    function eObj:RenderOverride()

        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) < CFG.disable_render_players_dist ) then self:DrawModel() end

    end

end )