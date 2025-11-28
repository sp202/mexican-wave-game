extends ToggleIconButton
class_name AudioToggleButton

func _get_toggle_value():
    return Settings.audio_enabled

func _set_toggle_value(value):
    Settings.audio_enabled = value