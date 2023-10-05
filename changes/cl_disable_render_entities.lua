hook.Add( 'OnEntityCreated', 'Ambi.Opti.DisableRenderObjects', function( eObj )
    if ( Ambi.Opti.Config.disable_render_objects == false ) then return end
    if eObj:IsPlayer() then return end

    function eObj:RenderOverride()
        if ( LocalPlayer():GetPos():Distance( self:GetPos() ) < Ambi.Opti.Config.disable_render_objects_dist ) then self:DrawModel() end
    end
end )