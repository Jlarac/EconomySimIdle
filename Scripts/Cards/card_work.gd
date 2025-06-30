extends Control

var Id = 'no_work'
var Screen = 'work'
var old_screen = 'work_'
var status = "+"
var oldstatus = "-"
var progress_yellow = preload('res://Resources/Themes/progress_upgrades.tres')
var progress_green = preload('res://Resources/Themes/progress_menu_green.tres')
var button_green = preload('res://Resources/Themes/green_button.tres')
var button_red = preload('res://Resources/Themes/red_button.tres')
var level_next_work = {0:0, 1: 10, 2: 50,3: 100, 4: 150, 5: 200,6: 250, 7: 300, 8: 350,9: 400, 10: 500}
signal change_in_work_card(Id)

func _ready() -> void:
	update_init()

func _process(_delta: float) -> void:
	if status != oldstatus:
		update_ui()
		oldstatus = status
	if old_screen != Screen:
		$Button.hide()
		if Screen == 'business':
			$Button.show()
		old_screen = Screen
	update_always()

func update_init() -> void:
	$Panel/VBoxContainer/Panel/title_lbl.text = Data.Database.Work[Id]["Name"]
	$Panel/VBoxContainer/HBoxContainer/Panel/image.texture = load(Data.Database.Work[Id]["Path"])
	$Panel/Level_pnl/HBoxContainer/Level_lbl.text = str(Data.Database.Work[Id]["Level"])
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(Data.Database.Work[Id]["Salary"]) + " /d"
	#$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(-Data.Database.Work[Id]["Cost"]) + " /d"
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer2/Panel3/HBoxContainer/happy_lbl.text = str(Data.Database.Work[Id]["Happy"]) + " /d"
	#$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/desc_lbl.text = tr('unlock_') + ' ' + tr('works_') + ': ' + Id

func update_ui() -> void:
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.hide()
	#$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.disabled = false
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3/HBoxContainer/skill_img.texture = load(Data.Database.Skills[Data.Database.Study[Data.Database.Work[Id]['Parent']]['Skill']])
	match status:
		'current':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.show()
			#$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.value = Data.Game.Player.WorkSummary[Id]
			#$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar/Label.text = tr("current_") + ': ' + str(90 - Data.Game.Player.WorkSummary[Id]) + ' ' + tr('days_')
				
		'available':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.text = tr("select_")
		'not_available':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.disabled = true
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.text = "not_available_"
			
			
		'completed':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.disabled = true
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.add_theme_stylebox_override("disabled",button_green)
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.text = tr("current_")

func update_always() -> void:
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3/HBoxContainer/ProgressSkill.value = Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Id]['Parent']]['Skill']]
	if Data.Database.Work[Id]['Level'] <= 1:
		status = 'available'
	
	if Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Id]['Parent']]['Skill']] >= level_next_work[Data.Database.Work[Id]['Level']]:
		status = 'available'
	
	if Id == Data.Game.Player.Work:
		status = 'current'
	
	match status:
		'current':
			var learn_progress = 0
			var step_status = 0
			if Data.Database.Work[Id]['Level'] == 10:
				learn_progress = int((Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Id]['Parent']]['Skill']] / 500) * 100)
				step_status = (500 - Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Id]['Parent']]['Skill']])
			else:
				learn_progress = int((Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Id]['Parent']]['Skill']] / level_next_work[Data.Database.Work[Id]['Level'] + 1])*100)
				step_status = (level_next_work[Data.Database.Work[Id]['Level'] + 1] - Data.Game.Player.Skills[Data.Database.Study[Data.Database.Work[Id]['Parent']]['Skill']])
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar/Label.text = tr("current_") + ': ' + str(learn_progress) + '%'
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.value = learn_progress
			if step_status <= 0:
				status = 'completed'

func _on_action_btn_pressed() -> void:
	match status:
		'completed':
			pass
		'progress':
			pass
		'available':
			#Data.Game.Player.WorkSummary[Id] = int(Data.Game.Date +  Data.Database.Work[Id]['Time'])
			#if Data.Database.Work[Id]["Skill"] not in Data.Game.Player.Skills:
			#	Data.Game.Player.Skills[Data.Database.Work[Id]["Skill"]] = 0
			if Id not in Data.Game.Player.WorkSummary:
				Data.Game.Player.WorkSummary[Id] = 0
			Data.Game.Player.Work = Id
			print(Data.Game.Player.WorkSummary)
			#emit_signal("change_in_work_card",Id)
		'not_available':
			pass
	Data.Game.Player.check_variables()


func _on_button_pressed() -> void:
	Data.screen = 'work'
	Data.reset_carefull_income()
	print('kaseki')
