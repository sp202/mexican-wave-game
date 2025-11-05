extends Node2D

const CAMERA_SPEED = 200

@onready var camera: Camera2D = $Camera2D

var moving:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if moving:
		camera.position += Vector2(1,0)*delta*CAMERA_SPEED
