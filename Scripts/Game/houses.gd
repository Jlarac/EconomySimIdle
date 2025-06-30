extends Control

var Item_card = preload("res://Scenes/Cards/house_card.tscn")

var status = 'dash'
var old_status = ''

var sub_status = ''
var sub_old_status = ''

var type = ''

var search_level = 0
var old_search_level = 0

var selected_house = ''
var old_selected_house = '-'

var selected_room = 'kitchen'
var room_paths = {}
var level_number = {0: 'res://Assets/Images/HouseMenu/zero.png' , 1: 'res://Assets/Images/HouseMenu/one.png' , 2: 'res://Assets/Images/HouseMenu/two.png',
					3: 'res://Assets/Images/HouseMenu/three.png', 4: 'res://Assets/Images/HouseMenu/four.png', 5: 'res://Assets/Images/HouseMenu/five.png'}

var progress_room = preload('res://Resources/Themes/house_room_purple.tres')
var complete_room = preload('res://Resources/Themes/house_room_blue.tres')
var purple_button = preload('res://Resources/Themes/purplecard.tres')
var green_button = preload('res://Resources/Themes/green_button.tres')

var Dictionary_houses = {}

var old_market = {}
var old_day = 0

func _ready() -> void:
	update_init()

func _process(_delta: float) -> void:
	update_always()
	if old_status != status:
		update_ui()
		old_status = status
	
	if status == 'house':
		if sub_old_status != sub_status:
			load_data_house()
			sub_old_status = sub_status

func update_init():
	#$Menu/Principal/home_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	room_paths = {
	'kitchen': 'House/HBoxContainer8/Panel3/HBoxContainer2/kitchen',
	'dinning': 'House/HBoxContainer8/Panel3/HBoxContainer2/dinning',
	'bedroom': 'House/HBoxContainer8/Panel3/HBoxContainer2/bedroom',
	'bath': 'House/HBoxContainer8/Panel3/HBoxContainer2/bath',
	'hall': 'House/HBoxContainer8/Panel3/HBoxContainer2/hall',
	'garden': 'House/HBoxContainer8/Panel3/HBoxContainer2/garden',
	'library': 'House/HBoxContainer8/Panel3/HBoxContainer2/library',
	
	
	'gym': 'House/HBoxContainer9/Panel3/HBoxContainer2/gym',
	'office': 'House/HBoxContainer9/Panel3/HBoxContainer2/office',
	'spa': 'House/HBoxContainer9/Panel3/HBoxContainer2/spa',
	'gameroom': 'House/HBoxContainer9/Panel3/HBoxContainer2/gameroom',
	'tennis': 'House/HBoxContainer9/Panel3/HBoxContainer2/tennis',
	'cinema': 'House/HBoxContainer9/Panel3/HBoxContainer2/cinema',
	'laundry': 'House/HBoxContainer9/Panel3/HBoxContainer2/laundry',
	'pool': 'House/HBoxContainer9/Panel3/HBoxContainer2/pool'
	}

func update_ui():
	#$House.hide()
	#$Item_container.hide()
	
	if status == 'own':
		clear_list()
		#$Item_container.show()
		for house in Data.Game.Player.Houses:
			if Data.Game.Player.Houses[house]['Status'] != 'Old':
				if Data.Game.Player.Houses[house]["CurrentHome"] == 1:
					create_item(house,status)
		for house in Data.Game.Player.Houses:
			if Data.Game.Player.Houses[house]['Status'] != 'Old':
				if Data.Game.Player.Houses[house]["CurrentHome"] == 0:
					create_item(house,status)
	if status == 'search':
		clear_list()
		#$Item_container.show()
		for house in Data.Game.HouseMarket.keys():
			#if Data.Game.HouseMarket[house]["Level"] == search_level:
			if Data.Game.HouseMarket[house]['Status'] != 'Sold':
				create_item(house,status)
	if status == 'house':
		#$House.show()
		load_data_house()

func clear_list():
	for card in $Item_container/ScrollContainer/VBoxContainer.get_children():
			card.queue_free()
func update_always():
	#if status != 'house':
	if Data.screen == 'market_houses':
		status = 'search'
	if Data.screen == 'own_houses':
		status = 'own'
		if len(Data.Game.Player.Houses) <= 0:
			status = 'search'
	if Data.screen == 'house_market':
		status = 'house'
	if Data.screen == 'house_own':
		status = 'house'
	
	if Data.screen == 'market_houses':
		if old_market != Data.Game.HouseMarket:
			update_ui()
			old_market = Data.Game.HouseMarket
	if Data.screen == 'house_market':
		if old_day != Data.dictdate['day']:
			Data.screen = 'market_houses'
			old_day = Data.dictdate['day']
			
	if status == 'house':
		if type == 'own':
			if selected_house in Data.Game.Player.Houses:
				$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status']
				$House/picture/card/Panel4/VBoxContainer/ProgressBar.value = Data.Game.Player.Houses[selected_house]['Payments']
				
				if Data.Game.Player.Houses[selected_house]['Status'] == 'Rent':
					$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status'] + ': ' + Data.format_money(Data.Game.Player.Houses[selected_house]['CostRent']) + '/d'
					#$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect.texture = load('res://Assets/Images/HouseMenu/rent.png')
					$House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = Data.Game.Player.Houses[selected_house]['Status']
				if Data.Game.Player.Houses[selected_house]['Status'] == 'Paying':
					var CostSale = Data.Game.Player.Houses[selected_house]['CostSale']
					var CostRent = 0
					
					if Data.Game.Player.Houses[selected_house]["Rentedby"] == 'NPC':
						CostRent = Data.Game.Player.Houses[selected_house]['CostRent']
					var Balance = - CostSale + CostRent
					var Lbl = Data.Game.Player.Houses[selected_house]['Status']
					if Balance > 0:
						Lbl = 'Receiving'
					$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = tr(Lbl) + ': ' + Data.format_money(abs(Balance)) + '/d  '
					$House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = str(365 - Data.Game.Player.Houses[selected_house]['Payments']) + ' ' + tr('remaining_payments_') 
						
				if Data.Game.Player.Houses[selected_house]['Status'] == 'Own':
					if Data.Game.Player.Houses[selected_house]["Rentedby"] == 'NPC':
						$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = 'Receiving' + ': ' + Data.format_money(Data.Game.Player.Houses[selected_house]['CostRent']) + '/d  '
					$House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = tr('paid_')

func load_data_house():
	$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect.hide()
	$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.hide()
	$House/picture/card/Panel4.hide()
	if type == 'search':
		Dictionary_houses = Data.Game.HouseMarket.duplicate(true)
	if type == 'own':
		$House/picture/card/Panel4.show()
		Dictionary_houses = Data.Game.Player.Houses.duplicate(true)
		$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect.show()
		if Dictionary_houses[selected_house]["CurrentHome"] == 1:
			$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.show()
			$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.texture = load('res://Assets/Images/HouseMenu/player.png')
		if Dictionary_houses[selected_house]["Rentedby"] == 'NPC':
			$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.show()
			$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.texture = load('res://Assets/Images/HouseMenu/rent.png')
			
		if Dictionary_houses[selected_house]['Status'] == 'Rent':
			$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect.texture = load('res://Assets/Images/HouseMenu/rent.png')
	
	$House/picture/card/house_photo.texture = load(Dictionary_houses[selected_house]["Path"])
	$House/picture2/Panel/VBoxContainer/VBoxContainer2/title_sector/work_lbl.text = Dictionary_houses[selected_house]['Name']
	$House/picture2/Panel/VBoxContainer/VBoxContainer2/title_sector/price_lbl.text = Data.format_money(Dictionary_houses[selected_house]["Price"])
	$House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer3/lvl_lbl.text = str(Data.round_to_dec(Dictionary_houses[selected_house]["Level"] + Dictionary_houses[selected_house]["LevelRooms"],1))
	$House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer2/happy_lbl.text = str(Dictionary_houses[selected_house]["Happy"])
	$House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer/health_lbl.text = str(Dictionary_houses[selected_house]["Health"])
	$House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer4/parking_lbl.text = str(Dictionary_houses[selected_house]['Parking'])
	$House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer5/home_lbl.text = str(Dictionary_houses[selected_house]['Size_house']) + ' m2'
	
	$House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.hide()
	$House/Item_container/VBoxContainer/Panel2.hide()
	if type == 'own':
		if Dictionary_houses[selected_house]["Status"] != 'Rent':
			$House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.show()
			$House/Item_container/VBoxContainer/Panel2.show()
			#$House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.show()
	if type == 'search':
		$House/Item_container/VBoxContainer/Panel2.show()
		#$House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.hide()
	
	select_room_menu()
	update_actions()

func save_houses():
	for card in $Houses/Item_container/ScrollContainer/VBoxContainer.get_children():
		pass

func unselect_menu():
	$Menu/Principal/own_pnl/selected_pnl.hide()
	$Menu/Principal/houses_pnl/selected_pnl.hide()
	$Menu/Principal/search_pnl/selected_pnl.hide()
	$Menu/Principal/level_pnl/selected_pnl.hide()

func select_room_menu():
	$House/HBoxContainer9.hide()
	for child in $House/HBoxContainer8/Panel3/HBoxContainer2.get_children():
		child.hide()
	for child in $House/HBoxContainer9/Panel3/HBoxContainer2.get_children():
		child.hide()
	
	for room in Dictionary_houses[selected_house]['Rooms']:
		if room in ['gym','office','spa','gameroom','tennis','cinema','laundry','pool']:
			$House/HBoxContainer9.show()
		var node_path = get_node(room_paths[room])
		node_path.show()
		var indicator = get_node(room_paths[room] + '/' + room + '/selected_pnl')
		if Dictionary_houses[selected_house]['Rooms'][room]['Tier'] < 5:
			indicator.add_theme_stylebox_override("panel", progress_room)
		else:
			indicator.add_theme_stylebox_override("panel", complete_room)
		
		if room == selected_room:
			$House/Item_container/VBoxContainer/Panel/HBoxContainer/img2.texture = load(Data.Database.Rooms[room]['Path'])
			$House/Item_container/VBoxContainer/Panel/HBoxContainer/Level_pnl/HBoxContainer/Level_lbl.text = str(Dictionary_houses[selected_house]['Rooms'][room]['Tier'])
	
	$House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.hide()
	var current_level = int(Dictionary_houses[selected_house]["Rooms"][selected_room]["Tier"])
	if type == 'own' and Dictionary_houses[selected_house]['Status'] != 'Rent':
		if current_level < 5:
			$House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.show()
			var current_cost = Data.Database["Rooms"][selected_room]["Tiers"][str(current_level)]
			var upgrade_cost = (Data.Database["Rooms"][selected_room]["Tiers"][str(current_level + 1)]) - current_cost
			$House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.text = tr('upgrade_') + ': ' + Data.format_money(upgrade_cost * Dictionary_houses[selected_house]["Rooms"][selected_room]["Qty"])
		
		
		
	

func update_actions():
	$House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.show()
	$House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.show()
	$House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.show()
	
	$House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.text = tr('rent_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["CostRent"]) + '/d'
	if type == 'own':
		$House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.text = tr('sell_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["Price"]) + '/d'
		if Dictionary_houses[selected_house]["CurrentHome"] == 1:
			$House/Item_container/VBoxContainer/Panel2.hide()
		if Dictionary_houses[selected_house]["Rentedby"] == 'NPC':
			$House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.hide()
		if Dictionary_houses[selected_house]['Status'] == 'Rent':
			pass
			#$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status'] + ': ' + Data.format_money(Dictionary_houses[selected_house]['CostRent']) + '/d'
			#$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect.texture = load('res://Assets/Images/HouseMenu/rent.png')
			#$House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = Dictionary_houses[selected_house]['Status'] #+ ': ' + Data.format_money(Dictionary_houses[selected_house]['CostRent']) + '/d'
		if Dictionary_houses[selected_house]['Status'] == 'Paying':
			$House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.hide()
		if Dictionary_houses[selected_house]['Status'] == 'Own':
			pass
			#$House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status']
			#$House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = tr('paid_')
	
	if type == 'search':
		$House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.text = tr('rent_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["CostRent"]) + '/d'
		$House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.text = tr('buy_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["CostSale"]) + '/d'
		$House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.hide()
		
	$House/Item_container/VBoxContainer/Panel3.hide()
	$House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.add_theme_stylebox_override("normal",green_button)
	$House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.add_theme_stylebox_override("normal",green_button)
	$House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.add_theme_stylebox_override("normal",green_button)
	if sub_status != '':
		$House/Item_container/VBoxContainer/Panel3.show()
		if sub_status == 'live':
			$House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.add_theme_stylebox_override("normal",purple_button)
		if sub_status == 'rent':
			$House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.add_theme_stylebox_override("normal",purple_button)
		if sub_status == 'buy':
			$House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.add_theme_stylebox_override("normal",purple_button)
			
func _on_close_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func create_item(id,type):
	var addcard = Item_card.instantiate()
	addcard.Id = id
	addcard.View = status
	addcard.Type = type
	#addcard.data = data
	$Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
	addcard.connect("change_in_house_card",entry_house)



func _on_close_btn_pressed() -> void:
	pass

func entry_house(identifier):
	#print(identifier)
	type = status
	#status = 'house'
	if Data.screen == 'market_houses':
		Data.screen = 'house_market'
	if Data.screen == 'own_houses':
		Data.screen = 'house_own'
	#print(status)
	selected_house = identifier

func update_level():
	$Menu/Principal/level_pnl/TextureRect.texture = load(level_number[search_level])
	
func _on_home_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func menu_change():
	if Data.screen == 'house_market':
		Data.screen = 'market_houses'
	if Data.screen == 'house_own':
		Data.screen = 'own_houses'

func _on_own_btn_pressed() -> void:
	menu_change()
	#unselect_menu()
	status = 'dash'
	type = ''
	search_level = 0
	#$Menu/Principal/own_pnl/selected_pnl.show()
	update_level()

func _on_search_btn_pressed() -> void:
	#show_gallery()
	if status != 'search':
		unselect_menu()
		status = 'search'
		type = ''
		$Menu/Principal/search_pnl/selected_pnl.show()
		search_level = 1
		update_level()

func _on_rent_btn_pressed() -> void:
	#show_gallery()
	if status != 'rent':
		unselect_menu()
		status = 'rent'
		$Menu/Principal/rent_pnl/selected_pnl.show()
		search_level = 1
		update_level()

func _on_sale_btn_pressed() -> void:
	#show_gallery()
	if status != 'sale':
		unselect_menu()
		status = 'sale'
		$Menu/Principal/sale_pnl/selected_pnl.show()
		search_level = 1
		update_level()

func _on_level_btn_pressed() -> void:
	if status != 'own':
		search_level += 1
		if search_level > 5:
			search_level = 1
		update_level()
		update_ui()

func _on_houses_btn_pressed() -> void:
	menu_change()
	#show_gallery()
	#unselect_menu()
	#status = 'own'
	type = ''
	#$Menu/Principal/houses_pnl/selected_pnl.show()
	#search_level = 0
	#update_level()

func _on_market_btn_pressed() -> void:
	_on_search_btn_pressed()

func _on_living_house_btn_pressed() -> void:
	if $Dashboard/picture/card/Panel3/title_lbl.text == "no_house":
		_on_search_btn_pressed()
	else:
		_on_houses_btn_pressed()


func _on_kitchen_btn_pressed() -> void:
	selected_room = 'kitchen'
	select_room_menu()


func _on_dinning_btn_pressed() -> void:
	selected_room = 'dinning'
	select_room_menu()


func _on_bedroom_btn_pressed() -> void:
	selected_room = 'bedroom'
	select_room_menu()

func _on_bath_btn_pressed() -> void:
	selected_room = 'bath'
	select_room_menu()


func _on_hall_btn_pressed() -> void:
	selected_room = 'hall'
	select_room_menu()


func _on_garden_btn_pressed() -> void:
	selected_room = 'garden'
	select_room_menu()


func _on_library_btn_pressed() -> void:
	selected_room = 'library'
	select_room_menu()


func _on_gym_btn_pressed() -> void:
	selected_room = 'gym'
	select_room_menu()


func _on_office_btn_pressed() -> void:
	selected_room = 'office'
	select_room_menu()


func _on_spa_btn_pressed() -> void:
	selected_room = 'spa'
	select_room_menu()


func _on_gameroom_btn_pressed() -> void:
	selected_room = 'gameroom'
	select_room_menu()


func _on_tennis_btn_pressed() -> void:
	selected_room = 'tennis'
	select_room_menu()


func _on_cinema_btn_pressed() -> void:
	selected_room = 'cinema'
	select_room_menu()


func _on_laundry_btn_pressed() -> void:
	selected_room = 'laundry'
	select_room_menu()

func _on_pool_btn_pressed() -> void:
	selected_room = 'pool'
	select_room_menu()



func _on_rent_house_btn_pressed() -> void:
	sub_status = 'rent'
	load_data_house()


func _on_live_house_btn_pressed() -> void:
	sub_status = 'live'
	load_data_house()


func _on_buy_house_btn_pressed() -> void:
	sub_status = 'buy'
	load_data_house()


func _on_accept_action_btn_pressed() -> void:
	if selected_house not in Data.Game.Player.Houses:
		if sub_status == 'rent':
			for house in Data.Game.Player.Houses:
				Data.Game.Player.Houses[house]["CurrentHome"] = 0
				if Data.Game.Player.Houses[house]['Status'] == 'Rent':
					Data.Game.Player.Houses[house]['Status'] = 'Old'
			var index = len(Data.Game.Player.Houses)
			Data.Game.HouseMarket[selected_house]['Status'] = 'Rent'
			Data.Game.HouseMarket[selected_house]["CurrentHome"] = 1
			Data.Game.Player.Houses[index] = Data.Game.HouseMarket[selected_house].duplicate(true) 
			Data.Game.HouseMarket[selected_house]['Status'] = 'Sold'
		if sub_status == 'buy':
			var index = len(Data.Game.Player.Houses)
			Data.Game.HouseMarket[selected_house]['Status'] = 'Paying'
			Data.Game.Player.Houses[index] = Data.Game.HouseMarket[selected_house].duplicate(true) 
			Data.Game.HouseMarket[selected_house]['Status'] = 'Sold'
	if selected_house in Data.Game.Player.Houses:
		if sub_status == 'rent':
			Data.Game.Player.Houses[selected_house]['Rentedby'] = 'NPC'
		if sub_status == 'buy':
			if Data.Game.Player.Houses[selected_house]['Status'] == 'Own':
				Data.Game.Player.give_money(Data.Game.Player.Houses[selected_house]['Price'])
				Data.Game.Player.Houses[selected_house]['Status'] = 'Old'
				
				
		if sub_status == 'live':
			for house in Data.Game.Player.Houses:
				Data.Game.Player.Houses[house]["CurrentHome"] = 0
				if Data.Game.Player.Houses[house]['Status'] == 'Rent':
					Data.Game.Player.Houses[house]['Status'] = 'Old'
			Data.Game.Player.Houses[selected_house]['Rentedby'] = ''
			Data.Game.Player.Houses[selected_house]["CurrentHome"] = 1
			
	Data.Game.Player.set_moneyperday()
	sub_status = ''
	menu_change()
	#_on_houses_btn_pressed()

func _on_cancel_action_btn_pressed() -> void:
	sub_status = ''

func _on_upgrade_room_btn_pressed() -> void:
	var current_level = int(Dictionary_houses[selected_house]["Rooms"][selected_room]["Tier"])
	var qty = int(Dictionary_houses[selected_house]["Rooms"][selected_room]["Qty"])
	if current_level < 5 and Dictionary_houses[selected_house]["Status"] not in ["rent"]:
		var current_cost = Data.Database["Rooms"][selected_room]["Tiers"][str(current_level)]
		var upgrade_cost = (Data.Database["Rooms"][selected_room]["Tiers"][str(current_level + 1)]) - current_cost
		if Data.Game.Player.buy_something(upgrade_cost * qty):
			if type == 'search':
				Data.Game.HouseMarket[selected_house]["Rooms"][selected_room]["Tier"] += 1
				var new_array = Data.Game.house_appraiser(Data.Game.HouseMarket[selected_house]["Rooms"])
				Data.Game.HouseMarket[selected_house]["LevelRooms"] = new_array[0]
				Data.Game.HouseMarket[selected_house]["Price"] = new_array[1]
				Data.Game.HouseMarket[selected_house]["CostRent"] = new_array[2]
				Data.Game.HouseMarket[selected_house]["CostSale"] = new_array[3]
			if type == 'own':
				Data.Game.Player.Houses[selected_house]["Rooms"][selected_room]["Tier"] += 1
				var new_array = Data.Game.house_appraiser(Data.Game.Player.Houses[selected_house]["Rooms"])
				Data.Game.Player.Houses[selected_house]["LevelRooms"] = new_array[0]
				Data.Game.Player.Houses[selected_house]["Price"] = new_array[1]
				Data.Game.Player.Houses[selected_house]["CostRent"] = new_array[2]
				#Data.Game.Player.Houses[selected_house]["CostSale"] = new_array[3]
			
	
	update_ui()
	select_room_menu()
	#Data.set_moneyperday()
	Data.Game.Player.check_variables()
