-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc')
    state.HybridMode:options('Normal','DTLite','PDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc')
	state.IdleMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Gletis','Prime','Trials')

    -- Additional local binds
    send_command('bind @` gs c step')
	send_command('bind ^!@` gs c toggle usealtstep')
	send_command('bind ^@` gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
	send_command('bind %~` gs c cycle SkillchainMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

------Gear to get------

--JSE Capes
--• Waltz Cape: 	CHR
--• Steps Cape:		DEX/Acc
--• RF Cape:		Reverse Flourish 30

--To Buy??
--Etoile Gorget +2, 41M on AH

	--------------------------------
     -- Start defining the sets --
    --------------------------------
	
	-- Weapons sets --
	sets.weapons.Gletis = {main="Gleti's Knife",sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},}
	sets.weapons.Prime = {main="Mpu Gandring",sub="Fusetto +2"}
	sets.weapons.Trials = {main="Twashtar",sub="Empty"}
	
	------------------------------
	  ------ Idle sets ------
	------------------------------
    
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Malignance Tabard",
		hands="Nyame Gauntlets",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Plat. Mog. Belt",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Chirich Ring +1",
		back="Solemnity Cape"
}

	------------------------------
	  ------ Engaged sets ------
	------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	
	--45%/Max Magic Haste (0% Dual Wield needed)
    sets.engaged = {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Gleti's Breeches",
		feet="Malignance Boots",
		neck="Etoile Gorget +2",
		waist="Reiki Yotai",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Epona's Ring",
		right_ring="Moonlight Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}

    sets.engaged.DTLite = {}
    sets.engaged.Acc = {}
    sets.engaged.SomeAcc = {}
    sets.engaged.PDT = {}
	   
	------------------------------
	------ Weaponskill sets ------
	------------------------------
    -- Default set for any weaponskill that isn't any more specifically defined
	
    sets.precast.WS = {
		ammo="Crepuscular Pebble",
		head="Maculele Tiara +3",
		body="Gleti's Cuirass", --Needs RP
		hands={ name="Nyame Gauntlets", augments={'Path: B',}}, --Maxixi Bangles +3
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Etoile Gorget +2",
		waist="Kentarch Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Macu. Earring +1",
		left_ring="Ephramad's Ring",
		right_ring="Regal Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-2%',}},
}

    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head="Maculele Tiara +3",
		body="Gleti's Cuirass",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Etoile Gorget +2", augments={'Path: A',}},
		waist={ name="Kentarch Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear={ name="Macu. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
		left_ring="Ephramad's Ring",
		right_ring="Regal Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-2%',}},
})
	
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head="Maculele Tiara +3",
		body="Gleti's Cuirass", --Needs RP
		hands="Gleti's gauntlets",
		legs="Gleti's breeches",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Etoile Gorget +2",
		waist="Sailfi belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Macu. Earring +1",
		left_ring="Ephramad's Ring",
		right_ring="Regal Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-2%',}},
	})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Odr Earring",
		right_ear="Mache Earring +1",
		left_ring="Gere Ring",})

    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Pyrrhic Kleos'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Aeolian Edge'] = {}
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	
    sets.Skillchain = {}
    
    ------------------------------
	  ------ Midcast sets ------
	------------------------------
    
    sets.midcast.FastRecast = {}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
	
	-- Defense sets

    sets.defense.PDT = {}
    sets.defense.MDT = {}
	sets.defense.MEVA = {}

    sets.Kiting = {}
 
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
    ------------------------------
	  ------ Precast sets ------
	------------------------------
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +1"}
    sets.precast.JA['Trance'] = {}
    

    -- Waltz set (chr and vit)
		sets.precast.Waltz = {
		ammo="Yamarang",
		neck="Etoile Gorget +2",
		ear2="Handler's Earring +1", --R15
		body="Maxixi Casaque +3",
		back="Toetapper Mantle",
		waist="Aristo Belt",
		legs="Dashing Subligar",
		feet="Maxixi Toe Shoes +3"
		}
		sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
	
--Refer here > Abilities Sets: https://www.ffxiah.com/forum/topic/53853/the-last-dance-iii-a-dancers-guide-new/#_user-5-ab
--This gear is from the guide.. Do we need it?
	
    sets.precast.Waltz['Healing Waltz'] = {
		ammo="Yamarang",
		neck="Etoile Gorget +2",
		ear2="Handler's Earring +1", --R15
		body="Maxixi Casaque +3",
		back="Toetapper Mantle",
		waist="Aristo Belt",
		legs="Dashing Subligar",
		feet="Maxixi Toe Shoes +3"
}
    
    sets.precast.Samba = {
		head="Maxxi Tiara +3",
		back="Senuna's Mantle",}

    sets.precast.Jig = {
		legs="Horos Tights +3",
		feet="Maxixi Toe Shoes +3",}

    sets.precast.Step = {
		head="Maxixi Tiara +3",
		hands="Maxixi Bangles +3",
		feet="Maxixi Toe Shoes +3",}
		
    sets.Enmity = {}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {body="Horos Casaque +3",}
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
    sets.precast.Flourish1['Desperate Flourish'] = {}
    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands="Maculele Bangles +3",
		back="Toetapper Mantle" -- • Cape: Reverse Flourish 10-30
}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {}
    sets.precast.Flourish3['Climactic Flourish'] = {}

	------------------------------
	 ------ Fast Cast sets ------
	------------------------------
    -- Fast cast sets for spells
    
    sets.precast.FC = {}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	------------------------------
	  ------- Buff sets -------
	------------------------------
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
    sets.buff['Saber Dance'] = {} --legs="Horos Tights"
    sets.buff['Climactic Flourish'] = {ammo="Charis Feather",head="Adhemar Bonnet +1",body="Meg. Cuirie +2"} --head="Charis Tiara +2"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 19)
    else
        set_macro_page(1, 19)
    end
end

function sub_job_change(new,old)
send_command('wait 5;input /lockstyleset 12')
end

send_command('wait 5;input /lockstyleset 20')

send_command('exec init.txt')