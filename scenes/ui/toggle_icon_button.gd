@abstract
extends Button
class_name ToggleIconButton

@export var _enabled_icon:Texture2D
@export var _disabled_icon:Texture2D

# Opens the popup, connecting up the provided button functionality.
func _ready() -> void:
	if !self.pressed.is_connected(_on_button_click):
		self.pressed.connect(_on_button_click)
	_update_toggle_icon()

func _on_button_click():
	var newValue = !_get_toggle_value()
	_set_toggle_value(newValue)
	_update_toggle_icon()

func _update_toggle_icon():
	if (_get_toggle_value()):
		self.icon = _enabled_icon
	else:
		self.icon = _disabled_icon

@abstract
func _get_toggle_value()

@abstract
func _set_toggle_value(value)
