extends Control

var Item_card = preload("res://Scenes/Cards/healthhappy_card.tscn")

func _ready() -> void:
	$Body/Menu_header_pnl/MarginContainer/Panel/Menu_header_lbl.text = "todo_title"
	$Body/Todo/VBoxContainer/MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel/virus_lbl.text = str(Data.Player.HealthDict["virus"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel2/bed_lbl.text = str(Data.Player.HealthDict["room"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel3/stove_lbl.text = str(Data.Player.HealthDict["kitchen"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel4/fridge_lbl.text = str(Data.Player.HealthDict["bath"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel5/wc_lbl.text = str(Data.Player.HealthDict["food"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel6/shower_lbl.text = str(Data.Player.HealthDict["cloth"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer/Panel/HBoxContainer2/health_lbl.text = str(Data.Player.HealthPerDay) + "%"
	$Body/Todo/VBoxContainer/MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel/friends_lbl.text = str(Data.Player.HappyDict["friends"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel2/house_lbl.text = str(Data.Player.HappyDict["house"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel3/car_lbl.text = str(Data.Player.HappyDict["car"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel4/work_lbl.text = str(Data.Player.HappyDict["work"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel5/food_lbl.text = str(Data.Player.HappyDict["food"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel6/clothes_lbl.text = str(Data.Player.HappyDict["clothes"]) + "%"
	$Body/Todo/VBoxContainer/MarginContainer2/Panel/HBoxContainer/happy_lbl.text = str(Data.Player.HappyPerDay) + "%"
	
	for item in Data.db_data["ToDo"].keys():
		create_item(item)

func _process(_delta: float) -> void:
	pass

func _on_close_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func create_item(item):
	var addcard = Item_card.instantiate()
	addcard.Id = item
	addcard.data = Data.db_data["ToDo"][item]
	$Body/Todo/Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
