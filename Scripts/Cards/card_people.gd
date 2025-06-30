extends Control

var Id
var status = "basic"
var oldstatus = "-"
var old_len_secrets = 0
var old_relation = ''
var green_indicator = preload("res://Resources/Themes/progress_menu_green.tres")
var red_indicator = preload("res://Resources/Themes/progress_menu_red.tres")
var relation_levels = {-50: 'detestable',0: 'unknown',100: 'known',300: 'friend',600: 'bestfriend'}
signal select_contact(Id)

func _ready() -> void:
	select_contact.emit()
	update_init()

func _process(_delta: float) -> void:
	update_always()
	if status != oldstatus:
		update_ui()
		oldstatus = status

func update_init():
	$Panel/HBoxContainer/Panel/TextureRectRounded.texture = load(Data.Database.Photos[Data.Game.People[Id].ProfilePic]['Path'])
	$Panel/HBoxContainer/data_section/name_section/name_lbl.text = Data.Game.People[Id].Fullname

func update_ui():
	set_relation()
	$Panel/HBoxContainer/data_section/HBoxContainer.hide()
	$Panel/HBoxContainer/data_section/HBoxContainer/Panel.hide()
	$Panel/HBoxContainer/data_section/HBoxContainer/Panel2.hide()
	$Panel/HBoxContainer/data_section/HBoxContainer/indicators_section/work_section2.hide()
	$Panel/HBoxContainer/data_section/HBoxContainer/indicators_section/work_section3.hide()
	$Panel/HBoxContainer/data_section/HBoxContainer.show()
	$Panel/HBoxContainer/data_section/HBoxContainer/Panel2.show()
	$Panel/HBoxContainer/data_section/HBoxContainer/indicators_section/work_section2.show()
	
	if 'mind' in Data.Game.Player.FriendsSecrets[Id]:
		$Panel/HBoxContainer/data_section/HBoxContainer/Panel.show()
	if 'love' in Data.Game.Player.FriendsSecrets[Id]:
		$Panel/HBoxContainer/data_section/HBoxContainer/indicators_section/work_section3.show()
		
	$Panel/HBoxContainer/data_section/HBoxContainer/Panel/state_mind_img.texture = load('res://Assets/Images/State_mind/' + Data.Game.People[Id].StateMind + '.png')
	$Panel/HBoxContainer/data_section/HBoxContainer/indicators_section/work_section2/friend_img.texture = load(Data.Database.Relations[Data.Game.Player.Friends[Id]['Relationship']][0])
	$Panel/HBoxContainer/data_section/HBoxContainer/indicators_section/work_section2/friend_progress.value = Data.Game.Player.Friends[Id]['Friend']
	$Panel/HBoxContainer/data_section/HBoxContainer/indicators_section/work_section3/chemistry_progress.value = Data.Game.Player.Friends[Id]['Love']
	

func update_always():
	if len(Data.Game.Player.FriendsSecrets[Id]) != old_len_secrets:
		update_ui()
		old_len_secrets = len(Data.Game.Player.FriendsSecrets[Id])
	if Data.Game.Player.Friends[Id]['Relationship'] != old_relation:
		update_ui()
		old_relation = Data.Game.Player.Friends[Id]['Relationship']

func _on_call_friend_btn_pressed() -> void:
	emit_signal("select_contact",Id)

func set_relation():
	var relation = ''
	for limit in relation_levels.keys():
		if Data.Game.Player.Friends[Id]['Relationship'] not in ['partner','engagedpartner','married','lover','break']:
			if Data.Game.Player.Friends[Id]['Friend'] <= limit:
				Data.Game.Player.Friends[Id]['Relationship'] = relation_levels[limit]
				break
