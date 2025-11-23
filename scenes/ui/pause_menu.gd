class_name PauseMenu extends GamePopup

@export var _retry_button:Button
@export var _home_button:Button
@export var _toggle_audio_button:Button

@export var _audio_on_icon:Texture2D
@export var _audio_off_icon:Texture2D

var _game_controller:GameController
var _sound_is_on:bool = true

# Opens the popup, connecting up the provided button functionality.
func open_popup(game_controller:GameController):
    _game_controller = game_controller
    show()

func _toggle_audio_button_clicked():
    # There is no sound in the game so this does nothing. For now we'll just change the icon.
    _sound_is_on = !_sound_is_on
    if (_sound_is_on):
        _toggle_audio_button.icon = _audio_on_icon
    else:
        _toggle_audio_button.icon = _audio_off_icon

func _quit_button_clicked():
    _game_controller.quit()

func _restart_button_clicked():
    _game_controller.restart()