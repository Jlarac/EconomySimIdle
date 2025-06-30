# Guardar este script como "MusicPlayer.gd" o similar, y adjuntarlo a tu nodo AudioStreamPlayer

extends AudioStreamPlayer

@export var songs: Array[AudioStream] # Aquí arrastrarás tus canciones
var current_song_index = -1
var is_first_song_played = false # Una bandera para saber si ya sonó la primera canción

func _ready():
	randomize() # Asegura la aleatoriedad para las canciones futuras
	
	finished.connect(_on_song_finished) # Conecta la señal de fin de canción
	
	# Reproduce la primera canción (índice 0) al inicio
	if not songs.is_empty():
		stream = songs[0] # Asigna la primera canción del array
		play()
		current_song_index = 0 # Establece que la canción actual es la primera
		is_first_song_played = true # Marca que la primera canción ya se está reproduciendo
		print("Reproduciendo: Canción de inicio (Índice 0) - " + str(songs[0].resource_path.get_file()))
	else:
		print("¡Advertencia! No hay canciones en la lista para reproducir. 😟")

func play_random_song():
	if songs.is_empty():
		print("¡Advertencia! No hay canciones en la lista para reproducir. 😟")
		return

	var next_song_index: int
	
	# Si solo hay una canción, siempre reproduce esa (la 0)
	if songs.size() == 1:
		next_song_index = 0
	else:
		# Si ya se reprodujo la primera canción (índice 0), elegimos aleatoriamente entre las demás
		if is_first_song_played:
			# Queremos elegir una canción aleatoria que NO sea la actual y que NO sea la primera (0)
			# Si tenemos solo 2 canciones (0 y 1), y la actual es 0, queremos que siempre sea 1.
			# Si tenemos 2 canciones y la actual es 1, queremos que sea 0.
			# Es mejor simplemente elegir una aleatoria que no sea la actual.
			
			# Creamos una lista temporal de canciones disponibles (todas excepto la actual si es que hay más de una)
			var available_songs = []
			for i in range(songs.size()):
				# Excluye la canción que ya está sonando si tenemos más de una opción
				if i != current_song_index: 
					available_songs.append(i)
			
			# Si por alguna razón solo queda una canción disponible (ej. solo teníamos 2 y la otra está sonando),
			# entonces elegimos esa única opción.
			if available_songs.is_empty():
				next_song_index = current_song_index # Si no hay otra opción, repite la actual (caso muy raro)
			else:
				next_song_index = available_songs[randi() % available_songs.size()]
		else:
			# Esto no debería ejecutarse si _ready() ya reprodujo la primera canción,
			# pero como fallback, si no es la primera canción, aún así reproducirá la 0.
			next_song_index = 0 # Asegura que la primera sea la 0 si esta función es llamada antes de tiempo

	# Asigna el nuevo stream y reproduce
	self.stream = songs[next_song_index] 
	self.play()
	
	current_song_index = next_song_index
	# Ahora todas las canciones serán tratadas como parte del ciclo aleatorio
	is_first_song_played = true 
	
	print("Reproduciendo: Canción #" + str(current_song_index) + " de " + str(songs.size()) + " disponibles.")

func _on_song_finished():
	# Esta función se llama automáticamente cuando la canción actual termina
	play_random_song() # Llama a la función para elegir y reproducir la siguiente canción aleatoriamente
