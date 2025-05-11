-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Trishula')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    --select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon"} --hands="Ptero. Fin. G. +1"
	sets.precast.JA.Jump = {{
    ammo="Ginsen",
    head="Sulevia's Mask +1",
    neck="Lissome Necklace",
    ear1="Cessance Earring",
    ear2="sherida Earring",
    body="Pelt. Plackart +1",
    hands="sulevia's gauntlets +2",
    ring1="Petrov Ring",
    ring2="Rajas Ring",
    back="Brigantia's Mantle",
    waist="Ioskeha Belt",
    legs="Sulevi. Cuisses +1",
    feet="Flamma gambieras +1"
}
	sets.precast.JA['Ancient Circle'] = { legs="Vishap Brais" }
	--check gear--
	sets.precast.JA['High Jump'] = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		neck="Ganesha's Mala",
		ear1="Brutal Earring",
		ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,
		ring1="Petrov Ring",
		ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",
		waist="Windbuffet Belt +1",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2"}
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Windbuffet Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Ganesha's Mala",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Windbuffet Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +1"} --head="Vishap Armet",hands="Lnc. Vmbrc. +2"
	sets.precast.JA['Call Wyvern'] = {} --body="Ptero. Mail +1"
	sets.precast.JA['Deep Breathing'] = {} --hands="Ptero. Armet +1"
	sets.precast.JA['Spirit Surge'] = {} --body="Ptero. Mail +1"
	sets.precast.JA['Steady Wing'] = {}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {back="Brigantia's Mantle"}
	sets.precast.JA['Smiting Breath'] = {back="Brigantia's Mantle"}
	sets.HealingBreath = {
        ammo="Ginsen",
		head="Wyrm Armet",
        neck="Lancer's Torque",
        ear1="Cessance Earring",
        ear2="Tripudio Earring",
		body="Acro Surcoat",
        hands="Crusher Gauntlets",
        ring1="Dark Ring",
        ring2="K'ayres Ring",
        back="Updraft Mantle",
        waist="Glassblower's Belt",
        legs="Vishap Brais",
        feet="Wym. Greaves +2"
    }
	sets.SmitingBreath = {back="Brigantia's Mantle"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
        ammo="Impatiens",
        head="Cizin Helm +1", 
        ear1="Loquacious Earring", 
        hands="Leyline Gloves",
        legs="Limbo Trousers",
        ring1="Prolix Ring"
    }
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets CHECK SETS
	sets.midcast.FastRecast = {
		ammo="Staunch Tathlum",
		head="Carmine Mask +1",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
		body="Taeon Tabard",
		hands="Leyline Gloves",
		ring1="Lebeche Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Tempus Fugit",
		legs="Founder's Greaves",
		feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
    main="Trishula",
    sub="Utu grip",
    ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+21 Attack+21','Sklchn.dmg.+5%','VIT+7','Accuracy+8','Attack+15',}},
    body={ name="Valorous Mail", augments={'Accuracy+26','"Store TP"+7','DEX+5',}},
    hands="Sulevia's gauntlets +2",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Soil Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Sherida Earring",
    left_ring="Ifrit Ring +1",
    right_ring="Ifrit Ring +1",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = {
    main="Trishula",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Flamma Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+26','"Store TP"+7','DEX+5',}},
    hands="Sulev. Gauntlets +2",
    legs="Sulev. Cuisses +2",
    feet="Flam. Gambieras +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}

	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS.Fodder, {})


	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
    main="Trishula",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulevia's gauntlets +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Sulev. Leggings +1",
    neck="Twilight Torque",
    waist="Flume Belt +1",
    left_ear="Sanare Earring",
    right_ear="Colossus's Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Xucau Mantle",
}
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Town = {
    main="Trishula",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="sulevia's gauntlets +2",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Sulev. Leggings +1",
    neck="Twilight Torque",
    waist="Flume Belt +1",
    left_ear="Sanare Earring",
    right_ear="Colossus's Earring",
    left_ring="Vocane Ring",
    right_ring="Defending Ring",
    back="Xucau Mantle",
}
    
		
	sets.idle.Refresh = {ammo="Staunch Tathlum",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Amm Greaves"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {
        ammo="Ginsen",
		head="Ighwa Cap",
        neck="Twilight Torque",
        ear1="Cessance Earring",
        ear2="Tripudio Earring",
        body="Jumalik Mail",
        hands="Crusher Gauntlets",
        ring1="Patricius Ring",
        ring2="Dark Ring",
        back="Impassive Mantle",
        waist="Flume Belt",
        legs="Cizin Breeches +1",
        feet="Amm Greaves"
    }
	
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {
		head="Twilight Helm",
		body="Twilight Mail"
    })

	sets.defense.MDT = {
		ammo="Staunch Tathlum",
		head="Loess Barbuta +1",
		neck="Warder's Charm +1",
		ear1="Genmei Earring",
		ear2="Ethereal Earring",
		body="Tartarus Platemail",
		hands="Sulev. Gauntlets +2",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
		back="Moonlight Cape",
		waist="Flume Belt",
		legs="Arke Cosciales",
		feet="Amm Greaves"
}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Loess Barbuta +1",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Amm Greaves"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {
    main="Trishula",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Flamma Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','"Store TP"+6','VIT+2','Attack+12',}},
    hands="Flam. Manopolas +1",
    legs={ name="Valor. Hose", augments={'Accuracy+20 Attack+20','"Store TP"+8','AGI+3','Attack+14',}},
    feet="Flam. Gambieras +2",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}

    sets.engaged.SomeAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Brutal Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Regal Ring",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Niqmaddu Ring",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    
	sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Zennaroi Earring",ear2="Telos Earring",
		body=gear.valorous_wsd_body,hands=gear.valorous_acc_hands,ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Brigantia's Mantle",waist="Ioskeha Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
    
	sets.engaged.Fodder = {
    main="Trishula",
    sub="Utu Grip",
    ammo="Ginsen",
    head="Flamma Zucchetto +2",
    body={ name="Valorous Mail", augments={'Accuracy+25','"Store TP"+6','VIT+2','Attack+12',}},
    hands="Flam. Manopolas +1",
    legs={ name="Valor. Hose", augments={'Accuracy+20 Attack+20','"Store TP"+8','AGI+3','Attack+14',}},
    feet="Flam. Gambieras +2",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {}
    sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    sets.engaged.Fodder.PDT = {}
	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(5, 13)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 13)
    elseif player.sub_job == 'BLU' then
        set_macro_page(2, 13)
    else
        set_macro_page(5, 13)
    end
end