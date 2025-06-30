extends Control

var People_card = preload("res://Scenes/Cards/people_card.tscn")
var Interaction_card = preload("res://Scenes/Cards/interaction_card.tscn")
var selected_contact = ''
var old_selected_contact = '-'
var mind_change_status = {}
var relation = ''
var old_relation = ''
var relation_levels = {-50: 'detestable',0: 'unknown',100: 'known',300: 'friend',600: 'bestfriend'}

func _ready() -> void:
	$Body/Menu/Principal/home_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	for item in Data.Game.Player.Friends.keys():
		create_people(item)
	for item in Data.Database.Interactions:
		create_interaction(item)

func _process(_delta: float) -> void:
	update_always()
	if old_selected_contact != selected_contact:
		update_ui()
		old_selected_contact = selected_contact
	if old_relation != relation:
		update_ui()
		old_relation = relation

func update_ui():
	$Body/Shop.hide()
	$Body/Profile.hide()
	$Body/Menu/Principal/contacts_pnl/selected_pnl.hide()
	$Body/Menu/Principal/contact_pnl/selected_pnl.hide()
	$Body/Menu/Principal/fav1_pnl/selected_pnl.hide()
	$Body/Menu/Principal/fav2_pnl/selected_pnl.hide()
	update_favs()
			
	if selected_contact == '':
		$Body/Shop.show()
		$Body/Menu/Principal/contacts_pnl/selected_pnl.show()
	if selected_contact != '':
		if Data.Game.Player.FavContacts[0] == selected_contact:
			$Body/Menu/Principal/fav1_pnl/selected_pnl.show()
		elif Data.Game.Player.FavContacts[1] == selected_contact:
			$Body/Menu/Principal/fav2_pnl/selected_pnl.show()
		else:
			$Body/Menu/Principal/contact_pnl/selected_pnl.show()
		
		var dictdate = Time.get_datetime_dict_from_unix_time(Data.Game.People[selected_contact].Birthdate)
		$Body/Profile.show()
		
		$Body/Profile/submenu.hide()
		$Body/Profile/submenu/card/HBoxContainer/HBoxContainer.hide()
		$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/Panel.hide()
		$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/Panel2.hide()
		$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/indicators_section/work_section2.hide()
		$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/indicators_section/work_section3.hide()

		
		$Body/Profile/user_data/card/Player_data/Work_section.hide()
		$Body/Profile/user_data/card/Player_data/Year_section.hide()
		$Body/Profile/Work_goal_section.hide()
		$Body/Profile/submenu/card/HBoxContainer/effects_section/happy_section.hide()
		$Body/Profile/submenu/card/HBoxContainer/effects_section/money_section.hide()
		$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_f_section.hide()
		$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_s_section.hide()
		if 'work' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/user_data/card/Player_data/Work_section.show()
		if 'birth' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/user_data/card/Player_data/Year_section.show()
		if 'goal' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/Work_goal_section.show()
		if 'happy' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/submenu.show()
			$Body/Profile/submenu/card/HBoxContainer/effects_section/happy_section.show()
		if 'money' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/submenu.show()
			$Body/Profile/submenu/card/HBoxContainer/effects_section/money_section.show()
		if 'first' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/submenu.show()
			$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_f_section.show()
		if 'second' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/submenu.show()
			$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_s_section.show()
		if 'mind' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/submenu.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/Panel2.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/Panel.show()
		if 'relation' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/submenu.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/Panel2.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/indicators_section/work_section2.show()
		if 'love' in Data.Game.Player.FriendsSecrets[selected_contact]:
			$Body/Profile/submenu.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/Panel2.show()
			$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/indicators_section/work_section3.show()
			
		
		$Body/Profile/user_data/card/user_photo.texture = load(Data.Database.Photos[Data.Game.People[selected_contact].ProfilePic]['Path'])
		$Body/Profile/user_data/card/Player_data/Name_section/name_lbl.text = Data.Game.People[selected_contact].Fullname
		$Body/Profile/user_data/card/Player_data/Year_section/age_lbl.text = str(dictdate["day"])+"/"+tr(Data.months[dictdate["month"]])+"/"+str(dictdate["year"]) + '   ' + str(set_years_old()) + " " + tr("years_")
		$Body/Profile/user_data/card/Player_data/Work_section/work_lbl.text = Data.Game.People[selected_contact].Work
		
		$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/Panel/state_mind_img.texture = load('res://Assets/Images/State_mind/' + Data.Game.People[selected_contact].StateMind + '.png')
		update_bars()
		$Body/Profile/submenu/card/HBoxContainer/effects_section/money_section/money_lbl.text = Data.format_money(Data.db_data['Work'][Data.Game.People[selected_contact].Work]['Salary Base'])
		$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_f_section/effect_pnl/TextureRect.texture = load(Data.Database.Effects[Data.Game.People[selected_contact].FirstEffect]['Path'])
		$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_f_section/effect_f_lbl.text = str(int(Data.Game.People[selected_contact].ValueFirstEffect))
		$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_s_section/effect_pnl/TextureRect.texture = load(Data.Database.Effects[Data.Game.People[selected_contact].SecondsEffect]['Path'])
		$Body/Profile/submenu/card/HBoxContainer/effects_section/effect_s_section/effect_s_lbl.text = str(int(Data.Game.People[selected_contact].ValueSecondEffect))
		$Body/Profile/Work_goal_section/work_lbl.text = Data.Game.People[selected_contact].WorkGoal
		update_actions()
		
		$Body/Profile/submenu/card/HBoxContainer/effects_section/happy_section/happy_lbl
		

func update_always():
	if selected_contact != '':
		set_relation()

func update_bars():
	$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/indicators_section/work_section2/friend_img.texture = load(Data.Database.Relations[Data.Game.Player.Friends[selected_contact]['Relationship']][0])
	$Body/Profile/submenu/card/HBoxContainer/effects_section/happy_section/happy_lbl.text = str(Data.Database.Relations[Data.Game.Player.Friends[selected_contact]['Relationship']][1])

	$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/indicators_section/work_section2/friend_progress.value = Data.Game.Player.Friends[selected_contact]['Friend']
	$Body/Profile/submenu/card/HBoxContainer/HBoxContainer/indicators_section/work_section3/chemistry_progress.value = Data.Game.Player.Friends[selected_contact]['Love']

func update_actions():
	for child in $Body/Profile/Item_container/ScrollContainer/VBoxContainer.get_children():
		child.hide()
		child.contact = selected_contact
		if child.Id in Data.Database.RelationActions[Data.Game.Player.Friends[selected_contact]['Relationship']]:
			child.show()

func update_favs():
	if Data.Game.Player.FavContacts[0] != '':
		$Body/Menu/Principal/fav1_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.People[Data.Game.Player.FavContacts[0]].ProfilePic]['Path'])
	else:
		$Body/Menu/Principal/fav1_pnl/user_photo.texture = load('res://Assets/Images/People/no_person.png')
	
	if Data.Game.Player.FavContacts[1] != '':
		$Body/Menu/Principal/fav2_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.People[Data.Game.Player.FavContacts[1]].ProfilePic]['Path'])
	else:
		$Body/Menu/Principal/fav2_pnl/user_photo.texture = load('res://Assets/Images/People/no_person.png')
	
	if selected_contact in Data.Game.Player.FavContacts:
		$Body/Profile/user_data/card/fav_img.texture = load('res://Assets/Images/Menu/star_full.png')
	else:
		$Body/Profile/user_data/card/fav_img.texture = load('res://Assets/Images/Menu/star.png')

func create_people(item):
	var addcard = People_card.instantiate()
	addcard.Id = item
	$Body/Shop/Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
	addcard.connect("select_contact",contact_selected)

func create_interaction(item):
	var addcard = Interaction_card.instantiate()
	addcard.Id = item
	addcard.contact = selected_contact
	$Body/Profile/Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
	addcard.connect("interaction_done",interaction_completed)

func contact_selected(identifier):
	selected_contact = identifier
	mind_change_status = {}
	update_actions()

func interaction_completed(identifier):
	if identifier not in mind_change_status:
		mind_change_status[identifier] = 0
	mind_change_status[identifier] += 1
	
	var old_mind_status = Data.Game.People[selected_contact].StateMind
	var current_state = Data.Game.People[selected_contact].StateMind
	if Data.Game.People[selected_contact].StateMind in Data.Database.TransitionsStates:
		var statemind = Data.Game.People[selected_contact].StateMind
		if Data.Game.Player.Friends[selected_contact]['Relationship'] in Data.Database.TransitionsStates[statemind]:
			var relation = Data.Game.Player.Friends[selected_contact]['Relationship']
			if identifier in mind_change_status and identifier in Data.Database.TransitionsStates[statemind][relation]:
				if mind_change_status[identifier] >= Data.Database.TransitionsStates[statemind][relation][identifier]:
					Data.Game.People[selected_contact].StateMind = Data.Database.NewTransitionsStates[statemind]
	if old_mind_status != Data.Game.People[selected_contact].StateMind:
		mind_change_status = {}
		

	if identifier == 'secret':
		var secrets = ['birth','birth','work','happy','money','first','second','mind','love']
		var secret_selected = Data.get_random_value(secrets)
		var level_secrets_friend = ( len(Data.Game.Player.FriendsSecrets[selected_contact]) * 10 )
		if ( Data.Game.Player.Friends[selected_contact]['Friend'] >= level_secrets_friend ) and ( secret_selected not in Data.Game.Player.FriendsSecrets[selected_contact] ):
			Data.Game.Player.FriendsSecrets[selected_contact].append(secret_selected)
	
	if identifier == 'lover':
		if Data.Game.Player.Friends[selected_contact]['Love'] > 50:
			Data.Game.Player.Friends[selected_contact]['Relationship'] = 'lover'
		else:
			Data.Game.Player.Friends[selected_contact]['Friend'] -= 20
	if identifier == 'relation':
		if Data.Game.Player.Friends[selected_contact]['Love'] > 100:
			Data.Game.Player.Friends[selected_contact]['Relationship'] = 'partner'
		else:
			Data.Game.Player.Friends[selected_contact]['Friend'] -= 10
	if identifier == 'compromised':
		if Data.Game.Player.Friends[selected_contact]['Love'] > 200:
			Data.Game.Player.Friends[selected_contact]['Relationship'] = 'engagedpartner'
		else:
			Data.Game.Player.Friends[selected_contact]['Friend'] -= 10
	if identifier == 'marry':
		if Data.Game.Player.Friends[selected_contact]['Love'] > 300:
			Data.Game.Player.Friends[selected_contact]['Relationship'] = 'married'
		else:
			Data.Game.Player.Friends[selected_contact]['Friend'] -= 10
		
	
	if identifier == 'break':
		Data.Game.Player.Friends[selected_contact]['Relationship'] = 'break'
		Data.Game.Player.Friends[selected_contact]['Friend'] = (Data.Game.Player.Friends[selected_contact]['Friend'] / 2)
		Data.Game.Player.Friends[selected_contact]['Love'] = (Data.Game.Player.Friends[selected_contact]['Love'] / 2 )
	
	if Data.Game.Player.Friends[selected_contact]['Friend'] > 600:
		Data.Game.Player.Friends[selected_contact]['Friend'] = 600
	if Data.Game.Player.Friends[selected_contact]['Love'] > 600:
		Data.Game.Player.Friends[selected_contact]['Love'] = 600
	update_ui()
	update_bars()

func set_years_old():
	var secs_year = 31536000.0
	var diff_secs = abs(Data.Game.Date - Data.Game.People[selected_contact].Birthdate)
	return int(diff_secs / secs_year)

func set_relation():
	var relation = ''
	for limit in relation_levels.keys():
		if Data.Game.Player.Friends[selected_contact]['Relationship'] not in ['partner','engagedpartner','married','lover','break']:
			if Data.Game.Player.Friends[selected_contact]['Friend'] <= limit:
				Data.Game.Player.Friends[selected_contact]['Relationship'] = relation_levels[limit]
				break

func _on_close_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func _on_home_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func _on_contacts_btn_pressed() -> void:
	selected_contact = ''

func _on_fav_btn_pressed() -> void:
	if Data.Game.Player.FavContacts[0] == '':
		Data.Game.Player.FavContacts[0] = selected_contact
	else:
		if selected_contact == Data.Game.Player.FavContacts[0]:
			Data.Game.Player.FavContacts[0] = ''
		else:
			if Data.Game.Player.FavContacts[1] == '':
				Data.Game.Player.FavContacts[1] = selected_contact
			else:
				if selected_contact == Data.Game.Player.FavContacts[1]:
					Data.Game.Player.FavContacts[1] = ''
	update_ui()

func _on_fav_1_btn_pressed() -> void:
	if Data.Game.Player.FavContacts[0] != '':
		selected_contact = Data.Game.Player.FavContacts[0]
		mind_change_status = {}
		update_actions()

func _on_fav_2_btn_pressed() -> void:
	if Data.Game.Player.FavContacts[1] != '':
		selected_contact = Data.Game.Player.FavContacts[1]
		mind_change_status = {}
		update_actions()
