-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons','MeleeWeapons')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds	
	
	-- send_command('bind ^` input /ma "Arise" <t>')
	-- send_command('bind !` input /ja "Penury" <me>')
	-- send_command('bind @` gs c cycle MagicBurstMode')
	-- send_command('bind ^@!` gs c toggle AutoCaress')
	-- send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	-- send_command('bind @backspace input /ma "Aurora Storm" <me>')
	-- send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	-- send_command('bind !backspace input /ja "Accession" <me>')
	-- send_command('bind != input /ja "Sublimation" <me>')
	-- send_command('bind ^delete input /ja "Dark Arts" <me>')
	-- send_command('bind !delete input /ja "Addendum: Black" <me>')
	-- send_command('bind @delete input /ja "Manifestation" <me>')
	-- send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	-- send_command('bind @\\\\ input /ma "Shellra V" <me>')
	-- send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book(1, 1)
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.MeleeWeapons = {main="Izcalli",sub="Ammurapi Shield"}
	sets.weapons.DualWeapons = {main="Izcalli",sub="Nehushtan"}
	sets.WakeUpWeapons = {main="Prime Maul"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		main="Grioavolr", --main="C. Palug hammer",
		--sub="Chanter's Shield", 
		ammo="Incantor Stone", --Impatiens
		head="Vanya Hood", --Bunzi's Hat
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
		back="Alaunus's Cape",
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +2"})
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main="Queller Rod", --main="C. Palug hammer",
		sub="Sors Shield",
		ammo="Incantor Stone", --Impatiens
		head="Piety Cap +2",
		body="Inyanga jubbah +2",
		hands="Fanatic Gloves",
		legs="Ebers Pant. +2", --+3
		feet="Regal Pumps +1",
		--neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Nourish. Earring",
		right_ear="Loquacious Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Alaunus's Cape", --back={ name="Alaunus's Cape", augments={'"Fast Cast"+10',}},
})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC.CureSolace = sets.precast.FC.Cure
	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    sets.precast.WS.Dagan = {}
		
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {back="Umbra Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {}
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
	sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {
		ammo="Incantor Stone",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, --head="Ebers Cap +3",
		body="Inyanga Jubbah +2",
		hands="Fanatic Gloves",
		--legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet="Regal Pumps +1",
		--neck="Voltsurge Torque", --neck="Cleric's Torque +2",
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
		--main="Raetic Rod +1",
		sub="Sors Shield",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum", --Pemphredo Tathlum
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque", 
		--neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash", 
		--waist="Austerity Belt",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape", --MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10
}
		
	sets.midcast.CureSolace = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}}, 
		--main="Raetic Rod +1",
		sub="Sors Shield",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum", --Pemphredo Tathlum
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque", 
		--neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash", 
		--waist="Austerity Belt",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape", --MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Fast Cast"+10
}

	sets.midcast.LightWeatherCure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}

	sets.midcast.LightWeatherCureSolace = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}
		
	sets.midcast.LightDayCureSolace = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}

	sets.midcast.LightDayCure = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}

	sets.midcast.Curaga = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}
		
	sets.midcast.LightWeatherCuraga = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}
		
	sets.midcast.LightDayCuraga = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}

	sets.midcast.Cure.DT = {
		main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		sub="Sors Shield",
		--main="Raetic Rod +1",
		--sub="Thuellaic Ecu +1",
		ammo="Oreiad's Tathlum",
		head="Ebers Cap +2", --+3
		body="Ebers Bliaut +3", --+3
		hands="Theophany Mitts +3",
		legs="Ebers Pant. +2",  --+3
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		-- waist="Shinjutsu-no-obi +1",
		left_ear="Nourish. Earring",
		right_ear="Glorious Earring",
		left_ring="Naji's Loop",
		right_ring="Ephedra Ring", 
		--right_ring="Mephitas's Ring +1", -- needs augments
		back="Alaunus's Cape",
}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +3"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +3"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +3",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +3"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +3",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaud +3",waist="Hachirin-no-Obi"})
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
	left_ear="Malignance Earring",
--		left_ear="Meili Earring",  --domain points
	right_ear="Ebers Earring +1",
	left_ring="Prolix Ring",
	right_ring="Kishar Ring",
	--left_ring="Menelaus's Ring",
	--right_ring="Haoma's Ring",
	back="Alaunus's Cape",
}

	sets.midcast.StatusRemoval = {
    main="Yagrush",
    sub="Sors Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +2", --+3
    legs="Ebers Pant. +2", --+3
    feet="Ebers Duckbills +2", --+3
    neck="Voltsurge Torque",
--	neck="Cleric's Torque +2",
    waist="Witful Belt",
    left_ear="Magnetic Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Kishar Ring",
    back="Fi Follet Cape +1", --Augment - Vidmapire
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
		feet="Theo. Duckbills +2",
		neck="Colossus's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Magnetic Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape +1",--Augment - Vidmapire
}

	sets.midcast.Haste = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+4','Mag. Acc.+15','DMG:+1',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +2",
		neck="Colossus's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Magnetic Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Fi Follet Cape +1",--Augment - Vidmapire
}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash",
		right_ear="Earthcry Earring",
		neck="Nodens Gorget",
})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +2"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
	main="Vadose Rod",
	head="Chironic Hat",
	hands="Regal Cuffs",
})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
	main="Bolelabunga",
	head="Inyanga Tiara +2",
	hands="Ebers Mitts +2",
	body="Piety Bliaut +3",
	legs="Th. Pant. +3"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +2",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +2",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +2",ear1="Gifted Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +2",ear1="Gifted Earring",waist="Sekhmet Corset"})
	
	
	sets.midcast.BarElement = {
    main="Beneficus",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Ebers Cap +2",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +2",
    legs={ name="Piety Pantaln. +2", augments={'Enhances "Afflatus Misery" effect',}},
    feet="Theo. Duckbills +2",
	--feet="Ebers Duckbills +2",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Andoaa Earring",
    right_ear="Magnetic Earring",
    left_ring="Defending Ring",
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
		feet="Theo. Duckbills +2",
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
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +2", -- Theophany Cap +3
		body="Theo. Bliaut +2",
		hands="Bunzi's Gloves",
		--hands="Regal Cuffs",
		legs="Bunzi's Pants",
		--legs={ name="Chironic Hose", augments={'Mag. Acc.+24','Haste+1','MND+14','"Mag.Atk.Bns."+11',}},
		feet="Theo. Duckbills +2",
		neck="Null Loop",
		waist={ name="Acuity Belt +1", augments={'Path: A',}}, -- Obstin. Sash augmented
		left_ear="Regal Earring",
		right_ear="Malignance Earring", -- whm sortie earring
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
}

	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +2", -- Theophany Cap +3
		body="Theo. Bliaut +2",
		hands="Bunzi's Gloves",
		--hands="Regal Cuffs",
		legs="Bunzi's Pants",
		--legs={ name="Chironic Hose", augments={'Mag. Acc.+24','Haste+1','MND+14','"Mag.Atk.Bns."+11',}},
		feet="Theo. Duckbills +2",
		neck="Null Loop",
		waist={ name="Acuity Belt +1", augments={'Path: A',}}, -- Obstin. Sash augmented
		left_ear="Regal Earring",
		right_ear="Malignance Earring", -- whm sortie earring
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
		legs="Ebers Pant. +2",
		feet="Ebers Duckbills +2",
		waist="Cleric's Belt",
		neck="Grandiose Chain",
		left_ear="Relaxing Earring",
		right_ear="Hearty Earring", -- Eabani earring
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back="Alaunus's Cape",
}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +3",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Ebers Duckbills +2",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring", -- Eabani earring
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back="Alaunus's Cape",
}

	sets.idle.Refresh = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +3",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Ebers Duckbills +2",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring", -- Eabani earring
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back="Alaunus's Cape",
}

	sets.idle.PDT = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +3",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Ebers Duckbills +2",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring", -- Eabani earring
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back="Alaunus's Cape",
}
	
		
	sets.idle.MDT = {}
		
	sets.idle.Weak = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +3",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Ebers Duckbills +2",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring", -- Eabani earring
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back="Alaunus's Cape",
}

    -- Defense sets

	sets.defense.PDT = {
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Isa Belt",
		left_ear="Magnetic Earring",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring="Dark Ring",
		back="Solemnity Cape",
}

	sets.defense.MDT = {
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Isa Belt",
		left_ear="Magnetic Earring",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring="Dark Ring",
		back="Solemnity Cape",
}

    sets.defense.MEVA = {
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza +1",
		hands="Aya. Manopolas +2",
		legs="Aya. Cosciales +2",
		feet="Aya. Gambieras +2",
		neck="Loricate Torque +1",
		waist="Isa Belt",
		left_ear="Magnetic Earring",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring="Dark Ring",
		back="Solemnity Cape",
}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
	
    -- sets.engaged = {head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
--body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Rajas Ring",ring2="K'ayres Ring",
--back="Umbra Cape",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.engaged.Acc = {ammo="Hasty Pinion +1",
        --head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Brutal Earring",
		--body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        --back="Kayapa Cape",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	--sets.engaged.DW = {ammo="Staunch Tathlum +1",
        --head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Telos Earring",ear2="Suppanomimi",
		--body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        --back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

    --sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
        --head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Suppanomimi",
		--body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        --back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}

	--sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		--body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		--back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}

	--sets.HPCure = {main="Queller Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		--head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		--body="Kaykaus Bliaut",hands="theophany mitts +3",ring1="Kunaji Ring",ring2="Meridian Ring",
		--back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pant. +2",feet="Kaykaus Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
		set_macro_page(1, 1)
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		{Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	},
	
	AutoMelee = {
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Engaged'},
		{Name='Temper II',		Buff='Multi Strikes',SpellID=895,	When='Engaged'},
	},
	
	Default = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	FullMeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},

	Odin = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	Tolba = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enblizzard',		Buff='Enblizzard',		SpellID=104,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Barwater',		Buff='Barwater',		SpellID=65,		Reapply=false},
	},
	
	HybridCleave = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	}}
	
function sub_job_change(new,old)
send_command('wait 5;input /lockstyleset 20')
end

send_command('wait 5;input /lockstyleset 20')

send_command('exec init.txt')