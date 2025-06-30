extends Control

var time = 0
var run = false
var target = 2

func _ready() -> void:
	pass
	#await get_tree().create_timer(2).timeout
	#run = true

func _process(delta: float) -> void:
	time += delta
	$All_Logos/MarginContainer/ProgressBar.value = (time/target) * 100
	if time > target:
		match Data.screen:
			'load':
				get_tree().change_scene_to_file('res://Scenes/Game/home.tscn')
				Data.screen = 'home'
			'create':
				get_tree().change_scene_to_file('res://Scenes/UI/create_character.tscn')
