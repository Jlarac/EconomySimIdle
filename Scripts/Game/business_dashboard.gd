extends Control

var old_work = 'no_work'

func _ready() -> void:
	$current_work/Control.Id = Data.Game.Player.Work
	$current_work/Control.Screen = 'business'

func _process(_delta: float) -> void:
	if old_work != Data.Game.Player.Work:
		$current_work/Control.Id = Data.Game.Player.Work
		print(Data.Game.Player.Work)
		old_work = Data.Game.Player.Work
