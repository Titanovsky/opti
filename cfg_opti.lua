AMB.Opti = AMB.Opti or {}
AMB.Opti.Config = AMB.Opti.Config or {}

AMB.Opti.Config.remove_sandbox_timer_hostname_think = true
AMB.Opti.Config.remove_sandbox_load_gmod_saves = true
AMB.Opti.Config.remove_sandbox_hooks_clients = {

    { hook = 'LoadGModSave', name = 'LoadGModSave' },
    { hook = 'PlayerTick', name = 'TickWidgets' },
    { hook = 'PostDrawEffects', name = 'RenderWidgets' },
    { hook = 'Think', name = 'DOFThink' },
    { hook = 'NeedsDepthPass', name = 'NeedsDepthPass_Bokeh' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderBokeh' },
    { hook = 'PreRender', name = 'PreRenderFrameBlend' },
    { hook = 'PostRender', name = 'RenderFrameBlend' },
    { hook = 'PreventScreenClicks', name = 'SuperDOFPreventClicks' },
    { hook = 'GUIMouseReleased', name = 'SuperDOFMouseUp' },
    { hook = 'GUIMousePressed', name = 'SuperDOFMouseDown' },
    { hook = 'RenderScene', name = 'RenderSuperDoF' },
    { hook = 'RenderScene', name = 'RenderStereoscopy' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderMotionBlur' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderMaterialOverlay' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderSharpen' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderSobel' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderSunbeams' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderTexturize' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderToyTown' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderBloom' },
    { hook = 'RenderScreenspaceEffects', name = 'RenderColorModify' }

}

AMB.Opti.Config.disable_render_players = true
AMB.Opti.Config.disable_render_players_dist = 6400

AMB.Opti.Config.settings_convars = {

    -- Multicore
    { cmd = 'mat_queue_mode', potato = '-1', easy = '-1', medium = '-1', high = '-1', ultra = '-1' },

    -- Material
    { cmd = 'mat_specular', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'mat_filtertextures', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'mat_filterlightmaps', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'mat_fastnobump', potato = '1', easy = '1', medium = '0', high = '0', ultra = '0' },
    { cmd = 'mat_fastspecular', potato = '1', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'muzzleflash_light', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'mat_picmip', potato = '4', easy = '-1', medium = '-1', high = '-1', ultra = '-1' },
    { cmd = 'mat_showlowresimage', potato = '1', easy = '0', medium = '0', high = '0', ultra = '0' },
    { cmd = 'mat_hdr_level', potato = '0', easy = '0', medium = '1', high = '1', ultra = '2' },
    { cmd = 'mat_antialias', potato = '0', easy = '0', medium = '0', high = '1', ultra = '1' },
    { cmd = 'mat_shadowstate', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'mat_disable_fancy_blending', potato = '1', easy = '1', medium = '0', high = '0', ultra = '0' },
    { cmd = 'mat_vsync', potato = '0', easy = '0', medium = '0', high = '0', ultra = '0' },

    -- Render
    { cmd = 'r_3dsky', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_teeth', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_eyes', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_eyemove', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_decals', potato = '0', easy = '8', medium = '256', high = '1024', ultra = '2048' },
    { cmd = 'r_WaterDrawReflection', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_WaterDrawRefraction', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_waterforcereflectentities', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_ropetranslucent', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_maxmodeldecal', potato = '0', easy = '5', medium = '50', high = '100', ultra = '150' },
    { cmd = 'r_maxdlights', potato = '0', easy = '8', medium = '32', high = '64', ultra = '128' },
    { cmd = 'r_drawmodeldecals', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_drawdetailprops', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_worldlights', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_drawflecks', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_dynamic', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_shadows', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_propsmaxdist', potato = '100', easy = '800', medium = '1200', high = '2000', ultra = '3200' },
    { cmd = 'props_break_max_pieces', potato = '0', easy = '0', medium = '-1', high = '-1', ultra = '-1' },
    { cmd = 'violence_agibs', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'violence_hgibs', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'violence_ablood', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'violence_hblood', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'rope_smooth', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'rope_wind_dist', potato = '0', easy = '500', medium = '1000', high = '1000', ultra = '1000' },
    { cmd = 'rope_shake', potato = '0', easy = '0', medium = '0', high = '1', ultra = '1' },
    { cmd = 'r_fastzreject', potato = '1', easy = '0', medium = '0', high = '0', ultra = '0' },
    { cmd = 'r_flex', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'r_lod', potato = '8', easy = '-1', medium = '-1', high = '-1', ultra = '-1' },
    { cmd = 'r_cheapwaterstart', potato = '2', easy = '400', medium = '1000', high = '3000', ultra = '6000' },
    { cmd = 'r_cheapwaterend', potato = '2', easy = '400', medium = '2000', high = '3000', ultra = '6000' },

    -- Client
    { cmd = 'cl_forcepreload', potato = '1', easy = '1', medium = '0', high = '0', ultra = '0' },
    { cmd = 'cl_ejectbrass', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'cl_detaildist', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'cl_show_splashes', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },
    { cmd = 'cl_phys_props_enable', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'cl_phys_props_max', potato = '0', easy = '50', medium = '300', high = '500', ultra = '800' },
    { cmd = 'cl_drawmonitors', potato = '0', easy = '1', medium = '1', high = '1', ultra = '1' },

    -- Other
    { cmd = 'datacachesize', potato = '512', easy = '512', medium = '64', high = '512', ultra = '512' },
    { cmd = 'mem_max_heapsize', potato = '2048', easy = '2048', medium = '256', high = '2048', ultra = '4096' },
    { cmd = 'in_usekeyboardsampletime', potato = '0', easy = '0', medium = '1', high = '1', ultra = '1' },
    { cmd = 'mp_decals', potato = '0', easy = '30', medium = '200', high = '400', ultra = '600' },
    { cmd = 'net_compressvoice', potato = '1', easy = '0', medium = '0', high = '0', ultra = '0' },

    -- Network
    { cmd = 'rate', potato = '20000', easy = '30000', medium = '50000', high = '100000', ultra = '150000' },
    { cmd = 'cl_updaterate', potato = '16', easy = '16', medium = '33', high = '66', ultra = '128' },
    { cmd = 'cl_cmdrate', potato = '16', easy = '16', medium = '33', high = '66', ultra = '128' },
    { cmd = 'cl_interp', potato = '1', easy = '0.1', medium = '0.1', high = '0.1', ultra = '0' },
    { cmd = 'cl_interp_ratio', potato = '2', easy = '2', medium = '2', high = '1', ultra = '0' },

    -- Sound
    { cmd = 'snd_mix_async', potato = '1', easy = '1', medium = '0', high = '0', ultra = '0' },

}

AMB.Opti.Config.physenv_air_density = 0.1
AMB.Opti.Config.physenv_gravity = Vector( 0, 0, -700 )
AMB.Opti.Config.physenv_settings = {

    [ 'MaxAngularVelocity' ] = 300,
    [ 'MaxVelocity' ] = 400,
    [ 'MinFrictionMass' ] = 20,
    [ 'MaxFrictionMass' ] = 600,
    [ 'MaxCollisionChecksPerTimestep' ] = 1000,
    [ 'MaxCollisionsPerObjectPerTimestep' ] = 5,
    [ 'LookAheadTimeObjectsVsObject' ] = 0.5,
    [ 'LookAheadTimeObjectsVsWorld' ] = 1,

}