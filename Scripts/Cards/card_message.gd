extends Control

var Id
var active_theme = preload('res://Resources/Themes/card_theme.tres')
var disabled_theme = preload('res://Resources/Themes/disabled_card.tres')
var old_status = true

func _ready() -> void:
	$Message/HBoxContainer/Panel/state_mind_img.texture = load(Data.Game.Messages[Id]['icon'])
	$Message/HBoxContainer/indicators_section/title_lbl.text = tr(Data.Game.Messages[Id]['area'])
	$Message/HBoxContainer/indicators_section/body_lbl.text = tr(Data.Game.Messages[Id]['message']) + ': \n     ' + tr(Data.Game.Messages[Id]['item'])

func _process(_delta: float) -> void:
	if old_status != Data.Game.Messages[Id]['status']:
		if Data.Game.Messages[Id]['status'] == true:
			$Message.add_theme_stylebox_override("panel",active_theme)
		else:
			$Message.add_theme_stylebox_override("panel",disabled_theme)
		old_status = Data.Game.Messages[Id]['status']

func _on_button_pressed() -> void:
	if Data.Game.Messages[Id]['status'] == true:
		Data.Game.Messages[Id]['status'] = false
