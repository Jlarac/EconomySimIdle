extends Node

#var old_date = 0
var run = false
var lastday = -1

#var player_data: PlayerData = PlayerData.new()


func patch_old_save():
	pass
	#if data_version < 2:
		# cosas nuevas en versión 2
	#	if "some_key" not in some_dict:
	#		some_dict["some_key"] = 0
	#	data_version = 2
	

func _process(_delta: float) -> void:
	if Data.run:
		if run == false:
			read_portraits()
			run = true
		if run and Data.screen != "create":
			if lastday != Data.dictdate['day']:
				calculate_state_mind()
				lastday = Data.dictdate['day']
		
func read_portraits():
	Data.people_portraits = []
	for people in Data.db_data['People_photos'].keys():
		Data.people_portraits.append(people)

func calculate_state_mind():
	var percentages = {}
	percentages['outgoing'] = [5,15,35,45]
	percentages['social'] = [10,25,40,25]
	percentages['introvert'] = [10,50,35,45]
	percentages['romantic'] = [10,20,40,30]
	percentages['gentle'] = [5,20,50,25]
	percentages['aromantic'] = [15,70,10,5]
	percentages['perfeccionist'] = [15,60,20,5]
	percentages['moderate'] = [10,50,30,10]
	percentages['carefree'] = [15,60,20,5]
	
	for people in Data.people_data:
		var new_percentage = [0,0,0,0]
		var temp_state = Data.get_random_value_weight(['sad','other'],[10,90])
		if people in Data.Game.Player.Friends:
			if temp_state == 'sad':
				Data.people_data[people]['state_mind'] = temp_state
			else:
				if Data.Game.Player.Friends[people]['Relationship'] == 'partner':
					new_percentage = [2,18,70,10]
				if Data.Game.Player.Friends[people]['Relationship'] == 'lover':
					new_percentage = [1,1,8,90]
				if Data.Game.Player.Friends[people]['Relationship'] == 'engagedpartner':
					new_percentage = [2,8,80,10]
				if Data.Game.Player.Friends[people]['Relationship'] == 'married':
					new_percentage = [2,10,18,70]
				if Data.Game.Player.Friends[people]['Relationship'] == 'break':
					new_percentage = [80,10,5,5]
				if Data.Game.Player.Friends[people]['Relationship'] == 'Not':
					for skill in ['friend','love','learn']:
						var count = 0
						for item in percentages[Data.people_data[people][skill]]:
							new_percentage[count] += item
							count += 1
				#print(people,'  ', Data.people_data[people]['state_mind'],' ',new_percentage,' ',Data.Game.Player.Friends[people]['Relationship'])
				temp_state = Data.get_random_value_weight(['angry','neutral','happy','fun'],new_percentage)
				Data.people_data[people]['state_mind'] = temp_state

func new_character(portrait,genre):
	var array = []
	var first_name = ''
	var surname = ''
	var work = ''
	var work_goal = ''
	var birth = 0
	var money = 0
	var first_effect = ''
	var value_first_effect = 0
	var second_effect = ''
	var value_second_effect = 0
	
	#var skill_friend = ['outgoing','social','introvert']
	#var skill_love = ['romantic','gentle','aromantic']
	#var skill_learn = ['perfeccionist','moderate','carefree']
	var friend_skill = Data.get_random_value(['outgoing','social','introvert'])
	var love_skill = Data.get_random_value(['romantic','gentle','aromantic'])
	var learn_skill = Data.get_random_value(['perfeccionist','moderate','carefree'])
	
	var check_ban_names = true
	while check_ban_names:
		if genre == 'F':
			first_name = Data.get_random_value(Data.db_data['Female_names'])
		if genre == 'M':
			first_name = Data.get_random_value(Data.db_data['Male_names'])
		surname = Data.get_random_value(Data.db_data['Surname'])
		if first_name+surname not in Data.banned_names:
			Data.ban_names(first_name,surname)
			check_ban_names = false
	birth = randi_range(915148800,1009756800)
	
	var available_sectors = []
	for work_item in Data.db_data['Work']:
		if Data.db_data['Work'][work_item]['Parent'] not in available_sectors:
			available_sectors.append(Data.db_data['Work'][work_item]['Parent'])
	var work_sector = Data.get_random_value(available_sectors)
	
	var available_works = []
	for work_item in Data.db_data['Work']:
		if Data.db_data['Work'][work_item]['Parent'] == work_sector and Data.db_data['Work'][work_item]['Level'] != 10 and Data.db_data['Work'][work_item]['Level'] > 4:
			available_works.append(work_item)
		if Data.db_data['Work'][work_item]['Parent'] == work_sector and Data.db_data['Work'][work_item]['Level'] == 1:
			work = work_item
	for item in Data.db_data['Work_Parents'][work_sector]['Effect']:
		first_effect = item
		value_first_effect = Data.db_data['Work_Parents'][work_sector]['Effect'][item]
	
	var bucle = true
	while bucle:
		second_effect = Data.get_random_value(Data.db_data['Effects'].keys())
		if second_effect != first_effect:
			bucle = false
	value_second_effect = randi_range(1,5)
	
	
	#print(work_sector,Data.db_data['Work_Parents'][work_sector]['Effect'])
	work_goal = Data.get_random_value(available_works)
	
	
	
	Data.people_data[first_name+surname] = {'id': '','name': first_name,'surname': surname,'selected_portrait': portrait,'birth': birth,'years_old':0,'money': money,'work':work,'work_goal':work_goal,'first_effect':first_effect,'value_first_effect':value_first_effect,'second_effect':second_effect,'value_second_effect':value_second_effect,'friend':friend_skill,'love':love_skill,'learn':learn_skill,'state_mind':'neutral'}
	return (first_name+' '+surname)
	
