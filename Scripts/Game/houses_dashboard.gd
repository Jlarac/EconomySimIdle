extends Control

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	$picture/card/house_photo.texture = load("res://Assets/Images/Houses/park1024.png")
	$picture/card/Panel3/title_lbl.text = "no_house"
	$real_estate_balance/Panel/VBoxContainer/VBoxContainer2/money_lbl.text = Data.format_money(Data.Game.Player.MoneyPerDayDetailed['Houses'])
	for house in Data.Game.Player.Houses:
		$picture/card/Panel3/title_lbl.text = 'my_properties_'
		if Data.Game.Player.Houses[house]["CurrentHome"] == 1:
			$picture/card/house_photo.texture = load(Data.Game.Player.Houses[house]["Path"])


func _on_market_btn_pressed() -> void:
	Data.screen = 'market_houses'
	Data.reset_carefull_income()

func _on_living_house_btn_pressed() -> void:
	Data.screen = 'own_houses'
	Data.reset_carefull_income()
