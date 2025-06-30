extends Control

var Item_card = preload("res://Scenes/Cards/shop_card.tscn")
var Separator_card = preload("res://Scenes/Cards/separator_card.tscn")
var selected = "personal"
var old_selected = ""
var invisible = preload("res://Resources/Themes/invisible.tres")
var selected_enviroment = preload("res://Resources/Themes/selected_enviroment.tres")
var data_dict = {}
var old_len_upgrades = 0
var old_len_items = 0
var separations = ['personal','upgrade','furniture','real']
var aisles = ['cloth','food','medicine']
	
func _ready() -> void:
	unselect_menu()
	$Body/Menu/Principal/home_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	$Body/Menu/Principal/cloth_pnl/selected_pnl.show()
	
	for separation in separations:
		if separation == 'personal':
			for aisle in aisles:
				for item in Data.Database.Upgrades.keys():
					if separation in item and aisle in item:
						create_item(item)
				create_separation('separator'+separation+aisle)
		else:
			for item in Data.Database.Upgrades.keys():
				if separation in item:
					create_item(item)
			create_separation('separator'+separation)
	check_upgrades()

func _process(_delta: float) -> void:
	if old_selected != selected:
		update_ui()
		old_selected = selected
	if len(Data.Game.Player.OwnUpgrades) != old_len_upgrades:
		update_ui()
		old_len_upgrades = len(Data.Game.Player.OwnUpgrades)
	if len(Data.Game.Player.OwnItems) != old_len_items:
		update_ui()
		old_len_items = len(Data.Game.Player.OwnItems)

func update_ui():
	for i in $Body/Shop/Item_container/ScrollContainer/VBoxContainer.get_children():
		i.hide()
		if selected in i.Id:
			if 'separator' in i.Id:
				i.show()
			else:
				if Data.Database.Upgrades[i.Id]['Kind'] == 'Upgrade' or Data.Database.Upgrades[i.Id]['Kind'] == 'Furniture':
					if Data.Database.Upgrades[i.Id]['Tier'] == (Data.Game.Player.Upgrades[Data.Database.Upgrades[i.Id]['Parent']]['Value'] + 1):
						i.show()
				else:
					i.show()

func create_item(item):
	var addcard = Item_card.instantiate()
	addcard.Id = item
	$Body/Shop/Item_container/ScrollContainer/VBoxContainer.add_child(addcard)

func create_separation(item):
	var addcard = Separator_card.instantiate()
	addcard.Id = item
	$Body/Shop/Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
	
func check_upgrades():
	for item in Data.Game.Player.OwnUpgrades:
		var parent = Data.Database.Upgrades[item]['Parent']
		data_dict[parent] = 0
	for item in Data.Game.Player.OwnUpgrades:
		var parent = Data.Database.Upgrades[item]['Parent']
		var tier = Data.Database.Upgrades[item]['Tier']
		if tier > data_dict[parent]:
			data_dict[parent] = tier
	print(data_dict)

func unselect_menu():
	$Body/Menu/Principal/items_pnl/selected_pnl.hide()
	$Body/Menu/Principal/cloth_pnl/selected_pnl.hide()
	$Body/Menu/Principal/food_pnl/selected_pnl.hide()
	$Body/Menu/Principal/medicine_pnl/selected_pnl.hide()
	$Body/Menu/Principal/upgrades_pnl/selected_pnl.hide()
	$Body/Menu/Principal/real_pnl/selected_pnl.hide()

func _on_close_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')


func _on_home_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')


func _on_items_btn_pressed() -> void:
	unselect_menu()
	selected = "furniture"
	$Body/Menu/Principal/items_pnl/selected_pnl.show()

func _on_cloth_btn_pressed() -> void:
	unselect_menu()
	selected = "personal"
	$Body/Menu/Principal/cloth_pnl/selected_pnl.show()

func _on_food_btn_pressed() -> void:
	unselect_menu()
	selected = "food"
	$Body/Menu/Principal/food_pnl/selected_pnl.show()

func _on_medicine_btn_pressed() -> void:
	unselect_menu()
	selected = "medicine"
	$Body/Menu/Principal/medicine_pnl/selected_pnl.show()


func _on_upgrades_btn_pressed() -> void:
	unselect_menu()
	selected = "upgrade"
	$Body/Menu/Principal/upgrades_pnl/selected_pnl.show()


func _on_real_btn_pressed() -> void:
	unselect_menu()
	selected = "real"
	$Body/Menu/Principal/real_pnl/selected_pnl.show()
