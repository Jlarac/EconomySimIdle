extends Control

var Item_card = preload("res://Scenes/Cards/work_card.tscn")
var Separator_card = preload("res://Scenes/Cards/separator_card.tscn")
var level_next_work = {0:0, 1: 10, 2: 50,3: 100, 4: 150, 5: 200,6: 250, 7: 300, 8: 350,9: 400, 10: 500}
var separators = [0,1,2,3,4,5,6,7,8,9,10]
var old_level = 0
var old_len_available_works = 0
var max_scroll = 0
var work_pos = 0
var steps = 0
var update_scroll = 0
var old_screen = ''

func _ready() -> void:
	for work in Data.Database.Work:
		if Data.Database.Work[work]['Level'] == 0:
			create_item(work)
		if Data.Database.Work[work]['Level'] != 0:
			if Data.Database.Work[work]['Level'] != old_level:
				create_separator(Data.Database.Work[work]['Level'])
				old_level = Data.Database.Work[work]['Level']
			create_item(work)

func _process(_delta: float) -> void:
	if old_len_available_works != len(Data.Game.Player.WorkAvailable):
		old_level = 1
		for child in $Item_container/ScrollContainer/VBoxContainer.get_children():
			child.hide()
			if child.Id in Data.Game.Player.WorkAvailable:
				child.show()
				if Data.Database.Work[child.Id]['Level'] != 0:
					old_level = Data.Database.Work[child.Id]['Level'] + 1
			if child.Id in separators:
				if child.Id <= old_level:
					child.show()
		old_len_available_works = len(Data.Game.Player.WorkAvailable)
		update_scroll = 1
	if old_screen != Data.screen:
		update_scroll = 0
		if Data.screen == 'work':
			update_scroll = 1
		old_screen = Data.screen
	if update_scroll == 1:
		update_scroll_view()
		update_scroll = 0

func update_scroll_view():
	steps = 0
	for child in $Item_container/ScrollContainer/VBoxContainer.get_children():
		if child.Id in Data.Game.Player.WorkAvailable:
			steps += 1
			if child.Id == Data.Game.Player.Work:
				work_pos = steps
			max_scroll = steps
	$Item_container/ScrollContainer.scroll_vertical = clampi(570 * (work_pos-1), 0, 570 * max_scroll) 

func create_item(item) -> void:
	var addcard = Item_card.instantiate()
	addcard.Id = item
	$Item_container/ScrollContainer/VBoxContainer.add_child(addcard)

func create_separator(item) -> void:
	var addcard = Separator_card.instantiate()
	addcard.Id = item
	$Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
