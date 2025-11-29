class_name LeaderboardPopup extends ColorRect

@export var _leaderboard_entries_left: Array[LeaderboardUserEntry]
@export var _leaderboard_entries_right: Array[LeaderboardUserEntry]

@export var _leftmost_button:Button
@export var _left_button:Button
@export var _player_button:Button
@export var _right_button:Button
@export var _rightmost_button:Button

@export var _close_button:Button

var _leaderboard_pages: Array = []
var _current_page_index = 0
var _player_page_index = 0

func _ready() -> void:
	_setup_buttons()

	# Prepare the leaderboard data for pages
	_populate_leaderboard_data()

	# Search and store the PAGE that has the player's entry
	_player_page_index = -1
	for i in _leaderboard_pages.size():
		if _leaderboard_pages[i].any(func(entry): return entry.is_player):
			_player_page_index = i
			break
	# Init the view
	_navigate_to_leaderboard_page(_player_page_index)

	# Connect to visibility event
	visibility_changed.connect(_on_visibility_changed)

func _on_visibility_changed():
	if visible:
		_on_show()

func _on_show():
	_navigate_to_leaderboard_page(_player_page_index)

func _setup_buttons() -> void:
	if !_leftmost_button.pressed.is_connected(_on_leftmost_button_click):
		_leftmost_button.pressed.connect(_on_leftmost_button_click)
	if !_left_button.pressed.is_connected(_on_left_button_click):
		_left_button.pressed.connect(_on_left_button_click)
	if !_player_button.pressed.is_connected(_on_player_button_click):
		_player_button.pressed.connect(_on_player_button_click)
	if !_right_button.pressed.is_connected(_on_right_button_click):
		_right_button.pressed.connect(_on_right_button_click)
	if !_rightmost_button.pressed.is_connected(_on_rightmost_button_click):
		_rightmost_button.pressed.connect(_on_rightmost_button_click)
	if !_close_button.pressed.is_connected(_on_close_button_click):
		_close_button.pressed.connect(_on_close_button_click)

func _populate_leaderboard_data():
	_leaderboard_pages = [
		[
			{"position": 1,  "name": "Player1",  "score": 5000, "is_player": false},
			{"position": 2,  "name": "Player2",  "score": 4800, "is_player": false},
			{"position": 3,  "name": "Player3",  "score": 4700, "is_player": false},
			{"position": 4,  "name": "Player4",  "score": 4600, "is_player": false},
			{"position": 5,  "name": "Player5",  "score": 4500, "is_player": false},
			{"position": 6,  "name": "Player6",  "score": 4400, "is_player": false},
			{"position": 7,  "name": "Player7",  "score": 4300, "is_player": false},
			{"position": 8,  "name": "Player8",  "score": 4200, "is_player": false},
			{"position": 9,  "name": "Player9",  "score": 4100, "is_player": false},
			{"position": 10, "name": "Player10", "score": 4000, "is_player": false}
		],
		[
			{"position": 11, "name": "Player11", "score": 3900, "is_player": false},
			{"position": 12, "name": "Player12", "score": 3800, "is_player": false},
			{"position": 13, "name": "Player13", "score": 3700, "is_player": false},
			{"position": 14, "name": "Player14", "score": 3600, "is_player": false},
			{"position": 15, "name": "Player15", "score": 3500, "is_player": false},
			{"position": 16, "name": "Player16", "score": 3400, "is_player": false},
			{"position": 17, "name": "Eric",     "score": 3300, "is_player": true},
			{"position": 18, "name": "Player18", "score": 3200, "is_player": false},
			{"position": 19, "name": "Player19", "score": 3100, "is_player": false},
			{"position": 20, "name": "Player20", "score": 3000, "is_player": false}
		],
		[
			{"position": 21, "name": "Player21", "score": 2900, "is_player": false},
			{"position": 22, "name": "Player22", "score": 2800, "is_player": false},
			{"position": 23, "name": "Player23", "score": 2700, "is_player": false},
			{"position": 24, "name": "Player24", "score": 2600, "is_player": false},
			{"position": 25, "name": "Player25", "score": 2500, "is_player": false},
			{"position": 26, "name": "Player26", "score": 2400, "is_player": false},
			{"position": 27, "name": "Player27", "score": 2300, "is_player": false},
			{"position": 28, "name": "Player28", "score": 2200, "is_player": false},
			{"position": 29, "name": "Player29", "score": 2100, "is_player": false},
			{"position": 30, "name": "Player30", "score": 2000, "is_player": false}
		],
		[
			{"position": 31, "name": "Player31", "score": 1900, "is_player": false},
			{"position": 32, "name": "Player32", "score": 1800, "is_player": false},
			{"position": 33, "name": "Player33", "score": 1700, "is_player": false},
			{"position": 34, "name": "Player34", "score": 1600, "is_player": false},
			{"position": 35, "name": "Player35", "score": 1500, "is_player": false},
			{"position": 36, "name": "Player36", "score": 1400, "is_player": false},
			{"position": 37, "name": "Player37", "score": 1300, "is_player": false},
			{"position": 38, "name": "Player38", "score": 1200, "is_player": false},
			{"position": 39, "name": "Player39", "score": 1100, "is_player": false},
			{"position": 40, "name": "Player40", "score": 1000, "is_player": false}
		],
		[
			{"position": 41, "name": "Player41", "score": 900,  "is_player": false},
			{"position": 42, "name": "Player42", "score": 850,  "is_player": false},
			{"position": 43, "name": "Player43", "score": 800,  "is_player": false},
			{"position": 44, "name": "Player44", "score": 750,  "is_player": false},
			{"position": 45, "name": "Player45", "score": 700,  "is_player": false},
			{"position": 46, "name": "Player46", "score": 650,  "is_player": false},
			{"position": 47, "name": "Player47", "score": 600,  "is_player": false},
			{"position": 48, "name": "Player48", "score": 550,  "is_player": false},
			{"position": 49, "name": "Player49", "score": 520,  "is_player": false},
			{"position": 50, "name": "Player50", "score": 500,  "is_player": false}
		]
	]


func _on_close_button_click():
	hide()

func _on_leftmost_button_click():
	_navigate_to_leaderboard_page(0)

func _on_rightmost_button_click():
	_navigate_to_leaderboard_page(_leaderboard_pages.size()-1)

func _on_left_button_click():
	_navigate_to_leaderboard_page(_current_page_index - 1)

func _on_right_button_click():
	_navigate_to_leaderboard_page(_current_page_index + 1)

func _on_player_button_click():
	_navigate_to_leaderboard_page(_player_page_index)

func _navigate_to_leaderboard_page(index):
	_current_page_index = clamp(index, 0, _leaderboard_pages.size())

	# Toggle buttons visibility based on page
	var has_left = _current_page_index > 0
	var has_right = _current_page_index < _leaderboard_pages.size() -1
	_leftmost_button.visible = has_left
	_left_button.visible = has_left
	_right_button.visible = has_right
	_rightmost_button.visible = has_right

	# Populate entry visuals
	var leaderboard_page_data = _leaderboard_pages[_current_page_index]
	_populate_entries(_leaderboard_entries_left, leaderboard_page_data, 0)
	_populate_entries(_leaderboard_entries_right, leaderboard_page_data, 5)

func _populate_entries(entries:Array[LeaderboardUserEntry], data:Array, data_start_index:int = 0):
	for i in entries.size():
		var data_index = i + data_start_index
		var entry_vis = entries[i]
		if data_index < data.size():
			entry_vis.visible = true
			var entry_data = data[data_index]
			entry_vis.init(entry_data.position, entry_data.name, entry_data.score, entry_data.is_player)
		else:
			entry_vis.visible = false
