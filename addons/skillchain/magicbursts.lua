local magic_bursts_by_spell_id = {
    [  1] = { name = 'cure', burst_msg = 7, },
    [  2] = { name = 'cure_ii', burst_msg = 7, },
    [  3] = { name = 'cure_iii', burst_msg = 7, },
    [  4] = { name = 'cure_iv', burst_msg = 7, },
    [  5] = { name = 'cure_v', burst_msg = 7, },
    [  6] = { name = 'cure_vi', burst_msg = 7, },
    [ 21] = { name = 'holy', burst_msg = 252, },
    [ 22] = { name = 'holy_ii', burst_msg = 252, },
    [ 23] = { name = 'dia', burst_msg = 252, },
    [ 24] = { name = 'dia_ii', burst_msg = 252, },
    [ 25] = { name = 'dia_iii', burst_msg = 252, },
    [ 28] = { name = 'banish', burst_msg = 252, },
    [ 29] = { name = 'banish_ii', burst_msg = 252, },
    [ 30] = { name = 'banish_iii', burst_msg = 252, },
    [ 31] = { name = 'banish_iv', burst_msg = 252, },
    [ 32] = { name = 'banish_v', burst_msg = 252, },
    [ 38] = { name = 'banishga', burst_msg = 252, },
    [ 39] = { name = 'banishga_ii', burst_msg = 252, },
    [ 40] = { name = 'banishga_iii', burst_msg = 252, },
    [ 41] = { name = 'banishga_iv', burst_msg = 252, },
    [ 42] = { name = 'banishga_v', burst_msg = 252, },
    [ 58] = { name = 'paralyze', burst_msg = 84, },
    [144] = { name = 'fire', burst_msg = 252, },
    [145] = { name = 'fire_ii', burst_msg = 252, },
    [146] = { name = 'fire_iii', burst_msg = 252, },
    [147] = { name = 'fire_iv', burst_msg = 252, },
    [148] = { name = 'fire_v', burst_msg = 252, },
    [149] = { name = 'blizzard', burst_msg = 252, },
    [150] = { name = 'blizzard_ii', burst_msg = 252, },
    [151] = { name = 'blizzard_iii', burst_msg = 252, },
    [152] = { name = 'blizzard_iv', burst_msg = 252, },
    [153] = { name = 'blizzard_v', burst_msg = 252, },
    [154] = { name = 'aero', burst_msg = 252, },
    [155] = { name = 'aero_ii', burst_msg = 252, },
    [156] = { name = 'aero_iii', burst_msg = 252, },
    [157] = { name = 'aero_iv', burst_msg = 252, },
    [158] = { name = 'aero_v', burst_msg = 252, },
    [159] = { name = 'stone', burst_msg = 252, },
    [160] = { name = 'stone_ii', burst_msg = 252, },
    [161] = { name = 'stone_iii', burst_msg = 252, },
    [162] = { name = 'stone_iv', burst_msg = 252, },
    [163] = { name = 'stone_v', burst_msg = 252, },
    [164] = { name = 'thunder', burst_msg = 252, },
    [165] = { name = 'thunder_ii', burst_msg = 252, },
    [166] = { name = 'thunder_iii', burst_msg = 252, },
    [167] = { name = 'thunder_iv', burst_msg = 252, },
    [168] = { name = 'thunder_v', burst_msg = 252, },
    [169] = { name = 'water', burst_msg = 252, },
    [170] = { name = 'water_ii', burst_msg = 252, },
    [171] = { name = 'water_iii', burst_msg = 252, },
    [172] = { name = 'water_iv', burst_msg = 252, },
    [173] = { name = 'water_v', burst_msg = 252, },
    [174] = { name = 'firaga', burst_msg = 252, },
    [175] = { name = 'firaga_ii', burst_msg = 252, },
    [176] = { name = 'firaga_iii', burst_msg = 252, },
    [177] = { name = 'firaga_iv', burst_msg = 252, },
    [178] = { name = 'firaga_v', burst_msg = 252, },
    [179] = { name = 'blizzaga', burst_msg = 252, },
    [180] = { name = 'blizzaga_ii', burst_msg = 252, },
    [181] = { name = 'blizzaga_iii', burst_msg = 252, },
    [182] = { name = 'blizzaga_iv', burst_msg = 252, },
    [183] = { name = 'blizzaga_v', burst_msg = 252, },
    [184] = { name = 'aeroga', burst_msg = 252, },
    [185] = { name = 'aeroga_ii', burst_msg = 252, },
    [186] = { name = 'aeroga_iii', burst_msg = 252, },
    [187] = { name = 'aeroga_iv', burst_msg = 252, },
    [188] = { name = 'aeroga_v', burst_msg = 252, },
    [189] = { name = 'stonega', burst_msg = 252, },
    [190] = { name = 'stonega_ii', burst_msg = 252, },
    [191] = { name = 'stonega_iii', burst_msg = 252, },
    [192] = { name = 'stonega_iv', burst_msg = 252, },
    [193] = { name = 'stonega_v', burst_msg = 252, },
    [194] = { name = 'thundaga', burst_msg = 252, },
    [195] = { name = 'thundaga_ii', burst_msg = 252, },
    [196] = { name = 'thundaga_iii', burst_msg = 252, },
    [197] = { name = 'thundaga_iv', burst_msg = 252, },
    [198] = { name = 'thundaga_v', burst_msg = 252, },
    [199] = { name = 'waterga', burst_msg = 252, },
    [200] = { name = 'waterga_ii', burst_msg = 252, },
    [201] = { name = 'waterga_iii', burst_msg = 252, },
    [202] = { name = 'waterga_iv', burst_msg = 252, },
    [203] = { name = 'waterga_v', burst_msg = 252, },
    [204] = { name = 'flare', burst_msg = 252, },
    [205] = { name = 'flare_ii', burst_msg = 252, },
    [206] = { name = 'freeze', burst_msg = 252, },
    [207] = { name = 'freeze_ii', burst_msg = 252, },
    [208] = { name = 'tornado', burst_msg = 252, },
    [209] = { name = 'tornado_ii', burst_msg = 252, },
    [210] = { name = 'quake', burst_msg = 252, },
    [211] = { name = 'quake_ii', burst_msg = 252, },
    [212] = { name = 'burst', burst_msg = 252, },
    [213] = { name = 'burst_ii', burst_msg = 252, },
    [214] = { name = 'flood', burst_msg = 252, },
    [215] = { name = 'flood_ii', burst_msg = 252, },
    [216] = { name = 'gravity', burst_msg = 252, },
    [217] = { name = 'gravity_ii', burst_msg = 252, },
    [218] = { name = 'meteor', burst_msg = 252, },
    [219] = { name = 'comet', burst_msg = 252, },
    [230] = { name = 'bio', burst_msg = 252, },
    [231] = { name = 'bio_ii', burst_msg = 252, },
    [232] = { name = 'bio_iii', burst_msg = 252, },
    [235] = { name = 'burn', burst_msg = 252, },
    [236] = { name = 'frost', burst_msg = 252, },
    [237] = { name = 'choke', burst_msg = 252, },
    [238] = { name = 'rasp', burst_msg = 252, },
    [239] = { name = 'shock', burst_msg = 252, },
    [240] = { name = 'drown', burst_msg = 252, },
    [245] = { name = 'drain', burst_msg = 274, },
    [246] = { name = 'drain_ii', burst_msg = 274, },
    [247] = { name = 'aspir', burst_msg = 275, },
    [248] = { name = 'aspir_ii', burst_msg = 228, },
    [252] = { name = 'stun', burst_msg = 268, },
    [278] = { name = 'geohelix', burst_msg = 252, },
    [279] = { name = 'hydrohelix', burst_msg = 252, },
    [280] = { name = 'anemohelix', burst_msg = 252, },
    [281] = { name = 'pyrohelix', burst_msg = 252, },
    [282] = { name = 'cryohelix', burst_msg = 252, },
    [283] = { name = 'ionohelix', burst_msg = 252, },
    [284] = { name = 'noctohelix', burst_msg = 252, },
    [285] = { name = 'luminohelix', burst_msg = 252, },
    [320] = { name = 'katon_ichi', burst_msg = 2, },
    [321] = { name = 'katon_ni', burst_msg = 2, },
    [322] = { name = 'katon_san', burst_msg = 2, },
    [323] = { name = 'hyoton_ichi', burst_msg = 2, },
    [324] = { name = 'hyoton_ni', burst_msg = 2, },
    [325] = { name = 'hyoton_san', burst_msg = 2, },
    [326] = { name = 'huton_ichi', burst_msg = 2, },
    [327] = { name = 'huton_ni', burst_msg = 2, },
    [328] = { name = 'huton_san', burst_msg = 2, },
    [329] = { name = 'doton_ichi', burst_msg = 2, },
    [330] = { name = 'doton_ni', burst_msg = 2, },
    [331] = { name = 'doton_san', burst_msg = 2, },
    [332] = { name = 'raiton_ichi', burst_msg = 2, },
    [333] = { name = 'raiton_ni', burst_msg = 2, },
    [334] = { name = 'raiton_san', burst_msg = 2, },
    [335] = { name = 'suiton_ichi', burst_msg = 2, },
    [336] = { name = 'suiton_ni', burst_msg = 2, },
    [337] = { name = 'suiton_san', burst_msg = 2, },
    [341] = { name = 'jubaku_ichi', burst_msg = 267, },
    [342] = { name = 'jubaku_ni', burst_msg = 267, },
    [343] = { name = 'jubaku_san', burst_msg = 267, },
    [344] = { name = 'hojo_ichi', burst_msg = 267, },
    [345] = { name = 'hojo_ni', burst_msg = 267, },
    [346] = { name = 'hojo_san', burst_msg = 267, },
    [347] = { name = 'kurayami_ichi', burst_msg = 267, },
    [348] = { name = 'kurayami_ni', burst_msg = 267, },
    [349] = { name = 'kurayami_san', burst_msg = 267, },
    [350] = { name = 'dokumori_ichi', burst_msg = 267, },
    [351] = { name = 'dokumori_ni', burst_msg = 267, },
    [352] = { name = 'dokumori_san', burst_msg = 267, },
    [454] = { name = 'fire_threnody', burst_msg = 268, },
    [455] = { name = 'ice_threnody', burst_msg = 268, },
    [456] = { name = 'wind_threnody', burst_msg = 268, },
    [457] = { name = 'earth_threnody', burst_msg = 268, },
    [458] = { name = 'lightning_threnody', burst_msg = 268, },
    [459] = { name = 'water_threnody', burst_msg = 268, },
    [460] = { name = 'light_threnody', burst_msg = 268, },
    [461] = { name = 'dark_threnody', burst_msg = 268, },
    [496] = { name = 'firaja', burst_msg = 252, },
    [497] = { name = 'blizzaja', burst_msg = 252, },
    [498] = { name = 'aeroja', burst_msg = 252, },
    [499] = { name = 'stoneja', burst_msg = 252, },
    [500] = { name = 'thundaja', burst_msg = 252, },
    [501] = { name = 'waterja', burst_msg = 252, },
    [502] = { name = 'kaustra', burst_msg = 252, },
    [503] = { name = 'impact', burst_msg = 252, },
    [505] = { name = 'gekka_ichi', burst_msg = 267, },
    [506] = { name = 'yain_ichi', burst_msg = 267, },
    [507] = { name = 'myoshu_ichi', burst_msg = 267, },
    [508] = { name = 'yurin_ichi', burst_msg = 267, },
    [509] = { name = 'kakka_ichi', burst_msg = 267, },
    [510] = { name = 'migawari_ichi', burst_msg = 267, },
    [513] = { name = 'venom_shell', burst_msg = 271, },
    [515] = { name = 'maelstrom', burst_msg = 252, },
    [521] = { name = 'mp_drainkiss', burst_msg = 275, },
    [522] = { name = 'death_ray', burst_msg = 252, },
    [524] = { name = 'sandspin', burst_msg = 252, },
    [531] = { name = 'ice_break', burst_msg = 252, },
    [532] = { name = 'blitzstrahl', burst_msg = 252, },
    [533] = { name = 'self-destruct', burst_msg = 252, },
    [534] = { name = 'mysterious_light', burst_msg = 252, },
    [535] = { name = 'cold_wave', burst_msg = 252, },
    [536] = { name = 'poison_breath', burst_msg = 252, },
    [537] = { name = 'stinking_gas', burst_msg = 268, },
    [541] = { name = 'blood_saber', burst_msg = 274, },
    [542] = { name = 'digest', burst_msg = 274, },
    [544] = { name = 'cursed_sphere', burst_msg = 252, },
    [548] = { name = 'filamented_hold', burst_msg = 271, },
    [555] = { name = 'magnetite_cloud', burst_msg = 252, },
    [557] = { name = 'eyes_on_me', burst_msg = 252, },
    [561] = { name = 'frightful_roar', burst_msg = 268, },
    [563] = { name = 'hecatomb_wave', burst_msg = 252, },
    [565] = { name = 'radiant_breath', burst_msg = 252, },
    [570] = { name = 'blood_drain', burst_msg = 274, },
    [572] = { name = 'sound_blast', burst_msg = 268, },
    [575] = { name = 'jettatura', burst_msg = 271, },
    [576] = { name = 'yawn', burst_msg = 271, },
    [582] = { name = 'chaotic_eye', burst_msg = 271, },
    [584] = { name = 'sheep_song', burst_msg = 271, },
    [591] = { name = 'heat_breath', burst_msg = 252, },
    [595] = { name = '1000_needles', burst_msg = 252, },
    [598] = { name = 'soporific', burst_msg = 271, },
    [604] = { name = 'bad_breath', burst_msg = 252, },
    [606] = { name = 'awful_eye', burst_msg = 268, },
    [608] = { name = 'frost_breath', burst_msg = 252, },
    [610] = { name = 'infrasonics', burst_msg = 268, },
    [612] = { name = 'actinic_burst', burst_msg = 268, },
    [616] = { name = 'temporal_shift', burst_msg = 271, },
    [618] = { name = 'blastbomb', burst_msg = 252, },
    [621] = { name = 'sandspray', burst_msg = 271, },
    [626] = { name = 'bomb_toss', burst_msg = 252, },
    [637] = { name = 'firespit', burst_msg = 252, },
    [644] = { name = 'mind_blast', burst_msg = 252, },
    [646] = { name = 'magic_hammer', burst_msg = 252, },
    [648] = { name = 'regurgitation', burst_msg = 252, },
    [651] = { name = 'corrosive_ooze', burst_msg = 252, },
    [846] = { name = 'flurry_ii', burst_msg = 0, },
}

return magic_bursts_by_spell_id
