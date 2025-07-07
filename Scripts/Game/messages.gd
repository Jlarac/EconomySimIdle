extends Control

var Item_card = preload("res://Scenes/Cards/message_card.tscn")
var old_screen = ''
var old_qty = 0

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if old_screen != Data.screen:
		update_screen()
		old_screen = Data.screen
	if old_qty != len(Data.Game.Messages):
		update_screen()
		old_qty = len(Data.Game.Messages)

func update_screen():
	for card in $Item_container/ScrollContainer/VBoxContainer.get_children():
		card.queue_free()
	for item in range(Data.Game.Messages.size(), 0, -1):
		create_item(item)

func create_item(item) -> void:
	var addcard = Item_card.instantiate()
	addcard.Id = item
	$Item_container/ScrollContainer/VBoxContainer.add_child(addcard)
