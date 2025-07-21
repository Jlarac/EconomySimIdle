extends Control

var Id
var status = '+'
var oldstatus = '-'
var database
var path_image = ''

func _ready() -> void:
	if Data.shop_screen == 'cloth':
		database = Data.Database.Clothes
		path_image = 'res://Assets/Images/Cloth/'
	if Data.shop_screen == 'food':
		database = Data.Database.Food
		path_image = 'res://Assets/Images/Food/'
	if Data.shop_screen == 'medicine':
		database = Data.Database.Medicine
		path_image = 'res://Assets/Images/Medicine/'
	if Data.shop_screen == 'furniture':
		database = Data.Database.Furnitures
		path_image = 'res://Assets/Images/Furnitures/'
	update_init()

func _process(_delta: float) -> void:
	if status != oldstatus:
		update_ui()
		oldstatus = status
	update_always()

func update_init():
	$Panel/VBoxContainer/Panel/title_lbl.text = Id
	$Panel/VBoxContainer/HBoxContainer/Panel/image.texture = load(path_image+Id+'.png' )
	if Data.shop_screen in ['furniture','medicine']:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/desc_lbl.text = tr(database[Id]['Desc']) + ': ' + str(database[Id]['Impact']*100) + '%'
	else:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/desc_lbl.text = tr('income_improve_') + ' ' + tr(database[Id]['Desc']) + ': ' + str(database[Id]['Impact']*100) + '%'
	$Panel/Level_pnl/HBoxContainer/Level_lbl.text = str(int(database[Id]['Tier']))
	
func update_ui():
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.hide()
	if 'recurrent' in database[Id]['Type']:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel/HBoxContainer/health_lbl.text = str(database[Id]['Health']) + '/d'
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4/HBoxContainer/happy_lbl.text = str(database[Id]['Happy']) + '/d'
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(database[Id]['Price']) + '/d'
	else:
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel/HBoxContainer/health_lbl.text = str(database[Id]['Health'])
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4/HBoxContainer/happy_lbl.text = str(database[Id]['Happy'])
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(database[Id]['Price'])
				
	match status:
		'buyed':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.hide()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.value = 100
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar/Label.text = 'selected_'
		'available':
			if database[Id]['Parent'] in ['Cloth','Food']:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.text = 'select_'
			else:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.text = 'buy_'
				
			if database[Id]['Parent'] == 'Medicine':
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4.hide()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.show()
			'''if 'recurrent' in database[Id]['Type']:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.show()
				
			else:
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.show()
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel.hide()
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4.hide() '''

func update_always():
	if Data.shop_screen in ['cloth','food']:
		status = 'available'
		if Data.Game.Player.ShopItems[database[Id]['Parent']] == Id:
			status = 'buyed'
	else:
		status = 'available'
		if Id in Data.Game.Player.OwnItems:
			status = 'buyed'
			
	'''if database[Id]['Parent'] in ['Cloth','Food','Medicine']:
		status = 'available'
		if Data.Game.Player.ShopItems[database[Id]['Parent']] == Id:
			status = 'buyed'
	else:
		status = 'available'
		if len(Data.Game.Player.OwnUpgrades) != 0:
			for upgrade in Data.Game.Player.OwnUpgrades:
				if upgrade == Id:
					status = 'buyed'
		if Id in Data.Game.Player.OwnItems:
			status = 'buyed'   '''

func set_upgrades():
	if len(Data.Game.Player.OwnUpgrades) != 0:
		for upgrade in Data.Game.Player.OwnUpgrades:
			if upgrade == Id:
				status = 'buyed'
	
func _on_action_btn_pressed() -> void:
	if Data.shop_screen in ['cloth','food']:
		Data.Game.Player.ShopItems[database[Id]['Parent']] = Id
		status = 'buyed'
	if Data.shop_screen == 'medicine':
		if Data.Game.Player.buy_something(database[Id]['Price']):
			Data.Game.Player.increase_health(database[Id]['Health'])
			Data.Game.Player.increase_happy(database[Id]['Happy'])
			Data.Game.Player.DiseaseValue -= database[Id]['Health']
			Data.Game.Player.Immunity += database[Id]['Impact']
			Data.Game.Player.verify_health_happy()
	if Data.shop_screen == 'furniture':
		if Data.Game.Player.buy_something(database[Id]['Price']):
			Data.Game.Player.OwnItems.append(Id)
			status = 'buyed'
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("buy")
	
	'''if database[Id]['Kind'] == 'Recurrent':
		Data.Game.Player.ShopItems[database[Id]['Parent']] = Id
		status = 'buyed'
	elif database[Id]['Kind'] == 'Medicine':
		if Data.Game.Player.buy_something(database[Id]['Price']):
			Data.Game.Player.increase_health(database[Id]['Health'])
			Data.Game.Player.DiseaseValue -= (5 * database[Id]['Tier'])
			Data.Game.Player.Immunity = (2 * database[Id]['Tier'])
			Data.Game.Player.verify_health_happy()
	elif database[Id]['Kind'] == 'Upgrade':
		if Data.Game.Player.buy_something(database[Id]['Price']):
			Data.Game.Player.OwnUpgrades.append(Id)
			status = 'buyed'
			Data.set_upgrades()
	elif database[Id]['Kind'] == 'Furniture':
		print(Id)
		if Data.Game.Player.buy_something(database[Id]['Price']):
			print(Id)
			Data.Game.Player.OwnItems.append(Id)
			status = 'buyed'   '''
	Data.Game.Player.check_variables()

func _on_onetime_btn_pressed() -> void:
	pass # Replace with function body.
