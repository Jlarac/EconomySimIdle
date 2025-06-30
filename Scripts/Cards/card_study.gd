extends Control

var Id
var status = "+"
var oldstatus = "-"
var progress_yellow = preload('res://Resources/Themes/progress_upgrades.tres')
var progress_green = preload('res://Resources/Themes/progress_menu_green.tres')

func _ready() -> void:
	update_init()

func _process(_delta: float) -> void:
	if status != oldstatus:
		update_ui()
		oldstatus = status
	update_always()

func update_init() -> void:
	$Panel/VBoxContainer/Panel/title_lbl.text = Data.Database.Study[Id]["Name"]
	$Panel/VBoxContainer/HBoxContainer/Panel/image.texture = load(Data.Database.Study[Id]["Path"])
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(-Data.Database.Study[Id]["Cost"]) + " /d"
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer2/Panel3/HBoxContainer/happy_lbl.text = str(Data.Database.Study[Id]["Happy"]) + " /d"
	#$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/desc_lbl.text = tr('unlock_') + ' ' + tr('works_') + ': ' + Id
	
func update_ui() -> void:
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.disabled = false
	match status:
		'completed':
			if Id != 'basic':
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3.show()
				$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3/HBoxContainer/skill_img.texture = load(Data.Database.Skills[Data.Database.Study[Id]['Skill']])
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.add_theme_stylebox_override("fill",progress_green)
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.value = 100
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar/Label.text = "completed_"
		'progress':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3/HBoxContainer/skill_img.texture = load(Data.Database.Skills[Data.Database.Study[Id]['Skill']])
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.add_theme_stylebox_override("fill",progress_yellow)
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.show()
		'available':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.show()
			var days_diff = int(((Data.Game.Date + Data.Database.Study[Id]["Time"]) - Data.Game.Date) / 86400)
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.text = tr("accept_btn") + ": " + str(days_diff) + " "+tr("days_")

		'not_available':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.disabled = true
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.text = "not_available_"
		
		'need_seq':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.show()
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.disabled = true
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/action_btn.text = tr(Data.Database.Study[Data.Database.Study[Id]["Seq"]]["Name"])
			
func update_always() -> void:
	if Id in Data.Game.Player.StudySummary:
		if Data.Game.Date < Data.Game.Player.StudySummary[Id]:
			status = 'progress'
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar.value = Data.Game.Player.ProgressStudy #(Data.Game.Player.StudySummary[Id] / Data.Database.Study[Id]['Days']) * 100
			var time_left = Time.get_datetime_dict_from_unix_time(Data.Game.Player.StudySummary[Id] - Data.Game.Date)
			var days_diff = int((Data.Game.Player.StudySummary[Id] - Data.Game.Date) / 86400)
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/VBoxContainer/Panel/ProgressBar/Label.text = str(days_diff) + ':' + Data.format_hour(time_left['hour']) + ':' + Data.format_hour(time_left['minute'])
	else:
		status = 'available'
		if len(Data.Game.Player.StudySummary) > 0:
			status = 'not_available'
			
	if Id in Data.Game.Player.StudyCompleted:
		status = 'completed'
		
	if Data.Database.Study[Id]["Seq"] != '':
		if Data.Database.Study[Id]["Seq"] not in Data.Game.Player.StudyCompleted:
			status = 'need_seq'
			
	if status == 'progress' or status == 'completed':
		if Id != 'basic':
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel3/HBoxContainer/ProgressSkill.value = Data.Game.Player.Skills[Data.Database.Study[Id]['Skill']]

func _on_action_btn_pressed() -> void:
	match status:
		'completed':
			pass
		'progress':
			pass
		'available':
			Data.Game.Player.StudySummary[Id] = int(Data.Game.Date +  Data.Database.Study[Id]['Time'])
			if Data.Database.Study[Id]["Skill"] not in Data.Game.Player.Skills:
				Data.Game.Player.Skills[Data.Database.Study[Id]["Skill"]] = 0
		'not_available':
			pass
	Data.Game.Player.check_variables()
	$Panel/AudioStreamPlayer.play()
