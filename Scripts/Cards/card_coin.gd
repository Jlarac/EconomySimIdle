extends Node2D

func _ready() -> void:
	var path = ''
	if Data.Game.Player.MoneyPerDay < 0:
		path = 'res://Assets/Images/Menu/loose.png'
	elif Data.Game.Player.MoneyPerDay < 1:
		path = 'res://Assets/Images/Menu/fly.png'
	elif Data.Game.Player.MoneyPerDay < 1000:
		path = 'res://Assets/Images/Menu/coin.png'
	else:
		path = 'res://Assets/Images/Menu/bill.png'
	
	$Panel/item.texture = load(path)
	$AnimationPlayer.play("float_up")

func _process(_delta: float) -> void:
	pass

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
