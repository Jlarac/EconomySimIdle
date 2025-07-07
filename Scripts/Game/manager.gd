extends Control

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
#var screen = 'home'
var old_screen = 'home'


var old_carefull_status = false
var old_income_status = false
var status_overlap = true

var scene_is_ready = 1

var old_day = 0

var current_message = -1
var status_message = ''
var time_message = 0

var tutorial_steps = 0
var time_tutorial = 0

# Variables del Tutorial
var tutorial_step_index: int = 0
var tutorial_running: bool = false
var tutorial_awaiting_input: bool = false

var init_process = false
var init_step = 0

func _ready() -> void:
	update_init()

func _process(delta: float) -> void:
	if run:
		if !Data.Game.Player.Tutorial:
			update_always(delta)
			
			if old_carefull_status != Data.carefull_status and status_overlap:
				await update_carefull()
				old_carefull_status = Data.carefull_status
			
			if old_income_status != Data.income_status and status_overlap:
				await update_income()
				old_income_status = Data.income_status
			
			if old_screen != Data.screen:
				print(old_screen , ' - ', Data.screen)
				update_screen()
				old_screen = Data.screen
	if init_process:
		init_step += 1
		match init_step:
			11:
				$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel.show()
			22:
				$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2.show()
			33:
				$Body/Header/HBoxContainer2/date_pnl.show()
			44:
				$Body/Header/HBoxContainer2/card.show()
			55:
				$Body/CenterBody/Home/user_data/card/Player_data.show()
			66:
				$Body/CenterBody/Home/user_data/card/user_photo.show()
			77:
				$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Img_pnl/TextureRect.show()
			88:
				$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl/Label.show()
			99:
				$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl2/ProgressBar.show()
			100:
				$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl3/Label.show()
			110:
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_prgbr.show()
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/study_pic.show()
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_btn.show()
			120:
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Work_pnl/Work_prgbr.show()
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Work_pnl/Work_btn.show()
			130:
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Bank_pnl/Bank_prgbr.show()
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Bank_pnl/Bank_btn.show()
			140:
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Shop_pnl/Shop_btn.show()
			150:
				$Body/CenterBody/Home/submenu/card/HBoxContainer/To_do_pnl/To_do_btn.show()
			160:
				$Body/CenterBody/Home/submenu/card/HBoxContainer/Achievements_pnl/Achievements_btn.show()
			170:
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_photo.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/Friend_btn.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_lbl.show()
			180:
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_photo.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/House_btn.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_lbl.show()
			190:
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/house_photo.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/Car_btn.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/car_lbl.show()
			200:
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/house_photo.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/Collection_btn.show()
				$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/collection_lbl.show()
				
			210:
				$Body/Menu/Menu_container/Principal/Realshop_pnl.show()
			220:
				$Body/Menu/Menu_container/Principal/email_pnl.show()
			230:
				$Body/Menu/Menu_container/Principal/Clock.show()
			240:
				$Body/Menu/Menu_container/Principal/Multiplayer_pnl.show()
			250:
				$Body/Menu/Menu_container/Principal/Settings_pnl.show()
			260:
				init_process = false
				run = true

func update_init():
	hide_buttons_tutorial()
	hide_background_tutorial()
	
	$Carefull.hide()
	$Income.hide()
	$Tutorial.hide()
	$Transicion.show()
	$AnimationPlayer.play('transition_out')
	await $AnimationPlayer.animation_finished
	$Transicion.hide()
	
	
	if Data.Game.Player.Tutorial:
		start_tutorial()
	else:
		start_init()

func update_screen():
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

func start_tutorial():
	if tutorial_running: return
	tutorial_running = true
	tutorial_step_index = 0
	print("DEBUG: Tutorial Iniciado!")
	await get_tree().process_frame
	next_tutorial_step()

func start_init():
	#await get_tree().process_frame
	show_background_tutorial()
	
	$AnimationPlayer.play('init_in')
	await $AnimationPlayer.animation_finished
			
	init_step = 0
	init_process = true
	
	#next_init_step()
	
func wait_func():
	$AnimationPlayer.play("time_await")
	await $AnimationPlayer.animation_finished

func hide_buttons_tutorial():
	
	$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel.hide()
	$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2.hide()
	
	$Body/Header/HBoxContainer2/date_pnl.hide()
	
	$Body/Header/HBoxContainer2/card.hide()
	
	
	
	$Body/CenterBody/Home/user_data/card/Player_data.hide()
	$Body/CenterBody/Home/user_data/card/user_photo.hide()
	
	$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Img_pnl/TextureRect.hide()
	$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl/Label.hide()
	$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl2/ProgressBar.hide()
	$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl3/Label.hide()
	
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_prgbr.hide()
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/study_pic.hide()
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_btn.hide()
	
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Work_pnl/Work_prgbr.hide()
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Work_pnl/Work_btn.hide()
	
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Bank_pnl/Bank_prgbr.hide()
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Bank_pnl/Bank_btn.hide()
	
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Shop_pnl/Shop_btn.hide()
	
	$Body/CenterBody/Home/submenu/card/HBoxContainer/To_do_pnl/To_do_btn.hide()
	
	$Body/CenterBody/Home/submenu/card/HBoxContainer/Achievements_pnl/Achievements_btn.hide()
	
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_photo.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/Friend_btn.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_lbl.hide()
	
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_photo.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/House_btn.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_lbl.hide()
	
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/house_photo.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/Car_btn.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/car_lbl.hide()
	
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/house_photo.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/Collection_btn.hide()
	$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/collection_lbl.hide()
	
	
	$Body/Menu/Menu_container/Principal/Realshop_pnl.hide()
	$Body/Menu/Menu_container/Principal/email_pnl.hide()
	$Body/Menu/Menu_container/Principal/Clock.hide()
	$Body/Menu/Menu_container/Principal/Multiplayer_pnl.hide()
	$Body/Menu/Menu_container/Principal/Settings_pnl.hide()

func hide_background_tutorial():
	$Body/Header.hide()
	
	$Body/CenterBody/Home/user_data/card/Panel.hide()
	
	$Body/CenterBody/Home/progress_steps/card.hide()
	
	$Body/CenterBody/Home/submenu/card.hide()
	
	$Body/CenterBody/Home/own_card_container/card.hide()
	
	$Body/Menu/Panel2.hide()
	
func show_background_tutorial():
	$Body/Header.show()
	
	$Body/CenterBody/Home/user_data/card/Panel.show()
	
	$Body/CenterBody/Home/progress_steps/card.show()
	
	$Body/CenterBody/Home/submenu/card.show()
	
	$Body/CenterBody/Home/own_card_container/card.show()
	
	$Body/Menu/Panel2.show()

func update_tutorial():
	#hide_buttons_tutorial()
	#hide_background_tutorial()
	
	
	for i in $Tutorial/VBoxContainer/MarginContainer2/Panel.get_children():
		i.hide()
	
	
	$Tutorial.position = Vector2(40,1000)
	$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('addon_installing_')
	$Tutorial/VBoxContainer/MarginContainer2/Panel/init.show()
	await wait_func()
	
	for i in $Tutorial/VBoxContainer/MarginContainer2/Panel.get_children():
		i.hide()
	
	$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel.show()
	$Tutorial.position = Vector2(40,300)
	$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('health_desc_')
	$Tutorial/VBoxContainer/MarginContainer2/Panel/health.show()
	await wait_func()
	
	for i in $Tutorial/VBoxContainer/MarginContainer2/Panel.get_children():
		i.hide()
		
	$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2.show()
	$Tutorial.position = Vector2(40,300)
	$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('happy_desc_')
	$Tutorial/VBoxContainer/MarginContainer2/Panel/happy.show()
	await wait_func()
	
	for i in $Tutorial/VBoxContainer/MarginContainer2/Panel.get_children():
		i.hide()
		
	$Body/Header/HBoxContainer2/date_pnl.show()
	$Tutorial.position = Vector2(40,300)
	$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('date_desc_')
	$Tutorial/VBoxContainer/MarginContainer2/Panel/date.show()
	await wait_func()
	
	for i in $Tutorial/VBoxContainer/MarginContainer2/Panel.get_children():
		i.hide()
		
		
	$Body/Header/HBoxContainer2/card.show()
	$Tutorial.position = Vector2(40,300)
	$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('card_desc_')
	$Tutorial/VBoxContainer/MarginContainer2/Panel/card.show()
	await wait_func()
	
	for i in $Tutorial/VBoxContainer/MarginContainer2/Panel.get_children():
		i.hide()
	
	$Body/CenterBody/Home/user_data/card/Player_data.show()
	$Body/CenterBody/Home/user_data/card/user_photo.show()
	$Tutorial.position = Vector2(40,1200)
	$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('user_desc_')
	$Tutorial/VBoxContainer/MarginContainer2/Panel/user.show()
	await wait_func()
	
func next_tutorial_step():
	if not tutorial_running: return
	
	tutorial_step_index += 1
	print("DEBUG: Avanzando al Paso de Tutorial: " , tutorial_step_index)
	
	for i in $Tutorial/VBoxContainer/MarginContainer2/Panel.get_children():
		i.hide()
		
	match tutorial_step_index:
		1:
			show_background_tutorial()
			$Tutorial.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('addon_installing_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/init.show()
			$AnimationPlayer.play('tutorial_in')
			await $AnimationPlayer.animation_finished
			next_tutorial_step()
		2:
			$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('health_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/health.show()
			$AnimationPlayer.play('health_in')
			await $AnimationPlayer.animation_finished
			$Tutorial.position = Vector2(40,300)
			await wait_func()
			next_tutorial_step()
		3:
			$Body/Header/HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('happy_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/happy.show()
			$Tutorial.position = Vector2(40,300)
			await wait_func()
			next_tutorial_step()
		4:
			$Body/Header/HBoxContainer2/date_pnl.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('date_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/date.show()
			$Tutorial.position = Vector2(40,300)
			await wait_func()
			next_tutorial_step()
		5:
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('card_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/card.show()
			$Body/Header/HBoxContainer2/card.show()
			$Tutorial.position = Vector2(40,300)
			await wait_func()
			next_tutorial_step()
		6:
			$Body/CenterBody/Home/user_data/card/Player_data.show()
			$Body/CenterBody/Home/user_data/card/user_photo.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('user_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/user.show()
			$AnimationPlayer.play('user_in')
			await $AnimationPlayer.animation_finished
			$Tutorial.position = Vector2(40,800)
			await wait_func()
			next_tutorial_step()
		7:
			$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Img_pnl/TextureRect.show()
			$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl/Label.show()
			$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl2/ProgressBar.show()
			$Body/CenterBody/Home/progress_steps/card/HBoxContainer/Txt_pnl3/Label.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('progress_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/progress.show()
			$AnimationPlayer.play('progress_in')
			await $AnimationPlayer.animation_finished
			$Tutorial.position = Vector2(40,1000)
			await wait_func()
			next_tutorial_step()
		8:
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_prgbr.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/study_pic.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Study_pnl/Study_btn.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Work_pnl/Work_prgbr.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Work_pnl/Work_btn.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Bank_pnl/Bank_prgbr.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Bank_pnl/Bank_btn.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Shop_pnl/Shop_btn.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/To_do_pnl/To_do_btn.show()
			$Body/CenterBody/Home/submenu/card/HBoxContainer/Achievements_pnl/Achievements_btn.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('submenu_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/submenu.show()
			$AnimationPlayer.play('submenu_in')
			await $AnimationPlayer.animation_finished
			$Tutorial.position = Vector2(40,1200)
			await wait_func()
			next_tutorial_step()
		9:
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_photo.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/Friend_btn.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/Friend_pnl/friend_lbl.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_photo.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/House_btn.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer/House_pnl/house_lbl.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/house_photo.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/Car_btn.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Study_pnl/car_lbl.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/house_photo.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/Collection_btn.show()
			$Body/CenterBody/Home/own_card_container/card/Progress_container2/HBoxContainer2/Work_pnl/collection_lbl.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('own_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/own.show()
			$AnimationPlayer.play('own_in')
			await $AnimationPlayer.animation_finished
			$Tutorial.position = Vector2(40,1700)
			await wait_func()
			next_tutorial_step()
		
		10:
			$Body/Menu/Menu_container/Principal/Realshop_pnl.show()
			$Body/Menu/Menu_container/Principal/email_pnl.show()
			$Body/Menu/Menu_container/Principal/Clock.show()
			$Body/Menu/Menu_container/Principal/Multiplayer_pnl.show()
			$Body/Menu/Menu_container/Principal/Settings_pnl.show()
			$Tutorial/VBoxContainer/MarginContainer/Panel/HBoxContainer2/title_lbl.text = tr('menu_desc_')
			$Tutorial/VBoxContainer/MarginContainer2/Panel/menu.show()
			$AnimationPlayer.play('menu_in')
			await $AnimationPlayer.animation_finished
			$Tutorial.position = Vector2(40,1900)
			await wait_func()
			next_tutorial_step()
		11:
			print("DEBUG: Tutorial Finalizado!")
			$Tutorial.hide() # Oculta el panel de tutorial
			Data.Game.Player.Tutorial = false # Desactiva el modo tutorial
			run = true
	

func hide_all_game_elements_for_tutorial():
	#hide_background_tutorial()
	hide_buttons_tutorial()

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
		$MessagePlayer.play('message_in')
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
		$MessagePlayer.play('message_out')
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
	#screen = 'study'
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
	#screen = 'houses_dashboard'
	update_screen()
	
func _on_car_btn_pressed() -> void:
	pass # Replace with function body.

func _on_collection_btn_pressed() -> void:
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print('La animación ' + anim_name + ' ha terminado.')
	if anim_name == 'tutorial_in':
		tutorial_steps += 1
