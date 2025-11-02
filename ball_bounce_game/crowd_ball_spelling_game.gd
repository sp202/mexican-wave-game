extends Node2D

@export var letter_dict:Dictionary[String, CrowdMember] = {}

func _ready() -> void:
	reset()


func reset() -> void:
	pass


func process_correct_input(letter:String):
	print("Correct letter input: ", letter)
	letter_dict[letter].stand_up(letter)
	await get_tree().create_timer(0.1).timeout
	letter_dict[letter].sit_down()

func process_incorrect_input(letter:String):
	print("Incorrect letter input: ", letter)

func _unhandled_input(event: InputEvent) -> void:
	
	if event.is_pressed() && event is InputEventKey:
		var key_event := event as InputEventKey
		var letter_input = PackedByteArray([key_event.unicode]).get_string_from_utf8()
		
		if letter_dict.has(letter_input):
			process_correct_input(letter_input)
		else:
			process_incorrect_input(letter_input)
		#var correct:bool = crowd_members[current_crowd_member_index+1].stand_up(
			#letter_input
		#)
		#
		#if correct:
			#process_correct_letter(letter_input)
		#else:
			#process_incorrect_letter(letter_input)
	
	
