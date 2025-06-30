extends Resource

class_name StudyData 

@export var Name: String = ''
@export var Days: int = 0
@export var Cost: int = 0
@export var Happy: int = 0
@export var Level: int = 0
@export var Sequence: String = ''
@export var Skill: String = ''
@export var Parent: String = ''
@export var Picture: String = ''

func new_data(data_):
	Name = data_['Name']
	Days = data_['Time']
	Cost = data_['Cost']
	Happy = data_['Happy']
	Level = data_['Level']
	Sequence = data_['Seq']
	Skill = data_['Skill']
	Parent = data_['Parent']
	Picture = data_['Path']
	
	return Name
