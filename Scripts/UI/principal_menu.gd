extends PanelContainer

var coin_scene = preload('res://Scenes/Cards/coin_card.tscn')
var active_coins = 0
var old_autoclic = 0
var old_screen = ''

var old_messages = false
var messages_status = false

func _ready() -> void:
	old_autoclic = Data.Game.Player.AutoClic

func _process(_delta: float) -> void:
	$Menu_container/Principal/Clock/Clock_btn.text = "+" + str(int(Data.Game.AutomaticHours)) + "h"
	
	if old_autoclic != Data.Game.Player.AutoClic:
		$AudioStreamPlayer.play()
		spawn_coin(Vector2($Menu_container/Principal/Clock/middle.get_screen_position()))
		old_autoclic = Data.Game.Player.AutoClic
	
	if old_screen != Data.screen:
		if Data.screen in ['home','study','houses_dashboard','business_dashboard','message']:
			$Menu_container/Principal/Realshop_pnl/TextureRect.texture = load('res://Assets/Images/HouseMenu/player.png')
		if Data.screen in ['market_houses','own_houses','work','house_market','house_own']:
			$Menu_container/Principal/Realshop_pnl/TextureRect.texture = load('res://Assets/Images/Menu/left.png')
		old_screen = Data.screen
	
	for message in Data.Game.Messages:
		messages_status = false
		if Data.Game.Messages[message]['status'] == true:
			messages_status = true
		
	if old_messages != messages_status:
		update_message()
		old_messages = messages_status

func spawn_coin(click_position: Vector2):
	active_coins += 1
	var coin = coin_scene.instantiate()
	var random_offset_x = randf_range(-40, 40)
	coin.position = click_position + Vector2(random_offset_x, 0)
	coin.connect("tree_exited", Callable(self, "_on_coin_removed"))
	get_tree().current_scene.add_child(coin)

func _on_coin_removed():
	active_coins -= 1
	#print("Monedas activas:", active_coins)

func _on_home_btn_pressed() -> void:
	if Data.screen in ['study','houses_dashboard','business_dashboard','message']:
		Data.screen = 'home'
	if Data.screen in ['market_houses','own_houses']:
		Data.screen = 'houses_dashboard'
	if Data.screen in ['house_market']:
		Data.screen = 'market_houses'
	if Data.screen in ['house_own']:
		Data.screen = 'own_houses'
	if Data.screen in ['work']:
		Data.screen = 'business_dashboard'
	Data.reset_carefull_income()

func _on_clock_btn_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$AudioStreamPlayer.play()
		Data.clic_manual()
		var global = $Menu_container/Principal/Clock/Clock_btn.get_global_position() + event.position
		spawn_coin(global)

func _on_message_btn_pressed() -> void:
	Data.screen = 'message'
	Data.reset_carefull_income()

func update_message():
	if messages_status == false:
		$Menu_container/Principal/email_pnl/TextureRect.texture = load('res://Assets/Images/Menu/email.png')
	else:
		$Menu_container/Principal/email_pnl/TextureRect.texture = load('res://Assets/Images/Menu/email_alert.png')
