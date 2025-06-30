extends Control

var Id
var Icon = load("res://Assets/Images/UI/img256.png")
var Price = 0
var Happy = 0
var Health = 0
var Duration = 0
var status = "+"
var oldstatus = "-"
var data = {}

func _ready() -> void:
	$Panel/Subpanel/title_lbl.text = Id
	$Panel/Subpanel/image.texture = load(data["Path"])
	$Panel/Subpanel/action_btn.set_text("accept_btn")
	$Panel/Subpanel/HBoxContainer/Panel/HBoxContainer/cost_lbl.text = Data.format_money(data["Price"])
	$Panel/Subpanel/HBoxContainer/Panel3/HBoxContainer3/happy_lbl.text = str(data["Happy"])+"%"
	$Panel/Subpanel/HBoxContainer/Panel2/HBoxContainer2/health_lbl.text = str(data["Health"])+"%"

func _process(_delta: float) -> void:
	if status != oldstatus:
		update()
		oldstatus = status
	update_always()

func update():
	if status == "Available":
		$Panel/Subpanel/action_btn.show()
		$Panel/Subpanel/ProgressBar.hide()
	if status == "Not":
		$Panel/Subpanel/action_btn.hide()
		$Panel/Subpanel/ProgressBar.show()

func update_always():
	if Id not in Data.player_data["to_do_times"] or Data.game_data["date"] >= Data.player_data["to_do_times"][Id]["End"]:
		status = "Available"
	else:
		status = "Not"
		$Panel/Subpanel/ProgressBar.value = (((Data.game_data["date"] - Data.player_data["to_do_times"][Id]["Init"])/3600) / data["Time"]) * 100
		$Panel/Subpanel/ProgressBar/Label.text = str(Data.round_to_dec((Data.player_data["to_do_times"][Id]["End"] - Data.game_data["date"])/3600,0)) + " HOURS"

func _on_action_btn_pressed() -> void:
	if Id not in Data.player_data["to_do_times"] or Data.game_data["date"] >= Data.player_data["to_do_times"][Id]["End"]:
		if Data.buy_something(data["Price"]):
			Data.player_data["to_do_times"][Id] = {"Init":Data.game_data["date"],"End":Data.game_data["date"] + (3600 * data["Time"])}
			Data.player_data["happy"] += data["Happy"]
			Data.player_data["health"] += data["Health"]
			Data.verify_health_happy()
			if Data.probability(5):
				Data.meet_someone()
			status = "Not"
		#Data.update_lbl = true
		#Data.update_screen = true
