extends Node

@export var music_tune:AudioStreamWAV 
@export var music_beats:AudioStreamWAV

@export var _audio_stream_player_scene:PackedScene

var _audio_players: Array[AudioStreamPlayer] = []

func _ready() -> void:
	if !Settings.on_settings_updated.is_connected(_toggle_mute):
		Settings.on_settings_updated.connect(_toggle_mute)
	_toggle_mute()

func _toggle_mute():
	AudioServer.set_bus_mute(0, !Settings.audio_enabled)

func stop_all_audio():
	for i in range(_audio_players.size()):
		_audio_players[i].stop()

func play_audio(audio:AudioStreamWAV, volume:float=-1, reset_to_start:bool = true, fade_duration:float = 0.5):
	var audioPlayer = _get_audio_player_for_audio(audio)
	if reset_to_start:
		audioPlayer.stop()
		audioPlayer.play()
	
	if volume != -1:
		# Tween to wanted value
		if fade_duration > 0:
			var tween = create_tween()
			tween.tween_property(audioPlayer, "volume_linear",volume, fade_duration)
		else:
			audioPlayer.volume_linear = volume

func stop_audio(audio:AudioStreamWAV):
	var audioPlayer = _get_audio_player_for_audio(audio)
	audioPlayer.stop()

func _get_audio_player_for_audio(audio:AudioStreamWAV):
	for i in range(_audio_players.size()):
		if _audio_players[i].stream == audio:
			return _audio_players[i]
	var new_audio_player = _audio_stream_player_scene.instantiate() as AudioStreamPlayer
	self.add_child(new_audio_player)
	_audio_players.append(new_audio_player)
	new_audio_player.stream = audio
	return new_audio_player
