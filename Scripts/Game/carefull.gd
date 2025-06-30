extends Node

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Data.carefull_status:
		$MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel/virus_lbl.text = str(Data.Game.Player.HealthDict["virus"]) + "%"
		$MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel2/bed_lbl.text = str(Data.Game.Player.HealthDict["room"]) + "%"
		$MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel3/stove_lbl.text = str(Data.Game.Player.HealthDict["kitchen"]) + "%"
		$MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel4/fridge_lbl.text = str(Data.Game.Player.HealthDict["bath"]) + "%"
		$MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel5/wc_lbl.text = str(Data.Game.Player.HealthDict["food"]) + "%"
		$MarginContainer/Panel/HBoxContainer2/HBoxHealth/Panel6/shower_lbl.text = str(Data.Game.Player.HealthDict["cloth"]) + "%"
		$MarginContainer/Panel/HBoxContainer2/health_lbl.text = str(Data.Game.Player.HealthPerDay) + "%"
		$MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel/friends_lbl.text = str(Data.Game.Player.HappyDict["friends"]) + "%"
		$MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel2/house_lbl.text = str(Data.Game.Player.HappyDict["house"]) + "%"
		$MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel3/car_lbl.text = str(Data.Game.Player.HappyDict["car"]) + "%"
		$MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel4/work_lbl.text = str(Data.Game.Player.HappyDict["work"]) + "%"
		$MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel5/food_lbl.text = str(Data.Game.Player.HappyDict["food"]) + "%"
		$MarginContainer2/Panel/HBoxContainer/HBoxHappy/Panel6/clothes_lbl.text = str(Data.Game.Player.HappyDict["cloth"]) + "%"
		$MarginContainer2/Panel/HBoxContainer/happy_lbl.text = str(Data.Game.Player.HappyPerDay) + "%"
