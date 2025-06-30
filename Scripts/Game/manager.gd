extends Control

#var time_init = 0
var init_steps = 0
var time_notification = 0
var time_clic = 0
var notification_status = "+"
var notification_btn = {}
var run = false
var ccc = 0
var minutes = 0
var path_house = ""

var old_autoclic = 0
var level_next_work = {0:0, 1: 10, 2: 50,3: 100, 4: 150, 5: 200,6: 250, 7: 300, 8: 350,9: 400, 10: 500}
var screen = 'home'
var old_screen = ''


var old_carefull_status = false
var old_income_status = false
var status_overlap = true

var scene_is_ready = 1

var old_day = 0

var current_message = -1
var status_message = ''
var time_message = 0

func _ready() -> void:
	#get_tree().connect("tree_changed", self._on_tree_changed)
	update_init()
	#update_ui()
	#update_screen()
	
	

func _process(delta: float) -> void:
	update_always(delta)
	
	
	if old_carefull_status != Data.carefull_status and status_overlap:
		await update_carefull()
		old_carefull_status = Data.carefull_status
	
	if old_income_status != Data.income_status and status_overlap:
		await update_income()
		old_income_status = Data.income_status
	
	if old_screen != Data.screen:
		update_screen()
		old_screen = Data.screen

func init_sequence(delta):
	update_ui()
	update_always(delta)
	
	#print(time_init)
	#if time_init > 0.2:
	if init_steps >= 2:
		#$Background_dummy.hide()
		run = true
	init_steps += 1

func update_init():
	$Carefull.hide()
	$Income.hide()
	$Transicion.show()
	$AnimationPlayer.play('transition_out')
	await $AnimationPlayer.animation_finished
	$Transicion.hide()

func update_screen():
	#if Data.screen not in ['house_market','house_own']:
	$AudioStreamPlayer.play()
	
	$Transicion_screen.show()
	$AnimationPlayer.play('transition_screen_in')
	await $AnimationPlayer.animation_finished
	
	for child in $Body/CenterBody.get_children():
		child.hide()
	if Data.screen == 'home':
		$Body/CenterBody/Home.show()
	if Data.screen == 'study':
		$Body/CenterBody/Study.show()
	if Data.screen == 'houses_dashboard':
		$Body/CenterBody/HousesDashboard.show()
	if Data.screen in ['market_houses','own_houses']:
		$Body/CenterBody/Houses.show()
		$Body/CenterBody/Houses/Item_container.show()
		$Body/CenterBody/Houses/House.hide()
	if Data.screen in ['house_market','house_own']:
		$Body/CenterBody/Houses.show()
		$Body/CenterBody/Houses/Item_container.hide()
		$Body/CenterBody/Houses/House.show()
	if Data.screen == 'business_dashboard':
		$Body/CenterBody/BusinessDashboard.show()
	if Data.screen == 'work':
		$Body/CenterBody/Work.show()
	if Data.screen == 'message':
		$Body/CenterBody/Messages.show()
		
	$AnimationPlayer.play('transition_screen_out')
	await $AnimationPlayer.animation_finished
	$Transicion_screen.hide()
		
func update_ui() -> void:
	pass
	'''$Body/CenterBody/Home/user_data/card/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	$Body/Menu/Menu_container/Principal/Realshop_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	
	$Body/CenterBody/Home/user_data/card/Player_data/Name_section/name_lbl.text = Data.Game.Player.Name + " " + Data.Game.Player.Surname
	$Body/CenterBody/Home/user_data/card/Player_data/Work_section/work_lbl.text = Data.Game.Player.Work
	$Body/CenterBody/Home/user_data/card/Player_data/Year_section/age_lbl.text = str(Data.Game.Player.YearsOld) + " " + tr("years_")
	
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_prgbr.value = Data.Game.Player.ProgressStudy
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/study_pic.texture = load(Data.Game.Player.StudyIcon)
	
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_photo.texture = load('res://Assets/Images/People/no_friends.png')
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_lbl.text = 'no_friends_'
	var high_value = 0
	for friend in Data.Game.Player.Friends:
		if Data.Game.Player.Friends[friend]['Friend'] >= high_value and Data.Game.Player.Friends[friend]['Friend'] > 100:
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_photo.texture = load(Data.Database.Photos[Data.Game.People[friend].ProfilePic]['Path'])
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_lbl.text = Data.Game.People[friend].Fullname
			high_value = Data.Game.Player.Friends[friend]['Friend']
	
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_photo.texture = load("res://Assets/Images/Houses/park1024.png")
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_lbl.text = "no_house"
	for house in Data.Game.Player.Houses:
		if Data.Game.Player.Houses[house]["CurrentHome"] == 1:
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_photo.texture = load(Data.Game.Player.Houses[house]["Path"])
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_lbl.text = Data.Game.Player.Houses[house]["Name"]
	'''
	
	#$Body/Menu/Menu_container/Principal/Clock/Clock_btn.text = "+" + str(int(Data.Game.AutomaticHours)) + "h"
	

func update_carefull(overlap = true):
	if overlap:
		status_overlap = false
		if Data.income_status == true:
			Data.income_status = false
			await update_income(false)
			old_income_status = Data.income_status
		status_overlap = true
	if Data.carefull_status:
		$Carefull.show()
		$AnimationPlayer.play('carefull_in')
		await $AnimationPlayer.animation_finished
	else:
		$AnimationPlayer.play('carefull_out')
		await $AnimationPlayer.animation_finished
		$Carefull.hide()

func update_income(overlap = true):
	if overlap:
		status_overlap = false
		if Data.carefull_status == true:
			Data.carefull_status = false
			await update_carefull(false)
			old_carefull_status = Data.carefull_status
		status_overlap = true
	if Data.income_status:
		$Income.show()
		$AnimationPlayer.play('income_in')
		await $AnimationPlayer.animation_finished
	else:
		$AnimationPlayer.play('income_out')
		await $AnimationPlayer.animation_finished
		$Income.hide()

func update_always(delta) -> void:
	if current_message == -1:
		for message in Data.Game.Messages:
			if Data.Game.Messages[message]['appear'] == true:
				current_message = message
				status_message = 'init'
				break
	if status_message == 'init':
		$Message/AudioStreamPlayer.play()
		$Message/HBoxContainer/Panel/state_mind_img.texture = load(Data.Game.Messages[current_message]['icon'])
		$Message/HBoxContainer/indicators_section/title_lbl.text = tr(Data.Game.Messages[current_message]['area'])
		$Message/HBoxContainer/indicators_section/body_lbl.text = tr(Data.Game.Messages[current_message]['message']) + ': \n     ' + tr(Data.Game.Messages[current_message]['item'])
		$Message/ProgressBar.value = 0
		$AnimationPlayer.play('message_in')
		time_message = 0
		status_message = 'wait_init'
	if status_message == 'wait_init':
		time_message += delta
		if time_message > 1:
			time_message = 0
			status_message = 'stay'
	if status_message == 'stay':
		time_message += delta
		if time_message > 5:
			time_message = 0
			status_message = 'out'
		else:
			$Message/ProgressBar.value = ((time_message / 5) * 100)
	if status_message == 'out':
		$AnimationPlayer.play('message_out')
		time_message = 0
		status_message = 'wait_out'
	if status_message == 'wait_out':
		time_message += delta
		if time_message > 1:
			Data.Game.Messages[current_message]['appear'] = false
			current_message = -1
			status_message = ''
	
	if old_day != Data.dictdate['day']:
		#if Data.screen == 'market_houses' or Data.screen == 'own_houses':
		#	update_screen()
		old_day = Data.dictdate['day']
		
	pass
	'''$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_prgbr.value = Data.Game.Player.ProgressStudy
	var learn_progress = 0
	if Data.Database.Work[Data.Game.Player.Work]['Level'] == 10:
		learn_progress = int((Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Data.Game.Player.Work]['Parent']]['Skill']] / 500)*100)
	else:
		learn_progress = int((Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Data.Game.Player.Work]['Parent']]['Skill']] / level_next_work[Data.Database.Work[Data.Game.Player.Work]['Level'] + 1])*100)
	if learn_progress >= 100 or Data.Database.Work[Data.Game.Player.Work]['Level'] == 0:
		learn_progress = 0
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Work_pnl/Work_prgbr.value = learn_progress
	
	time_notification += delta
	notification_icon()
	
	
	 '''
	
	
func load_data():
	if notification_status == "+":
		notification_btn = {"Business":$Body/Menu/Menu_container/Secondary/Business_pnl/Business_btn,
							"Study":$Body/Menu/Menu_container/Business_principal/Education_pnl/Education_btn,
							"Work":$Body/Menu/Menu_container/Business_principal/Work_pnl/Work_btn}
		notification_status = "down"

func notification_icon():
	for item in notification_btn:
		if Data.notification_dict[item] == 1:
			if notification_status == "up":
				notification_btn[item].material.set_shader_parameter("outline_color",Color("00b2ff"))
			else:
				notification_btn[item].material.set_shader_parameter("outline_color",Color("ffffff"))
		else:
			notification_btn[item].material.set_shader_parameter("outline_color",Color("ffffff"))
	if time_notification >= 0.5:
		time_notification = 0
		if notification_status == "up":
			notification_status = "down"
		else:
			notification_status = "up"

	
func _on_clock_btn_pressed() -> void:
	Data.clic_manual()





func _on_study_btn_pressed() -> void:
	screen = 'study'
	update_screen()


func _on_work_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/business.tscn')


func _on_bank_btn_pressed() -> void:
	pass # Replace with function body.

func _on_shop_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/shop.tscn')
	
func _on_upgrades_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/shop.tscn')


func _on_to_do_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Game/activities.tscn")

func _on_achievements_btn_pressed() -> void:
	pass # Replace with function body.

func _on_friend_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/people.tscn')

func _on_house_own_btn_pressed() -> void:
	#get_tree().change_scene_to_file('res://Scenes/Game/houses.tscn')
	screen = 'houses_dashboard'
	update_screen()
	
func _on_car_btn_pressed() -> void:
	pass # Replace with function body.

func _on_collection_btn_pressed() -> void:
	pass # Replace with function body.
