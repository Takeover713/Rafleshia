-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('Normal','Acc')
	state.RangedMode:options('Normal','Acc')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Default','Gun','Bow','DualWeapons')
	
	DefaultAmmo = {['Fomalhaut']="Chrono Bullet"}
	U_Shot_Ammo = {['Fomalhaut']="Animkii Bullet"}
	
	gear.tp_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.wsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	--send_command('bind @` gs c cycle SkillchainMode')
	--send_command('bind !r gs c weapons MagicWeapons;gs c update')
	--send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	
	send_command('exec init.txt')
	
	select_default_macro_book(1,13)

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +1"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Double Shot'] = {head="Amini Gapette"}
	sets.precast.JA['Velocity Shot'] = {body="Amini Caban +1"}

	-- Weapons sets --
	sets.weapons.Default = {main="Perun +1",sub="Nusku Shield",range="Yoichinoyumi",ammo="Yoichi's Arrow"}
		
	sets.weapons.Gun = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut",ammo="Chrono Bullet"}
		
	sets.weapons.Bow = {main="Perun +1",sub="Nusku Shield",range="Fail-Not",ammo="Chrono Arrow"}
		
	sets.weapons.DualWeapons = {main="Malevolence +1",sub="Malevolence",range="Fomalhaut",ammo="Chrono Bullet"}

	-- Fast cast sets for spells

    sets.precast.FC = {
		ear1="Loquacious Earring",
        ring1="Prolix Ring",
}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		neck="Magoraga Beads",
		body="Passion Jacket"
})

	-- Ranged sets (Snapshot)
	
	sets.precast.RA = {
    head="Orion Beret +1",
    body="Oshosi Vest",
    hands="Oshosi Gloves",
    legs="Oshosi Trousers",
    feet="Meg. Jam. +2",
    waist="Yemaya Belt",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
	head="Orion Beret +1",
    body="Oshosi Vest",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
	--right_ear="",
    right_ring="Regal Ring",
	left_ring="Beithir ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}

    sets.precast.WS.Acc = {}
	
	sets.precast.WS['Namas Arrow'] = {
	head="Orion Beret +1",
    body="Oshosi Vest",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
	--right_ear="",
    right_ring="Regal Ring",
	left_ring="Beithir ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}

    sets.precast.WS['Wildfire'] = {
	head="Orion Beret +1",
    body="Oshosi Vest",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
	--right_ear="",
    right_ring="Regal Ring",
	left_ring="Beithir ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}

    sets.precast.WS['Trueflight'] = {
	head="Orion Beret +1",
    body="Oshosi Vest",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Meg. Jam. +2",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
	--right_ear="",
    right_ring="Regal Ring",
	left_ring="Beithir ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = {}
		
	-- Ranged sets

    sets.midcast.RA = {
	head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
    body="Oshosi Vest",
    hands="Amini Glove. +1",
    legs="Amini Bragues +1",
    feet="Ikenga's Clogs",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Dedition Earring",
    right_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}
	
    sets.midcast.RA.Acc = {
	head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
    body="Oshosi Vest",
    hands="Amini Glove. +1",
    legs="Amini Bragues +1",
    feet="Ikenga's Clogs",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Beyla Earring",
    right_ear="Crepuscular Ring", --wyrm god
    left_ring="Harjuk Ring +1",
    right_ring="Regal Ring",
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {body="Orion Jerkin +1"}
	
	sets.buff.Camouflage.Acc = {}
	
	sets.buff['Double Shot'] = {back=gear.tp_ranger_jse_back}
	
	sets.buff['Double Shot'].Acc = {}
	
	sets.buff.Barrage = {hands="Orion Bracers +1"}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
    sets.idle = {
    head={ name="Arcadian Beret +1", augments={'Enhances "Recycle" effect',}},
    body="Oshosi Vest",
    hands="Oshosi Gloves",
    legs="Oshosi Trousers",
    feet="Ikenga's Clogs",
    neck="Loricate Torque +1",
    waist="Flax Sash",
    left_ear="Genmei Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+4','"Store TP"+10',}},
}
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}
		
    sets.defense.MEVA = {}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {}

    sets.engaged.Acc = {}

    sets.engaged.DW = {}
    
    sets.engaged.DW.Acc = {}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 13)
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 20')
end