extends Control

var Item_card = preload('res://Scenes/Cards/activity_card.tscn')
var selected = 'park'
var old_selected = ''
#var old_selected = '
#var invisible = preload('res://Resources/Themes/invisible.tres')
#var selected_enviroment = preload('res://Resources/Themes/selected_enviroment.tres')
#var data_dict = {}
#var old_len = 0

func _ready() -> void:
	unselect_menu()
	#$Body/Menu_header_pnl/MarginContainer/Panel/Menu_header_lbl.text = 'activities_title'
	$Body/Menu/Principal/home_pnl/user_photo.texture = load(Data.Database.Photos[Data.Game.Player.ProfilePic]['Path'])
	#$Body/Menu/Principal/clock_pnl.add_theme_stylebox_override('panel',selected_enviroment)
	$Body/Menu/Principal/park_pnl/selected_pnl.show()
	for item in Data.Database.Activities.keys():
		create_item(item)
	

func _process(_delta: float) -> void:
	if old_selected != selected:
		update_ui()
		old_selected = selected

func update_ui():
	for child in $Body/Activities/Item_container/ScrollContainer/VBoxContainer.get_children():
		child.hide()
		if Data.Database.Activities[child.Id]['Parent'] == selected:
			if selected == 'home':
				for item in Data.Game.Player.OwnItems:
					if child.Id in item:
						child.show()
						#print(item,' ',child.Id)
			else:
				child.show()
			#print(child.Id,' ',selected)
	
func create_item(item):
	var addcard = Item_card.instantiate()
	addcard.Id = item
	#addcard.data = Data.db_data['ToDo'][item]
	$Body/Activities/Item_container/ScrollContainer/VBoxContainer.add_child(addcard)

func unselect_menu():
	$Body/Menu/Principal/house_pnl/selected_pnl.hide()
	$Body/Menu/Principal/park_pnl/selected_pnl.hide()
	$Body/Menu/Principal/events_pnl/selected_pnl.hide()
	$Body/Menu/Principal/trip_pnl/selected_pnl.hide()

func _on_home_btn_pressed() -> void:
	get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')

func _on_house_btn_pressed() -> void:
	unselect_menu()
	selected = 'home'
	$Body/Menu/Principal/house_pnl/selected_pnl.show()

func _on_park_btn_pressed() -> void:
	unselect_menu()
	selected = 'park'
	$Body/Menu/Principal/park_pnl/selected_pnl.show()

func _on_events_btn_pressed() -> void:
	unselect_menu()
	selected = 'events'
	$Body/Menu/Principal/events_pnl/selected_pnl.show()

func _on_trip_btn_pressed() -> void:
	unselect_menu()
	selected = 'trip'
	$Body/Menu/Principal/trip_pnl/selected_pnl.show()
