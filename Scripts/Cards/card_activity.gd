extends Control

var Id
var status = "+"
var oldstatus = "-"
var kind = 'other'
var kind_name = ''
var kind_value = 0
var indicator_friend = false
var time_friend = 0

func _ready() -> void:
	update_init()

func _process(delta: float) -> void:
	update_always(delta)
	if status != oldstatus:
		update_ui()
		oldstatus = status

func update_init():
	$Panel/new_friend.hide()
	for item in Data.Game.Player.Upgrades:
		if Id in Data.Game.Player.Upgrades[item]['Name']:
			kind = 'home'
			kind_name = Data.Game.Player.Upgrades[item]['Name']
			kind_value = Data.Game.Player.Upgrades[item]['Value']
			$Panel/VBoxContainer/HBoxContainer/Panel/image.texture = load(Data.Database.Upgrades[kind_name]["Path"])
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/HBoxContainer/skill_img.texture = load(Data.Database.Skills[Data.Database.Activities[Id]['Skill']])
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/HBoxContainer/ProgressSkill.value = Data.Game.Player.Skills[Data.Database.Activities[Id]['Skill']]
	if kind == 'other':
		$Panel/VBoxContainer/HBoxContainer/Panel/image.texture = load(Data.Database.Activities[Id]["Path"])
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/Panel3/HBoxContainer.hide()
	
	$Panel/VBoxContainer/Panel/title_lbl.text = Id
	
func update_ui():
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.hide()
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel2.hide()
	
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.text = "accept_btn"
	
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel/HBoxContainer/health_lbl.text = str(int(Data.Database.Activities[Id]["Health"]))
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel4/HBoxContainer/happy_lbl.text = str(int(Data.Database.Activities[Id]["Happy"]))
	
	$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer/Panel2/HBoxContainer/cost_lbl.text = Data.format_money(Data.Database.Activities[Id]["Price"])
	
	if status == "Available":
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.show()
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.hide()
	if status == "Not":
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/action_btn.hide()
		$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.show()


func update_always(delta):
	if indicator_friend == true:
		time_friend += delta
		$Panel/new_friend.show()
		if time_friend > 1:
			time_friend = 0
			indicator_friend = false
			$Panel/new_friend.hide()
	
	if Id in Data.Game.Player.ActivityTimes:
		if Data.Game.Date < Data.Game.Player.ActivityTimes[Id]:
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar.value = (1-( float(Data.Game.Player.ActivityTimes[Id] - Data.Game.Date ) / float(Data.Database.Activities[Id]["Time"] ))) * 100
			var time_left = Time.get_datetime_dict_from_unix_time(Data.Game.Player.ActivityTimes[Id] - Data.Game.Date)
			var days_diff = int((Data.Game.Player.ActivityTimes[Id] - Data.Game.Date) / 86400)
			$Panel/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer3/Panel/ProgressBar/Label.text = str(days_diff) + ':' + Data.format_hour(time_left['hour']) + ':' + Data.format_hour(time_left['minute'])
			status = "Not"
		if Data.Game.Date > Data.Game.Player.ActivityTimes[Id]:
			Data.Game.Player.ActivityTimes.erase(Id)
	else:
		status = "Available"

func _on_action_btn_pressed() -> void:
	#print(Id)
	if Id not in Data.Game.Player.ActivityTimes:
		if Data.Game.Player.buy_something(Data.Database.Activities[Id]["Price"]):
			#print(Id)
			Data.Game.Player.ActivityTimes[Id] = int(Data.Game.Date +  Data.Database.Activities[Id]["Time"]) #{"Init":Data.Game.Date,"End":Data.Game.Date + (3600 * Data.Database.Activities[Id]["Time"])}
			Data.Game.Player.increase_health(Data.Database.Activities[Id]["Health"])
			Data.Game.Player.increase_happy(Data.Database.Activities[Id]["Happy"])
			#print(Data.Game.Player.ActivityTimes)
			if Id == 'doctor':
				Data.Game.Player.DiseaseValue -= 50
			if Id == 'hospital':
				Data.Game.Player.DiseaseValue -= 101
			if kind == 'home':
				if Data.Database.Activities[Id]['Skill'] not in Data.Game.Player.Skills:
					Data.Game.Player.Skills[Data.Database.Activities[Id]['Skill']] = 0
				else:
					Data.Game.Player.Skills[Data.Database.Activities[Id]['Skill']] += (kind_value * Data.Game.Player.SkillLearn)
				#Data.Game.Player.Skills[]
				print(Data.Game.Player.Skills[Data.Database.Activities[Id]['Skill']])
			Data.Game.Player.verify_health_happy()
			if Data.probability(Data.Database.Activities[Id]['Meet'] * Data.Game.Player.SkillFriend):
				print(Data.Game.Player.meet_someone())
				print('MEET SOMEONE')
				indicator_friend = true
			#status = "Not"
		#Data.update_lbl = true
		#Data.update_screen = true

func _on_onetime_btn_pressed() -> void:
	pass # Replace with function body.
