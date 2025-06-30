extends Resource

class_name GameData

@export var Date: int = 1640995200
@export var LastDay: int = 0
@export var LastHour: int = 0
@export var Inflation: float = 0.3
@export var InflationData: Array = []
@export var PeriodFiscal: int = 30
@export var DaysFiscal: int = 0
@export var TrendFiscal: String = 'static'
@export var AutomaticSeconds: int = 0
@export var AutomaticHours: int = 1
@export var CurrentDate: String = 'dd/mm/yyyy'
@export var CurrentHour: String = '00:00'
@export var People: Dictionary = {}
@export var Study: Array[StudyData] = []
@export var Player: PlayerData
@export var HouseMarket: Dictionary = {}
@export var Countries: Array = ['Aurora','Grezul','Jade','Kalahari','Mares','Novara ']
@export var Messages: Dictionary = {}
@export var Tutorial: bool = false

func create_houses_market():
	HouseMarket = {}
	for search_level in range(1,6):
		var filtered_houses = []
		for house in Data.Database.Houses:
			if Data.Database.Houses[house]["Level"] == search_level:
				filtered_houses.append(house)
		for i in range(randi_range(2,4)):
			var new_id = int(str(search_level) + str(i))
			var temp_house = Data.get_random_value(filtered_houses)
			HouseMarket[new_id] = Data.Database.Houses[temp_house].duplicate(true) 
			HouseMarket[new_id]['Name'] = temp_house
			for room in HouseMarket[new_id]["Rooms"]:
				HouseMarket[new_id]["Rooms"][room]['Tier'] = randi_range(1,search_level)
			var new_array = house_appraiser(HouseMarket[new_id]["Rooms"])
			HouseMarket[new_id]["LevelRooms"] = new_array[0]
			HouseMarket[new_id]["Price"] = new_array[1]
			HouseMarket[new_id]["CostRent"] = new_array[2]
			HouseMarket[new_id]["CostSale"] = new_array[3]

func house_appraiser(content) -> Array:
	var count = 0.0
	var sum_tier = 0.0
	var level_furniture = 0.0
	var price_full = 0.0
	for room in content:
		var quantity = content[room]["Qty"]
		var tier = int(content[room]["Tier"])
		price_full += (Data.Database["Rooms"][room]["Tiers"][str(tier)] * quantity)
		count += 1
		sum_tier += tier
	if count != 0:
		level_furniture = (float(float(sum_tier)/float(count))) / 5
	else:
		level_furniture = 0
	var price_rent = roundi(((price_full * 0.65) )/ 364.0)
	var price_sale = roundi((price_full )/ 364.0)
	return [level_furniture,price_full,price_rent,price_sale]

func set_inflation():
	var options = ["high","static","low"]
	var options_weight = [0,0,0]
	var old_inflation_status = 0
	if DaysFiscal >= PeriodFiscal:
		PeriodFiscal = randi_range(30,60)
		DaysFiscal = 0
		if Inflation > 0.08:
			options_weight = [80,10,10]
		elif Inflation > 0.06:
			options_weight = [60,20,20]
		elif Inflation > -0.02 and Inflation < 0:
			options_weight = [20,20,60]
		elif Inflation < -0.05:
			options_weight = [10,10,80]
		else:
			options_weight = [30,40,30]
		TrendFiscal = Data.get_random_value_weight(options,options_weight)
	var adjust = randf_range(0.000000,0.000333)
	if TrendFiscal == "static":
		if old_inflation_status == "high":
			adjust = adjust * 1
			old_inflation_status = "low"
		else:
			adjust = adjust * -1
			old_inflation_status = "high"
	if TrendFiscal == "high":
		adjust = adjust * 1
	if TrendFiscal == "low":
		adjust = adjust * -1
	Inflation += adjust
	InflationData.append(Inflation)
	if len(InflationData) > 30:
		InflationData.remove_at(0)
	DaysFiscal += 1
	
func create_message(area,item):
	var area_sender = {'study':'grezul_university_','work':'linkin_'}
	var icon_area = {'study':'res://Assets/Images/Menu/study.png','work':'res://Assets/Images/Menu/work.png'}
	var message_sender = {'study':'study_completed_','work':'work_available_'}
	
	if area == 'study':
		item = Data.Database.Study[item]['Name']
	
	var temp_message = {'area':area_sender[area],'icon':icon_area[area],'message':message_sender[area],'item':item,'status':true,'appear':true}
	var position = len(Messages) + 1
	Messages[position] = temp_message
