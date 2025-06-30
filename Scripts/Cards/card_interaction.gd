extends Control

var Id
var contact = ''
var status = "available"
var oldstatus = "-"
signal interaction_done(Id)

func _ready() -> void:
	interaction_done.emit()
	update_init()

func _process(_delta: float) -> void:
	update_always()
	if status != oldstatus:
		update_ui()
		oldstatus = status

func update_init():
	$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_icon.texture = load(Data.Database.Interactions[Id]['path'])
	$Panel/HBoxContainer2/check_pnl/HBoxContainer/action_icon.texture = load(Data.Database.Interactions[Id]['path'])
	$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_lbl.text = tr(Id + '_')

func update_ui():
	$Panel/HBoxContainer2/check_pnl.hide()
	$Panel/HBoxContainer2/action_pnl.hide()
	$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_progress.hide()
	$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_btn.hide()
	
	if status == 'available':
		$Panel/HBoxContainer2/action_pnl.show()
		$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_btn.show()
	if status == 'not':
		$Panel/HBoxContainer2/action_pnl.show()
		$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_progress.show()
	if status == 'validation':
		$Panel/HBoxContainer2/check_pnl.show()

func update_always():
	if status != 'validation':
		if contact in Data.Game.Player.FriendsTimes:
			if Id in Data.Game.Player.FriendsTimes[contact]:
				if Data.Game.Date < Data.Game.Player.FriendsTimes[contact][Id]:
					$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_progress.value = (1-( float(Data.Game.Player.FriendsTimes[contact][Id] - Data.Game.Date ) / float(Data.Database.Interactions[Id]['time'] ))) * 100
					var time_left = Time.get_datetime_dict_from_unix_time(Data.Game.Player.FriendsTimes[contact][Id] - Data.Game.Date)
					var days_diff = int((Data.Game.Player.FriendsTimes[contact][Id] - Data.Game.Date) / 86400)
					$Panel/HBoxContainer2/action_pnl/HBoxContainer/action_progress/Label.text = str(days_diff) + ':' + Data.format_hour(time_left['hour']) + ':' + Data.format_hour(time_left['minute'])
					status = 'not'
				if Data.Game.Date > Data.Game.Player.FriendsTimes[contact][Id]:
					Data.Game.Player.FriendsTimes[contact].erase(Id)
			else:
				status = 'available'
		else:
				status = 'available'
		
		
func _on_action_btn_pressed() -> void:
	if Data.Database.Interactions[Id]['validation'] == 0:
		_on_accept_btn_pressed()
	else:
		status = 'validation'

func _on_accept_btn_pressed() -> void:
	var statemind_items = {'angry':0.5,'neutral':1,'happy':1.25,'fun':1.5,'love':2,'sad':3}
	#print(contact)
	#print(Data.Game.People[contact].StateMind)
	var modifier = statemind_items[Data.Game.People[contact].StateMind]
	if Id != 'speak' and Data.Game.People[contact].StateMind == 'sad':
		modifier = 0.2

	Data.Game.Player.Friends[contact]['Friend'] += (Data.Database.Interactions[Id]['friend'] * modifier * Data.Game.Player.SkillFriend)
	Data.Game.Player.Friends[contact]['Love'] += (Data.Database.Interactions[Id]['love'] * modifier * Data.Game.Player.SkillLove)
	if contact not in Data.Game.Player.FriendsTimes:
		Data.Game.Player.FriendsTimes[contact] = {}
	Data.Game.Player.FriendsTimes[contact][Id] = Data.Game.Date + (Data.Database.Interactions[Id]['time'])
	emit_signal("interaction_done",Id)
	status = 'not'

func _on_cancel_btn_pressed() -> void:
	status = 'available'
