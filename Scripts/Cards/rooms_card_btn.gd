extends Control

var Id
var Icon = load("res://Assets/Images/UI/img128.png")
signal selected_enviroment(new_enviroment)

func _ready() -> void:
	selected_enviroment.emit()
	$Panel/TextureButton.texture_normal = Icon

func _process(_delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	emit_signal("selected_enviroment",Id)
