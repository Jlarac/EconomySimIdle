extends Node

#-------------screen management
var run = false
#var status = 'charging'
#var old_status = '+'
var screen = 'init'
#var charging_world_progress = 0
#var charging_world_comment = 'people_born'
var update_screen = false
var update_lbl = false
#var update_date = false
#var update_gallery = {'work':false,'study':false,'upgrade':false,'house':false}
#var menu = false
#var find_level = 1
#var find_house = ''
#var find_rental_status = false
#var find_sale_status = false
var progress = {'work':0,'study':0}
var study_icon = ""
#var progress_study = 0
#var progress_work = 0
var notification_dict = {'Business':0,'Study':0,'Work':0}
#var status_match = 'empty'
#var to_do_screen = 'health'
var health_dict = {'virus':0,'Bed':0,'Stove':0,'Fridge':0,'WC':0,'Shower':0}
var happy_dict = {'friend':0,'house':0,'car':0,'work':0,'food':0,'clothes':0}

#-------------basic
var months = {1: '1_month',2: '2_month',3: '3_month',4: '4_month',5: '5_month',6: '6_month',7: '7_month',8: '8_month',9: '9_month',10: '10_month',11: '11_month',12: '12_month'}

#-------------time controller
#var date = 631152000
#var startdate = -6999900000
#var enddate = 631152000
var dictdate = {}
#var lastday = 1
#var game_data = {'time':0,'segs_auto':0,'hours_auto':1,'minutes':0,'current_hour':'00:00','lastday':0}
#var cronos_factor = 1
#var autoclic_factor = 0

#-------------database
var db_data = {}
var save_file = {}
#var study_data = {}
#var work_data = {}
#var house_data = {}
#var todo_data = {}
#var upgrades_data = {}
#var cards_data = {}
#var screen_to_node_data = {}
#var goals_data = {}
#var skills_data = {}
#var rooms_data = {}
#var furniture_data = {}
#var male_names = []
#var female_names = []
#var all_names = []
#var surnames = []
#var portraits = []
var people_portraits = []
var fullname = []
var banned_names = []

#-------------save file'time':0,'segs_auto':0,'hours_auto':1,'minutes':0,'current_hour':'00:00','lastday':0
var npc_controller
var json = JSON.new()
var jsonpath = 'user://Savefiles/savedata.json'
#var game_data_init = {'date': 1640995200,'lastday':0,'lasthour':0,"inflation":0.03,"inflation_data":[],"period_fiscal":30,"days_fiscal":0,"status_fiscal":"static",'time':0,'segs_auto':0,'hours_auto':1,'minutes':0,'current_hour':'00:00'}
#var game_data = {}
var people_data = {}

#var Character = preload("res://Scripts/Classes/character.gd")
var seconds = 0
#-------------player
'''var player_data_init = {
	'id': '','name': '','surname': '','selected_portrait': '','birth': 0,'years_old': 0,
	'money': 100000000000,'money_per_day': 0,'clic': 0,'auto_clic': 0,
	'health': 100,'happy': 100,'energy':100,'level': 0,'disease_name': '','disease_value': 0,
	'work': 'no_work','work_summary': {'no_work': 0},
	'study': '','study_completed': {},'study_summary': {'basic': 0},
	'business_summary': {},'investment_summary': {'metals':{}},
	'houses': [],'counthouses': 0,'car': '','own_cars': {},'plane': '','own_planes': {},'boat': '','own_boats': {},'friend': '','friends': {},'fav_contacts':['',''],'friends_times': {},'friends_secrets':{},
	'collection': {},'shop_items': {'Cloth':'','Food':'','Medicine':''},'own_upgrades': ['clock_0'],'own_achievements': [],'card': 'classic_card',
	'skills': {'friend': '','love': '','learn': ''},'skills_work':{},'to_do_times': {}
}
var player_data = {}'''
var old_inflation_status = "status"

#-------------no assignement
#var edit_user_status = false
#var edit_user_charge = false

#-------------house control
var houses_availables = {}
var status_house_view = "live"
var status_house_search = "live"
#var status_house = "homeless"

var Database: Tables = null
#var Player: PlayerData = null
var Game: GameData = null
const PlayerSavePath := 'user://Savefiles/PlayerSaveGame.tres'
const GameSavePath := 'user://Savefiles/GameSaveGame.tres'

var carefull_status = false
var income_status = false



		
func _ready():
	randomize()
	#get_tree().quit()
	#print(seconds_to_date(-432000))
	#print(seconds_to_date(631152000)) 
	#print(date_to_seconds(1, 1, 2010))
	#print(date_to_seconds(1, 1, 1994))
	#print(date_to_seconds(1, 1, 2000))
	#print(date_to_seconds(31, 12, 2000))
	#print(date_to_seconds(1, 1, 1999))
	#print(date_to_seconds(31, 12, 2001))
	#print(date_to_seconds(1, 1, 2022))
	#print(seconds_to_date(1640995200))
	#print(seconds_to_date(1640995201))
	

	

func _process(delta: float) -> void:
	if not run:
		initialize_game()
	else:
		update_game_time()

func initialize_game() -> void:
	db_data = load_and_merge_name_data()
	Characters.read_portraits()
	Database = Tables.new()
	
	if FileAccess.file_exists(GameSavePath):
		load_game()
		dictdate = Time.get_datetime_dict_from_unix_time(Game.Date)
		init_check()
		#Game.Player.check_variables()
		screen = "load"
		run = true
	else:
		ensure_save_folder_exists()
		screen = "create"

func load_and_merge_name_data() -> Dictionary:
	var data = read_json("res://Scripts/Data/Database.json")
	data["All_names"] = data["Male_names"] + data["Female_names"]
	return data

func ensure_save_folder_exists() -> void:
	if DirAccess.open("user://Savefiles") == null:
		DirAccess.make_dir_recursive_absolute("user://Savefiles")

func update_game_time() -> void:
	if screen == "create":
		return
	
	dictdate = Time.get_datetime_dict_from_unix_time(Game.Date)
	seconds = int(3600 / Game.AutomaticSeconds)
	Game.CurrentHour = "%02d:%02d" % [dictdate["hour"], dictdate["minute"]]
	Game.CurrentDate = "%02d/%s/%04d" % [dictdate["day"], tr(months[dictdate["month"]]),dictdate["year"]] #str(Data.dictdate["day"])+"/"+tr(Data.months[Data.dictdate["month"]])+"/"+str(Data.dictdate["year"])
	var hour_diff = abs(dictdate["hour"] - Game.LastHour)
	if hour_diff >= Game.AutomaticHours:
		clic_auto()
		save_game()
		Game.LastHour = dictdate["hour"]

func load_game():
	#var playerloaded = ResourceLoader.load(PlayerSavePath)
	#if playerloaded is PlayerData:
	#	Game.Player = playerloaded
	var gameloaded = ResourceLoader.load(GameSavePath)
	if gameloaded is GameData:
		Game = gameloaded

func save_game():
	if Game:
		ResourceSaver.save(Game,GameSavePath)



func seconds_to_date(seconds: int) -> String:
	var base_time = Time.get_datetime_dict_from_unix_time(0) 
	var target_time = Time.get_datetime_dict_from_unix_time(seconds) 
	return "%04d-%02d-%02d %02d:%02d:%02d" % [target_time.year, target_time.month, target_time.day,target_time.hour, target_time.minute, target_time.second]

func date_to_seconds(day: int, month: int,year: int) -> int:
	var timestamp = Time.get_unix_time_from_datetime_dict({"year": year, "month": month, "day": day,"hour": 0, "minute": 0, "second": 0})
	return timestamp

func read_json(path):
	var file = FileAccess.open(path,FileAccess.READ)
	var tempdata = null
	if file != null:
		tempdata = JSON.parse_string(file.get_as_text())
		file.close()
	return tempdata

func save_json(content,path):
	var file = FileAccess.open(path,FileAccess.WRITE)
	file.store_string(JSON.stringify(content))
	file.close()
	file = null

func check_save_file():
	var base_dict = create_save_dict()
	for item in base_dict:
		if item not in save_file:
			save_file[item] = base_dict[item]
	transform_data()

func transform_data():
	#game_data = save_file["game_data"]
	#player_data = save_file["player_data"]
	people_data = save_file["people_data"]

func create_save_dict():
	var temp_dict = {}
	#temp_dict['game_data'] = game_data
	#temp_dict['player_data'] = player_data
	temp_dict['people_data'] = people_data
	return temp_dict

func save_current():
	save_file = create_save_dict()
	save_json(save_file,jsonpath)

func init_check():
	#ban_names(player_data['name'],player_data['surname'])
	#lock_portraits()
	Game.Player.check_variables()

	#set_health_happy()
	Game.Player.set_yearsold()
	#set_moneyperday()
	#Player.set_studyprogress()
	#set_upgrades()
	#set_house_status()
	dictdate = Time.get_datetime_dict_from_unix_time(Game.Date)
	Game.LastDay = dictdate['day']
	update_screen = true
	update_lbl = true
	screen = 'home'
	#save_current()

func clic_auto():
	Game.Player.AutoClic += 1
	clic_action()

func clic_manual():
	Game.Player.ManualClic += 1
	Game.Date += (3600 * Game.AutomaticHours * 24)
	clic_action()
	
func clic_action():
	Game.Player.give_money(int(float(Game.Player.MoneyPerDay) / (24.0 / Game.AutomaticHours)))
	dictdate = Time.get_datetime_dict_from_unix_time(Game.Date)
	if Game.LastDay != dictdate['day']:
		Game.LastDay = dictdate['day']
		change_day()
	#save_current()
	save_game()
	
	#update_screen = true
	#update_lbl = true
	#update_date = true

func change_day():
	for people in Game.People:
		Game.People[people].calculate_state_mind()
	Game.create_houses_market()
	Game.Player.check_variables()
	Game.Player.change_day()
	#Game.set_inflation()
	
	




func health_house(rooms_dictionary):
	var tier_health = {'kitchen':-2,'bedroom':-2,'bath':-2}
	for room in rooms_dictionary:
		if room in tier_health:
			tier_health[room] = rooms_dictionary[room]["Tier"]
			tier_health[room] = ((tier_health[room] - 3) * 0.5)
	return tier_health




func set_upgrades():
	#var game_data = {'time':0,'segs_auto':0,'hours_auto':0,'minutes':0,'current_hour':'00:00','lastday':0}
	pass


func change_study():
	pass
	#for study in Player.StudySummary:
	#	if Player.StudySummary[study] < db_data['Study'][study]['Time']:
	#		Player.StudySummary[study] += 1
	

func reset_carefull_income():
	if Data.carefull_status == true:
		Data.carefull_status = false
	if Data.income_status == true:
		Data.income_status = false



func probability(percentage,base = 100):
	var prob = randi() % base
	if prob < percentage:
		return true
	else:
		return false

func format_hour(hour: int) -> String:
	return "%02d" % hour

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
	
func format_money(number,size = 6) -> String:    
	var suffixes = {3: 'K', 6: 'M',12: 'B',18: 'T',24: 'Q',30: 'Qi'}
	var abs_value = abs(number)
	var abs_num = abs(number)
	var sign = ""
	if number < 0:
		sign = "-"
	var final_string = "$" + sign
	var final_exp = 0
	var size_comparation = 10_000_000
	if size == 3:
		size_comparation = 1_000
	if abs_num >= size_comparation:
		for exp in [30, 24, 18, 12, 6, 3]:
			if abs_num >= pow(10, exp):
				var short_number = abs_num / pow(10, exp)
				abs_num = round_to_dec(short_number, 3)
				final_exp = exp
	var decimal_number = abs_num - int(abs_num)
	decimal_number = round_to_dec(abs(decimal_number),1)
	var string_number = str(int(abs_num))
	for i in range(len(string_number)):
		final_string += string_number[i]
		var digits_left = len(string_number) - i - 1
		if digits_left > 0 and digits_left % 3 == 0:
			final_string += ","
	string_number = str(decimal_number)
	for i in len(string_number):
		if (len(string_number)-i) < (len(string_number)):
			final_string += str(string_number[i])
	if abs_value >= size_comparation:
		return final_string + suffixes[final_exp]
	else:
		return final_string

func format_quantity(number) -> String:    
	var decimal_number = number - int(number)
	decimal_number = round_to_dec(decimal_number,2)
	var string_number = str(int(number))
	var final_string = " "
	for i in len(string_number):
		final_string+=str(string_number[i])
		if (len(string_number)-i) == 19 or (len(string_number)-i)==16 or (len(string_number)-i)==13 or (len(string_number)-i)==10 or (len(string_number)-i)==7 or (len(string_number)-i)==4:
			final_string+=","
	string_number = str(decimal_number)
	for i in len(string_number):
		if (len(string_number)-i)<(len(string_number)):
			final_string+=str(string_number[i])
	return final_string

'''func generate_name() -> Array:
	var name_ = '' #get_random_value(db_data['All_names'])
	var surname_ = get_random_value(db_data['Surname'])
	return [name_ , surname_]
	
func generate_name_male() -> Array:
	var name_ = get_random_value(db_data['Male_names'])
	var surname_ = get_random_value(db_data['Surname'])
	return [name_ , surname_]
	
func generate_name_female() -> Array:
	var name_ = get_random_value(db_data['Female_names'])
	var surname_ = get_random_value(db_data['Surname'])
	return [name_ , surname_] '''
	
func get_random_value(array):
	if array.is_empty():
		return null
	return array[randi() % array.size()]

func get_random_value_weight(array,weight):
	var total = 0
	for item in weight:
		total += item
	var rand = randi() % total
	for i in range(array.size()):
		if rand < weight[i]:
			return array[i]
		#rand - weight[i]
	return array[-1]
	

	

func lock_portraits():
	people_portraits.erase(Game.Player.ProfilePic)

func ban_names(people_name,people_surname):
	if people_name+people_surname not in banned_names:
		banned_names.append(people_name+people_surname)
