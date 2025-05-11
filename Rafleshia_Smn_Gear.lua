-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT','TPEat')
	state.Weapons:options('None','Gridarvor','Grioavolr','Khatvanga')

    gear.perp_staff = {name="Gridarvor"}
	
	gear.magic_jse_back = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	gear.phys_jse_back = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	
    --send_command('bind !` input /ja "Release" <me>')
	--send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	--send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	--send_command('bind !q gs c weapons default;gs c reset CastingMode')
	
    select_default_macro_book(1, 4)
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {        
		head="Glyphic Horn +1",
}
    
    sets.precast.JA['Elemental Siphon'] = {	    
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +2",
    body="Baayami Robe +1",
    hands="Baayami Cuffs +1",
    legs="Baayami Slops +1",
    feet="Beck. Pigaches +1",
    neck="Incanter's Torque",
    waist="Kobo Obi",
    left_ear="C. Palug Earring",
    right_ear="Lodurr Earring",
    left_ring="Evoker's Ring",
    right_ring="Stikini Ring +1",
    back="Conveyance Cape",
}

    sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers +2"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {	
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +2",
    body="Baayami Robe +1",
    hands="Baayami Cuffs +1",
    legs="Baayami Slops +1",
    feet="Baaya. Sabots +1",
    neck="Incanter's Torque",
    waist="Kobo Obi",
    left_ear="C. Palug Earring",
    right_ear="Lodurr Earring",
    left_ring="Evoker's Ring",
    right_ring="Stikini Ring +1",
    back="Conveyance Cape",
}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard	
	
    -- Fast cast sets for spells
    
    sets.precast.FC = {		
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +2",
		feet="Regal Pumps +1",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Veela Cape",
}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity", augments={'MP+10','"Cure" spellcasting time -9%'}, sub="Clerisy Strap +1"})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})       
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {        
		head="Nahtirah Hat",
		ear1="Gifted Earring",
		ear2="Loquacious Earring",
        body="Con. Doublet +3",
		hands="Caller's Bracers +2",
		ring1="Evoker's Ring",
		ring2="Sangoma Ring",
        back="Pahtli Cape",
		waist="Fucho-no-Obi",
		legs="Nares Trews",
		feet="Chelona Boots +1"
}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {        
		head="Nahtirah Hat",
		ear2="Loquacious Earring",
        body="Vanir Cotehardie",
		hands="Bokwus Gloves",
		ring1="Prolix Ring",
        back="Swith Cape +1",
		waist="Witful Belt",
		legs="Hagondes Pants",
		feet="Hagondes Sabots"}
	
    sets.midcast.Cure = {
		main={ name="Serenity", augments={'MP+5','"Cure" potency +1%',}},
		sub="Achaq Grip",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Heka's Kalasiris",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Fylgja Torque",
		waist="Witful Belt",
		left_ear="Beatific Earring",
		right_ear="Magnetic Earring",
		left_ring="Sirona's Ring",
		right_ring="Janniston Ring",
		back="Veela Cape",
}
		
	sets.Self_Healing = {
		neck="Phalaina Locket",
		ring1="Kunaji Ring",
		ring2="Asklepian Ring",
		waist="Gishdubar Sash"
}
	
	sets.Cure_Received = {
		neck="Phalaina Locket",
		ring1="Kunaji Ring",
		ring2="Asklepian Ring",
		waist="Gishdubar Sash"
}
	
	sets.Self_Refresh = {
		back="Grapevine Cape",
		waist="Gishdubar Sash",
		feet="Inspirited Boots"
}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		neck="Debilis Medallion",
		hands="Hieros Mittens",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		back="Tempered Cape +1",
		waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})

	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast['Elemental Magic'].Resistant = {}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {}
		
	sets.midcast.Impact = {
		ammo="Pemphredo Tathlum",
		head=empty,
		neck="Erra Pendant",
		ear1="Enchntr. Earring +1",
		ear2="Gwati Earring",
		body="Twilight Cloak",
		hands="Regal Cuffs",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Toro Cape",
		waist="Acuity Belt +1",
		legs="Merlinic Shalwar",
		feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})

    sets.midcast['Divine Magic'] = {}
		
    sets.midcast['Dark Magic'] = {}
	
	sets.midcast.Drain = {}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {}
		
    sets.midcast.Stun.Resistant = {}
		
	sets.midcast['Enfeebling Magic'] = {}
		
	sets.midcast['Enfeebling Magic'].Resistant = {}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {
		ammo="Clarus Stone",
		head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="C. Palug Earring",
		ear2="Gifted Earring",
		body="Telchine Chas.",
		hands="Telchine Gloves",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Perimede Cape",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
		head="Amalric Coif +1",
		hands="Regal Cuffs",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"})
    
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		ear2="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		legs="Shedir Seraweels"})

    -- Avatar pact sets.  All pacts are Ability type.
    
		-- Blood Pact Ward--
	
    sets.midcast.Pet.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",	
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		legs="Baayami Slops +1",
		feet="Baayami Sabots +1",
		neck="Incanter's Torque",
		waist="Kobo Obi",
		right_ear="C. Palug Earring",
		left_ear="Lodurr Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
		back="Conveyance Cape"
}

    sets.midcast.Pet.DebuffBloodPactWard = {	
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2",
		body="Baayami Robe +1",
		hands="Baayami Cuffs +1",
		legs="Baayami Slops +1",
		feet="Baayami Sabots +1",
		neck="Incanter's Torque",
		waist="Kobo Obi",
		right_ear="C. Palug Earring",
		left_ear="Lodurr Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
		back="Conveyance Cape"
}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
	
		-- Specified Blood Pact Ward --
	
	sets.midcast.Pet['Winds Blessing'] = {
		main="Nirvana",
		sub="Vox Grip",
		ammo="Sancus Sachet +1",
		head="Beckoner's Horn +2",
		body="Shomonjijoe +1",
		hands="Baayami Cuffs +1",
		legs="Assid. Pants +1",
		feet="Baayami Sabots +1",
		neck="Incanter's Torque",
		waist="Kobo Obi",
		right_ear="C. Palug Earring",
		left_ear="Lodurr Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
		back="Conveyance Cape",
}

		-- Blood Pact Rage --
	
    sets.midcast.Pet.PhysicalBloodPactRage = {	    
		main="Nirvana",
        sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+29','Blood Pact Dmg.+10',}},
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet="Convo. Pigaches +3",
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Incarnation Sash",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10',}},
}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(PhysicalBloodPactRage, {
		feet="Convo. Pigaches +3"})

    sets.midcast.Pet.MagicalBloodPactRage = {
		main="Grioavolr",
        sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head={ name="Apogee Crown", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+29','Blood Pact Dmg.+10',}},
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck="Smn. Collar +2",
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {
		body="Con. Doublet +3",
		feet="Convo. Pigaches +3",
})
		-- Specified Blood Pact Rage --
	
	sets.midcast.Pet['Flaming Crush'] = {
		main="Nirvana",
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="C. Palug Crown",
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+29','Blood Pact Dmg.+10',}},
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
}

		-- Merit BloodPactRage --

	sets.midcast.Pet['Meteor Strike'] = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+10','Pet: Mag. Acc.+15','Pet: "Mag.Atk.Bns."+22',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="C. Palug Crown",
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+29','Blood Pact Dmg.+10',}},
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
}

	sets.midcast.Pet['Heavenly Strike'] = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+10','Pet: Mag. Acc.+15','Pet: "Mag.Atk.Bns."+22',}},
		sub="Elan Strap +1",
		ammo="Sancus Sachet +1",
		head="C. Palug Crown",
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+29','Blood Pact Dmg.+10',}},
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck={ name="Smn. Collar +2", augments={'Path: A',}},
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
}

	
    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {		
		head="Goliard Chapeau",
		body="Chelona Blazer",
		hands="Oracle's Gloves",
		legs="Yigit Seraweels",
		legs="Assiduity Pants +1",
		feet="Goliard Clogs",
		waist="Cleric's Belt",
		neck="Grandiose Chain",
		back="Vita Cape",
		left_ear="Relaxing Earring"
}
    
    -- Idle sets
    sets.idle = {		
		main="Nirvana",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        neck="Loricate Torque +1",
        lear="Gelos Earring",
        rear="Lugalbanda Earring",
        body="Shomonjijoe +1",
		hands="Beck. Bracers +1",
        lring="Defending Ring",
        rring="Sheltered Ring",
        back="Solemnity Cape",
        waist="Witful Belt",
        legs="Assid. Pants +1",
        feet="Beck. Pigaches +1"}

    sets.idle.PDT = {}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Gridarvor: -5
    -- Glyphic Horn: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Con. Pigaches +1: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {		
		main="Nirvana",
        sub="Elan Strap",
		ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        neck="Incanter's Torque",
        lear="Gifted Earring",
        rear="Evans Earring",
        body="Baayami Robe +1",
        hands="Baayami Cuffs +1",
        lring="Evoker's Ring",
        rring="Speaker's Ring",
        back="Campestres's cape",
        waist="Lucidity Sash",
        legs="Baayami Slops +1",
        feet="Baaya. Sabots +1"}
		
    sets.idle.PDT.Avatar = {
		ammo="Seraphicaller",
        head="Convoker's Horn",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Regimen Mittens",ring1="Evoker's Ring",ring2="Defending Ring",
        back="Conveyance Cape",waist="Fucho-no-Obi",legs="Hagondes Pants",feet="Convoker's Pigaches"}

    sets.idle.Spirit = {main="Gridarvor",sub="Oneiros Grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shomonjijoe +1",hands=gear.merlinic_refresh_hands,ring1="Evoker's Ring",ring2="Sheltered Ring",
        back="Conveyance Cape",waist="Lucidity Sash",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Spirit = {ammo="Seraphicaller",
        head="Convoker's Horn",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Serpentes Cuffs",ring1="Evoker's Ring",ring2="Sangoma Ring",
        back="Samanisi Cape",waist="Fucho-no-Obi",legs="Summoner's Spats",feet="Herald's Gaiters"}
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {neck="Chrys. Torque"})
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {		
		main="Nirvana",
        sub="Elan Strap",
		ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        neck="Incanter's Torque",
        lear="C. Palug Earring",
        rear="Evans Earring",
        body="Apogee Dalmatica +1",
        hands="Glyphic Bracers +1",
        lring="Evoker's Ring",
        rring="Stikini Ring +1",
        back="Campestres's cape",
        waist="Lucidity Sash",
        legs="Assid. Pants +1",
        feet="Baaya. Sabots +1",
}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = set_combine(sets.perp, {hands="Asteria Mitts +1"})
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {main="Nirvana", sub="Elan Strap"}
    
    -- Defense sets
    sets.defense.PDT = {
    sub="Elan Strap +1",
    ammo="Sancus Sachet +1",
    head="Beckoner's Horn +2",
    body="Apogee Dalmatica +1",
    hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Assid. Pants +1",
    feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
    neck="Incanter's Torque",
    waist="Klouskap Sash",
    left_ear="Handler's Earring +1",
    right_ear="Enmerkar Earring",
    left_ring="Evoker's Ring",
    right_ring="Speaker's Ring",
    back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Regen"+10',}},
}

    sets.defense.MDT = {}

    sets.defense.MEVA = {}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Sacrifice Torque"}

	-- Weapons sets
	sets.weapons.Gridarvor = {main="Gridarvor", sub="Elan Strap +1"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
	sets.weapons.Grioavolr = {main="Grioavolr",sub="Elan Strap +1"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {		
		head="Tali'ah Turban +1",
		body="Tali'ah Manteel +1",
		hands="Tali'ah Gages +1",
		legs="Tali'ah Sera. +1",
		feet="Tali'ah Crackows +1",
		neck="Shulmanu Collar",
		waist="Klouskap Sash",
		left_ear="Mache Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10',}},
}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 4)
end

-- function user_self_command(commandArgs, eventArgs)
	-- if commandArgs[1] == 'rad' then
	   -- send_command('input /echo waiting; wait 4.5; input //temps buy radialens')
       -- add_to_chat(158,'Radialens')
	-- elseif commandArgs[1] == 'bli' then
       -- send_command('input /ma "Blind" <bt>')
	   -- add_to_chat(158,'Blinding')
	-- elseif commandArgs[1] == 'ewz' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew z')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew1' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 1')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew2' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 2')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew3' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 3')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew4' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 4')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew5' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 5')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew6' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 6')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew7' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 7')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew8' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 8')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew9' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 9')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew10' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 10')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew11' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 11')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew12' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 12')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew13' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 13')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew14' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 14')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew15' then
	   -- send_command('input /echo waiting; wait 5.5; input //ew 15')
       -- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'stop' then
       -- windower.ffxi.run(false)
       -- windower.ffxi.follow()
	   -- add_to_chat(158,'Chillin')
	-- elseif commandArgs[1] == 'food' then
       -- send_command('input /item "Shiromochi +1" <me>')
       -- add_to_chat(158,'Eating')
	-- elseif commandArgs[1] == 'attackbt' then
		-- send_command('input /attack <bt>; wait 4; input /ja "Aggressor" <me>')
		-- add_to_chat(158,'Attack bt')
	-- elseif commandArgs[1] == 'charm' then
       -- send_command('input /item "Charm Buffer" <me>')
       -- add_to_chat(158,'Charm buffer')
	-- elseif commandArgs[1] == 'wing1' then
       -- send_command('input /item "Lucid Wings I" <me>')
       -- add_to_chat(158,'Lucid Wings I')
	-- elseif commandArgs[1] == 'wing2' then
       -- send_command('input /item "Lucid Wings II" <me>')
       -- add_to_chat(158,'Lucid Wings II')
	-- elseif commandArgs[1] == 'pois' then
       -- send_command('input /item "Poison Buffer" <me>')
       -- add_to_chat(158,'Poison Buffer')
	-- elseif commandArgs[1] == 'wing3' then
       -- send_command('input /item "Daedalus wing" <me>')
       -- add_to_chat(158,'Daedalus wing')
	-- elseif commandArgs[1] == 'super' then
       -- send_command('input /item "Super Revitalizer" <me>')
       -- add_to_chat(158,'Super Revitalizer')
	-- elseif commandArgs[1] == 'doom' then
       -- send_command('input /item "Savior\'s Tonic" <me>')
       -- add_to_chat(158,'Savior tonic')
	-- elseif commandArgs[1] == 'amne' then
       -- send_command('input /item "Moneta\'s Tonic"  <me>')
       -- add_to_chat(158,'Monetas Tonic')
	-- elseif commandArgs[1] == 'petri' then
       -- send_command('input /item "Mirror\'s Tonic" <me>')
       -- add_to_chat(158,'Mirrors Tonic')
	-- elseif commandArgs[1] == 'pote' then
       -- send_command('input /item "Champion\'s Drink" <me>')
       -- add_to_chat(158,'Champions Drink')
	-- end
-- end

function sub_job_change(new,old)
send_command('wait 10;input /lockstyleset 12')
end

send_command('wait 10;input /lockstyleset 12')