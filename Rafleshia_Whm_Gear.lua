-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT','MEVA')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Zeni','Zeni2000')

    select_default_macro_book(1, 1)
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    -----------------------------
    -- Start defining the sets --
    -----------------------------
	
	-- Weapons sets
	sets.WakeUpWeapons = {main="Prime Maul"}
	sets.weapons.Zeni = {range="Soultrapper",ammo="Blank Soulplate"}
	sets.weapons.Zeni2000 = {range="Soultrapper 2000",ammo="Blank Soulplate"}
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Idle sets --
	
	sets.idle = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +3",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Eabani earring",
		left_ring="Murky Ring",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
}

	sets.idle.PDT = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Null Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Ayanmo Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
}

	sets.idle.MEVA = {
		main="Daybreak",
		ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		left_ring="Inyanga Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
}

	sets.idle.Weak = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		neck="Loricate Torque +1",
		body="Ebers Bliaut +3",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Hearty Earring",
		left_ring="Murky Ring",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
}

    -- Defense sets

	sets.defense.PDT = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		neck="Loricate Torque +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		waist="Null Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Ayanmo Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
}

	sets.defense.MDT = {}

    sets.defense.MEVA = {
		main="Daybreak",
		ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",
		neck="Warder's Charm +1",
		body="Bunzi's Robe",
		hands="Bunzi's Gloves",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Eabani Earring",
		left_ring="Inyanga Ring",
		right_ring="Defending Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}}
}

    -- Precast Sets --

    -- Fast cast sets for spells
    sets.precast.FC = {
		main="C. Palug hammer",
		sub="Chanter's Shield", 
		ammo="Incantor Stone", --Impatiens
		head="Bunzi's Hat",
		body="Inyanga Jubbah +2",
		hands="Fanatic Gloves", --Fast Cast"+7
		--legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet="Regal Pumps +1",
		neck="Voltsurge Torque", --Cleric's Torque +2
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +3"})
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main="C. Palug hammer",
		sub="Sors Shield",
		ammo="Incantor Stone", --Impatiens
		head="Piety Cap +3",
		body="Inyanga jubbah +2",
		hands="Fanatic Gloves",
		legs="Ebers Pant. +3",
		feet="Regal Pumps +1",
		--neck="Voltsurge Torque",
		neck="Cleric's Torque +2",
		waist="Witful Belt",
		left_ear="Nourish. Earring",
		right_ear="Loquacious Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC.CureSolace = sets.precast.FC.Cure
	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +4"}
	sets.precast.JA.Devotion = {head="Piety Cap +3"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    sets.precast.WS.Dagan = {}
		
	sets.MaxTP = {left_ear="Cessance Earring",right_ear="Brutal Earring"}
	sets.MaxTP.Dagan = {left_ear="Etiolation Earring",right_ear="Evans Earring"}

    --sets.precast.WS['Flash Nova'] = {}
    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {}
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
	sets.MagicBurst = {neck="Mizu. Kubikazari",left_ring="Mujin Band",right_ring="Locus Ring"}
	
    sets.midcast.FastRecast = {
		ammo="Incantor Stone",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, --head="Ebers Cap +3",
		body="Inyanga Jubbah +2",
		hands="Fanatic Gloves",
		--legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet="Regal Pumps +1",
		neck="Cleric's Torque +2",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Perimede Cape",
}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}}, 
		--main="Raetic Rod +1", 30M AH
		sub="Sors Shield", --sub="Thuellaic Ecu +1",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Theophany Mitts +4",
		legs="Ebers Pant. +3", 
		feet="Vanya Clogs", --Kaykaus Boots +1 D: Mag. Acc. +20,Cure Potency +6,Fast Cast +4%
		neck="Clr. Torque +2",
		waist="Luminary Sash", 
		-- waist="Shinjutsu-no-obi +1", needs augments, Lustreless Scale
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", needs augments, Lustreless Hide
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Damage taken-5%',}},
}

	sets.midcast.CureSolace = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightWeatherCureSolace = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightDayCureSolace = set_combine(sets.midcast.Cure,{})
	sets.midcast.LightDayCure = set_combine(sets.midcast.Cure,{})
	sets.midcast.Cure.DT = set_combine(sets.midcast.Cure,{})

	sets.midcast.Curaga = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Theophany Mitts +4",
		legs="Ebers Pant. +3",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1", --needs augments, Lustreless Scale
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", --needs augments, Lustreless Hide
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Damage taken-5%',}},
}
		
	sets.midcast.LightWeatherCuraga = set_combine(sets.midcast.Curaga,{})
	sets.midcast.LightDayCuraga = set_combine(sets.midcast.Curaga,{})
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {}
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {
		main="Yagrush",
		sub="Sors Shield",
--	sub="Thuellaic Ecu +1",
		ammo="Incantor Stone",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaut +3",
		hands="Fanatic Gloves",
		legs="Th. Pant. +3",
		feet="Vanya Clogs",
		neck="Malison Medallion",
		waist="Bishop's Sash",
		left_ear="Meili Earring",
		right_ear="Ebers Earring +2",
		left_ring="Menelaus's Ring",
		right_ring="Haoma's Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
}

	sets.midcast.StatusRemoval = {
		main="Yagrush",
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck="Cleric's Torque +2",
		waist="Witful Belt",
		left_ear="Magnetic Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape +1",
}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+4','Mag. Acc.+15','DMG:+1',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +4",
		neck="Colossus's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Magnetic Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape +1",
}

	sets.midcast.Haste = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+4','Mag. Acc.+15','DMG:+1',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +4",
		neck="Colossus's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Magnetic Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape +1",
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash",
		right_ear="Earthcry Earring",
		neck="Nodens Gorget",
})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +3"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		main="Vadose Rod",
		head="Chironic Hat",
		hands="Regal Cuffs",
})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main="Bolelabunga",
		head="Inyanga Tiara +2",
		hands="Ebers Mitts +3",
		body="Piety Briault +4",
		legs="Theophany Pantaloons +3"
})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring",feet="Piety Duckbills +1",left_ear="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring",feet="Piety Duckbills +1",left_ear="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring",legs="Piety Pantaln. +3",left_ear="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {right_ring="Sheltered Ring",legs="Piety Pantaln. +3",left_ear="Gifted Earring",waist="Sekhmet Corset"})
	
	
	sets.midcast.BarElement = {
		main="Beneficus",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		legs="Piety Pantaln. +3",
		feet="Ebers Duckbills +3",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Magnetic Earring",
		left_ring="Murky Ring",
		right_ring="Stikini Ring +1",
		back="Fi Follet Cape +1",
}

	sets.midcast.Impact = {}
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast['Divine Magic'] = {
		main="Marin Staff",
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Inyanga Tiara +2",
		body={ name="Witching Robe", augments={'MP+40','Mag. Acc.+10',}},
		hands="Fanatic Gloves",
		legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet="Theo. Duckbills +4",
		neck="Sanctity Necklace",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Fenrir Ring +1",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Toro Cape",
}
		
	sets.midcast.Holy = {}
	sets.midcast['Dark Magic'] = {}
    sets.midcast.Drain = {}
    sets.midcast.Drain.Resistant = {}
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant
	sets.midcast.Stun = {}
	sets.midcast.Stun.Resistant = {}
	sets.midcast.Dispel = {}
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})


	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak", --Yagrush R15
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +3",
		body="Theo. Bliaut +3",
		hands="Theo. Mitts +4",
		legs="Theophany Pantaloons +4",
		feet="Theo. Duckbills +4",
		neck="Null Loop",
		waist="Obstin. Sash",
		left_ear="Regal Earring",
		right_ear="Ebers Earring +2",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
}

	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Theophany Cap +3",
		body="Theo. Bliaut +3",
		hands="Theo. Mitts +4",
		legs="Theophany Pantaloons +4",
		feet="Theo. Duckbills +4",
		neck="Null Loop",
		waist="Obstin. Sash",
		left_ear="Regal Earring",
		right_ear="Ebers Earring +2",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Befouled Crown",})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Yagrush",})
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})


    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {
		main="Daybreak",
		sub="Genmei Shield",
		head="Bunzi's Hat",
		ammo="Homiliary",
		body="Ebers Bliaut +3",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		waist="Cleric's Belt",
		neck="Grandiose Chain",
		left_ear="Relaxing Earring",
		right_ear="Hearty Earring", -- Eabani earring
		left_ring="Murky Ring",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Damage taken-5%',}},
}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
	
    -- sets.engaged = {head="Nahtirah Hat",neck="Asperity Necklace",left_ear="Bladeborn Earring",right_ear="Steelflash Earring",
--body="Vanir Cotehardie",hands="Dynasty Mitts",left_ring="Rajas Ring",right_ring="K'ayres Ring",
--back="Umbra Cape",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.engaged.Acc = {ammo="Hasty Pinion +1",
        --head="Aya. Zucchetto +2",neck="Combatant's Torque",left_ear="Telos Earring",right_ear="Brutal Earring",
		--body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",left_ring="Petrov Ring",right_ring="Ilabrat Ring",
        --back="Kayapa Cape",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	--sets.engaged.DW = {ammo="Staunch Tathlum +1",
        --head="Aya. Zucchetto +2",neck="Asperity Necklace",left_ear="Telos Earring",right_ear="Suppanomimi",
		--body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",left_ring="Petrov Ring",right_ring="Ilabrat Ring",
        --back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

    --sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
        --head="Aya. Zucchetto +2",neck="Combatant's Torque",left_ear="Telos Earring",right_ear="Suppanomimi",
		--body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",left_ring="Petrov Ring",right_ring="Ilabrat Ring",
        --back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +3",back="Mending Cape"}

	--sets.HPDown = {head="Pixie Hairpin +1",left_ear="Mendicant's Earring",right_ear="Evans Earring",
		--body="Zendik Robe",hands="Hieros Mittens",left_ring="Mephitas's Ring +1",right_ring="Mephitas's Ring",
		--back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}

	--sets.HPCure = {main="Queller Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		--head="Blistering Sallet +1",neck="Nodens Gorget",left_ear="Etiolation Earring",right_ear="Ethereal Earring",
		--body="Kaykaus Bliaut",hands="theophany mitts +3",left_ring="Kunaji Ring",right_ring="Meridian Ring",
		--back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pant. +3",feet="Kaykaus Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
		set_macro_page(1, 1)
end

function sub_job_change(new,old)
send_command('wait 5;input /lockstyleset 20')
end

send_command('wait 5;input /lockstyleset 20')

send_command('exec init.txt')