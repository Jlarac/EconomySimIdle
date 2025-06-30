extends Node

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Data.run:
		if Data.screen != "create":
			Data.Game.Date += int(delta * Data.seconds)
