extends Resource

class_name NPCData

@export var Id: String = ''

@export var Name: String = ''
@export var Surname: String = ''
@export var Fullname: String = ''
@export var ProfilePic: String = ''

@export var Work: String = 'no_work'
@export var WorkGoal: String = ''
@export var MoneyPerDay: float = 0

@export var Birthdate: int = 0
@export var YearsOld: int = 0

@export var StateMind: String = ''
@export var PersonalityFriend: String = ''
@export var PersonalityLove: String = ''
@export var PersonalityLearn: String = ''
@export var SkillFriend: float = 0.0
@export var SkillLove: float = 0.0
@export var SkillLearn: float = 0.0
@export var Skills: Dictionary = {
'drive':0.0,'math':0.0,'marine':0.0,'pilot':0.0,'social':0.0,'paint':0.0,'guitar':0.0,
'piano':0.0,'saxofon':0.0,'violin':0.0,'drums':0.0,'sing':0.0,'acting':0.0,'gastronomy':0.0,
'business':0.0,'medicine':0.0,'law':0.0,'draw':0.0}

@export var FirstEffect: String = ''
@export var SecondsEffect: String = ''
@export var ValueFirstEffect: float = 0.0
@export var ValueSecondEffect: float = 0.0

func to_dict() -> Dictionary:
	return {
		'Id': Id,'Name': Name,'Surname': Surname,'ProfilePic': ProfilePic,'Work': Work,'WorkGoal': WorkGoal,'Birthdate':Birthdate,
		'PersonalityFriend':PersonalityFriend,'PersonalityLove':PersonalityLove,'PersonalityLearn':PersonalityLearn,
		'SkillFriend':SkillFriend,'SkillLove':SkillLove,'SkillLearn':SkillLearn,'Skills':Skills,'StateMind':StateMind,
		'FirstEffect':FirstEffect,'SecondsEffect':SecondsEffect,'ValueFirstEffect':ValueFirstEffect,'ValueSecondEffect':ValueSecondEffect
	}

func from_dict(data: Dictionary) -> void:
	Id = data['Id']
	Name = data['Name']
	Surname = data['Surname']
	ProfilePic = data['ProfilePic']
	Work = data['Work']
	WorkGoal = data['WorkGoal']
	Birthdate = data['Birthdate']
	PersonalityFriend = data['PersonalityFriend']
	PersonalityLove = data['PersonalityLove']
	PersonalityLearn = data['PersonalityLearn']
	SkillFriend = data['SkillFriend']
	SkillLove = data['SkillLove']
	SkillLearn = data['SkillLearn']
	StateMind = data['StateMind']
	Skills = data['Skills']
	FirstEffect = data['FirstEffect']
	SecondsEffect = data['SecondsEffect']
	ValueFirstEffect = data['ValueFirstEffect']
	ValueSecondEffect = data['ValueSecondEffect']


func new_character(portrait,genre) -> String:
	PersonalityFriend = Data.get_random_value(['outgoing','social','introvert'])
	SkillFriend = Data.Database.Personalities[PersonalityFriend]['Impact']
	
	PersonalityLove = Data.get_random_value(['outgoing','social','introvert'])
	SkillLove = Data.Database.Personalities[PersonalityLove]['Impact']
	
	PersonalityLearn = Data.get_random_value(['outgoing','social','introvert'])
	SkillLearn = Data.Database.Personalities[PersonalityLearn]['Impact']
	
	var check_ban_names = true
	while check_ban_names:
		if genre == 'F':
			Name = Data.get_random_value(Data.Database.FemaleNames)
		if genre == 'M':
			Name = Data.get_random_value(Data.Database.MaleNames)
		Surname = Data.get_random_value(Data.Database.Surnames)
		if Name + Surname not in Data.banned_names:
			Data.ban_names(Name,Surname)
			check_ban_names = false
	ProfilePic = portrait
	Id = Name + Surname
	Birthdate = randi_range(915148800,1009756800)
	
	var available_sectors = []
	for work_item in Data.Database.Work:
		if Data.Database.Work[work_item]['Parent'] not in available_sectors:
			available_sectors.append(Data.Database.Work[work_item]['Parent'])
	var work_sector = Data.get_random_value(available_sectors)
	
	var available_works = []
	for work_item in Data.Database.Work:
		if Data.Database.Work[work_item]['Parent'] == work_sector and Data.Database.Work[work_item]['Level'] != 10 and Data.Database.Work[work_item]['Level'] > 4:
			available_works.append(work_item)
		if Data.Database.Work[work_item]['Parent'] == work_sector and Data.Database.Work[work_item]['Level'] == 1:
			Work = work_item
	for item in Data.Database.WorkEffects[work_sector]['Effect']:
		FirstEffect = item
		ValueFirstEffect = Data.Database.WorkEffects[work_sector]['Effect'][item]
	
	var bucle = true
	while bucle:
		SecondsEffect = Data.get_random_value(Data.Database.Effects.keys())
		if SecondsEffect != FirstEffect:
			bucle = false
	ValueSecondEffect = randi_range(1,5)
	
	WorkGoal = Data.get_random_value(available_works)
	StateMind = 'neutral'
	Fullname = Name + ' ' + Surname
	return Name + ' ' + Surname

func print_name():
	print(Name)

func calculate_state_mind():
	if Fullname in Data.Game.Player.Friends:
		StateMind = Data.get_random_value_weight(['sad','other'],[2,98])
		if StateMind == 'other':
			var new_percentage = Data.Database.PercentagesStateMind[Data.Game.Player.Friends[Fullname]['Relationship']]
			StateMind = Data.get_random_value_weight(['angry','neutral','happy','fun'],new_percentage)
