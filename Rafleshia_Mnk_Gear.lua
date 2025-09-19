function user_setup()
	state.OffenseMode:options('Normal','DTLite','SomeAcc','Acc')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc')
    state.HybridMode:options('Normal', 'PDT','PDTOnly')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Verethragna','Barehanded','ProcStaff','ProcClub','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}


	-- Additional local binds
	--send_command('bind ^` input /ja "Boost" <me>')
	--send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @` gs c cycle SkillchainMode')
	
	send_command('exec init.txt')
	
	autows = 'Victory Smite'
	autowstp = 1250
	
	select_default_macro_book(1, 18)
end
	
function init_gear_sets()

	-- Weapons sets
	sets.weapons.Verethragna = {main="Verethragna"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.ProcStaff = {main="Ram Staff"}
	sets.weapons.ProcClub = {main="Jingly Rod"}
	sets.weapons.ProcSword = {main="Firetongue",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Zanmato",sub=empty}

	---------------
    -- Idle sets --
	---------------

	sets.idle = {    
	main="Varga Purnikawa",
    ammo="Aurgelmir Orb +1",
    body="Nyame Mail",
    head="Null Masque",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Etiolation Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Dark Ring",
    back="Solemnity Cape",
}
	sets.idle.Weak = {}
	sets.idle.PDT = {}		
	sets.defense.PDT = {}
	sets.defense.HP = {}
	sets.defense.MDT = {}
	sets.defense.MEVA = {}
	sets.Kiting = {feet="Herald's Gaiters"}							

	------------------
	-- Engaged sets --
	------------------

    -- sets.engaged = {
    -- ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    -- head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    -- body="Mpaca's Doublet",
    -- hands="Mpaca's Gloves",
    -- legs="Bhikku Hose +3",
    -- feet="Anch. Gaiters +4",
    -- neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    -- waist="Moonbow Belt +1",
    -- left_ear="Sherida Earring",
    -- right_ear="Telos Earring",
    -- left_ring="Gere Ring",
    -- right_ring="Niqmaddu Ring",
    -- back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
-- }

	sets.engaged = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    --head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
	head="Bhikku Crown +3",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Bhikku Hose +3",
    feet="Anch. Gaiters +4",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

	sets.engaged.DTLite = {
    ammo="Coiste Bodhar",
    head="Bhikku Crown +3",--+3
    body="Mpaca's Doublet",--Attack+25, Store TP+7, Accuracy+10 Mag. Acc.+10
    hands="Mpaca's Gloves", 
    legs="Bhikku Hose +3",
    feet="Mpaca's Boots",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",--Moonbow Belt +1
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
	back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}
	
    sets.engaged.SomeAcc = {}
    sets.engaged.Acc = {}
	sets.engaged.FullAcc = {}
	sets.engaged.Fodder = {}

	-- Defensive melee hybrid sets
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.PDTOnly = {}
	sets.engaged.SomeAcc.PDTOnly = {}
	sets.engaged.Acc.PDTOnly = {}

	-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.SomeAcc.HF = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})

	--------------------
	--Weaponskill sets--
	--------------------

	sets.precast.WS = {    --Victory Smite
	ammo="Knobkierrie",
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Bhikku Cyclas +3",
    hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
    legs="Mpaca's Hose",--25 Attack, Physical damage limit +7%, Accuracy+10 Mag. Acc.+10
    feet={ name="Herculean Boots", augments={'Attack+20','"Triple Atk."+3','Accuracy+14',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
}

	sets.precast.WSSomeAcc = {}
	sets.precast.WSAcc = {}
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, sets.precast.WSSomeAcc)	
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)

	
	-- Specific weaponskill sets --
	
	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {
	ammo="Knobkierrie",
    head="Ken. Jinpachi +1",
    body="Bhikku Cyclas +3",
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Attack+20','"Triple Atk."+3','Accuracy+14',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	})
	
	
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {})
	
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
    body="Bhikku Cyclas +3",
    hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Attack+20','"Triple Atk."+3','Accuracy+14',}},
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Schere Earring",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	})
	
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {
	ammo="Aurgelmir Orb +1",
    head="Ken. Jinpachi +1",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet={ name="Herculean Boots", augments={'Attack+20','"Triple Atk."+3','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear="Mache Earring +1",
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})
	
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body="Bhikku Cyclas +3",
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Anch. Gaiters +4",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	})
	
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {
	ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Mpaca's Cap",
    body="Bhikku Cyclas +3",
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs="Mpaca's Hose",
    feet="Anch. Gaiters +4",
    neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
    waist="Moonbow Belt +1",
    left_ear="Sherida Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Gere Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})

	sets.precast.WS["Raging Fists"].SomeAcc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Howling Fist"].SomeAcc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSSomeAcc)
	sets.precast.WS["Asuran Fists"].SomeAcc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSSomeAcc)
	sets.precast.WS["Ascetic's Fury"].SomeAcc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Victory Smite"].SomeAcc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Shijin Spiral"].SomeAcc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSSomeAcc, {})
	sets.precast.WS["Dragon Kick"].SomeAcc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSSomeAcc)
	sets.precast.WS["Tornado Kick"].SomeAcc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSSomeAcc)
	
	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS['Cataclysm'] = {}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

	-----------------------	
	   --Precast Sets --
	-----------------------

	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	sets.precast.JA['Boost'] = {hands="Anchorite's Gloves +1"}
	sets.precast.JA['Dodge'] = {feet="Anch. Gaiters +4"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +1"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +1"} 
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"} --Suzaku
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +1"}

	sets.precast.JA['Chi Blast'] = {
        head="Bhikku Crown +3",
        body="Bhikku Cyclas +3",
		hands="Hes. Gloves +2",
        back="Tuilha Cape",
		legs="Hes. Hose +3",
		feet="Anch. Gaiters +4"
}

	sets.precast.JA['Chakra'] = { --Mix DT + VIT
		head="Genmei Kabuto",
		body="Anch. Cyclas +2", -- +2 omen is fine
		hands="Hes. Gloves +2", -- +3 dynamis
		legs="Hes. Hose +3",
		feet="Bhikku Gaiters +3", -- +3 sortie
		--back="Segomo's Mantle" VIT
}

	-- Fast cast sets for spells
	sets.precast.FC = {}
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	-- Midcast Sets
	sets.midcast.FastRecast = {}
	
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
	sets.resting = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	sets.buff.Impetus = {body="Bhikku Cyclas +3"}
	sets.buff.Footwork = {feet="Anch. Gaiters +4"}
	sets.FootworkWS = {}
	sets.TreasureHunter = {}
	sets.Skillchain = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
	sets.precast.Step = {}
	sets.precast.Flourish1 = {}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'NIN' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end

send_command('exec init.txt')

function sub_job_change(new,old)
send_command('wait 7;input /lockstyleset 12')
end

send_command('wait 7;input /lockstyleset 12')