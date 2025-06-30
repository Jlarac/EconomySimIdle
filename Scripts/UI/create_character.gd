extends Control

var skill_friend = ['outgoing','social','introvert']
var skill_love = ['romantic','gentle','aromantic']
var skill_learn = ['perfeccionist','moderate','carefree']
var index_portrait = 0
var name_portrait = ''
var name_selected = ''
var surname_selected = ''
var len_portrait = 0
var status = 'init'
var old_status = ''
var selected_portraits = []
var count = 0
var keys_dictionary = []
var steps_times = {'init':1,'text1':2}

func _ready() -> void:
	update_init()
	
	Data.Game = GameData.new()
	Data.Game.Player = PlayerData.new()
	name_portrait = Data.get_random_value(Data.people_portraits)
	$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_friend_lst.select(randi_range(0,2))
	$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_love_lst.select(randi_range(0,2))
	$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_learn_lst.select(randi_range(0,2))

func _process(_delta: float) -> void:
	if status != old_status:
		update_ui()
		old_status = status
		
	if status == 'skill':
		update_skill()
		
	if status == 'people':
		#$Create/CreateCharacter/creating.show()
		var item = Data.get_random_value(selected_portraits)
		var newcharacter = NPCData.new()
		var temp_name = newcharacter.new_character(item,Data.Database.Photos[item]['Genre'])
		Data.Game.People[temp_name] = newcharacter
		selected_portraits.erase(item)
		#$Create/CreateCharacter/creating/Panel/ProgressBar.value = (float(count) / float(len_portrait)) * 100
		#$Create/CreateCharacter/creating/Panel/Label.text = temp_name
		count += 1
		if len(selected_portraits) == 0:
			for key in Data.Database.Study.keys():
				keys_dictionary.append(key)
			len_portrait = len(keys_dictionary)
			count = 0
			status = 'study'
			
	if status == 'study':
		var item = Data.get_random_value(keys_dictionary)
		var newstudy = StudyData.new()
		var temp_name = newstudy.new_data(Data.Database.Study[item])
		Data.Game.Study.append(newstudy) 
		keys_dictionary.erase(item)
		#$Create/CreateCharacter/creating/Panel/ProgressBar.value = (float(count) / float(len_portrait)) * 100
		#$Create/CreateCharacter/creating/Panel/Label.text = temp_name
		count += 1
		if len(keys_dictionary) == 0:
			status = 'done'
	if status == 'done':
		Data.init_check()
		Data.Game.create_houses_market()
		Data.save_game()
		Data.run = true
		Data.screen = 'home'
		get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func update_init():
	$Transicion.show()
	$AnimationPlayer.play('fade_transicion_out')
	await $AnimationPlayer.animation_finished
	$Transicion.hide()
	
func update_ui():
	$Transicion.show()
	if status != 'init':
		$AnimationPlayer.play('fade_transicion_in')
		await $AnimationPlayer.animation_finished
	$Create/CreateCharacter/init.hide()
	$Create/CreateCharacter/name.hide()
	$Create/CreateCharacter/photo.hide()
	$Create/CreateCharacter/skill.hide()
	$Create/CreateCharacter/creating.hide()
	
	$AnimationPlayer.play('fade_transicion_out')
	if status == 'init':
		$Create/CreateCharacter/init.show()
		$Create/CreateCharacter/init/text1.show()
		$Create/CreateCharacter/init/text2.show()
		$Create/CreateCharacter/init/text3.show()
		$Create/CreateCharacter/init/TextureRect.show()
		$Create/CreateCharacter/init/create_user.show()
	if status == 'name':
		$Create/CreateCharacter/name.show()
		$Create/CreateCharacter/name/Panel.show()
		$Create/CreateCharacter/name/complete.show()
		$Create/CreateCharacter/name/Panel/MarginContainer/VBoxContainer/VBoxContainer/Name_editor.text = Data.get_random_value(Data.Database.AllNames)
		$Create/CreateCharacter/name/Panel/MarginContainer/VBoxContainer/VBoxContainer2/Surname_editor.text = Data.get_random_value(Data.Database.Surnames)
	if status == 'photo':
		update_photos()
		$Create/CreateCharacter/photo.show()
		$Create/CreateCharacter/photo/Panel.show()
		$Create/CreateCharacter/photo/complete.show()
		$Create/CreateCharacter/photo/AnimationPlayer.play('fadephotos')
	if status == 'skill':
		$Create/CreateCharacter/skill.show()
		update_skill()
	await $AnimationPlayer.animation_finished
	$Transicion.hide()

func update_photos():
	len_portrait = len(Data.people_portraits)
	index_portrait = Data.people_portraits.find(name_portrait)
	
	var left_index = index_portrait - 1
	var right_index = index_portrait + 1
	left_index = validate_index(left_index)
	right_index = validate_index(right_index)
	var left_portrait = Data.people_portraits[left_index]
	var right_portrait = Data.people_portraits[right_index]
	
	$Create/CreateCharacter/photo/Panel/MarginContainer/VBoxContainer/Panel/user_photo.texture = load(Data.Database.Photos[name_portrait]['Path'])
	$Create/CreateCharacter/photo/Panel/MarginContainer/VBoxContainer/Panel/left_photo.texture = load(Data.Database.Photos[left_portrait]['Path'])
	$Create/CreateCharacter/photo/Panel/MarginContainer/VBoxContainer/Panel/right_photo.texture = load(Data.Database.Photos[right_portrait]['Path'])

func update_skill():
	var friend = skill_friend[$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_friend_lst.get_selected_items()[0]]
	var love = skill_love[$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_love_lst.get_selected_items()[0]]
	var learn = skill_learn[$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_learn_lst.get_selected_items()[0]]
	$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/friend_lbl.text = tr('friend_skill') + ': ' + tr(friend) + ' ' + str(int(Data.Database.Personalities[friend]['Impact'] * 100)) + '%'
	$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/love_lbl.text = tr('love_skill') + ': ' + tr(love) + ' ' + str(int(Data.Database.Personalities[love]['Impact'] * 100)) + '%'
	$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/learn_lbl.text = tr('learn_skill') + ': ' + tr(learn) + ' ' + str(int(Data.Database.Personalities[learn]['Impact'] * 100)) + '%'

func _on_save_profile_pressed() -> void:
	Data.Game.Player.Name = name_selected
	Data.Game.Player.Surname = surname_selected
	Data.Game.Player.Id = Data.Game.Player.Name + Data.Game.Player.Surname
	
	Data.Game.Player.PersonalityFriend = skill_friend[$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_friend_lst.get_selected_items()[0]] 
	Data.Game.Player.SkillFriend = Data.Database.Personalities[Data.Game.Player.PersonalityFriend]['Impact']
	Data.Game.Player.PersonalityLove = skill_love[$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_love_lst.get_selected_items()[0]] 
	Data.Game.Player.SkillLove = Data.Database.Personalities[Data.Game.Player.PersonalityLove]['Impact']
	Data.Game.Player.PersonalityLearn = skill_learn[$Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/skills_learn_lst.get_selected_items()[0]] 
	Data.Game.Player.SkillLearn = Data.Database.Personalities[Data.Game.Player.PersonalityLearn]['Impact']
	Data.Game.Player.ProfilePic = name_portrait
	Data.Game.Player.Birthdate = randi_range(946684800,978220800)
	
	Data.Game.Tutorial = $Create/CreateCharacter/skill/Panel2/MarginContainer/VBoxContainer/HBoxContainer/CheckBox.button_pressed
	
	Data.save_game()
	Data.ban_names(Data.Game.Player.Name,Data.Game.Player.Surname)
	selected_portraits = Data.people_portraits
	selected_portraits.erase(Data.Game.Player.ProfilePic)
	if status == 'skill':
		status = 'people'

func validate_index(temp_index):
	if temp_index < 0:
		temp_index = (len_portrait -1)
	if temp_index >= len_portrait:
		temp_index = 0
	return temp_index

func _on_create_user_pressed() -> void:
	status = 'name'

func _on_complete_pressed() -> void:
	if status == 'name':
		name_selected = $Create/CreateCharacter/name/Panel/MarginContainer/VBoxContainer/VBoxContainer/Name_editor.text
		surname_selected = $Create/CreateCharacter/name/Panel/MarginContainer/VBoxContainer/VBoxContainer2/Surname_editor.text
		status = 'photo'
	elif status == 'photo':
		status = 'skill'

func _on_left_pressed() -> void:
	var index = (index_portrait - 1)
	index = validate_index(index)
	name_portrait = Data.people_portraits[index]
	update_photos()

func _on_right_pressed() -> void:
	var index = (index_portrait + 1)
	index = validate_index(index)
	name_portrait = Data.people_portraits[index]
	update_photos()
