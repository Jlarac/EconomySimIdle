extends Control

var Id
var Icon = load("res://Assets/Images/UI/img256.png")
var View = ''
var Type = ''
var status = "+"
var oldstatus = "-"
var size_min = "small"
var last_size = ""
var data = {}
var current_enviroment = "bath"

var Item_card = preload("res://Scenes/Cards/rooms_card_btn.tscn")
var invisible = preload("res://Resources/Themes/invisible.tres")
var selected_enviroment = preload("res://Resources/Themes/selected_enviroment.tres")
var green_btn = preload("res://Resources/Themes/green_button.tres")
var yellow_btn = preload("res://Resources/Themes/yellow_button.tres")
signal change_in_house_card(new_enviroment)
var time_update = 0

var correct_visible = false
var Dictionary_houses = {}

func _ready() -> void:
	change_in_house_card.emit()
	update_init()

func _process(_delta: float) -> void:
	if status != oldstatus:
		update_init()
		update_ui()
		oldstatus = status
	update_always()

func update_init():
	$Panel/Panel3/VBoxContainer/HBoxContainer8.hide()
	$Panel/Panel3/VBoxContainer/HBoxContainer9.hide()
	var room_paths = {
	'kitchen': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/kitchen',
	'dinning': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/dinning',
	'bedroom': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/bedroom',
	'bath': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/bath',
	'hall': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/hall',
	'library': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/library',
	'gym': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/gym',
	'office': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/office',
	'spa': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/spa',
	'gameroom': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/gameroom',
	'tennis': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/tennis',
	'cinema': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/cinema',
	'laundry': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/laundry',
	'pool': 'Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2/pool',
	'garden': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/garden',
	'parking': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/parking',
	'home': 'Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/house'
	}
	
	$Panel/Panel3/VBoxContainer/HBoxContainer10/ProgressBar.hide()
	$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect.hide()
	$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect2.hide()
	if Type == 'search':
		Dictionary_houses = Data.Game.HouseMarket.duplicate(true)
	if Type == 'own':
		Dictionary_houses = Data.Game.Player.Houses.duplicate(true)
		$Panel/Panel3/VBoxContainer/HBoxContainer10/ProgressBar.show()
		$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect.show()
		
		if Dictionary_houses[Id]["CurrentHome"] == 1:
			$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect2.show()
			$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect2.texture = load('res://Assets/Images/HouseMenu/player.png')
		if Dictionary_houses[Id]["Rentedby"] == 'NPC':
			$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect2.show()
			$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect2.texture = load('res://Assets/Images/HouseMenu/rent.png')

		if Dictionary_houses[Id]['Status'] == 'Rent':
			$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect.texture = load('res://Assets/Images/HouseMenu/rent.png')
			$Panel/Panel3/VBoxContainer/HBoxContainer10/ProgressBar/Label.text = Dictionary_houses[Id]['Status'] + ': ' + Data.format_money(Dictionary_houses[Id]['CostRent']) + '/d'
		if Dictionary_houses[Id]['Status'] == 'Paying':
			$Panel/Panel3/VBoxContainer/HBoxContainer10/ProgressBar/Label.text = Dictionary_houses[Id]['Status'] + ': ' + Data.format_money(Dictionary_houses[Id]['CostSale']) + '/d'
		if Dictionary_houses[Id]['Status'] == 'Own':
			$Panel/Panel3/VBoxContainer/HBoxContainer10/ProgressBar/Label.text = Dictionary_houses[Id]['Status']
	
	$house_photo.texture = load(Dictionary_houses[Id]["Path"])
	$Panel/Panel3/VBoxContainer/HBoxContainer2/title_lbl.text = Dictionary_houses[Id]['Name']
	#$Panel/Panel3/VBoxContainer/HBoxContainer2/price_lbl.text = Data.format_money(Dictionary_houses[Id]["Price"])
	$Panel/Panel3/VBoxContainer/HBoxContainer10/price_lbl.text = Data.format_money(Dictionary_houses[Id]["Price"] * (1 + Data.Game.Inflation))
	$Panel/Panel2/VBoxContainer/HBoxContainer3/lvl_lbl.text = str(Data.round_to_dec(Dictionary_houses[Id]["Level"] + Dictionary_houses[Id]["LevelRooms"],1))
	$Panel/Panel2/VBoxContainer/HBoxContainer2/happy_lbl.text = str(Dictionary_houses[Id]["Happy"])
	$Panel/Panel2/VBoxContainer/HBoxContainer/health_lbl.text = str(Dictionary_houses[Id]["Health"])

	if Type == 'search':
		$Panel/Panel3/VBoxContainer/HBoxContainer8.show()
		for child in $Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2.get_children():
			child.hide()
		for child in $Panel/Panel3/VBoxContainer/HBoxContainer9/Panel3/HBoxContainer2.get_children():
			child.hide()
		$Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/parking.show()
		$Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/house.show()
		
		for item in Dictionary_houses[Id]['Rooms']:
			if item in ['library','gym','office','spa','gameroom','tennis','cinema','laundry','pool']:
				$Panel/Panel3/VBoxContainer/HBoxContainer9.show()
				
			var node_path = get_node(room_paths[item])
			node_path.show()
			var label = get_node(room_paths[item] + '/lbl')
			label.text = 'x' + str(Dictionary_houses[Id]['Rooms'][item]['Qty'])
		$Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/parking/lbl.text = str(Dictionary_houses[Id]['Parking'])
		$Panel/Panel3/VBoxContainer/HBoxContainer8/Panel3/HBoxContainer2/house/lbl.text = str(Dictionary_houses[Id]['Size_house']) + ' m2'

func update_ui():
	resize_panel(994)

func update_always():
	if Type == 'own':
		$Panel/Panel3/VBoxContainer/HBoxContainer10/ProgressBar.value = Data.Game.Player.Houses[Id]['Payments']
	
	if $Panel/Panel3.is_visible_in_tree() and !correct_visible:
		update_init()
		update_ui()
		correct_visible = true
		#await get_tree().process_frame

func update_actions():
	pass

func cost_btn_green():
	pass

func cost_btn_yellow():
	pass

func resize_panel(card_size):
	var size_vertical = 0
	for i in $Panel/Panel3/VBoxContainer.get_children():
		if i.is_visible_in_tree():
			size_vertical += i.size[1]
			size_vertical += 30
	$Panel/Panel3.size = Vector2(964,size_vertical)
	$Panel/Panel3.position = Vector2(30,card_size-size_vertical)

func create_item(item):
	var addcard = Item_card.instantiate()
	addcard.Id = item
	addcard.Icon = load(Data.db_data["Rooms"][item]["Path"])
	$Panel/Panel3/VBoxContainer/HBoxContainer5/Panel/ScrollContainer/HBoxContainer.add_child(addcard)
	addcard.connect("selected_enviroment",selected_enviroment_change)

func selected_enviroment_change(new_enviroment):
	current_enviroment = new_enviroment
	update_enviroment()

func update_enviroment() -> void:
	var current_level = int(data["Rooms"][current_enviroment]["Tier"])
	$Panel/Panel3/VBoxContainer/HBoxContainer6/Panel/HBoxContainer/lvl_lbl.text = "Level:" + str(current_level)
	
	if current_level < 5 and data["Status"] not in ["rent"]:
		$Panel/Panel3/VBoxContainer/HBoxContainer6/Panel/HBoxContainer/upgrade_room_btn.show()
		var current_cost = Data.db_data["Rooms"][current_enviroment]["Tiers"][str(current_level)]
		var upgrade_cost = (Data.db_data["Rooms"][current_enviroment]["Tiers"][str(current_level + 1)]) - current_cost
		$Panel/Panel3/VBoxContainer/HBoxContainer6/Panel/HBoxContainer/upgrade_room_btn.text = " Upgrade: " + Data.format_money(upgrade_cost * data["Rooms"][current_enviroment]["Qty"]) 
	else:
		$Panel/Panel3/VBoxContainer/HBoxContainer6/Panel/HBoxContainer/upgrade_room_btn.hide()
	
	for child in $Panel/Panel3/VBoxContainer/HBoxContainer5/Panel/ScrollContainer/HBoxContainer.get_children():
		var child_pnl = child.get_node("Panel")
		child_pnl.add_theme_stylebox_override("panel", invisible)
		if child.Id == current_enviroment:
			child_pnl.add_theme_stylebox_override("panel", selected_enviroment)

func _on_action_btn_pressed() -> void:
	emit_signal("change_in_house_card",Id)

func change_rented_house(new_house_id):
	var houses_to_remove = []

	for house in Data.player_data["houses"]:
		if house["Status"] == "rent":
			if house["Id"] == new_house_id:
				house["CurrentHome"] = 1
			else:
				houses_to_remove.append(house)

	for house in houses_to_remove:
		Data.player_data["houses"].erase(house)

func delete_rented_house():
	var houses_to_remove = []

	for house in Data.player_data["houses"]:
		if house["Status"] == "rent":
			houses_to_remove.append(house)

	for house in houses_to_remove:
		Data.player_data["houses"].erase(house)

func _on_upgrade_room_btn_pressed() -> void:
	var current_level = int(data["Rooms"][current_enviroment]["Tier"])
	var qty = int(data["Rooms"][current_enviroment]["Qty"])
	if current_level < 5 and data["Status"] not in ["rent"]:
		var current_cost = Data.db_data["Rooms"][current_enviroment]["Tiers"][str(current_level)]
		var upgrade_cost = (Data.db_data["Rooms"][current_enviroment]["Tiers"][str(current_level + 1)]) - current_cost
		if Data.buy_something(upgrade_cost * qty):
			data["Rooms"][current_enviroment]["Tier"] += 1
			
			
			check_prices()
	update_ui()
	Data.set_moneyperday()

func _on_cost_btn_pressed() -> void:
	if data["Status"] == "paying" or data["Status"] == "payinglive":
		Data.buy_something(data["CostSale"])
		data["Payments"] += 1
		if data["Payments"] >= 365:
			if data["Status"] == "paying":
				data["Status"] = "own"
			if data["Status"] == "payinglive":
				data["Status"] = "live"
		check_prices()
	update_ui()
	Data.set_moneyperday()

func check_prices():
	var new_array = Data.House_appraiser(data["Size_house"],data["Level"],data["Rooms"])
	data["LevelRooms"] = Data.round_to_dec(new_array[0],2)
	data["Price"] = new_array[1]
	if data["Status"] == "own" or data["Status"] == "inrent":
		data["CostRent"] = Data.round_to_dec(new_array[2],2)
		data["CostSale"] = Data.round_to_dec(new_array[3],2)
	if  data["Status"] == "paying" or data["Status"] == "payingrent":
		data["CostRent"] = Data.round_to_dec(new_array[2],2)
				
func _on_tosale_btn_pressed() -> void:
	Data.player_data["money"] += data["Price"]
	data["Status"] = "sold"
	update_ui()
	emit_signal("change_in_house_card",Id)
	Data.set_moneyperday()
	status = "no"

func _on_torent_btn_pressed() -> void:
	if data["Status"] == "own":
		data["Status"] = "inrent"
	if data["Status"] == "paying":
		data["Status"] = "payingrent"
	check_prices()
	update_ui()
	Data.set_moneyperday()
	status = "no"

func _on_tolive_btn_pressed() -> void:
	for house in Data.player_data["houses"]:
		if house["Status"] == "live":
			house["CurrentHome"] = 0
			house["Status"] = "own"
			house["Rentedby"] = ""
		if house["Status"] == "payinglive":
			house["CurrentHome"] = 0
			house["Status"] = "paying"
			house["Rentedby"] = ""
			
	if data["Status"] == "own":
		data["Status"] = "live"
	if data["Status"] == "inrent":
		data["Status"] = "live"
	if data["Status"] == "paying":
		data["Status"] = "payinglive"
	if data["Status"] == "payingrent":
		data["Status"] = "payinglive"
	
	data["CurrentHome"] = 1
	data["Rentedby"] = Data.player_data["name"] + " " + Data.player_data["surname"]
	
	delete_rented_house()
	update_ui()
	Data.set_moneyperday()
	emit_signal("change_in_house_card",Id)
	status = "no"


func _on_details_btn_pressed() -> void:
	emit_signal("change_in_house_card",Id)
