extends Control

var Item_card = preload("res://Scenes/Cards/work_card.tscn")

var status = 'work'
var old_status = ''

var sub_status = ''
var sub_old_status = ''

var type = ''

var search_level = 1
var max_search_level = 10
var old_search_level = 0

var selected_house = ''
var old_selected_house = '-'

var selected_room = 'kitchen'
var room_paths = {}
var level_number = {0: 'res://Assets/Images/Menu/Niveles/numero-0.png', 1: 'res://Assets/Images/Menu/Niveles/numero-1.png', 2: 'res://Assets/Images/Menu/Niveles/numero-2.png',
					3: 'res://Assets/Images/Menu/Niveles/numero-3.png', 4: 'res://Assets/Images/Menu/Niveles/numero-4.png', 5: 'res://Assets/Images/Menu/Niveles/numero-5.png',
					6: 'res://Assets/Images/Menu/Niveles/numero-6.png', 7: 'res://Assets/Images/Menu/Niveles/numero-7.png', 8: 'res://Assets/Images/Menu/Niveles/numero-8.png',
					9: 'res://Assets/Images/Menu/Niveles/numero-9.png', 10: 'res://Assets/Images/Menu/Niveles/numero-10.png'}
var level_next_work = {0:0, 1: 10, 2: 50,3: 100, 4: 150, 5: 200,6: 250, 7: 300, 8: 350,9: 400, 10: 500}

var progress_room = preload('res://Resources/Themes/house_room_purple.tres')
var complete_room = preload('res://Resources/Themes/house_room_blue.tres')
var purple_button = preload('res://Resources/Themes/purplecard.tres')
var green_button = preload('res://Resources/Themes/green_button.tres')

var Dictionary_houses = {}

func _ready() -> void:
	update_init()
	unselect_menu()
	$Body/Menu/Principal/work_pnl/selected_pnl.show()
	update_level()

func _process(_delta: float) -> void:
	update_always()
	if old_status != status:
		update_ui()
		old_status = status

func update_init():
	print(Data.Game.Player.Skills)
	$Body/Menu/Principal/home_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	search_level = Data.Database.Work[Data.Game.Player.Work]['Level']
	if search_level == 0:
		search_level = 1
	

func update_ui():
	for card in $Body/Works/Item_container/ScrollContainer/VBoxContainer.get_children():
		card.queue_free()
		
	if status == 'work':
		'''var step_search_level = 0
		for skill in Data.Game.Player.Skills:
			for value in level_next_work:
				if Data.Game.Player.Skills[skill] >= level_next_work[value]:
					step_search_level = value
				if step_search_level > max_search_level:
					max_search_level = step_search_level
		print(max_search_level)'''
		#show_dash()
		#$Body/Dashboard/picture/card/house_photo.texture = load("res://Assets/Images/Houses/park1024.png")
		#$Body/Dashboard/picture/card/Panel3/title_lbl.text = "no_house"
		#$Body/Dashboard/real_estate_balance/Panel/VBoxContainer/VBoxContainer2/money_lbl.text = Data.format_money(Data.Game.Player.MoneyPerDayDetailed['Houses'])
		#search_level = 1   
		for work in Data.Database.Work:
			if Data.Database.Work[work]['Level'] == search_level and Data.Database.Work[work]['Level'] != 0:
				print(Data.Game.Player.Skills)
				if Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[work]['Parent']]['Skill']] >= level_next_work[Data.Database.Work[work]['Level']]:
					create_item(work)
			if Data.Database.Work[work]['Level'] == 0:
				create_item(work)
				'''for work_ in Data.Game.Player.WorkSummary:
					if Data.Database.Work[work_]['Parent'] == Data.Database.Work[Data.Game.Player.Work]['Parent']:
						if Data.Database.Work[work_]['Level'] == (Data.Database.Work[Data.Game.Player.Work]['Level']-1):
							if Data.Game.Player.WorkSummary[work_] >= 90:
								status = 'available'
								'''
			#$Body/Dashboard/picture/card/Panel3/title_lbl.text = 'my_properties_'
			#if Data.Game.Player.Houses[house]["CurrentHome"] == 1:
			#	$Body/Dashboard/picture/card/house_photo.texture = load(Data.Game.Player.Houses[house]["Path"])

func update_always():
	#status = 'not_available'
	
	
	
	
	#else:
	#	status = 'available'
	
	if status == 'house':
		if type == 'own':
			if selected_house in Data.Game.Player.Houses:
				$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status']
				$Body/House/picture/card/Panel4/VBoxContainer/ProgressBar.value = Data.Game.Player.Houses[selected_house]['Payments']
				
				if Data.Game.Player.Houses[selected_house]['Status'] == 'Rent':
					$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status'] + ': ' + Data.format_money(Data.Game.Player.Houses[selected_house]['CostRent']) + '/d'
					#$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect.texture = load('res://Assets/Images/HouseMenu/rent.png')
					$Body/House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = Data.Game.Player.Houses[selected_house]['Status']
				if Data.Game.Player.Houses[selected_house]['Status'] == 'Paying':
					var CostSale = Data.Game.Player.Houses[selected_house]['CostSale']
					var CostRent = 0
					
					if Data.Game.Player.Houses[selected_house]["Rentedby"] == 'NPC':
						CostRent = Data.Game.Player.Houses[selected_house]['CostRent']
					var Balance = - CostSale + CostRent
					var Lbl = Data.Game.Player.Houses[selected_house]['Status']
					if Balance > 0:
						Lbl = 'Receiving'
					$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = tr(Lbl) + ': ' + Data.format_money(abs(Balance)) + '/d  '
					$Body/House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = str(365 - Data.Game.Player.Houses[selected_house]['Payments']) + ' ' + tr('remaining_payments_') 
						
				if Data.Game.Player.Houses[selected_house]['Status'] == 'Own':
					if Data.Game.Player.Houses[selected_house]["Rentedby"] == 'NPC':
						$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = 'Receiving' + ': ' + Data.format_money(Data.Game.Player.Houses[selected_house]['CostRent']) + '/d  '
					$Body/House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = tr('paid_')

func load_data_house():
	$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect.hide()
	$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.hide()
	$Body/House/picture/card/Panel4.hide()
	if type == 'search':
		Dictionary_houses = Data.Game.HouseMarket.duplicate(true)
	if type == 'own':
		$Body/House/picture/card/Panel4.show()
		Dictionary_houses = Data.Game.Player.Houses.duplicate(true)
		$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect.show()
		if Dictionary_houses[selected_house]["CurrentHome"] == 1:
			$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.show()
			$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.texture = load('res://Assets/Images/HouseMenu/player.png')
		if Dictionary_houses[selected_house]["Rentedby"] == 'NPC':
			$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.show()
			$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect2.texture = load('res://Assets/Images/HouseMenu/npc.png')
			
		if Dictionary_houses[selected_house]['Status'] == 'Rent':
			$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/TextureRect.texture = load('res://Assets/Images/HouseMenu/rent.png')
	
	$Body/House/picture/card/house_photo.texture = load(Dictionary_houses[selected_house]["Path"])
	$Body/House/picture2/Panel/VBoxContainer/VBoxContainer2/title_sector/work_lbl.text = Dictionary_houses[selected_house]['Name']
	$Body/House/picture2/Panel/VBoxContainer/VBoxContainer2/title_sector/price_lbl.text = Data.format_money(Dictionary_houses[selected_house]["Price"])
	$Body/House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer3/lvl_lbl.text = str(Data.round_to_dec(Dictionary_houses[selected_house]["Level"] + Dictionary_houses[selected_house]["LevelRooms"],1))
	$Body/House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer2/happy_lbl.text = str(Dictionary_houses[selected_house]["Happy"])
	$Body/House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer/health_lbl.text = str(Dictionary_houses[selected_house]["Health"])
	$Body/House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer4/parking_lbl.text = str(Dictionary_houses[selected_house]['Parking'])
	$Body/House/picture2/Panel/VBoxContainer/HBoxContainer/HBoxContainer5/home_lbl.text = str(Dictionary_houses[selected_house]['Size_house']) + ' m2'
	
	$Body/House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.hide()
	$Body/House/Item_container/VBoxContainer/Panel2.hide()
	if type == 'own':
		if Dictionary_houses[selected_house]["Status"] != 'Rent':
			$Body/House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.show()
			$Body/House/Item_container/VBoxContainer/Panel2.show()
			#$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.show()
	if type == 'search':
		$Body/House/Item_container/VBoxContainer/Panel2.show()
		#$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.hide()
	
	select_room_menu()
	update_actions()

func save_houses():
	for card in $Body/Houses/Item_container/ScrollContainer/VBoxContainer.get_children():
		pass

func unselect_menu():
	$Body/Menu/Principal/work_pnl/selected_pnl.hide()
	$Body/Menu/Principal/business_pnl/selected_pnl.hide()
	$Body/Menu/Principal/minigame_pnl/selected_pnl.hide()
	$Body/Menu/Principal/level_pnl/selected_pnl.hide()

func select_room_menu():
	$Body/House/HBoxContainer9.hide()
	for child in $Body/House/HBoxContainer8/Panel3/HBoxContainer2.get_children():
		child.hide()
	for child in $Body/House/HBoxContainer9/Panel3/HBoxContainer2.get_children():
		child.hide()
	
	for room in Dictionary_houses[selected_house]['Rooms']:
		if room in ['gym','office','spa','gameroom','tennis','cinema','laundry','pool']:
			$Body/House/HBoxContainer9.show()
		var node_path = get_node(room_paths[room])
		node_path.show()
		var indicator = get_node(room_paths[room] + '/' + room + '/selected_pnl')
		if Dictionary_houses[selected_house]['Rooms'][room]['Tier'] < 5:
			indicator.add_theme_stylebox_override("panel", progress_room)
		else:
			indicator.add_theme_stylebox_override("panel", complete_room)
		
		if room == selected_room:
			$Body/House/Item_container/VBoxContainer/Panel/HBoxContainer/img2.texture = load(Data.Database.Rooms[room]['Path'])
			$Body/House/Item_container/VBoxContainer/Panel/HBoxContainer/Level_pnl/HBoxContainer/Level_lbl.text = str(Dictionary_houses[selected_house]['Rooms'][room]['Tier'])
	
	$Body/House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.hide()
	var current_level = int(Dictionary_houses[selected_house]["Rooms"][selected_room]["Tier"])
	if type == 'own' and Dictionary_houses[selected_house]['Status'] != 'Rent':
		if current_level < 5:
			$Body/House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.show()
			var current_cost = Data.Database["Rooms"][selected_room]["Tiers"][str(current_level)]
			var upgrade_cost = (Data.Database["Rooms"][selected_room]["Tiers"][str(current_level + 1)]) - current_cost
			$Body/House/Item_container/VBoxContainer/Panel/HBoxContainer/upgrade_room_btn.text = tr('upgrade_') + ': ' + Data.format_money(upgrade_cost * Dictionary_houses[selected_house]["Rooms"][selected_room]["Qty"])
		
		
		
	

func update_actions():
	$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.show()
	$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.show()
	$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.show()
	
	$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.text = tr('rent_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["CostRent"]) + '/d'
	if type == 'own':
		$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.text = tr('sell_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["Price"]) + '/d'
		if Dictionary_houses[selected_house]["CurrentHome"] == 1:
			$Body/House/Item_container/VBoxContainer/Panel2.hide()
		if Dictionary_houses[selected_house]["Rentedby"] == 'NPC':
			$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.hide()
		if Dictionary_houses[selected_house]['Status'] == 'Rent':
			pass
			#$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status'] + ': ' + Data.format_money(Dictionary_houses[selected_house]['CostRent']) + '/d'
			#$Panel/Panel3/VBoxContainer/HBoxContainer2/TextureRect.texture = load('res://Assets/Images/HouseMenu/rent.png')
			#$Body/House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = Dictionary_houses[selected_house]['Status'] #+ ': ' + Data.format_money(Dictionary_houses[selected_house]['CostRent']) + '/d'
		if Dictionary_houses[selected_house]['Status'] == 'Paying':
			$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.hide()
		if Dictionary_houses[selected_house]['Status'] == 'Own':
			pass
			#$Body/House/picture/card/Panel4/VBoxContainer/HBoxContainer2/title_lbl.text = Data.Game.Player.Houses[selected_house]['Status']
			#$Body/House/picture/card/Panel4/VBoxContainer/ProgressBar/Label.text = tr('paid_')
	
	if type == 'search':
		$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.text = tr('rent_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["CostRent"]) + '/d'
		$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.text = tr('buy_for') + ': \n' + Data.format_money(Dictionary_houses[selected_house]["CostSale"]) + '/d'
		$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.hide()
		
	$Body/House/Item_container/VBoxContainer/Panel3.hide()
	$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.add_theme_stylebox_override("normal",green_button)
	$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.add_theme_stylebox_override("normal",green_button)
	$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.add_theme_stylebox_override("normal",green_button)
	if sub_status != '':
		$Body/House/Item_container/VBoxContainer/Panel3.show()
		if sub_status == 'live':
			$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/live_house_btn.add_theme_stylebox_override("normal",purple_button)
		if sub_status == 'rent':
			$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/rent_house_btn.add_theme_stylebox_override("normal",purple_button)
		if sub_status == 'buy':
			$Body/House/Item_container/VBoxContainer/Panel2/HBoxContainer/buy_house_btn.add_theme_stylebox_override("normal",purple_button)
			
func _on_close_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func create_item(id):
	var addcard = Item_card.instantiate()
	addcard.Id = id
	#addcard.data = data
	$Body/Works/Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
	addcard.connect("change_in_work_card",entry_work)



func _on_close_btn_pressed() -> void:
	pass

func entry_work(identifier):
	type = status
	status = 'house'
	selected_house = identifier

func update_level():
	$Body/Menu/Principal/level_pnl/TextureRect.texture = load(level_number[search_level])

func show_gallery():
	$Body/Houses.show()
	$Body/House.hide()
	$Body/Dashboard.hide()

func show_house():
	$Body/Houses.hide()
	$Body/House.show()
	$Body/Dashboard.hide()

func show_dash():
	$Body/Dashboard.show()
	$Body/House.hide()
	$Body/Houses.hide()
	
func _on_home_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')


func _on_own_btn_pressed() -> void:
	show_dash()
	unselect_menu()
	status = 'dash'
	type = ''
	search_level = 0
	$Body/Menu/Principal/own_pnl/selected_pnl.show()
	update_level()

func _on_search_btn_pressed() -> void:
	show_gallery()
	if status != 'search':
		unselect_menu()
		status = 'search'
		type = ''
		$Body/Menu/Principal/search_pnl/selected_pnl.show()
		search_level = 1
		update_level()

func _on_rent_btn_pressed() -> void:
	show_gallery()
	if status != 'rent':
		unselect_menu()
		status = 'rent'
		$Body/Menu/Principal/rent_pnl/selected_pnl.show()
		search_level = 1
		update_level()

func _on_sale_btn_pressed() -> void:
	show_gallery()
	if status != 'sale':
		unselect_menu()
		status = 'sale'
		$Body/Menu/Principal/sale_pnl/selected_pnl.show()
		search_level = 1
		update_level()

func _on_level_btn_pressed() -> void:
	if status != 'own':
		search_level += 1
		if search_level > max_search_level:
			search_level = 1
		update_level()
		update_ui()

func _on_houses_btn_pressed() -> void:
	show_gallery()
	unselect_menu()
	status = 'own'
	type = ''
	$Body/Menu/Principal/houses_pnl/selected_pnl.show()
	search_level = 0
	update_level()

func _on_market_btn_pressed() -> void:
	_on_search_btn_pressed()

func _on_living_house_btn_pressed() -> void:
	if $Body/Dashboard/picture/card/Panel3/title_lbl.text == "no_house":
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
	_on_houses_btn_pressed()

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


func _on_work_btn_pressed() -> void:
	pass # Replace with function body.


func _on_business_btn_pressed() -> void:
	pass # Replace with function body.


func _on_minigame_pressed() -> void:
	pass # Replace with function body.
