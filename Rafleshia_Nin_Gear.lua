-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','Crit')
    state.HybridMode:options('Normal','Evasion','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Heishi','MagicWeapons','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcKatana','ProcGreatKatana','ProcClub','ProcStaff')
	
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}
	
	send_command('bind ^` input /ja "Innin" <me>')
    send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	
	utsusemi_cancel_delay = .4
	utsusemi_ni_cancel_delay = .1
	
		-- Weapons sets
	sets.weapons.Heishi = {main="Heishi Shorinken",sub="Kanaria"}
	sets.weapons.MagicWeapons = {main="Ochu",sub="Ochu"}
	sets.weapons.ProcDagger = {main="Onion Dagger",sub=empty}
	sets.weapons.ProcSword = {main="Firetongue",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}
	sets.weapons.ProcKatana = {main="Kunai",sub=empty}
	sets.weapons.ProcClub = {main="Jingly Rod",sub=empty}
	sets.weapons.ProcStaff = {main="Ram Staff",sub=empty}

	
    select_default_macro_book(1, 10)
end

-- Define sets and vars used by this job file.
function init_gear_sets()


    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {} --legs="Mochizuki Chainmail"
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {}
    sets.precast.Flourish1 = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket",feet="Hattori Kyahan +1"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {ammo="Staunch Tathlum",ring1="Prolix Ring"})

    -- Snapshot for ranged
    sets.precast.RA = {legs="Nahtirah Trousers"}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Jin'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Jin'].Acc = set_combine(sets.precast.WS.Acc, {})
    
	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Hi'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS.Acc, {})
    
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Shun'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, {})
    
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Ten'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS.Acc, {})
    
    sets.precast.WS['Aeolian Edge'] = {}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring",ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Cessance Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring",}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}
    sets.midcast.ElementalNinjutsu = {}
	sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	
	sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}
	sets.element.Earth = {neck="Quanpur Necklace"}
    sets.midcast.NinjutsuDebuff = {}
    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {back="Andartia's Mantle",feet="Hattori Kyahan +1"})
    sets.midcast.RA = {}
    sets.midcast.RA.Acc = {}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {    
    ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Genmei Earring",
    right_ear="Brutal Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Magic dmg. taken -3%',}},
    back="Solemnity Cape",
}

    sets.idle.PDT = {}	
    sets.idle.Weak = {}
    
    -- Defense sets
    sets.defense.Evasion = {}
    sets.defense.PDT = {}
    sets.defense.MDT = {}
	sets.defense.MEVA = {}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
	ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Attack+20','"Triple Atk."+3','Accuracy+14',}},
    neck="Lissome Necklace",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back="Solemnity Cape",
}

    sets.engaged.SomeAcc = {}
    sets.engaged.Acc = {}
    sets.engaged.Crit = {}
    sets.engaged.Evasion = {}
	sets.engaged.SomeAcc.Evasion = {}
    sets.engaged.Acc.Evasion = {}
    sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {} --body="Hattori Ningi +1"
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Yonin = {legs="Hattori Hakama +1"} --
    sets.buff.Innin = {} --head="Hattori Zukin +1"
	
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Shetal Stone"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {legs="Ryuo Hakama"}
	

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 10)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 10)
    else
        set_macro_page(1, 10)
    end
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 1')
end

send_command('wait 2;input /lockstyleset 1')