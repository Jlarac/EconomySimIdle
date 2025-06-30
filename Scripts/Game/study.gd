extends Control

var Item_card = preload("res://Scenes/Cards/study_card.tscn")

func _ready() -> void:
	for item in Data.Database.Study.keys():
		create_item(item)

func _process(_delta: float) -> void:
	pass

func create_item(item) -> void:
	var addcard = Item_card.instantiate()
	addcard.Id = item
	$Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
