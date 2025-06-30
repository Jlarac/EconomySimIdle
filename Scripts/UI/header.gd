extends Control

var happy_stat = '+'
var old_stat = ''
var selected_card = '+'
var old_card = ''
var health_stat = '+'
var old_health = ''
var happy_images = {'sad':'res://Assets/Images/Header/sad.png','neutral':'res://Assets/Images/Header/neutral.png','bad':'res://Assets/Images/Header/bad.png','mask':'res://Assets/Images/Header/mask.png','hot':'res://Assets/Images/Header/hot.png','head':'res://Assets/Images/Header/head.png',
					'happy':'res://Assets/Images/Header/happy.png','fun':'res://Assets/Images/Header/fun.png'}
var health_images = {'sick':'res://Assets/Images/Header/sick.png','good':'res://Assets/Images/Header/health.png'}
var card_colors = {"upgrade_card_0": {"Fill":'#2577ff',"Border": '#1114c2'},"upgrade_card_1": {"Fill":'#13848a',"Border": '#003454'},"upgrade_card_2": {"Fill":'#8757f7',"Border": '#7500ad'},
					"upgrade_card_3": {"Fill":'#7a8084',"Border": '#464b4a'},"upgrade_card_4": {"Fill":'#ac710a',"Border": '#7b4100'},"upgrade_card_5": {"Fill":'#262626',"Border": '#000000'}}
var health_red_bar = preload('res://Resources/Themes/health_red_bar.tres')
var health_green_bar = preload('res://Resources/Themes/health_green_bar.tres')
var health_blue_bar = preload('res://Resources/Themes/health_blue_bar.tres')

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Data.run and Data.screen != 'create':
		update_ui()

func update_ui():
	var health_label = ''
	health_stat = 'good'
	
	if Data.Game.Player.DiseaseName == '':
		$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/health_progress.add_theme_stylebox_override("fill",health_red_bar)
		health_label = str(Data.Game.Player.Health)
		
	if Data.Game.Player.Immunity != 0:
		$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/health_progress.add_theme_stylebox_override("fill",health_blue_bar)
		health_label = str(Data.Game.Player.Health) + ' (' + str(Data.Game.Player.Immunity) + '/d)'
		
	if Data.Game.Player.Happy < 26:
		happy_stat = 'sad'
	elif Data.Game.Player.Happy < 51:
		happy_stat = 'neutral'
	elif Data.Game.Player.Happy < 76:
		happy_stat = 'happy'
	elif Data.Game.Player.Happy < 101:
		happy_stat = 'fun'
		
	if Data.Game.Player.DiseaseName != '':
		health_stat = Data.Game.Player.DiseaseName
		$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/health_progress.add_theme_stylebox_override("fill",health_green_bar)
		if Data.Game.Player.DiseaseValue < 26:
			happy_stat = 'mask'
		elif Data.Game.Player.DiseaseValue < 51:
			happy_stat = 'hot'
		elif Data.Game.Player.DiseaseValue < 76:
			happy_stat = 'bad'
		elif Data.Game.Player.DiseaseValue < 101:
			happy_stat = 'head'
		health_label = str(Data.Game.Player.Health) + ' (' + str(Data.Game.Player.DiseaseValue) + '%)'
	
	if old_stat != happy_stat:
		$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2/TextureRect.texture = load(happy_images[happy_stat])
		old_stat = happy_stat
	if old_health != health_stat:
		$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/TextureRect.texture = load(Data.Database.Sicks[health_stat]['Path'])
		old_health = health_stat
	
	var sign_health = ''
	if Data.Game.Player.HealthPerDay >= 0:
		sign_health = '+'
	var sign_happy = ''
	if Data.Game.Player.HappyPerDay >= 0:
		sign_happy = '+'
		
	$HBoxContainer2/date_pnl/date_lbl.text = Data.Game.CurrentDate
	$HBoxContainer2/date_pnl/clock_lbl.text = Data.Game.CurrentHour
	
	$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/health_progress/health_lbl.text = sign_health + str(Data.Game.Player.HealthPerDay) #+ '%'
	$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2/happy_progress/happy_lbl.text = sign_happy + str(Data.Game.Player.HappyPerDay) #+ '%'
	
	$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/health_progress.set_value_no_signal(Data.Game.Player.Health)
	$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2/happy_progress.set_value_no_signal(Data.Game.Player.Happy)
	$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/health_progress/sick_progress.set_value_no_signal(Data.Game.Player.DiseaseValue)
	
	$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel/health_progress/health_lbl2.text = health_label #+ '%'
	$HBoxContainer2/HBoxContainer/VBoxContainer2/Panel2/happy_progress/happy_lbl2.text = str(Data.Game.Player.Happy) #+ '%'

	$HBoxContainer2/card/money_lbl.text = Data.format_money(Data.Game.Player.Money)
	$HBoxContainer2/card/income_lbl.text = Data.format_money(Data.Game.Player.MoneyPerDay) + ' /d '
	
	for card_tier in card_colors.keys():
		if card_tier in Data.Game.Player.OwnUpgrades:
			selected_card = card_tier
	if old_card != selected_card:
		var panels = [$HBoxContainer2/card,$HBoxContainer2/card/card2,$HBoxContainer2/card/card3,$HBoxContainer2/card/card4]
		for card_pnl in panels:
			var theme_card = card_pnl.get_theme_stylebox('panel').duplicate()
			theme_card.bg_color = card_colors[selected_card]["Fill"]
			theme_card.border_color = card_colors[selected_card]["Border"]
			card_pnl.add_theme_stylebox_override('panel', theme_card)
		old_card = selected_card

func update_always():
	pass

func _on_bank_pressed() -> void:
	Data.income_status = !Data.income_status
	#if Data.carefull_status == true:
	#	Data.carefull_status = false

func _on_carefull_pressed() -> void:
	Data.carefull_status = !Data.carefull_status
	#if Data.income_status == true:
	#	Data.income_status = false
