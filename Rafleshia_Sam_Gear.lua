-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc')
    state.HybridMode:options('Normal','DTLite','PDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal')
	state.Weapons:options('Masamune','Dojikiri','Polearm','ProcWeapon','Bow')
    
	-- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !@^` gs c cycle Stance')
	
	send_command('exec init.txt')

	autows = 'Tachi: Fudo'
	autowstp = 1250

    select_default_macro_book(1, 9)	
end

function init_gear_sets()

	-- Weapons sets
	sets.weapons.Masamune = {main="Masamune",sub="Utu Grip"}
	sets.weapons.Dojikiri = {main="Dojikiri Yasutsuna",sub="Utu Grip"}
	sets.weapons.Polearm = {main="Shining One",sub="Utu Grip"}
	sets.weapons.ProcWeapon = {main="Soboro Sukehiro",sub="Utu Grip"}
	sets.weapons.Bow = {ranged="Yoichinoyumi",sub="Utu Grip",ammo="Yoichi's Arrow"}

	---------------
    -- Idle sets --
	---------------
	
    sets.idle = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Kasuga Domaru +2",
    hands="Wakido Kote +3",
    legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
    feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
	back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	sets.idle.Town = {
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Kasuga Domaru +2",
    hands="Wakido Kote +3",
    legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
    feet="Danzo Sune-Ate",
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Chirich Ring +1",
    right_ring="Defending Ring",
	back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

    sets.idle.Weak = {}
    sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)
	sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	sets.DayIdle = set_combine(sets.idle)
	sets.NightIdle = set_combine(sets.idle)
	sets.Kiting = {feet="Danzo Sune-ate"}
    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
    
    -- Precast Sets --

    sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +1",back=gear.ws_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +1"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}
	
	--------------------
	 -- Engaged sets --
	--------------------
		-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
		-- sets if more refined versions aren't defined.
		-- If you create a set with both offense and defense modes, the offense mode should be first.
		-- EG: sets.engaged.Dagger.Accuracy.Evasion
		-- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
	
	sets.engaged = {
		ammo="Aurgelmir Orb +1",
		head="Flamma Zucchetto +2",
		body="Kasuga Domaru +2",
		hands="Wakido Kote +3",
		legs="Tatenashi Haidate +1",
		feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		neck="Sam. Nodowa +2",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Chirich Ring +1",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	
	sets.engaged.SomeAcc = {
		ammo="Aurgelmir Orb +1",
		head="Flamma Zucchetto +2",
		body="Kasuga Domaru +2",
		hands="Wakido Kote +3",
		legs="Tatenashi Haidate +1",
		feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
		neck="Sam. Nodowa +2",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Flamma Ring",
		back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	sets.engaged.Acc ={}
    
	sets.engaged.PDT ={
    ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Kasuga Domaru +2",
    hands="Wakido Kote +3",
    legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
    feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	
   sets.engaged.SomeAcc.PDT = {}
   sets.engaged.Acc.PDT = {}
	
	sets.engaged.DTLite = {    
	ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Wakido Kote +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
   
   sets.engaged.SomeAcc.DTLite = {
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Kasuga Domaru +2",
    hands="Wakido Kote +3",
    legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
    feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Genmei Earring",
    right_ear="Etiolation Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}		
  
	sets.engaged.Acc.DTLite = {}
		
	----------------------
    -- Weaponskill sets --
	----------------------
	    -- Default set for any weaponskill that isn't any more specifically defined
    
	sets.precast.WS = {
    ammo="Knobkierrie",
    head="Mpaca's Cap",
    body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
    hands={ name="Valorous Mitts", augments={'Attack+26','Weapon skill damage +4%','MND+4','Accuracy+11',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%','VIT+1','Attack+6',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring +1",
    right_ring="Regal Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {feet="Wakido Sune. +3"})
	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    ammo="Knobkierrie",
    head="Mpaca's Cap",
    body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
    hands={ name="Valorous Mitts", augments={'Attack+26','Weapon skill damage +4%','MND+4','Accuracy+11',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%','VIT+1','Attack+6',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring +1",
    right_ring="Epaminondas's Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
})
   
	-- Specific weaponskill sets -- 
		
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Mpaca's Cap",
    body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
    hands={ name="Valorous Mitts", augments={'Attack+26','Weapon skill damage +4%','MND+4','Accuracy+11',}},
    legs="Wakido Haidate +3",
    feet={ name="Valorous Greaves", augments={'Accuracy+20 Attack+20','Weapon skill damage +4%','VIT+1','Attack+6',}},
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Thrud Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Karieyh Ring +1",
    right_ring="Epaminondas's Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
})

    sets.precast.WS['Tachi: Fudo'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Tachi: Fudo'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Tachi: Fudo'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {
	feet="Flam. Gambieras +2",
	right_ring="Flamma Ring",})

    sets.precast.WS['Tachi: Shoha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Rana'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Kasha'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Kasha'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Gekko'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Gekko'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Tachi: Yukikaze'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Tachi: Yukikaze'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Tachi: Hobaku'] = set_combine(sets.precast.WS, {})		
    sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {})
    
	sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Apex Arrow'].SomeAcc = set_combine(sets.precast.WS['Apex Arrow'], {})
    sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS['Apex Arrow'], {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Lugra Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Cessance Earring",}
	sets.AccDayWSEars = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Ishvara Earring",ear2="Moonshade Earring",}
	
    -- Midcast Sets
    sets.midcast.FastRecast = {}
	
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
	-- Ranged
    sets.precast.RA = {}

    sets.midcast.RA = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sanctity Necklace",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
}

    sets.midcast.RA.Acc = {}
	
	------------------
    -- Defense sets	--
	------------------
	
    sets.defense.PDT = {	
	ammo="Aurgelmir Orb +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Wakido Kote +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Sam. Nodowa +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear="Telos Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Flamma Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

    sets.defense.MDT = {
	ammo="Aurgelmir Orb +1",
    head="Flam. Zucchetto +2",
    body="Kasuga Domaru +2",
    hands="Wakido Kote +3",
    legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
    feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
    neck="Loricate Torque +1",
    waist="Ioskeha Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Defending Ring",
	back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Magic dmg. taken-10%',}},
}

    sets.defense.MEVA = {}

	----------
	-- Misc --
	----------
   
    sets.precast.Step = {
        head="Flam. Zucchetto +2",neck="Moonbeam Nodowa",ear1="Zennaroi Earring",ear2="Telos Earring",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.stp_jse_back,waist="Olseni Belt",legs="Wakido Haidate +3",feet="Founder's Greaves"}
		
    sets.precast.JA['Violent Flourish'] = {ammo="Pemphredo Tathlum",
        head="Flam. Zucchetto +2",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Moonshade Earring",
        body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back=gear.ws_jse_back,waist="Eschan Stone",legs="Flamma Dirs +2",feet="Flam. Gambieras +2"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Flam. Zucchetto +2",
        body="Tartarus Platemail",hands="Flam. Manopolas +2",ring1="Asklepian Ring",ring2="Valseur's Ring",
        waist="Chaac Belt",legs="Wakido Haidate +3",feet="Sak. Sune-Ate +1"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring"}
	
	-- Buff sets
	sets.Cure_Received = {hands="Buremte Gloves",waist="Gishdubar Sash",legs="Flamma Dirs +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
	sets.buff.Hasso = {hands="Wakido Kote +3"}
	sets.buff['Third Eye'] = {} --legs="Sakonji Haidate +3"
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sak. Sune-Ate +1"}
end


--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = (framerate * 3)
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = (framerate * 3)
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'NIN' then
		set_macro_page(1, 9)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 9)
	else
		set_macro_page(1, 9)
	end
end

function sub_job_change(new,old)
send_command('wait 10;input /lockstyleset 12')
end

send_command('wait 10;input /lockstyleset 12')

------Suggested Skillchains------

--			***Dojikiri Yasutsuna*** denotates the need of Dojikiri Yasutsuna to continue the SC.

--------------------------------
	--Light Skillchains--
--------------------------------

--**DOJI** Tachi: Shoha → **DOJI** Tachi: Shoha = Light

---3-STEP---
--Shoha → Kasha → Fudo
--If using **DOJI**, ends in Radiance--

---4-STEP--- **The go to for most situations
--Fudo → Kasha → Shoha → Fudo
--If using **DOJI**, ends in Radiance--

---5-STEP---
--Shoha → Fudo → Kasha → Shoha → Fudo 
--If using **DOJI**, ends in Radiance--

---6-STEP---
--Ageha → Yukikaze → Kasha → Shoha → Kasha → Fudo
--If using **DOJI**, ends in Radiance--

--------------------------------
	--Darkness Skillchains--
--------------------------------
	
--Tachi: Rana ←/→ Tachi: Fudo

---3-STEP---
--Shoha → Fudo → Rana
--Kasha → Rana → Fudo

---4-STEP---
--Ageha → Jinpu → Shoha → Fudo **Use this one
--Rana → Shoha → Tachi: Fudo → Rana
--Ageha → Yukikaze → Kasha → Fudo 

--Polearm
---3-STEP---
--Stardiver → Sonic Thrust → Impulse Drive