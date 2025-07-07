extends Resource

class_name PlayerData

@export var Id: String = ''

@export var Name: String = ''
@export var Surname: String = ''
@export var ProfilePic: String = ''

@export var PersonalityFriend: String = ''
@export var PersonalityLove: String = ''
@export var PersonalityLearn: String = ''

@export var SkillFriend: float = 0.0
@export var SkillLove: float = 0.0
@export var SkillLearn: float = 0.0
@export var SkillDrive: float = 0.0
@export var Skills: Dictionary = {
'basic':20,'drive':0.0,'math':0.0,'marine':0.0,'pilot':0.0,'social':0.0,'paint':0.0,'guitar':0.0,
'piano':0.0,'saxofon':0.0,'violin':0.0,'drums':0.0,'sing':0.0,'acting':0.0,'gastronomy':0.0,
'business':0.0,'medicine':0.0,'law':0.0,'draw':0.0}

@export var Birthdate: int = 0
@export var YearsOld: int = 0

@export var OwnUpgrades: Array[String] = ['upgrade_clock_0','upgrade_card_0']
@export var OwnItems: Array[String] = []
@export var Upgrades: Dictionary = { }
@export var Items: Dictionary = { }

@export var Money: int = 1111110
@export var MoneyPerDay: float = 0
@export var MoneyPerDayDetailed: Dictionary = { }

@export var ManualClic: int = 0
@export var AutoClic: int = 0

@export var Health: int = 100
@export var Happy: int = 100
@export var DiseaseName: String = ''
@export var DiseaseValue: int = 0
@export var Immunity: int = 0
@export var Level: int = 0
@export var HealthDict: Dictionary = {'virus':0.0,'room':0.0,'kitchen':0.0,'bath':0.0,'food':0.0,'cloth':0.0}
@export var HappyDict: Dictionary = {'friends':0.0,'house':0.0,'car':0.0,'work':0.0,'food':0.0,'cloth':0.0,'study':0.0}
@export var HealthPerDay: float = 0.0
@export var HappyPerDay: float = 0.0
@export var SickArray: Array[String] = []

@export var Work: String = 'no_work'
@export var WorkAvailable: Array = ['no_work']
@export var WorkSummary: Dictionary = {'no_work': 0}

@export var Study: String = ''
@export var StudyCompleted: Array = ['basic']
@export var StudySummary: Dictionary = {}

@export var BusinessSummary: Dictionary = {}
@export var InvestmentSummary: Dictionary = {'metals': {}}

@export var Houses: Dictionary = {}

@export var ShopItems: Dictionary = {'Cloth': '', 'Food': '', 'Medicine': ''}

@export var Friend: String = ''
@export var Friends: Dictionary = {}
@export var FavContacts: Array[String] = ['', '']
@export var FriendsTimes: Dictionary = {}
@export var FriendsSecrets: Dictionary = {}

@export var ProgressStudy: int = 0
@export var ProgressWork: int = 0
@export var StudyIcon: String = 'res://Assets/Images/Study/basic.png'

@export var ActivityTimes: Dictionary = {}
@export var Tutorial: bool = true


@export var counthouses: int = 0
@export var car: String = ''
@export var own_cars: Dictionary = {}
@export var plane: String = ''
@export var own_planes: Dictionary = {}
@export var boat: String = ''
@export var own_boats: Dictionary = {}



@export var collection: Dictionary = {}


@export var own_achievements: Array[String] = []
@export var card: String = 'classic_card'


@export var skills_work: Dictionary = {}
@export var to_do_times: Dictionary = {}



func check_variables() -> void:
	set_upgrades()
	set_health_happy()
	set_worksalary()
	set_moneyperday()
	set_work_available()

func change_day() -> void:
	set_yearsold()
	check_variables()
	change_health_happy()
	change_workprogress()
	change_studyprogress()
	set_house_status()
	print('day changed')

func give_money(amount: int) -> void:
	Money += amount

func buy_something(price: int) -> bool:
	if Money >= price:
		Money -= price
		return true
	else:
		return false

func set_yearsold():
	var secs_year = 31536000.0
	var diff_secs = abs(Data.Game.Date - Birthdate)
	YearsOld = int(diff_secs / secs_year)
	SickArray = []
	for sick in Data.Database.Sicks:
		if Data.Database.Sicks[sick]['Year'] <= YearsOld:
			if sick != 'good' and sick != 'shield':
				SickArray.append(sick)

func change_workprogress():
	for work in WorkSummary:
		if work == Work:
			WorkSummary[work] += 1
			Skills[Data.Database.Study[Data.Database.Work[work]['Parent']]['Skill']] += (1 * SkillLearn)

func change_studyprogress():
	HappyDict['study'] = 0
	var old_progress = ProgressStudy
	for study in StudySummary:
		if Data.Game.Date > StudySummary[study]:
			ProgressStudy = 0
			StudyCompleted.append(study)
			StudySummary.erase(study)
			Data.Game.create_message('study',study)
		else:
			ProgressStudy = (1-( float(StudySummary[study] - Data.Game.Date ) / float(Data.Database.Study[study]["Time"] ))) * 100
			Skills[Data.Database.Study[study]["Skill"]] += ( float(ProgressStudy - old_progress) / 1.1) * SkillLearn
			HappyDict['study'] += Data.Database.Study[study]['Happy']
	for skill in Skills:
		if Skills[skill] > 500:
			Skills[skill] = 500

func set_work_available():
	var level_next_work = {0: 0, 1: 10, 2: 50,3: 100, 4: 150, 5: 200,6: 250, 7: 300, 8: 350,9: 400, 10: 500}
	
	for work in Data.Database.Work:
		if work != 'no_work':
			
			if Skills[Data.Database.Study[Data.Database.Work[work]['Parent']]['Skill']] >= level_next_work[Data.Database.Work[work]['Level']] and Data.Database.Work[work]['Level'] == 1:
				if work not in WorkAvailable:
					WorkAvailable.append(work)
					Data.Game.create_message('work',work)
			
			if Data.Database.Work[work]['Parent'] == Data.Database.Work[work]['Parent'] and Data.Database.Work[work]['Level'] == Data.Database.Work[work]['Level'] + 1:
				pass
				#var next_work = job
					
					
	'''for work in WorkSummary:
		
			for job in Data.Database.Work:
				
					
					if Skills[Data.Database.Study[Data.Database.Work[work]['Parent']]['Skill']] >= level_next_work[Data.Database.Work[work]['Level']]:
						if work not in WorkAvailable:
							WorkAvailable.append(work)
							Data.Game.create_message('work',work)
					print(work, '  ->  ',job) '''
		
	print('WorkAvailable:    ',WorkAvailable)

func set_worksalary():
	for work in Data.Database.Work:
		if Data.Database.Study[Data.Database.Work[work]['Parent']]['Skill'] in Skills:
			var value = 1 + float( ( (Skills[Data.Database.Study[Data.Database.Work[work]['Parent']]['Skill']] / 100 ) / 100) )
			Data.Database.Work[work]['Salary'] = Data.Database.Work[work]['Salary Base'] * value

func increase_health(value: int) -> void:
	Health += value
	verify_health_happy()

func increase_happy(value: int) -> void:
	Happy += value
	verify_health_happy()

func set_health_happy():
	HappyDict['work'] = Data.Database.Work[Work]['Happy'] + HappyDict['study']
	if ShopItems['Food'] != '':
		HappyDict['food'] = Data.Database.Upgrades[ShopItems['Food']]['Happy']
		HealthDict['food'] = Data.Database.Upgrades[ShopItems['Food']]['Health']
	else:
		HappyDict['food'] = -5
		HealthDict['food'] = -5
	if ShopItems['Cloth'] != '':
		HappyDict['cloth'] = Data.Database.Upgrades[ShopItems['Cloth']]['Happy']
		HealthDict['cloth'] = Data.Database.Upgrades[ShopItems['Cloth']]['Health']
	else:
		HappyDict['cloth'] = -5
		HealthDict['cloth'] = -5
		
	if DiseaseName != '':
		HealthDict['virus'] = Data.Database.Sicks[DiseaseName]['Health']
		
	var high_value = 0
	for friend in Friends:
		if Friends[friend]['Friend'] >= high_value and Friends[friend]['Friend'] > 100:
			HappyDict['friends'] = Data.Database.Relations[Friends[friend]['Relationship']][1]
			high_value = Friends[friend]['Friend']
	
	HealthPerDay = 0
	HappyPerDay = 0
	for item in HealthDict.keys():
		HealthPerDay += HealthDict[item]
	for item in HappyDict.keys():
		HappyPerDay += HappyDict[item]

func health_house(rooms_dictionary):
	var tier_health = {'kitchen':-2,'bedroom':-2,'bath':-2}
	for room in rooms_dictionary:
		if room in tier_health:
			tier_health[room] = rooms_dictionary[room]["Tier"]
			tier_health[room] = ((tier_health[room] - 3) * 0.5)
	return tier_health

func change_health_happy():
	Health += HealthPerDay
	Happy += HappyPerDay
	if Immunity <= 0:
		if Data.probability(1) and DiseaseName == '':
			DiseaseName = Data.get_random_value(SickArray)
			DiseaseValue = 100
	Immunity -= 1
	#print(SickArray, '-', DiseaseName,' : ',DiseaseValue)
	verify_health_happy()

func verify_health_happy():
	if Health > 100:
		Health = 100
	if Health < 0:
		Health = 0
	if Happy > 100:
		Happy = 100
	if Happy < 0:
		Happy = 0
	if Immunity < 0:
		Immunity = 0
	if DiseaseValue <= 0:
		DiseaseValue =0 
		DiseaseName = ''

func set_upgrades():
	for item in Data.Database.Upgrades.keys():
		var parent = Data.Database.Upgrades[item]['Parent']
		var tier = Data.Database.Upgrades[item]['Tier']
		if parent not in Upgrades:
			Upgrades[parent] = {'Name':'','Value':0}
		if item in OwnUpgrades or item in OwnItems:
			if tier > Upgrades[parent]['Value']:
				Upgrades[parent]['Name'] = item
				Upgrades[parent]['Value'] = tier
	var dict_hours = {1:2,2:3,3:4,4:6,5:12}
	var dict_seconds = {0:30,1:20,2:15,3:10,4:6,5:3}
	if len(OwnUpgrades) != 0:
		for upgrade in OwnUpgrades:
			if Data.Database.Upgrades[upgrade]['Parent'] == 'Clic':
				Data.Game.AutomaticHours = dict_hours[Data.Database.Upgrades[upgrade]['Tier']]
			if Data.Database.Upgrades[upgrade]['Parent'] == 'Clock':
				Data.Game.AutomaticSeconds = dict_seconds[Data.Database.Upgrades[upgrade]['Tier']]

func meet_someone():
	#var Data.all_people = []
	#for people in Data.Game.People:
	#	if people not in Friends:
	#		all_people.append(people)
	print(Data.Game.People)
	var person = Data.get_random_value(Data.Game.People.keys())
	Friends[person] = {'Friend':0,'Love':randi_range(1,30),'Relationship':'Not','happy':0} 
	FriendsTimes[person] = {} #'speak':0,'joker':0,'secret':0,'flirting':0,'sweetheart':0,'love':0,'goto':0,'relation':0,'gift':0,'events':0,'break':0
	FriendsSecrets[person] = ['relation']
	print(Friends)
	return person
	
func set_house_status():
	#for house in player_data["houses"]:
	if len(Houses) != 0:
		for house in Houses:
			if Houses[house]["Status"] == "Paying" or Houses[house]["Status"] == "payingrent" or Houses[house]["Status"] == "payinglive":
				Houses[house]["Payments"] += 1
				if Houses[house]["Payments"] >= 365:
					if Houses[house]["Status"] == "Paying":
						Houses[house]["Status"] = "Own"
					if Houses[house]["Status"] == "payingrent":
						Houses[house]["Status"] = "inrent"
					if Houses[house]["Status"] == "payinglive":
						Houses[house]["Status"] = "live"

func set_moneyperday():
	MoneyPerDay = 0
	MoneyPerDayDetailed['AllIncome'] = 0
	MoneyPerDayDetailed['AllExpense'] = 0
	MoneyPerDayDetailed['Work'] = 0
	MoneyPerDayDetailed['Study'] = 0
	MoneyPerDayDetailed['Business'] = 0
	MoneyPerDayDetailed['Cashback'] = 0
	MoneyPerDayDetailed['Food'] = 0
	MoneyPerDayDetailed['Cloth'] = 0
	MoneyPerDayDetailed['Houses'] = 0
	MoneyPerDayDetailed['Investment'] = 0
	
	MoneyPerDayDetailed['Work'] = Data.Database.Work[Work]['Salary']
	MoneyPerDayDetailed['AllIncome'] += MoneyPerDayDetailed['Work']
	
	for Id in StudySummary.keys():
		if StudySummary[Id] > Data.Database.Study[Id]['Time']:
			MoneyPerDayDetailed['Study'] += Data.Database.Study[Id]['Cost']
	MoneyPerDayDetailed['AllExpense'] -= MoneyPerDayDetailed['Study']
	
	if len(Houses) != 0:
		for house in Houses:
			if Houses[house]["Status"] == "Rent":
				MoneyPerDayDetailed['Houses'] -= Houses[house]['CostRent']
			if Houses[house]['Status'] == 'Paying':
				var CostSale = Houses[house]['CostSale']
				var CostRent = 0
				if Houses[house]["Rentedby"] == 'NPC':
					CostRent = Houses[house]['CostRent']
				MoneyPerDayDetailed['Houses'] += (- CostSale + CostRent)
			if Houses[house]['Status'] == 'Own':
				if Houses[house]["Rentedby"] == 'NPC':
					MoneyPerDayDetailed['Houses'] += Houses[house]['CostRent']
	
	if ShopItems['Cloth'] != '':
		MoneyPerDayDetailed['Cloth'] = Data.Database.Upgrades[ShopItems['Cloth']]['Price']
	MoneyPerDayDetailed['AllExpense'] -= MoneyPerDayDetailed['Cloth']
	if ShopItems['Food'] != '':
		MoneyPerDayDetailed['Food'] = Data.Database.Upgrades[ShopItems['Food']]['Price']
	MoneyPerDayDetailed['AllExpense'] -= MoneyPerDayDetailed['Food']
	
	if MoneyPerDayDetailed['Houses'] < 0:
		MoneyPerDayDetailed['AllExpense'] += MoneyPerDayDetailed['Houses']
	else:
		MoneyPerDayDetailed['AllIncome'] += MoneyPerDayDetailed['Houses']
	
	MoneyPerDay = MoneyPerDayDetailed['AllIncome'] + MoneyPerDayDetailed['AllExpense']
