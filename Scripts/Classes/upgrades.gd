extends Node

var wait_data = false
var run = false
var old_len = 0
var upgrades = {}

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	#if Data.run and Data.screen == 'home' and run == false:
	#	wait_data = true
	#if wait_data and run == false:
	#	check_upgrades()
	#	run = true
	if run:
		if len(Data.Player.OwnUpgrades) != old_len:
			check_upgrades()
			old_len = len(Data.Player.OwnUpgrades)

func check_init():
	check_upgrades()
	run = true

func check_upgrades():
	for item in Data.Player.OwnUpgrades:
		var parent = Data.db_data['Upgrades'][item]['Parent']
		upgrades[parent] = 0
		
	for item in Data.Player.OwnUpgrades:
		var parent = Data.db_data['Upgrades'][item]['Parent']
		var tier = Data.db_data['Upgrades'][item]['Tier']
		if tier > upgrades[parent]:
			upgrades[parent] = tier
			
	if len(Data.Player.OwnUpgrades) != 0:
		for upgrade in Data.Player.OwnUpgrades:
			if Data.db_data['Upgrades'][upgrade]['Parent'] == 'Clic':
				Data.Game.AutomaticHours = (5.5 * (Data.db_data['Upgrades'][upgrade]['Tier'])) - 3.5
				Data.Game.AutomaticHours = int(Data.Game.AutomaticHours)
			if Data.db_data['Upgrades'][upgrade]['Parent'] == 'Clock':
				if Data.db_data['Upgrades'][upgrade]['Tier'] == 0:
					Data.Game.AutomaticSeconds = 30
				if Data.db_data['Upgrades'][upgrade]['Tier'] == 1:
					Data.Game.AutomaticSeconds = 20
				if Data.db_data['Upgrades'][upgrade]['Tier'] == 2:
					Data.Game.AutomaticSeconds = 15
				if Data.db_data['Upgrades'][upgrade]['Tier'] == 3:
					Data.Game.AutomaticSeconds = 10
				if Data.db_data['Upgrades'][upgrade]['Tier'] == 4:
					Data.Game.AutomaticSeconds = 6
				if Data.db_data['Upgrades'][upgrade]['Tier'] == 5:
					Data.Game.AutomaticSeconds = 3
				#Data.Game.AutomaticSeconds = -(2.25 * (Data.db_data['Upgrades'][upgrade]['Tier'])) + 12.25
				#Data.Game.AutomaticSeconds = int(Data.Game.AutomaticSeconds)
				#print(Data.Game.AutomaticSeconds,'  ',Data.Game.AutomaticHours)
	#print('*',upgrades)
