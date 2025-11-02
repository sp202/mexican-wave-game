extends Node2D


@onready var player_crowd_line: CrowdLine = $PlayerCrowdLine
@onready var enemy_crowd_line: CrowdLine = $EnemyCrowdLine

enum State {
	WAITING,
	PLAYING,
	VICTORY,
	LOSS,
}
var state:State

func _ready() -> void:
	reset()


func reset() -> void:
	state = State.WAITING
	player_crowd_line.accepting_inputs = true
	player_crowd_line.reset()
	enemy_crowd_line.reset()
	$Ready.show()
	$GO.hide()
	$WinScreen.hide()
	$LossScreen.hide()

func _on_player_crowd_line_go() -> void:
	state = State.PLAYING
	$Ready.hide()
	$GO.show()
	$GO/BlinkTimer.start()
	enemy_crowd_line.execute_wave(3)

func process_win():
	print("YOU WIN!")
	state = State.VICTORY
	enemy_crowd_line.stop()
	await get_tree().create_timer(0.3).timeout
	player_crowd_line.all_sit_down()
	player_crowd_line.execute_wave(1)
	await player_crowd_line.done_auto_wave
	player_crowd_line.stop()
	$WinScreen.show()

func process_loss() -> void:
	print("YOU LOSE!")
	state = State.LOSS
	player_crowd_line.stop()
	$LossScreen.show()


func _on_player_crowd_line_done_manual_wave() -> void:
	if state == State.PLAYING:
		process_win()

func _on_enemy_crowd_line_done_auto_wave() -> void:
	if state == State.PLAYING:
		process_loss()

func _on_blink_timer_timeout() -> void:
	$GO.hide()


func _on_button_pressed() -> void:
	reset()
