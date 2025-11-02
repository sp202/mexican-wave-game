extends Node2D


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "wave_animation":
		$Water/AnimationPlayer.play("wave_retract_animation")
	elif anim_name == "wave_retract_animation":
		$Water/AnimationPlayer.play("wave_animation")
