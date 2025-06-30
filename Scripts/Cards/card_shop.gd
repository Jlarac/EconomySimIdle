extends Control

var Id
var status = '+'
var oldstatus = '-'

func _ready() -> void:
	update_init()

func _process(_delta: float) -> void:
	if status != oldstatus:
		update_ui()
		oldstatus = status
	update_always()

func update_init():
	$Panel/VBoxContainer/Panel/title_lbl.text = Data.Database.Upgrades[Id]['Name']
	$Panel/VBoxContainer/HBoxContainer/Panel/image.texture = load(Data.Database.Upgrades[Id]['Path'])
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/desc_lbl.text = Data.Database.Upgrades[Id]['Desc']
	$Panel/Level_pnl/HBoxContainer/Level_lbl.text = str(int(Data.Database.Upgrades[Id]['Tier']))
	
func update_ui():
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.hide()
	if 'recurrent' in Data.Database.Upgrades[Id]['Type']:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel/HBoxContainer/health_lbl.text = str(Data.Database.Upgrades[Id]['Health']) + '/d'
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4/HBoxContainer/happy_lbl.text = str(Data.Database.Upgrades[Id]['Happy']) + '/d'
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(Data.Database.Upgrades[Id]['Price']) + '/d'
	else:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel/HBoxContainer/health_lbl.text = str(Data.Database.Upgrades[Id]['Health'])
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4/HBoxContainer/happy_lbl.text = str(Data.Database.Upgrades[Id]['Happy'])
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(Data.Database.Upgrades[Id]['Price'])
				
	match status:
		'buyed':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.hide()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.value = 100
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar/Label.text = 'selected_'
		'available':
			if Data.Database.Upgrades[Id]['Parent'] in ['Cloth','Food']:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.text = 'select_'
			else:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.text = 'buy_'
				
			if Data.Database.Upgrades[Id]['Parent'] == 'Medicine':
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4.hide()
				
			if 'recurrent' in Data.Database.Upgrades[Id]['Type']:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.show()
				
			else:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.show()
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel.hide()
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4.hide()

func update_always():
	if Data.Database.Upgrades[Id]['Parent'] in ['Cloth','Food','Medicine']:
		status = 'available'
		if Data.Game.Player.ShopItems[Data.Database.Upgrades[Id]['Parent']] == Id:
			status = 'buyed'
	else:
		status = 'available'
		if len(Data.Game.Player.OwnUpgrades) != 0:
			for upgrade in Data.Game.Player.OwnUpgrades:
				if upgrade == Id:
					status = 'buyed'

func set_upgrades():
	if len(Data.Game.Player.OwnUpgrades) != 0:
		for upgrade in Data.Game.Player.OwnUpgrades:
			if upgrade == Id:
				status = 'buyed'

func _on_action_btn_pressed() -> void:
	if Data.Database.Upgrades[Id]['Kind'] == 'Recurrent':
		Data.Game.Player.ShopItems[Data.Database.Upgrades[Id]['Parent']] = Id
		status = 'buyed'
	elif Data.Database.Upgrades[Id]['Kind'] == 'Medicine':
		if Data.Game.Player.buy_something(Data.Database.Upgrades[Id]['Price']):
			Data.Game.Player.increase_health(Data.Database.Upgrades[Id]['Health'])
			Data.Game.Player.DiseaseValue -= (5 * Data.Database.Upgrades[Id]['Tier'])
			Data.Game.Player.Immunity = (2 * Data.Database.Upgrades[Id]['Tier'])
			Data.Game.Player.verify_health_happy()
	elif Data.Database.Upgrades[Id]['Kind'] == 'Upgrade':
		if Data.Game.Player.buy_something(Data.Database.Upgrades[Id]['Price']):
			Data.Game.Player.OwnUpgrades.append(Id)
			status = 'buyed'
			Data.set_upgrades()
	elif Data.Database.Upgrades[Id]['Kind'] == 'Furniture':
		print(Id)
		if Data.Game.Player.buy_something(Data.Database.Upgrades[Id]['Price']):
			print(Id)
			Data.Game.Player.OwnItems.append(Id)
			status = 'buyed'
	Data.Game.Player.check_variables()

func _on_onetime_btn_pressed() -> void:
	pass # Replace with function body.
