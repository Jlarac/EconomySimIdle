extends Control

var screen = ''
var old_screen = ''
var old_len_upgrades = 0
var old_len_items = 0
var Item_card = preload("res://Scenes/Cards/shop_card.tscn")

func _ready() -> void:
	update_init()

func _process(_delta: float) -> void:
	if old_screen != screen:
		update_screen()
		old_screen = screen

	if len(Data.Game.Player.OwnUpgrades) != old_len_upgrades:
		update_screen()
		old_len_upgrades = len(Data.Game.Player.OwnUpgrades)
	if len(Data.Game.Player.OwnItems) != old_len_items:
		update_screen()
		old_len_items = len(Data.Game.Player.OwnItems)

func update_init():
	for item in Data.Database.Upgrades.keys():
		create_item(item)
	_on_cloth_btn_pressed()

func update_screen():
	for child in $Item_container/ScrollContainer/VBoxContainer.get_children():
		child.hide()
		if screen in child.Id and 'card' not in child.Id:
			if Data.Database.Upgrades[child.Id]['Kind'] == 'Upgrade' or Data.Database.Upgrades[child.Id]['Kind'] == 'Furniture':
				if Data.Database.Upgrades[child.Id]['Tier'] == (Data.Game.Player.Upgrades[Data.Database.Upgrades[child.Id]['Parent']]['Value'] + 1):
					child.show()
			else:
				child.show()
	for child in $Item_container/ScrollContainer/VBoxContainer.get_children():
		if screen in child.Id and 'card' not in child.Id:
			if Data.Database.Upgrades[child.Id]['Kind'] == 'Upgrade' or Data.Database.Upgrades[child.Id]['Kind'] == 'Furniture':
				if Data.Database.Upgrades[child.Id]['Tier'] == 5 and child.Id in Data.Game.Player.OwnItems:
					child.show()

func create_item(item):
	var addcard = Item_card.instantiate()
	addcard.Id = item
	$Item_container/ScrollContainer/VBoxContainer.add_child(addcard)

func unselect_submenu():
	$submenu/card/HBoxContainer/cloth_pnl/Panel.hide()
	$submenu/card/HBoxContainer/food_pnl/Panel.hide()
	$submenu/card/HBoxContainer/medicine_pnl/Panel.hide()
	$submenu/card/HBoxContainer/furniture_pnl/Panel.hide()
	$submenu/card/HBoxContainer/upgrade_pnl/Panel.hide()
	$submenu/card/HBoxContainer/real_pnl/Panel.hide()

func _on_cloth_btn_pressed() -> void:
	screen = 'cloth'
	unselect_submenu()
	$submenu/card/HBoxContainer/cloth_pnl/Panel.show()


func _on_food_btn_pressed() -> void:
	screen = 'food'
	unselect_submenu()
	$submenu/card/HBoxContainer/food_pnl/Panel.show()


func _on_medicine_btn_pressed() -> void:
	screen = 'medicine'
	unselect_submenu()
	$submenu/card/HBoxContainer/medicine_pnl/Panel.show()


func _on_furniture_btn_pressed() -> void:
	screen = 'furniture'
	unselect_submenu()
	$submenu/card/HBoxContainer/furniture_pnl/Panel.show()


func _on_upgrade_btn_pressed() -> void:
	screen = 'upgrade'
	unselect_submenu()
	$submenu/card/HBoxContainer/upgrade_pnl/Panel.show()

func _on_real_btn_pressed() -> void:
	screen = 'real'
	unselect_submenu()
	$submenu/card/HBoxContainer/real_pnl/Panel.show()
