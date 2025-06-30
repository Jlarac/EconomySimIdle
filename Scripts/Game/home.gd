extends Control

#var time_init = 0
#var init_steps = 0
#var time_notification = 0
#var time_clic = 0
#var notification_status = "+"
#var notification_btn = {}
#var run = false
#var ccc = 0
#var minutes = 0
#var path_house = ""
#var coin_scene = preload('res://Scenes/Cards/coin_card.tscn')
#var active_coins = 0
#var old_autoclic = 0
var level_next_work = {0:0, 1: 10, 2: 50,3: 100, 4: 150, 5: 200,6: 250, 7: 300, 8: 350,9: 400, 10: 500}
#var screen = 'home'
#var old_screen = ''

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	$user_data/card/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	#$Body/Menu/Menu_container/Principal/Realshop_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	
	$user_data/card/Player_data/Name_section/name_lbl.text = Data.Game.Player.Name + " " + Data.Game.Player.Surname
	$user_data/card/Player_data/Work_section/work_lbl.text = Data.Game.Player.Work
	$user_data/card/Player_data/Year_section/age_lbl.text = str(Data.Game.Player.YearsOld) + " " + tr("years_")
	
	$submenu/card/HBoxContainer/Study_pnl/Study_prgbr.value = Data.Game.Player.ProgressStudy
	$submenu/card/HBoxContainer/Study_pnl/study_pic.texture = load(Data.Game.Player.StudyIcon)
	
	$own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_photo.texture = load('res://Assets/Images/People/no_friends.png')
	$own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_lbl.text = 'no_friends_'
	var high_value = 0
	for friend in Data.Game.Player.Friends:
		if Data.Game.Player.Friends[friend]['Friend'] >= high_value and Data.Game.Player.Friends[friend]['Friend'] > 100:
			$own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_photo.texture = load(Data.Database.Photos[Data.Game.People[friend].ProfilePic]['Path'])
			$own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_lbl.text = Data.Game.People[friend].Fullname
			high_value = Data.Game.Player.Friends[friend]['Friend']
	
	$own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_photo.texture = load("res://Assets/Images/Houses/park1024.png")
	$own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_lbl.text = "no_house"
	for house in Data.Game.Player.Houses:
		if Data.Game.Player.Houses[house]["CurrentHome"] == 1:
			$own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_photo.texture = load(Data.Game.Player.Houses[house]["Path"])
			$own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_lbl.text = Data.Game.Player.Houses[house]["Name"]
	
	#$Body/Menu/Menu_container/Principal/Clock/Clock_btn.text = "+" + str(int(Data.Game.AutomaticHours)) + "h"
	
	$submenu/card/HBoxContainer/Study_pnl/Study_prgbr.value = Data.Game.Player.ProgressStudy
	var learn_progress = 0
	if Data.Database.Work[Data.Game.Player.Work]['Level'] == 10:
		learn_progress = int((Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Data.Game.Player.Work]['Parent']]['Skill']] / 500)*100)
	else:
		learn_progress = int((Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Data.Game.Player.Work]['Parent']]['Skill']] / level_next_work[Data.Database.Work[Data.Game.Player.Work]['Level'] + 1])*100)
	if learn_progress >= 100 or Data.Database.Work[Data.Game.Player.Work]['Level'] == 0:
		learn_progress = 0
	$submenu/card/HBoxContainer/Work_pnl/Work_prgbr.value = learn_progress
	


func _on_study_btn_pressed() -> void:
	Data.screen = 'study'
	Data.reset_carefull_income()


func _on_house_btn_pressed() -> void:
	Data.screen = 'houses_dashboard'
	Data.reset_carefull_income()


func _on_work_btn_pressed() -> void:
	Data.screen = 'business_dashboard'
	Data.reset_carefull_income()
