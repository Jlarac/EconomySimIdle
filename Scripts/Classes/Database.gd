extends Resource

class_name Tables 

@export var Study: Dictionary = {
	"basic":{"Name":"basic_study","Time":0,"Cost":0,"Happy":0,"Level":1,"Seq":"","Skill":"basic","Parent":"basic","Path":"res://Assets/Images/Study/basic.png"},
	"business":{"Name":"business_study","Time":15552000,"Cost":100,"Happy":-30,"Level":10,"Seq":"basic","Skill":"math","Parent":"speciality","Path":"res://Assets/Images/Study/business.png"},
	
	"driver":{"Name":"driver_study","Time":864000,"Cost":30,"Happy":-10,"Level":2,"Seq":"","Skill":"drive","Parent":"basic","Path":"res://Assets/Images/Study/driver.png"},
	"heavy":{"Name":"heavy_study","Time":432000,"Cost":50,"Happy":-15,"Level":3,"Seq":"driver","Skill":"drive","Parent":"speciality","Path":"res://Assets/Images/Study/heavy.png"},
	
	"technician":{"Name":"technician_study","Time":4320000,"Happy":-20,"Cost":40,"Level":4,"Seq":"","Skill":"math","Parent":"basic","Path":"res://Assets/Images/Study/technician.png"},
	"engineer":{"Name":"engineer_study","Time":15552000,"Cost":100,"Happy":-30,"Level":16,"Seq":"technician","Skill":"math","Parent":"speciality","Path":"res://Assets/Images/Study/engineer.png"},
	
	"people":{"Name":"people_study","Time":1296000,"Cost":60,"Happy":-20,"Level":7,"Seq":"","Skill":"social","Parent":"basic","Path":"res://Assets/Images/Study/people.png"},
	"politician":{"Name":"politician_study","Time":7776000,"Cost":100,"Happy":-30,"Level":17,"Seq":"people","Skill":"social","Parent":"speciality","Path":"res://Assets/Images/Study/politician.png"},
	
	"medicine":{"Name":"medicine_study","Time":15552000,"Cost":100,"Happy":-20,"Level":11,"Seq":"","Skill":"medicine","Parent":"basic","Path":"res://Assets/Images/Study/medicine.png"},
	"specialist":{"Name":"specialist_study","Time":7776000,"Cost":200,"Happy":-30,"Level":12,"Seq":"medicine","Skill":"medicine","Parent":"speciality","Path":"res://Assets/Images/Study/specialist.png"},
	
	"navegation":{"Name":"navegation_study","Time":1296000,"Cost":30,"Happy":-20,"Level":5,"Seq":"","Skill":"marine","Parent":"basic","Path":"res://Assets/Images/Study/nav.png"},
	"marine":{"Name":"marine_study","Time":5184000,"Cost":60,"Happy":-20,"Level":5,"Seq":"navegation","Skill":"marine","Parent":"speciality","Path":"res://Assets/Images/Study/marine.png"},
	
	"aero":{"Name":"aero_study","Time":1296000,"Cost":40,"Happy":-25,"Level":5,"Seq":"","Skill":"pilot","Parent":"basic","Path":"res://Assets/Images/Study/aero.png"},
	"pilot":{"Name":"pilot_study","Time":5184000,"Cost":70,"Happy":-30,"Level":6,"Seq":"aero","Skill":"pilot","Parent":"speciality","Path":"res://Assets/Images/Study/pilot.png"},
	
	"kitchen":{"Name":"kitchen_study","Time":1728000,"Cost":50,"Happy":-15,"Level":5,"Seq":"","Skill":"gastronomy","Parent":"basic","Path":"res://Assets/Images/Study/kitchen.png"},
	"gastronomy":{"Name":"gastronomy_study","Time":15552000,"Cost":100,"Happy":-28,"Level":9,"Seq":"kitchen","Skill":"gastronomy","Parent":"speciality","Path":"res://Assets/Images/Study/gastronomy.png"},
	
	
	"law":{"Name":"law_study","Time":3456000,"Cost":45,"Happy":-25,"Level":5,"Seq":"","Skill":"law","Parent":"basic","Path":"res://Assets/Images/Study/law.png"},
	"lawyer":{"Name":"lawyer_study","Time":15552000,"Cost":100,"Happy":-30,"Level":13,"Seq":"law","Skill":"law","Parent":"speciality","Path":"res://Assets/Images/Study/lawyer.png"},
	
	"finance":{"Name":"finance_study","Time":1296000,"Cost":25,"Happy":-10,"Level":5,"Seq":"","Skill":"math","Parent":"basic","Path":"res://Assets/Images/Study/finance.png"},
	"account":{"Name":"account_study","Time":15552000,"Cost":100,"Happy":-20,"Level":14,"Seq":"finance","Skill":"math","Parent":"speciality","Path":"res://Assets/Images/Study/account.png"},
	
	"draw":{"Name":"draw_study","Time":1296000,"Cost":30,"Happy":-5,"Level":5,"Seq":"","Skill":"draw","Parent":"basic","Path":"res://Assets/Images/Study/draw.png"},
	"architect":{"Name":"architect_study","Time":15552000,"Cost":100,"Happy":-30,"Level":15,"Seq":"draw","Skill":"draw","Parent":"speciality","Path":"res://Assets/Images/Study/architect.png"},
	
	"phisic":{"Name":"phisic_study","Time":2592000,"Cost":40,"Happy":-18,"Level":5,"Seq":"","Skill":"math","Parent":"basic","Path":"res://Assets/Images/Study/phisic.png"},
	"science":{"Name":"science_study","Time":15552000,"Cost":100,"Happy":-29,"Level":18,"Seq":"phisic","Skill":"math","Parent":"speciality","Path":"res://Assets/Images/Study/science.png"},
	
	"paint":{"Name":"paint_study","Time":7776000,"Cost":60,"Happy":-8,"Level":8,"Seq":"","Skill":"paint","Parent":"art","Path":"res://Assets/Images/Study/paint.png"},
	"guitar":{"Name":"guitar_study","Time":7776000,"Cost":80,"Happy":-6,"Level":8,"Seq":"","Skill":"guitar","Parent":"art","Path":"res://Assets/Images/Study/guitar.png"},
	"piano":{"Name":"piano_study","Time":7776000,"Cost":180,"Happy":-10,"Level":8,"Seq":"","Skill":"piano","Parent":"art","Path":"res://Assets/Images/Study/piano.png"},
	"saxofon":{"Name":"saxofon_study","Time":7776000,"Cost":90,"Happy":-9,"Level":8,"Seq":"","Skill":"saxofon","Parent":"art","Path":"res://Assets/Images/Study/saxofon.png"},
	"violin":{"Name":"violin_study","Time":7776000,"Cost":140,"Happy":-12,"Level":8,"Seq":"","Skill":"violin","Parent":"art","Path":"res://Assets/Images/Study/violin.png"},
	"drums":{"Name":"drums_study","Time":7776000,"Cost":40,"Happy":-9,"Level":8,"Seq":"","Skill":"drums","Parent":"art","Path":"res://Assets/Images/Study/drums.png"},
	"sing":{"Name":"sing_study","Time":7776000,"Cost":130,"Happy":-4,"Level":8,"Seq":"","Skill":"sing","Parent":"art","Path":"res://Assets/Images/Study/sing.png"},
	"acting":{"Name":"acting_study","Time":7776000,"Cost":200,"Happy":-5,"Level":8,"Seq":"","Skill":"acting","Parent":"art","Path":"res://Assets/Images/Study/acting.png"},
	
	"football":{"Name":"football_study","Time":7776000,"Cost":120,"Happy":-12,"Level":17,"Seq":"","Skill":"football","Parent":"sport","Path":"res://Assets/Images/Study/football.png"},
	"soccer":{"Name":"soccer_study","Time":7776000,"Cost":160,"Happy":-25,"Level":17,"Seq":"","Skill":"soccer","Parent":"sport","Path":"res://Assets/Images/Study/soccer.png"},
	"basquetball":{"Name":"basquetball_study","Time":7776000,"Cost":87,"Happy":-16,"Level":17,"Seq":"","Skill":"basquetball","Parent":"sport","Path":"res://Assets/Images/Study/basquetball.png"},
	"voleiball":{"Name":"voleiball_study","Time":7776000,"Cost":95,"Happy":-9,"Level":17,"Seq":"","Skill":"voleiball","Parent":"sport","Path":"res://Assets/Images/Study/voleiball.png"},
	"tenis":{"Name":"tenis_study","Time":7776000,"Cost":170,"Happy":-14,"Level":17,"Seq":"","Skill":"tenis","Parent":"sport","Path":"res://Assets/Images/Study/tenis.png"},
	"golf":{"Name":"golf_study","Time":7776000,"Cost":190,"Happy":-12,"Level":17,"Seq":"","Skill":"golf","Parent":"sport","Path":"res://Assets/Images/Study/golf.png"}
}

@export var Work: Dictionary = {
	"no_work": {"Name": "no_work", "Salary Base": 0, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 0, "Level": 0, "Health": 0,"Happy": 5, "Path": "res://Assets/Images/Menu/Business/jobless.png"},
	
	"cleaning_work": {"Name": "cleaning_work", "Salary Base": 50, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 10, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"food_delivery_driver": {"Name": "food_delivery_driver", "Salary Base": 100, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"maintenance_technician": {"Name": "maintenance_technician", "Salary Base": 110, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"navigation_student": {"Name": "navigation_student", "Salary Base": 108, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"aviation_student": {"Name": "aviation_student", "Salary Base": 109, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"fine_arts_student": {"Name": "fine_arts_student", "Salary Base": 90, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"kitchen_helper": {"Name": "kitchen_helper", "Salary Base": 115, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"medical_student": {"Name": "medical_student", "Salary Base": 120, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"legal_intern": {"Name": "legal_intern", "Salary Base": 118, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"accounting_assistant": {"Name": "accounting_assistant", "Salary Base": 119, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"design_assistant": {"Name": "design_assistant", "Salary Base": 112, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"engineering_intern": {"Name": "engineering_intern", "Salary Base": 121, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"political_assistant": {"Name": "political_assistant", "Salary Base": 80, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	"research_assistant": {"Name": "research_assistant", "Salary Base": 130, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 1, "Health": 0,"Happy": -2, "Path": "res://Assets/Images/Study/basic.png"},
	#"street_busker": {"Name": "Street Busker","Salary Base": 50,"Salary": 0,"Parent": "guitar","Study": "Basic Chords","Seq": "","Days": 0,"Level": 1,"Health": 0,"Happy": 1,"Path": "res://Assets/Images/Jobs/street_busker.png"},
	
	
	"warehouse_helper": {"Name": "warehouse_helper", "Salary Base": 60, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 20, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"package_delivery_driver": {"Name": "package_delivery_driver", "Salary Base": 110, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"support_technician": {"Name": "support_technician", "Salary Base": 135, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"marina_intern": {"Name": "marina_intern", "Salary Base": 0, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"private_pilot": {"Name": "private_pilot", "Salary Base": 50, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"emerging_artist": {"Name": "emerging_artist", "Salary Base": 20, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"junior_cook": {"Name": "junior_cook", "Salary Base": 25, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"intern_doctor": {"Name": "intern_doctor", "Salary Base": 0, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"junior_lawyer": {"Name": "junior_lawyer", "Salary Base": 40, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"junior_accountant": {"Name": "junior_accountant", "Salary Base": 40, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"junior_designer": {"Name": "junior_designer", "Salary Base": 40, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"junior_engineer": {"Name": "junior_engineer", "Salary Base": 40, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"political_researcher": {"Name": "political_researcher", "Salary Base": 40, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"junior_researcher": {"Name": "junior_researcher", "Salary Base": 40, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 2, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"construction_worker": {"Name": "construction_worker", "Salary Base": 70, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 30, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"taxi_driver": {"Name": "taxi_driver", "Salary Base": 130, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"repair_technician": {"Name": "repair_technician", "Salary Base": 40, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"sailor": {"Name": "sailor", "Salary Base": 30, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"regional_airline_pilot": {"Name": "regional_airline_pilot", "Salary Base": 60, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"illustrator_designer": {"Name": "illustrator_designer", "Salary Base": 30, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"cook": {"Name": "cook", "Salary Base": 30, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"resident_doctor": {"Name": "resident_doctor", "Salary Base": 0, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"defense_lawyer": {"Name": "defense_lawyer", "Salary Base": 60, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"payroll_accountant": {"Name": "payroll_accountant", "Salary Base": 45, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"junior_architect": {"Name": "junior_architect", "Salary Base": 50, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"design_engineer": {"Name": "design_engineer", "Salary Base": 50, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"campaign_consultant": {"Name": "campaign_consultant", "Salary Base": 50, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"senior_researcher": {"Name": "senior_researcher", "Salary Base": 50, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 3, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"waiter": {"Name": "waiter", "Salary Base": 80, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 30, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"driver_trainer": {"Name": "driver_trainer", "Salary Base": 150, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"electrician_technician": {"Name": "electrician_technician", "Salary Base": 45, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"small_boat_pilot": {"Name": "small_boat_pilot", "Salary Base": 35, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"cargo_pilot": {"Name": "cargo_pilot", "Salary Base": 65, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"mixed_media_artist": {"Name": "mixed_media_artist", "Salary Base": 25, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"chef_de_partie": {"Name": "chef_de_partie", "Salary Base": 40, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"specialist_doctor": {"Name": "specialist_doctor", "Salary Base": 100, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"corporate_lawyer": {"Name": "corporate_lawyer", "Salary Base": 70, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"accounts_payable_accountant": {"Name": "accounts_payable_accountant", "Salary Base": 50, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"senior_architect": {"Name": "senior_architect", "Salary Base": 60, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"project_engineer": {"Name": "project_engineer", "Salary Base": 60, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"legislative_advisor": {"Name": "legislative_advisor", "Salary Base": 60, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"laboratory_scientist": {"Name": "laboratory_scientist", "Salary Base": 60, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 4, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"security_guard": {"Name": "security_guard", "Salary Base": 90, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 30, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"school_transport_driver": {"Name": "school_transport_driver", "Salary Base": 35, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"mechanical_technician": {"Name": "mechanical_technician", "Salary Base": 45, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"tour_boat_captain": {"Name": "tour_boat_captain", "Salary Base": 50, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"airline_pilot": {"Name": "airline_pilot", "Salary Base": 70, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"gallery_curator": {"Name": "gallery_curator", "Salary Base": 40, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"sous_chef": {"Name": "sous_chef", "Salary Base": 50, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"emergency_physician": {"Name": "emergency_physician", "Salary Base": 90, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"family_lawyer": {"Name": "family_lawyer", "Salary Base": 65, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"accounts_receivable_accountant": {"Name": "accounts_receivable_accountant", "Salary Base": 50, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"design_consultant": {"Name": "design_consultant", "Salary Base": 70, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"senior_engineer": {"Name": "senior_engineer", "Salary Base": 70, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"local_politician": {"Name": "local_politician", "Salary Base": 55, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"field_scientist": {"Name": "field_scientist", "Salary Base": 65, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 5, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"private_security_driver": {"Name": "private_security_driver", "Salary Base": 100, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 40, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"public_service_driver": {"Name": "public_service_driver", "Salary Base": 40, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"network_technician": {"Name": "network_technician", "Salary Base": 50, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"yacht_pilot": {"Name": "yacht_pilot", "Salary Base": 60, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"flight_instructor": {"Name": "flight_instructor", "Salary Base": 50, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"recognized_artist": {"Name": "recognized_artist", "Salary Base": 50, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"executive_chef": {"Name": "executive_chef", "Salary Base": 60, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"family_physician": {"Name": "family_physician", "Salary Base": 85, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"senior_lawyer": {"Name": "senior_lawyer", "Salary Base": 80, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"tax_accountant": {"Name": "tax_accountant", "Salary Base": 60, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"sustainability_specialist": {"Name": "sustainability_specialist", "Salary Base": 65, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"engineering_consultant": {"Name": "engineering_consultant", "Salary Base": 75, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"senator_representative": {"Name": "senator_representative", "Salary Base": 80, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"university_professor": {"Name": "university_professor", "Salary Base": 70, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 6, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"sales_assistant": {"Name": "sales_assistant", "Salary Base": 110, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 40, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"bus_driver": {"Name": "bus_driver", "Salary Base": 50, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"hvac_technician": {"Name": "hvac_technician", "Salary Base": 50, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"cargo_ship_captain": {"Name": "cargo_ship_captain", "Salary Base": 70, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"business_jet_pilot": {"Name": "business_jet_pilot", "Salary Base": 70, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"arts_teacher": {"Name": "arts_teacher", "Salary Base": 45, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"gastronomic_consultant": {"Name": "gastronomic_consultant", "Salary Base": 70, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"medical_researcher": {"Name": "medical_researcher", "Salary Base": 80, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"firm_partner": {"Name": "firm_partner", "Salary Base": 100, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"senior_accountant": {"Name": "senior_accountant", "Salary Base": 70, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"urban_architect": {"Name": "urban_architect", "Salary Base": 75, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"engineering_manager": {"Name": "engineering_manager", "Salary Base": 85, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"minister_governor": {"Name": "minister_governor", "Salary Base": 90, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"scientific_consultant": {"Name": "scientific_consultant", "Salary Base": 80, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 7, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"machinery_operator": {"Name": "machinery_operator", "Salary Base": 120, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 50, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"cargo_vehicle_driver": {"Name": "cargo_vehicle_driver", "Salary Base": 45, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"laboratory_technician": {"Name": "laboratory_technician", "Salary Base": 40, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"passenger_ship_pilot": {"Name": "passenger_ship_pilot", "Salary Base": 65, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"helicopter_pilot": {"Name": "helicopter_pilot", "Salary Base": 60, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"art_historian": {"Name": "art_historian", "Salary Base": 40, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"restaurant_owner": {"Name": "restaurant_owner", "Salary Base": 80, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"medical_professor": {"Name": "medical_professor", "Salary Base": 70, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"supreme_court_judge": {"Name": "supreme_court_judge", "Salary Base": 120, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"controller": {"Name": "controller", "Salary Base": 80, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"project_director": {"Name": "project_director", "Salary Base": 90, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"engineering_researcher": {"Name": "engineering_researcher", "Salary Base": 80, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"ambassador": {"Name": "ambassador", "Salary Base": 100, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"research_group_leader": {"Name": "research_group_leader", "Salary Base": 90, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 8, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"event_worker": {"Name": "event_worker", "Salary Base": 130, "Salary": 0, "Parent":"basic", "Study": "", "Seq": "", "Days": 50, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"special_cargo_driver": {"Name": "special_cargo_driver", "Salary Base": 50, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"production_technician": {"Name": "production_technician", "Salary Base": 35, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"navigation_instructor": {"Name": "navigation_instructor", "Salary Base": 50, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"cargo_aircraft_pilot": {"Name": "cargo_aircraft_pilot", "Salary Base": 65, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"art_commissioner": {"Name": "art_commissioner", "Salary Base": 50, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"cooking_instructor": {"Name": "cooking_instructor", "Salary Base": 50, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"medical_director": {"Name": "medical_director", "Salary Base": 120, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"supreme_court_minister": {"Name": "supreme_court_minister", "Salary Base": 130, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"financial_director": {"Name": "financial_director", "Salary Base": 100, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"architecture_professor": {"Name": "architecture_professor", "Salary Base": 70, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"engineering_professor": {"Name": "engineering_professor", "Salary Base": 70, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"political_party_leader": {"Name": "political_party_leader", "Salary Base": 110, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"research_institute_director": {"Name": "research_institute_director", "Salary Base": 100, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 9, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	
	"shift_supervisor": {"Name": "shift_supervisor", "Salary Base": 150, "Salary": 0, "Parent": "basic", "Study": "", "Seq": "", "Days": 60, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"f1_driver": {"Name": "f1_driver", "Salary Base": 100, "Salary": 0, "Parent": "driver", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"technical_supervisor": {"Name": "technical_supervisor", "Salary Base": 60, "Salary": 0, "Parent": "technician", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"research_vessel_captain": {"Name": "research_vessel_captain", "Salary Base": 80, "Salary": 0, "Parent": "marine", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"test_pilot": {"Name": "test_pilot", "Salary Base": 80, "Salary": 0, "Parent": "pilot", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"international_artist": {"Name": "international_artist", "Salary Base": 60, "Salary": 0, "Parent": "paint", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"gastronomic_critic": {"Name": "gastronomic_critic", "Salary Base": 45, "Salary": 0, "Parent": "gastronomy", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"public_health_consultant": {"Name": "public_health_consultant", "Salary Base": 100, "Salary": 0, "Parent": "medicine", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"supreme_court_president": {"Name": "supreme_court_president", "Salary Base": 140, "Salary": 0, "Parent": "lawyer", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"central_bank_president": {"Name": "central_bank_president", "Salary Base": 120, "Salary": 0, "Parent": "account", "Study": "", "Seq": "", "Days": 10, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"architecture_researcher": {"Name": "architecture_researcher", "Salary Base": 80, "Salary": 0, "Parent": "architect", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"innovation_director": {"Name": "innovation_director", "Salary Base": 100, "Salary": 0, "Parent": "engineer", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"president": {"Name": "president", "Salary Base": 150, "Salary": 0, "Parent": "politician", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"},
	"astronaut": {"Name": "astronaut", "Salary Base": 150, "Salary": 0, "Parent": "science", "Study": "", "Seq": "", "Days": 0, "Level": 10, "Health": 0,"Happy": 0, "Path": "res://Assets/Images/Study/basic.png"}
}

@export var Personalities: Dictionary = {
	"outgoing": {"Parent": "friend", "Name": "basic", "Impact": 2, "Path": "res://Resources/Images/Skills/laugh.png"},
	"social": {"Parent": "friend", "Name": "driver", "Impact": 1, "Path": "res://Resources/Images/Skills/nice.png"},
	"introvert": {"Parent": "friend", "Name": "technician", "Impact": 0.5, "Path": "res://Resources/Images/Skills/introvert.png"},
	"romantic": {"Parent": "love", "Name": "technician", "Impact": 2, "Path": "res://Resources/Images/Skills/love.png"},
	"gentle": {"Parent": "love", "Name": "marine", "Impact": 1, "Path": "res://Resources/Images/Skills/loveless.png"},
	"aromantic": {"Parent": "love", "Name": "pilot", "Impact": 0.5, "Path": "res://Resources/Images/Skills/aromantic.png"},
	"perfeccionist": {"Parent": "learn", "Name": "art", "Impact": 2, "Path": "res://Resources/Images/Skills/perfect.png"},
	"moderate": {"Parent": "learn", "Name": "gastronomy", "Impact": 1, "Path": "res://Resources/Images/Skills/good.png"},
	"carefree": {"Parent": "learn", "Name": "medicine", "Impact": 0.5, "Path": "res://Resources/Images/Skills/sleep.png"}
}

@export var Photos: Dictionary = {
	"girl1": {"Path":"res://Assets/Images/People/girl1.png","Genre":"F"},
	"guy1": {"Path":"res://Assets/Images/People/guy1.png","Genre":"M"},
	"girl2": {"Path":"res://Assets/Images/People/girl2.png","Genre":"F"},
	"guy2": {"Path":"res://Assets/Images/People/guy2.png","Genre":"M"},
	"girl3": {"Path":"res://Assets/Images/People/girl3.png","Genre":"F"},
	"guy3": {"Path":"res://Assets/Images/People/guy3.png","Genre":"M"},
	"girl4": {"Path":"res://Assets/Images/People/girl4.png","Genre":"F"},
	"guy4": {"Path":"res://Assets/Images/People/guy4.png","Genre":"M"},
	"girl5": {"Path":"res://Assets/Images/People/girl5.png","Genre":"F"},
	"guy5": {"Path":"res://Assets/Images/People/guy5.png","Genre":"M"},
	"girl6": {"Path":"res://Assets/Images/People/girl6.png","Genre":"F"},
	"guy6": {"Path":"res://Assets/Images/People/guy6.png","Genre":"M"},
	"girl7": {"Path":"res://Assets/Images/People/girl7.png","Genre":"F"},
	"guy7": {"Path":"res://Assets/Images/People/guy7.png","Genre":"M"},
	"girl8": {"Path":"res://Assets/Images/People/girl8.png","Genre":"F"},
	"guy8": {"Path":"res://Assets/Images/People/guy8.png","Genre":"M"},
	"girl9": {"Path":"res://Assets/Images/People/girl9.png","Genre":"F"},
	"guy9": {"Path":"res://Assets/Images/People/guy9.png","Genre":"M"},
	"girl10": {"Path":"res://Assets/Images/People/girl10.png","Genre":"F"},
	"guy10": {"Path":"res://Assets/Images/People/guy10.png","Genre":"M"},
	"girl11": {"Path":"res://Assets/Images/People/girl11.png","Genre":"F"},
	"guy11": {"Path":"res://Assets/Images/People/guy11.png","Genre":"M"},
	"girl12": {"Path":"res://Assets/Images/People/girl12.png","Genre":"F"},
	"guy12": {"Path":"res://Assets/Images/People/guy12.png","Genre":"M"},
	"girl13": {"Path":"res://Assets/Images/People/girl13.png","Genre":"F"},
	"guy13": {"Path":"res://Assets/Images/People/guy13.png","Genre":"M"},
	"girl14": {"Path":"res://Assets/Images/People/girl14.png","Genre":"F"},
	"guy14": {"Path":"res://Assets/Images/People/guy14.png","Genre":"M"},
	"girl15": {"Path":"res://Assets/Images/People/girl15.png","Genre":"F"},
	"guy15": {"Path":"res://Assets/Images/People/guy15.png","Genre":"M"}
}

@export var Skills: Dictionary = {
	"basic":"res://Assets/Images/Study/basic.png",
	"drive":"res://Assets/Images/Study/driver_.png",
	"math":"res://Assets/Images/Study/math.png",
	"marine":"res://Assets/Images/Study/marine.png",
	"pilot":"res://Assets/Images/Study/pilot.png",
	"social":"res://Assets/Images/Study/people.png",
	"paint":"res://Assets/Images/Study/paint.png",
	"guitar":"res://Assets/Images/Study/guitar.png",
	"piano":"res://Assets/Images/Study/piano.png",
	"saxofon":"res://Assets/Images/Study/saxofon.png",
	"violin":"res://Assets/Images/Study/violin.png",
	"drums":"res://Assets/Images/Study/drums.png",
	"sing":"res://Assets/Images/Study/sing.png",
	"acting":"res://Assets/Images/Study/acting.png",
	"gastronomy":"res://Assets/Images/Study/gastronomy.png",
	"business":"res://Assets/Images/Study/business.png",
	"medicine":"res://Assets/Images/Study/medicine.png",
	"law":"res://Assets/Images/Study/lawyer.png",
	"draw":"res://Assets/Images/Study/architect.png",
	"football":"res://Assets/Images/Study/football.png",
	"soccer":"res://Assets/Images/Study/soccer.png",
	"basquetball":"res://Assets/Images/Study/basquetball.png",
	"voleiball":"res://Assets/Images/Study/voleiball.png",
	"tenis":"res://Assets/Images/Study/tenis.png",
	"golf":"res://Assets/Images/Study/golf.png"
}

@export var Upgrades: Dictionary = {
	"upgrade_card_0": {"Path":"res://Assets/Images/Upgrades/card.png","Price": 0,"Kind":"Upgrade","Type":"unique","Parent":"Card","Tier": 0,"Impact":0,"Name":"card_basic_","Health":0,"Happy":0,"Desc":""},
	"upgrade_card_1": {"Path":"res://Assets/Images/Upgrades/card.png","Price": 100,"Kind":"Upgrade","Type":"unique","Parent":"Card","Tier": 1,"Impact":0,"Name":"card_basic_","Health":0,"Happy":0,"Desc":""},
	"upgrade_card_2": {"Path":"res://Assets/Images/Upgrades/card.png","Price": 1000,"Kind":"Upgrade","Type":"unique","Parent":"Card","Tier": 2,"Impact":0,"Name":"card_basic_","Health":0,"Happy":0,"Desc":""},
	"upgrade_card_3": {"Path":"res://Assets/Images/Upgrades/card.png","Price": 10000,"Kind":"Upgrade","Type":"unique","Parent":"Card","Tier": 3,"Impact":0,"Name":"card_basic_","Health":0,"Happy":0,"Desc":""},
	"upgrade_card_4": {"Path":"res://Assets/Images/Upgrades/card.png","Price": 100000,"Kind":"Upgrade","Type":"unique","Parent":"Card","Tier": 4,"Impact":0,"Name":"card_basic_","Health":0,"Happy":0,"Desc":""},
	"upgrade_card_5": {"Path":"res://Assets/Images/Upgrades/card.png","Price": 1000000,"Kind":"Upgrade","Type":"unique","Parent":"Card","Tier": 5,"Impact":0,"Name":"card_basic_","Health":0,"Happy":0,"Desc":""},
	
	"personal_cloth_1": {"Path":"res://Assets/Images/Upgrades/cloth1.png","Price": 1,"Kind":"Recurrent","Type":"recurrent","Parent":"Cloth","Tier": 1,"Impact":1,"Name":"used_cloth_","Health":-2,"Happy":-5,"Desc":""},
	"personal_cloth_2": {"Path":"res://Assets/Images/Upgrades/cloth2.png","Price": 5,"Kind":"Recurrent","Type":"recurrent","Parent":"Cloth","Tier": 2,"Impact":2,"Name":"cheap_cloth_","Health":-1,"Happy":-3,"Desc":""},
	"personal_cloth_3": {"Path":"res://Assets/Images/Upgrades/cloth3.png","Price": 40,"Kind":"Recurrent","Type":"recurrent","Parent":"Cloth","Tier": 3,"Impact":3,"Name":"imitation_cloth_","Health":0,"Happy":0,"Desc":""},
	"personal_cloth_4": {"Path":"res://Assets/Images/Upgrades/cloth4.png","Price": 450,"Kind":"Recurrent","Type":"recurrent","Parent":"Cloth","Tier": 4,"Impact":4,"Name":"branded_cloth_","Health":1,"Happy":3,"Desc":""},
	"personal_cloth_5": {"Path":"res://Assets/Images/Upgrades/cloth5.png","Price": 1000,"Kind":"Recurrent","Type":"recurrent","Parent":"Cloth","Tier": 5,"Impact":5,"Name":"tailored_cloth_","Health":2,"Happy":5,"Desc":""},
	
	"personal_food_1": {"Path":"res://Assets/Images/Upgrades/food1.png","Price": 15,"Kind":"Recurrent","Type":"recurrent","Parent":"Food","Tier": 1,"Impact":1,"Name":"soup_food_","Health":-1,"Happy":3,"Desc":""},
	"personal_food_2": {"Path":"res://Assets/Images/Upgrades/food2.png","Price": 30,"Kind":"Recurrent","Type":"recurrent","Parent":"Food","Tier": 2,"Impact":2,"Name":"fast_food_","Health":-3,"Happy":20,"Desc":""},
	"personal_food_3": {"Path":"res://Assets/Images/Upgrades/food3.png","Price": 80,"Kind":"Recurrent","Type":"recurrent","Parent":"Food","Tier": 3,"Impact":3,"Name":"home_food_","Health":1,"Happy":5,"Desc":""},
	"personal_food_4": {"Path":"res://Assets/Images/Upgrades/food4.png","Price": 200,"Kind":"Recurrent","Type":"recurrent","Parent":"Food","Tier": 4,"Impact":4,"Name":"vegan_food_","Health":2,"Happy":10,"Desc":""},
	"personal_food_5": {"Path":"res://Assets/Images/Upgrades/food5.png","Price": 1200,"Kind":"Recurrent","Type":"recurrent","Parent":"Food","Tier": 5,"Impact":5,"Name":"chef_food_","Health":3,"Happy":20,"Desc":""},
	
	"personal_medicine_1": {"Path":"res://Assets/Images/Upgrades/medicine1.png","Price": 10,"Kind":"Medicine","Type":"recurrent_medicine","Parent":"Medicine","Tier": 1,"Impact":1,"Name":"generic_medicine_","Health":2,"Happy":0,"Desc":""},
	"personal_medicine_2": {"Path":"res://Assets/Images/Upgrades/medicine2.png","Price": 20,"Kind":"Medicine","Type":"recurrent_medicine","Parent":"Medicine","Tier": 2,"Impact":2,"Name":"oldpatent_medicine_","Health":5,"Happy":0,"Desc":""},
	"personal_medicine_3": {"Path":"res://Assets/Images/Upgrades/medicine3.png","Price": 30,"Kind":"Medicine","Type":"recurrent_medicine","Parent":"Medicine","Tier": 3,"Impact":3,"Name":"patent_medicine_","Health":10,"Happy":0,"Desc":""},
	"personal_medicine_4": {"Path":"res://Assets/Images/Upgrades/medicine4.png","Price": 40,"Kind":"Medicine","Type":"recurrent_medicine","Parent":"Medicine","Tier": 4,"Impact":4,"Name":"specialist_medicine_","Health":15,"Happy":0,"Desc":""},
	"personal_medicine_5": {"Path":"res://Assets/Images/Upgrades/medicine5.png","Price": 60,"Kind":"Medicine","Type":"recurrent_medicine","Parent":"Medicine","Tier": 5,"Impact":5,"Name":"multivitamin_medicine_","Health":20,"Happy":0,"Desc":""},
	
	"upgrade_agenda_1": {"Path":"res://Assets/Images/Upgrades/agenda1.png","Price": 250,"Kind":"Upgrade","Type":"unique","Parent":"Clic","Tier": 1,"Impact":1,"Name":"normal_book_","Health":0,"Happy":0,"Desc":"improve_hours_two"},
	"upgrade_agenda_2": {"Path":"res://Assets/Images/Upgrades/agenda2.png","Price": 500,"Kind":"Upgrade","Type":"unique","Parent":"Clic","Tier": 2,"Impact":2,"Name":"normal_agenda_","Health":0,"Happy":0,"Desc":"improve_hours_three"},
	"upgrade_agenda_3": {"Path":"res://Assets/Images/Upgrades/agenda3.png","Price": 1000,"Kind":"Upgrade","Type":"unique","Parent":"Clic","Tier": 3,"Impact":3,"Name":"lether_agenda_","Health":0,"Happy":0,"Desc":"improve_hours_four"},
	"upgrade_agenda_4": {"Path":"res://Assets/Images/Upgrades/agenda4.png","Price": 2000,"Kind":"Upgrade","Type":"unique","Parent":"Clic","Tier": 4,"Impact":4,"Name":"executive_agenda_","Health":0,"Happy":0,"Desc":"improve_hours_six"},
	"upgrade_agenda_5": {"Path":"res://Assets/Images/Upgrades/agenda5.png","Price": 4000,"Kind":"Upgrade","Type":"unique","Parent":"Clic","Tier": 5,"Impact":5,"Name":"digital_agenda_","Health":0,"Happy":0,"Desc":"improve_hours_twelve"},
	
	"upgrade_clock_0": {"Path":"res://Assets/Images/Upgrades/clock1.png","Price": 0,"Kind":"Upgrade","Type":"unique","Parent":"Clock","Tier": 0,"Impact":0,"Name":"timer_clock_","Health":0,"Happy":0,"Desc":"improve_seconds_cero"},
	"upgrade_clock_1": {"Path":"res://Assets/Images/Upgrades/clock1.png","Price": 50,"Kind":"Upgrade","Type":"unique","Parent":"Clock","Tier": 1,"Impact":1,"Name":"timer_clock_","Health":0,"Happy":0,"Desc":"improve_seconds_one"},
	"upgrade_clock_2": {"Path":"res://Assets/Images/Upgrades/clock2.png","Price": 1000,"Kind":"Upgrade","Type":"unique","Parent":"Clock","Tier": 2,"Impact":2,"Name":"cronometer_clock_","Health":0,"Happy":0,"Desc":"improve_seconds_two"},
	"upgrade_clock_3": {"Path":"res://Assets/Images/Upgrades/clock3.png","Price": 1500,"Kind":"Upgrade","Type":"unique","Parent":"Clock","Tier": 3,"Impact":3,"Name":"alarm_clock_","Health":0,"Happy":0,"Desc":"improve_seconds_three"},
	"upgrade_clock_4": {"Path":"res://Assets/Images/Upgrades/clock4.png","Price": 3000,"Kind":"Upgrade","Type":"unique","Parent":"Clock","Tier": 4,"Impact":4,"Name":"radio_clock_","Health":0,"Happy":0,"Desc":"improve_seconds_four"},
	"upgrade_clock_5": {"Path":"res://Assets/Images/Upgrades/clock5.png","Price": 6000,"Kind":"Upgrade","Type":"unique","Parent":"Clock","Tier": 5,"Impact":5,"Name":"smartwatch_clock_","Health":0,"Happy":0,"Desc":"improve_seconds_five"},
	
	"upgrade_phone_1": {"Path":"res://Assets/Images/Upgrades/phone1.png","Price": 500,"Kind":"Upgrade","Type":"unique","Parent":"Phone","Tier": 1,"Impact":1,"Name":"public_phone_","Health":0,"Happy":0,"Desc":"improve_work_one"},
	"upgrade_phone_2": {"Path":"res://Assets/Images/Upgrades/phone2.png","Price": 1000,"Kind":"Upgrade","Type":"unique","Parent":"Phone","Tier": 2,"Impact":2,"Name":"old_phone_","Health":0,"Happy":0,"Desc":"improve_work_two"},
	"upgrade_phone_3": {"Path":"res://Assets/Images/Upgrades/phone3.png","Price": 3000,"Kind":"Upgrade","Type":"unique","Parent":"Phone","Tier": 3,"Impact":3,"Name":"home_phone_","Health":0,"Happy":0,"Desc":"improve_work_three"},
	"upgrade_phone_4": {"Path":"res://Assets/Images/Upgrades/phone4.png","Price": 5000,"Kind":"Upgrade","Type":"unique","Parent":"Phone","Tier": 4,"Impact":4,"Name":"hand_phone_","Health":0,"Happy":0,"Desc":"improve_work_four"},
	"upgrade_phone_5": {"Path":"res://Assets/Images/Upgrades/phone5.png","Price": 15000,"Kind":"Upgrade","Type":"unique","Parent":"Phone","Tier": 5,"Impact":5,"Name":"smart_phone_","Health":0,"Happy":0,"Desc":"improve_work_five"},
	
	"upgrade_computer_1": {"Path":"res://Assets/Images/Upgrades/computer1.png","Price": 1000,"Kind":"Upgrade","Type":"unique","Parent":"Computer","Tier": 1,"Impact":1,"Name":"old_computer_","Health":0,"Happy":0,"Desc":"improve_bussines_one"},
	"upgrade_computer_2": {"Path":"res://Assets/Images/Upgrades/computer2.png","Price": 5000,"Kind":"Upgrade","Type":"unique","Parent":"Computer","Tier": 2,"Impact":2,"Name":"desk_computer_","Health":0,"Happy":0,"Desc":"improve_bussines_two"},
	"upgrade_computer_3": {"Path":"res://Assets/Images/Upgrades/computer3.png","Price": 10000,"Kind":"Upgrade","Type":"unique","Parent":"Computer","Tier": 3,"Impact":3,"Name":"education_computer_","Health":0,"Happy":0,"Desc":"improve_bussines_three"},
	"upgrade_computer_4": {"Path":"res://Assets/Images/Upgrades/computer4.png","Price": 20000,"Kind":"Upgrade","Type":"unique","Parent":"Computer","Tier": 4,"Impact":4,"Name":"work_computer_","Health":0,"Happy":0,"Desc":"improve_bussines_four"},
	"upgrade_computer_5": {"Path":"res://Assets/Images/Upgrades/computer5.png","Price": 30000,"Kind":"Upgrade","Type":"unique","Parent":"Computer","Tier": 5,"Impact":5,"Name":"gamer_computer_","Health":0,"Happy":0,"Desc":"improve_bussines_five"},
	
	"furniture_guitar_1": {"Path":"res://Assets/Images/Upgrades/guitar1.png","Price": 500,"Kind":"Furniture","Type":"unique","Parent":"Guitar","Tier": 1,"Impact":1,"Name":"ukelele_","Health":0,"Happy":0,"Desc":"guitar_to_practice_"},
	"furniture_guitar_2": {"Path":"res://Assets/Images/Upgrades/guitar2.png","Price": 1500,"Kind":"Furniture","Type":"unique","Parent":"Guitar","Tier": 2,"Impact":2,"Name":"acustic_guitar_","Health":0,"Happy":0,"Desc":"guitar_to_practice_"},
	"furniture_guitar_3": {"Path":"res://Assets/Images/Upgrades/guitar3.png","Price": 3500,"Kind":"Furniture","Type":"unique","Parent":"Guitar","Tier": 3,"Impact":3,"Name":"electric_guitar_","Health":0,"Happy":0,"Desc":"guitar_to_practice_"},
	"furniture_guitar_4": {"Path":"res://Assets/Images/Upgrades/guitar4.png","Price": 4500,"Kind":"Furniture","Type":"unique","Parent":"Guitar","Tier": 4,"Impact":4,"Name":"bajo_","Health":0,"Happy":0,"Desc":"guitar_to_practice_"},
	"furniture_guitar_5": {"Path":"res://Assets/Images/Upgrades/guitar5.png","Price": 6500,"Kind":"Furniture","Type":"unique","Parent":"Guitar","Tier": 5,"Impact":5,"Name":"double_guitar_","Health":0,"Happy":0,"Desc":"guitar_to_practice_"},
	
	"furniture_piano_1": {"Path":"res://Assets/Images/Upgrades/piano1.png","Price": 700,"Kind":"Furniture","Type":"unique","Parent":"Piano","Tier": 1,"Impact":1,"Name":"piano_toy_","Health":0,"Happy":0,"Desc":"piano_to_practice_"},
	"furniture_piano_2": {"Path":"res://Assets/Images/Upgrades/piano2.png","Price": 1900,"Kind":"Furniture","Type":"unique","Parent":"Piano","Tier": 2,"Impact":2,"Name":"acustic_piano_","Health":0,"Happy":0,"Desc":"piano_to_practice_"},
	"furniture_piano_3": {"Path":"res://Assets/Images/Upgrades/piano3.png","Price": 4200,"Kind":"Furniture","Type":"unique","Parent":"Piano","Tier": 3,"Impact":3,"Name":"electric_piano_","Health":0,"Happy":0,"Desc":"piano_to_practice_"},
	"furniture_piano_4": {"Path":"res://Assets/Images/Upgrades/piano4.png","Price": 5700,"Kind":"Furniture","Type":"unique","Parent":"Piano","Tier": 4,"Impact":4,"Name":"bajo_","Health":0,"Happy":0,"Desc":"piano_to_practice_"},
	"furniture_piano_5": {"Path":"res://Assets/Images/Upgrades/piano5.png","Price": 16800,"Kind":"Furniture","Type":"unique","Parent":"Piano","Tier": 5,"Impact":5,"Name":"double_piano_","Health":0,"Happy":0,"Desc":"piano_to_practice_"},
}

@export var Activities: Dictionary = {
	"walk_": {"Path":"res://Assets/Images/HealthHappy/park.png","Price": 0,"Happy": 15,"Health": 10,"Parent":"park",'Skill':'',"Tier": 1,"Time":86400,"Meet":5},
	"tv_": {"Path":"res://Assets/Images/HealthHappy/tv.png","Price": 0,"Happy": 5,"Health": 0,"Parent":"home",'Skill':'',"Tier": 1,"Time":10800,"Meet":0},
	"stove_": {"Path":"res://Assets/Images/HealthHappy/tv.png","Price": 0,"Happy": 5,"Health": 0,"Parent":"home",'Skill':'',"Tier": 1,"Time":10800,"Meet":0},
	"tennis_": {"Path":"res://Assets/Images/HealthHappy/tv.png","Price": 0,"Happy": 5,"Health": 0,"Parent":"home",'Skill':'',"Tier": 1,"Time":10800,"Meet":0},
	"guitar_": {"Path":"res://Assets/Images/HealthHappy/tv.png","Price": 0,"Happy": 13,"Health": 0,"Parent":"home",'Skill':'guitar',"Tier": 1,"Time":14400,"Meet":0},
	"piano_": {"Path":"res://Assets/Images/HealthHappy/tv.png","Price": 0,"Happy": 13,"Health": 0,"Parent":"home",'Skill':'piano',"Tier": 1,"Time":14400,"Meet":0},
	"bar_": {"Path":"res://Assets/Images/HealthHappy/beer.png","Price": 40,"Happy": 20,"Health": 5,"Parent":"park",'Skill':'',"Tier": 1,"Time":345600,"Meet":50},
	"cine_": {"Path":"res://Assets/Images/HealthHappy/cinema.png","Price": 20,"Happy": 10,"Health": 2,"Parent":"park",'Skill':'',"Tier": 1,"Time":604800,"Meet":10},
	"gym_": {"Path":"res://Assets/Images/HealthHappy/gym.png","Price": 20,"Happy": 10,"Health": 10,"Parent":"park",'Skill':'',"Tier": 1,"Time":86400,"Meet":50},
	"restaurant_": {"Path":"res://Assets/Images/HealthHappy/gym.png","Price": 80,"Happy": 10,"Health": 15,"Parent":"park",'Skill':'',"Tier": 1,"Time":86400,"Meet":10},
	"stadium_soccer_": {"Path":"res://Assets/Images/HealthHappy/soccer.png","Price": 100,"Happy": 15,"Health": 2,"Parent":"events",'Skill':'',"Tier": 1,"Time":604800,"Meet":5},
	"stadium_futball_": {"Path":"res://Assets/Images/HealthHappy/futball.png","Price": 100,"Happy": 15,"Health": 2,"Parent":"events",'Skill':'',"Tier": 1,"Time":604800,"Meet":5},
	"stadium_basquetball_": {"Path":"res://Assets/Images/HealthHappy/basquetball.png","Price": 100,"Happy": 15,"Health": 2,"Parent":"events",'Skill':'',"Tier": 1,"Time":604800,"Meet":5},
	"stadium_voleiball_": {"Path":"res://Assets/Images/HealthHappy/voleiball.png","Price": 100,"Happy": 15,"Health": 2,"Parent":"events",'Skill':'',"Tier": 1,"Time":604800,"Meet":5},
	"stadium_beisball_": {"Path":"res://Assets/Images/HealthHappy/beisball.png","Price": 100,"Happy": 15,"Health": 2,"Parent":"events",'Skill':'',"Tier": 1,"Time":604800,"Meet":5},
	"jack_": {"Path":"res://Assets/Images/HealthHappy/jack.png","Price": 100,"Happy": 15,"Health": 2,"Parent":"park",'Skill':'',"Tier": 1,"Time":604800,"Meet":5},
	"concert_": {"Path":"res://Assets/Images/HealthHappy/concert.png","Price": 200,"Happy": 20,"Health": 2,"Parent":"events",'Skill':'',"Tier": 1,"Time":604800,"Meet":5},
	"doctor_": {"Path":"res://Assets/Images/HealthHappy/doctor.png","Price": 100,"Happy": 10,"Health": 20,"Parent":"park",'Skill':'',"Tier": 1,"Time":3600,"Meet":0},
	"hospital_": {"Path":"res://Assets/Images/HealthHappy/hospital.png","Price": 1000,"Happy": 10,"Health": 40,"Parent":"park",'Skill':'',"Tier": 1,"Time":3600,"Meet":0}
}

@export var Interactions: Dictionary = {
	"speak":{"text":"speak_","friend":1,"love":0,"relation":"","validation":0,"time":120,"path":"res://Assets/Images/Interactions/speak.png"},
	"listen": {"text": "listen_", "friend": 4, "love": 0, "relation": "", "validation":0,"time": 1800, "path": "res://Assets/Images/Interactions/listen.png"},
	"support": {"text": "support_", "friend": 7, "love": 2, "relation": "", "validation":0,"time": 2400, "path": "res://Assets/Images/Interactions/support.png"},
	"joke":{"text":"joke_","friend":2,"love":0,"relation":"","validation":0,"time":1200,"path":"res://Assets/Images/Interactions/joke.png"},
	"apologize": {"text": "apologize_", "friend": 5, "love": 3, "relation": "", "validation":0,"time": 1800, "path": "res://Assets/Images/Interactions/apologize.png"},
	"argue": {"text": "argue_", "friend": -5, "love": -4, "relation": "", "validation":0,"time": 3000, "path": "res://Assets/Images/Interactions/argue.png"},
	"fight": {"text": "fight_", "friend": -3, "love": -2, "relation": "", "validation":0,"time": 1200, "path": "res://Assets/Images/Interactions/fight.png"},
	"secret":{"text":"secret_","friend":5,"love":0,"relation":"","validation":0,"time":3600,"path":"res://Assets/Images/Interactions/secret.png"},
	"celebrate": {"text": "celebrate_", "friend": 6, "love": 4, "relation": "", "validation":0,"time": 4800, "path": "res://Assets/Images/Interactions/celebrate.png"},
	"help_out": {"text": "help_out_", "friend": 6, "love": 1, "relation": "", "validation":0,"time": 3600, "path": "res://Assets/Images/Interactions/help_out.png"},
	"flirting":{"text":"flirting_","friend":0,"love":1,"relation":"","validation":0,"time":600,"path":"res://Assets/Images/Interactions/flirting.png"},
	"sweetheart":{"text":"sweetheart_","friend":1,"love":2,"relation":"","validation":0,"time":1200,"path":"res://Assets/Images/Interactions/sweetheart.png"},
	"love":{"text":"love_","friend":2,"love":3,"relation":"","validation":0,"time":1200,"path":"res://Assets/Images/Interactions/love.png"},
	"sex":{"text":"sex_","friend":2,"love":4,"relation":"","validation":0,"time":1200,"path":"res://Assets/Images/Interactions/sex.png"},
	"goto":{"text":"goto_","friend":10,"love":1,"relation":"","validation":0,"time":86400,"path":"res://Assets/Images/Interactions/goto.png"},
	"relation":{"text":"relation_","friend":0,"love":0,"relation":"init","validation":1,"time":86400,"path":"res://Assets/Images/Interactions/relation.png"},
	"compromised":{"text":"relation_","friend":0,"love":0,"relation":"init","validation":1,"time":86400,"path":"res://Assets/Images/Interactions/ring.png"},
	"marry":{"text":"relation_","friend":0,"love":0,"relation":"init","validation":1,"time":86400,"path":"res://Assets/Images/Interactions/wedding.png"},
	"lover":{"text":"lover_","friend":0,"love":0,"relation":"init","validation":1,"time":86400,"path":"res://Assets/Images/Interactions/lover.png"},
	"gift":{"text":"gift_","friend":5,"love":1,"relation":"","validation":0,"time":1200,"path":"res://Assets/Images/Interactions/gift.png"},
	"events":{"text":"events_","friend":15,"love":1,"relation":"","validation":0,"time":1200,"path":"res://Assets/Images/Interactions/events.png"},
	"break":{"text":"break_","friend":-100,"love":-10,"relation":"break","validation":1,"time":1200,"path":"res://Assets/Images/Interactions/break.png"},
}

@export var Relations: Dictionary = {
	'unknown':['res://Assets/Images/Relations/unknown.png',0],'known':['res://Assets/Images/Relations/known.png',0],'friend':['res://Assets/Images/Relations/friends.png',1],
	'bestfriend':['res://Assets/Images/Relations/best_friends.png',2],'partner':['res://Assets/Images/Relations/in_love.png',3],'engagedpartner':['res://Assets/Images/Relations/engaged.png',4],
	'married':['res://Assets/Images/Relations/married.png',5],'lover':['res://Assets/Images/Relations/lover.png',2],'break':['res://Assets/Images/Interactions/break.png',0]
}

@export var Effects: Dictionary = {
	"luck": {"Work_impact": "science", "Name": "basic", "Impact": 1.5, "Path": "res://Assets/Images/Effects/luck.png"},
	"investment": {"Work_impact": "art", "Name": "driver", "Impact": 1, "Path": "res://Assets/Images/Effects/investment.png"},
	"business": {"Work_impact": "lawyer", "Name": "technician", "Impact": 0.5, "Path": "res://Assets/Images/Effects/business.png"},
	"hours": {"Work_impact": "technician", "Name": "technician", "Impact": 1.5, "Path": "res://Assets/Images/Effects/hours.png"},
	"clic_speed": {"Work_impact": "architect", "Name": "marine", "Impact": 1, "Path": "res://Assets/Images/Effects/clic_speed.png"},
	"work": {"Work_impact": "basic", "Name": "pilot", "Impact": 0.5, "Path": "res://Assets/Images/Effects/work.png"},
	"health": {"Work_impact": "learn", "Name": "art", "Impact": 1.5, "Path": "res://Assets/Images/Effects/health.png"},
	"expense": {"Work_impact": "learn", "Name": "gastronomy", "Impact": 1, "Path": "res://Assets/Images/Effects/expenses.png"},
	"discount": {"Work_impact": "learn", "Name": "medicine", "Impact": 0.5, "Path": "res://Assets/Images/Effects/discount.png"},
	"tax": {"Work_impact": "learn", "Name": "medicine", "Impact": 0.5, "Path": "res://Assets/Images/Effects/tax.png"}
}

@export var WorkEffects: Dictionary = {
	"basic": {"Effect": {"work":2}, "Name": "basic", "Impact": 1.5, "Path": "res://Resources/Images/Skills/laugh.png"},
	"driver": {"Effect": {"clic_speed":1}, "Name": "driver", "Impact": 1, "Path": "res://Resources/Images/Skills/nice.png"},
	"technician": {"Effect": {"hours":1}, "Name": "technician", "Impact": 0.5, "Path": "res://Resources/Images/Skills/introvert.png"},
	"marine": {"Effect": {"luck":4}, "Name": "technician", "Impact": 1.5, "Path": "res://Resources/Images/Skills/love.png"},
	"pilot": {"Effect": {"clic_speed":1}, "Name": "marine", "Impact": 1, "Path": "res://Resources/Images/Skills/loveless.png"},
	"paint": {"Effect": {"investment":2}, "Name": "pilot", "Impact": 0.5, "Path": "res://Resources/Images/Skills/aromantic.png"},
	"gastronomy": {"Effect": {"health":2}, "Name": "art", "Impact": 1.5, "Path": "res://Resources/Images/Skills/perfect.png"},
	"medicine": {"Effect": {"health":5}, "Name": "gastronomy", "Impact": 1, "Path": "res://Resources/Images/Skills/good.png"},
	"lawyer": {"Effect": {"business":1}, "Name": "medicine", "Impact": 0.5, "Path": "res://Resources/Images/Skills/sleep.png"},
	"account": {"Effect": {"expense":5}, "Name": "medicine", "Impact": 0.5, "Path": "res://Resources/Images/Skills/sleep.png"},
	"architect": {"Effect": {"clic_speed":1}, "Name": "medicine", "Impact": 0.5, "Path": "res://Resources/Images/Skills/sleep.png"},
	"engineer": {"Effect": {"work":2}, "Name": "medicine", "Impact": 0.5, "Path": "res://Resources/Images/Skills/sleep.png"},
	"politician": {"Effect": {"tax":5}, "Name": "medicine", "Impact": 0.5, "Path": "res://Resources/Images/Skills/sleep.png"},
	"science": {"Effect": {"luck":5}, "Name": "medicine", "Impact": 0.5, "Path": "res://Resources/Images/Skills/sleep.png"}
}

@export var RelationActions: Dictionary = {
	'unknown':['speak'],
	'known':['speak','listen','joke','argue','secret','flirting','goto','gift'],
	'friend':['speak','listen','joke','argue','secret','celebrate','flirting','goto','events','gift','support','help_out','relation','lover'],
	'bestfriend':['speak','listen','joke','argue','secret','celebrate','flirting','goto','events','gift','support','help_out','relation','lover'],
	'partner':['speak','listen','joke','argue','secret','celebrate','flirting','sweetheart','love','sex','goto','events','gift','support','help_out','compromised','break'],
	'engagedpartner':['speak','listen','joke','argue','secret','celebrate','flirting','sweetheart','love','sex','goto','events','gift','support','help_out','marry','break'],
	'married':['speak','listen','joke','argue','secret','celebrate','flirting','sweetheart','love','sex','goto','events','gift','support','help_out','break'],
	'lover':['speak','listen','joke','argue','secret','celebrate','flirting','sweetheart','love','sex','goto','events','gift','support','help_out','relation','break'],
	'break':['speak','listen','apologize','argue','joke','goto','help_out','relation'],
	'unfriendly':['speak','listen','apologize','joke','argue','fight','secret','flirting','goto'],
	'detestable':['speak','listen','apologize','argue','fight']
}

@export var PercentagesStateMind:Dictionary = {
	'Not':[10,10,70,10],
	'unknown':[10,10,70,10],
	'known':[8,8,76,8],
	'friend':[6,6,74,14],
	'bestfriend':[5,5,80,10],
	'partner':[2,18,70,10],
	'lover':[1,1,8,90],
	'engagedpartner':[2,8,80,10],
	'married':[2,10,18,70],
	'break':[80,10,5,5]
}

@export var TransitionsStates = {
	'angry': { 'known': {'listen': 10},'friend': {'listen': 8},'bestfriend': {'listen': 8},'partner': {'listen': 10},'lover': {'listen': 8},'engagedpartner': {'listen': 10},'married': {'listen': 12},'break': {'listen': 30} },
	'neutral': { 'known': {'joke': 6},'friend': {'joke': 4},'bestfriend': {'joke': 3},'partner': {'joke': 2},'lover': {'joke': 4},'engagedpartner': {'joke': 1},'married': {'joke': 2},'break': {'apologize': 16} },
	'sad': { 'known': {'support': 10},'friend': {'support': 8},'bestfriend': {'support': 8},'partner': {'support': 10},'lover': {'support': 8},'engagedpartner': {'support': 10},'married': {'support': 12},'break': {'support': 30} }
}

@export var NewTransitionsStates = {
	'angry': 'neutral',
	'neutral': 'happy',
	'sad': 'neutral'
}

@export var FemaleNames: Array = [
	'Lizeth','Ana','Grecia','Maria', 'Sofia', 'Lucia', 'Carmen', 'Isabel', 'Elena', 'Sara', 'Claudia', 'Marta', 'Julia', 'Paula', 'Andrea', 'Victoria', 
	'Rosa', 'Alba', 'Teresa', 'Eva', 'Irene','Leah','Emma', 'Olivia', 'Sophia', 'Isabella', 'Ava', 'Mia', 'Charlotte', 'Amelia', 'Emily', 'Ella', 'Grace', 
	'Abigail', 'Hannah', 'Lily', 'Zoe', 'Marie', 'Camille', 'Chloe', 'Lea', 'Elise', 'Sophie', 'Juliette', 'Claire', 'Isabelle', 'Gabrielle', 'Amelie', 
	'Charlotte', 'Manon', 'Noemie', 'Aurore','Yuzuriha','Hinata','Jade', 'Hanna', 'Lena', 'Mia', 'Sophia', 'Laura', 'Leonie', 'Anna', 'Marie', 'Emilia', 
	'Clara', 'Johanna', 'Luisa', 'Theresa', 'Frieda', 'Giulia', 'Sofia', 'Aurora', 'Francesca', 'Chiara', 'Martina', 'Alessia', 'Viola', 'Elisa', 'Giorgia', 
	'Beatrice', 'Camilla','Aisha', 'Fatima', 'Layla', 'Zahra', 'Amira', 'Mariam', 'Nadia', 'Rania', 'Salma', 'Yasmin', 'Noor','Anna', 'Olga', 'Elena', 'Maria', 
	'Tatiana', 'Natalia', 'Irina', 'Ekaterina', 'Anastasia', 'Svetlana', 'Daria','Yuki', 'Hana', 'Aiko', 'Akira', 'Sakura', 'Emi', 'Haruka', 'Kaori', 'Miyu', 
	'Rina', 'Nao','Mei', 'Hua', 'Lin', 'Xiao', 'Li', 'Fen', 'Zhen', 'Lan', 'Ying', 'Jing', 'Wei','Asha', 'Priya', 'Lakshmi', 'Radha', 'Sita', 'Anjali', 'Kavita', 
	'Meera', 'Nisha', 'Rekha', 'Rani','Amina', 'Zola', 'Nia', 'Imani', 'Ayana', 'Ama', 'Sade', 'Fatou', 'Lulu', 'Eshe', 'Zuri','Astrid', 'Freya', 'Ingrid', 
	'Sigrid', 'Saga', 'Liv', 'Karin', 'Birgit', 'Tove', 'Linnea', 'Greta', 'Sarely', 'Kim', 'Anguelique', 'Jennifer', 'Robin', 'Esbeidy', 'Anabel', 'Sahira'
]

@export var MaleNames: Array = [
	'Alejandro', 'Carlos', 'Daniel', 'Eduardo', 'Fernando', 'Gabriel', 'Hector', 'Ivan', 'Javier', 'Luis', 'Manuel', 'Nicolas', 'Oscar', 'Pablo', 'Ricardo', 
	'Sergio', 'Tomas', 'Victor', 'Ruben', 'Mateo', 'James', 'John', 'Michael', 'Robert', 'William', 'David', 'Joseph', 'Thomas', 'Daniel', 'Matthew', 'Andrew', 
	'Christopher', 'Jonathan', 'Edward', 'Henry', 'Jean', 'Pierre', 'Luc', 'Étienne', 'Antoine', 'Michel', 'Hugo', 'Louis', 'Gabriel', 'Theo', 'Raphaël', 
	'Sebastien', 'Olivier', 'Hans', 'Friedrich', 'Klaus', 'Jürgen', 'Matthias', 'Lukas', 'Niklas', 'Johann', 'Leon', 'Maximilian', 'Tobias', 'Philipp', 'Lorenzo', 
	'Marco', 'Matteo', 'Giovanni', 'Francesco', 'Alessandro', 'Stefano', 'Vincenzo', 'Luca', 'Giorgio', 'Paolo','Ahmed', 'Mohammed', 'Ali', 'Hassan', 'Omar', 
	'Ibrahim', 'Yusuf', 'Abdullah', 'Sami', 'Khalid', 'Amir', 'Levi', 'Ivan', 'Dmitri', 'Vladimir', 'Sergei', 'Nikolai', 'Alexei', 'Mikhail', 'Yuri', 'Pavel', 
	'Andrei', 'Maxim', 'Hiroshi', 'Kenji', 'Takashi', 'Yuki', 'Taro', 'Akira', 'Kaito', 'Daiki', 'Riku', 'Haruto', 'Shota','Wei', 'Jian', 'Ming', 'Hao', 'Yong', 
	'Feng', 'Lei', 'Jun', 'Chao', 'Long', 'Xin', 'Arjun', 'Ravi', 'Vikram', 'Amit', 'Rahul', 'Sanjay', 'Karan', 'Anil', 'Rajesh', 'Manoj', 'Akash','Kwame', 
	'Jabari', 'Omari', 'Kofi', 'Sekou', 'Amari', 'Malik', 'Zuberi', 'Bakari', 'Hassan','Erik', 'Lars', 'Bjorn', 'Magnus', 'Sven', 'Oskar', 'Anders', 'Nils', 
	'Thor', 'Leif', 'Francisco', 'Jose', 'Juan', 'Jairo', 'Armando', 'Gerardo', 'Azael', 'Dante', 'Scott', 'Marcus', 'Dom', 'Jhon', 'Fred', 'Valentin', 'Julian'
]

@export var AllNames: Array = FemaleNames + MaleNames


@export var Surnames: Array = [
	'Garcia', 'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 
	'Perez', 'Sanchez', 'Ramirez', 'Torres', 'Flores', 'Rivera', 'Vargas', 
	'Morales', 'Ortiz', 'Castillo', 'Jimenez', 'Reyes', 'Ruiz', 'Mendoza',
	'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Miller', 
	'Davis', 'Garcia', 'Taylor', 'Anderson', 'Thomas', 'Moore', 
	'Martin', 'Jackson', 'Thompson', 'White', 'Harris', 'Clark',
	'Bernard', 'Dubois', 'Thomas', 'Robert', 'Richard', 'Lara',
	'Petit', 'Durand', 'Leroy', 'Moreau', 'Simon', 'Laurent', 
	'Michel', 'Garcia', 'David', 'Bertrand', 'Roux', 'Vincent',
	'Müller', 'Schmidt', 'Schneider', 'Fischer', 'Weber', 'Meyer', 
	'Wagner', 'Becker', 'Schulz', 'Hoffmann', 'Koch', 'Bauer', 
	'Richter', 'Klein', 'Wolf', 'Schröder', 'Neumann', 'Braun',
	'Rossi', 'Russo', 'Ferrari', 'Esposito', 'Bianchi', 'Romano', 
	'Colombo', 'Ricci', 'Marino', 'Greco', 'Bruno', 'Gallo', 
	'Conti', 'De Luca', 'Mancini', 'Costa', 'Giordano', 'Moretti',
	'Ahmed', 'Hassan', 'Ali', 'Khan', 'Mohammed', 'Abdullah', 
	'Omar', 'Salim', 'Yusuf', 'Farah', 'Rahman', 'Nasser', 
	'Karim', 'Hussein', 'Ibrahim', 'Alderete', 'Zapata',
	'Ivanov', 'Petrov', 'Sidorov', 'Smirnov', 'Kuznetsov', 'Popov', 
	'Vasiliev', 'Novikov', 'Morozov', 'Volkov', 'Solovyov', 
	'Mikhailov', 'Fedorov', 'Semenov', 'Vinogradov',
	'Tanaka', 'Yamamoto', 'Kobayashi', 'Nakamura', 'Takahashi', 
	'Sato', 'Suzuki', 'Matsumoto', 'Ito', 'Yamaguchi', 'Fujimoto', 
	'Shimizu', 'Hayashi', 'Ueda',
	'Wang', 'Li', 'Zhang', 'Liu', 'Chen', 'Yang', 'Huang', 
	'Zhao', 'Wu', 'Zhou', 'Xu', 'Sun', 'Ma', 'Hu', 'Guo',
	'Sharma', 'Gupta', 'Patel', 'Kumar', 'Reddy', 'Singh', 
	'Chopra', 'Iyer', 'Joshi', 'Nair', 'Desai', 'Varma', 
	'Pandey', 'Das', 'Agarwal',
	'Abebe', 'Okafor', 'Adjei', 'Kone', 'Diallo', 'Mwangi', 
	'Ndlovu', 'Amadi', 'Chukwu', 'Kamara', 'Toure', 'Osei', 
	'Banda', 'Adebayo', 'Omari',
	'Andersen', 'Johansson', 'Larsen', 'Nielsen', 'Eriksson', 
	'Hansen', 'Olsen', 'Berg', 'Holm', 'Lind', 'Svensson', 
	'Eliasson', 'Jensen', 'Magnusson'
]

@export var Houses: Dictionary = {
	'no_house': {'Size_house': 0,'Happy': -10,'Health': -10,'Level': 0,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Rooms': {},
	'Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':0
	},
	'old': {'Size_house': 20,'Happy': -5,'Health': -3,'Level': 1,'LevelRooms':0,'Path':'res://Assets/Images/Houses/old.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':1,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':1,'Tier':1},'bath': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'cabin': {'Size_house': 30,'Happy': -4,'Health': -2,'Level': 1,'LevelRooms':0,'Path':'res://Assets/Images/Houses/cabin.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':2,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':1,'Tier':1},'bath': {'Qty':2,'Tier':1},'dinning': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'small_apartment': {'Size_house': 35,'Happy': -4,'Health': -2,'Level': 1,'LevelRooms':0,'Path':'res://Assets/Images/Houses/small_apartment.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':1,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':1,'Tier':1},'bath': {'Qty':1,'Tier':1},'library': {'Qty':1,'Tier':1}}
	},
	'single_story': {'Size_house': 110,'Happy': -2,'Health': -1,'Level': 2,'LevelRooms':0,'Path':'res://Assets/Images/Houses/single_story.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':2,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':1,'Tier':1},'bath': {'Qty':1,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'city_house': {'Size_house': 120,'Happy': -2,'Health': -1,'Level': 2,'LevelRooms':0,'Path':'res://Assets/Images/Houses/city_house.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':1,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':2,'Tier':1},'bath': {'Qty':1,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1}}
	},
	'two_story': {'Size_house': 140,'Happy': -1,'Health': -1,'Level': 2,'LevelRooms':0,'Path':'res://Assets/Images/Houses/two_story.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':2,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':3,'Tier':1},'bath': {'Qty':2,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'period_house': {'Size_house': 160,'Happy': -2,'Health': -1,'Level': 2,'LevelRooms':0,'Path':'res://Assets/Images/Houses/period_house.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':2,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':3,'Tier':1},'bath': {'Qty':2,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1},'library': {'Qty':1,'Tier':1},'laundry': {'Qty':1,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'town_apartment': {'Size_house': 180,'Happy': -1,'Health': -1,'Level': 2,'LevelRooms':0,'Path':'res://Assets/Images/Houses/town_apartment.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':2,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':2,'Tier':1},'bath': {'Qty':2,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1},'library': {'Qty':1,'Tier':1}}
	},
	'basic_pool': {'Size_house': 220,'Happy': 1,'Health': 0,'Level': 3,'LevelRooms':0,'Path':'res://Assets/Images/Houses/basic_pool.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':3,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':2,'Tier':1},'bath': {'Qty':2,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1},'laundry': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'modern': {'Size_house': 350,'Happy': 1,'Health': 0,'Level': 3,'LevelRooms':0,'Path':'res://Assets/Images/Houses/modern.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':4,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':3,'Tier':1},'bath': {'Qty':2,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'office': {'Qty':1,'Tier':1},'library': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'family_house': {'Size_house': 450,'Happy': 1,'Health': 0,'Level': 3,'LevelRooms':0,'Path':'res://Assets/Images/Houses/family_house.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':5,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':4,'Tier':1},'bath': {'Qty':3,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':1,'Tier':1},'library': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'suburban': {'Size_house': 600,'Happy': 1,'Health': 0,'Level': 3,'LevelRooms':0,'Path':'res://Assets/Images/Houses/suburban.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':6,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':4,'Tier':1},'bath': {'Qty':4,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':2,'Tier':1},'library': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'small_luxury': {'Size_house': 800,'Happy': 1,'Health': 0,'Level': 3,'LevelRooms':0,'Path':'res://Assets/Images/Houses/small_luxury.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':7,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':5,'Tier':1},'bath': {'Qty':4,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':2,'Tier':1},'library': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'ocean_view': {'Size_house': 1400,'Happy': 2,'Health': 1,'Level': 4,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':10,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':6,'Tier':1},'bath': {'Qty':5,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':2,'Tier':1},'library': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'modern_country': {'Size_house': 1500,'Happy': 2,'Health': 1,'Level': 4,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':11,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':6,'Tier':1},'bath': {'Qty':6,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'office': {'Qty':1,'Tier':1},'spa': {'Qty':1,'Tier':1},'library': {'Qty':1,'Tier':1},'tennis': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':1,'Tier':1}}
	},
	'chalet': {'Size_house': 1800,'Happy': 2,'Health': 1,'Level': 4,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':12,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':6,'Tier':1},'bath': {'Qty':7,'Tier':1},'dinning': {'Qty':1,'Tier':1},'hall': {'Qty':1,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':1,'Tier':1},'library': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1}}
	},
	'architectural_design': {'Size_house': 2800,'Happy': 2,'Health': 1,'Level': 4,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':14,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':6,'Tier':1},'bath': {'Qty':7,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':1,'Tier':1},'library': {'Qty':2,'Tier':1},'tennis': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'smart_home': {'Size_house': 2000,'Happy': 2,'Health': 1,'Level': 4,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':14,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':7,'Tier':1},'bath': {'Qty':6,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':1,'Tier':1},'library': {'Qty':2,'Tier':1},'tennis': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':2,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'home_cinema_roomma': {'Size_house': 2500,'Happy': 2,'Health': 1,'Level': 4,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':16,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':7,'Tier':1},'bath': {'Qty':7,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':3,'Tier':1},'spa': {'Qty':1,'Tier':1},'library': {'Qty':3,'Tier':1},'cinema': {'Qty':2,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'eco_house': {'Size_house': 2000,'Happy': 2,'Health': 1,'Level': 4,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':18,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':6,'Tier':1},'bath': {'Qty':7,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':1,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':1,'Tier':1},'library': {'Qty':2,'Tier':1},'tennis': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':1,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'mediterranean_villa': {'Size_house': 2900,'Happy': 3,'Health': 2,'Level': 5,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':20,
	'Rooms': {'kitchen': {'Qty':2,'Tier':1},'bedroom': {'Qty':8,'Tier':1},'bath': {'Qty':8,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':2,'Tier':1},'gym': {'Qty':2,'Tier':1},'gameroom': {'Qty':1,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':1,'Tier':1},'library': {'Qty':2,'Tier':1},'tennis': {'Qty':1,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':2,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'luxury_house': {'Size_house': 3000,'Happy': 3,'Health': 2,'Level': 5,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':22,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':8,'Tier':1},'bath': {'Qty':8,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':2,'Tier':1},'gym': {'Qty':1,'Tier':1},'gameroom': {'Qty':2,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':2,'Tier':1},'library': {'Qty':2,'Tier':1},'tennis': {'Qty':2,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':2,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'historical_mansion': {'Size_house': 3200,'Happy': 3,'Health': 2,'Level': 5,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':24,
	'Rooms': {'kitchen': {'Qty':1,'Tier':1},'bedroom': {'Qty':8,'Tier':1},'bath': {'Qty':9,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':2,'Tier':1},'gym': {'Qty':2,'Tier':1},'gameroom': {'Qty':2,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':1,'Tier':1},'library': {'Qty':2,'Tier':1},'tennis': {'Qty':2,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':2,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'contemporary_mansion': {'Size_house': 3500,'Happy': 3,'Health': 2,'Level': 5,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':26,
	'Rooms': {'kitchen': {'Qty':2,'Tier':1},'bedroom': {'Qty':8,'Tier':1},'bath': {'Qty':9,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':2,'Tier':1},'laundry': {'Qty':2,'Tier':1},'gym': {'Qty':2,'Tier':1},'gameroom': {'Qty':2,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':2,'Tier':1},'library': {'Qty':2,'Tier':1},'tennis': {'Qty':2,'Tier':1},'cinema': {'Qty':1,'Tier':1},'pool': {'Qty':2,'Tier':1},'garden': {'Qty':2,'Tier':1}}
	},
	'dream_mansion': {'Size_house': 4000,'Happy': 3,'Health': 2,'Level': 5,'LevelRooms':0,'Path':'res://Assets/Images/Houses/park1024.png','Price':0,'CostRent':0,'CostSale':0,'Payments':0,'Status':'','CurrentHome':0,'Rentedby':'','Parking':30,
	'Rooms': {'kitchen': {'Qty':2,'Tier':1},'bedroom': {'Qty':10,'Tier':1},'bath': {'Qty':12,'Tier':1},'dinning': {'Qty':2,'Tier':1},'hall': {'Qty':3,'Tier':1},'laundry': {'Qty':2,'Tier':1},'gym': {'Qty':2,'Tier':1},'gameroom': {'Qty':2,'Tier':1},'office': {'Qty':2,'Tier':1},'spa': {'Qty':2,'Tier':1},'library': {'Qty':3,'Tier':1},'tennis': {'Qty':2,'Tier':1},'cinema': {'Qty':2,'Tier':1},'pool': {'Qty':3,'Tier':1},'garden': {'Qty':3,'Tier':1}}
	},
}

@export var Rooms: Dictionary = {
	'kitchen':{'Path':'res://Assets/Images/Rooms/kitchen128.png','Tiers':{'1':3000,'2':8000,'3':15000,'4':30000,'5':60000}},
	'dinning':{'Path':'res://Assets/Images/Rooms/table128.png','Tiers':{'1':2500,'2':7000,'3':12000,'4':25000,'5':50000}},
	'bedroom':{'Path':'res://Assets/Images/Rooms/bed128.png','Tiers':{'1':4000,'2':10000,'3':20000,'4':40000,'5':80000}},
	'bath':{'Path':'res://Assets/Images/Rooms/bath128.png','Tiers':{'1':2500,'2':6000,'3':12000,'4':25000,'5':50000}},
	'hall':{'Path':'res://Assets/Images/Rooms/hall128.png','Tiers':{'1':3500,'2':9000,'3':18000,'4':35000,'5':70000}},
	'library':{'Path':'res://Assets/Images/Rooms/library128.png','Tiers':{'1':2000,'2':5000,'3':10000,'4':20000,'5':40000}},
	'gym':{'Path':'res://Assets/Images/Rooms/gym128.png','Tiers':{'1':5000,'2':12000,'3':25000,'4':50000,'5':100000}},
	'office':{'Path':'res://Assets/Images/Rooms/office128.png','Tiers':{'1':2500,'2':6500,'3':14000,'4':28000,'5':55000}},
	'spa':{'Path':'res://Assets/Images/Rooms/spa128.png','Tiers':{'1':6000,'2':15000,'3':30000,'4':60000,'5':120000}},
	'gameroom':{'Path':'res://Assets/Images/Rooms/game128.png','Tiers':{'1':4000,'2':10000,'3':20000,'4':40000,'5':80000}},
	'tennis':{'Path':'res://Assets/Images/Rooms/tennis128.png','Tiers':{'1':7000,'2':18000,'3':35000,'4':70000,'5':140000}},
	'cinema':{'Path':'res://Assets/Images/Rooms/cinema128.png','Tiers':{'1':8000,'2':20000,'3':40000,'4':80000,'5':160000}},
	'laundry':{'Path':'res://Assets/Images/Rooms/laundry128.png','Tiers':{'1':1500,'2':4000,'3':8000,'4':16000,'5':32000}},
	'pool':{'Path':'res://Assets/Images/Rooms/pool128.png','Tiers':{'1':10000,'2':25000,'3':50000,'4':100000,'5':200000}},
	'garden':{'Path':'res://Assets/Images/Rooms/garden128.png','Tiers':{'1':2000,'2':6000,'3':15000,'4':30000,'5':70000}}
}

@export var Sicks: Dictionary = {
	"good": {'Year': 0, 'Health': 0, 'Path':'res://Assets/Images/Sickness/health.png'},
	"shield": {'Year': 0, 'Health': 0, 'Path':'res://Assets/Images/Sickness/shield.png'},
	"common_cold": {'Year': 10, 'Health': -1, 'Path':'res://Assets/Images/Sickness/common_cold.png'},
	"flu": {'Year': 10, 'Health': -2, 'Path':'res://Assets/Images/Sickness/flu.png'},
	"toothache": {'Year': 20, 'Health': -3, 'Path':'res://Assets/Images/Sickness/toothache.png'},
	"diarrhea": {'Year': 20, 'Health': -4, 'Path':'res://Assets/Images/Sickness/diarrhea.png'},
	"conjunctivitis": {'Year': 30, 'Health': -5, 'Path':'res://Assets/Images/Sickness/conjunctivitis.png'},
	"coronavirus": {'Year': 30, 'Health': -6, 'Path':'res://Assets/Images/Sickness/coronavirus.png'},
	"bronchitis": {'Year': 40, 'Health': -7, 'Path':'res://Assets/Images/Sickness/bronchitis.png'},
	"hypertension": {'Year': 40, 'Health': -8, 'Path':'res://Assets/Images/Sickness/hypertension.png'},
	"diabetes": {'Year': 50, 'Health': -9, 'Path':'res://Assets/Images/Sickness/diabetes.png'},
	"cardiac_arrest": {'Year': 120, 'Health': -100, 'Path':'res://Assets/Images/Sickness/cardiac_arrest.png'}
}

@export var Progress: Dictionary = {
	"progress_cloth": {'Reward':100,'Points':10},
	"progress_food": {'Reward':100,'Points':10},
	"progress_f": {'Reward':100,'Points':10},
}
