extends Control

@onready var spress_space_label: Label = $SpressSpaceLabel
@onready var game_over_label: Label = $GameOverLabel
@onready var score: Label = $MarginContainer/Score
@onready var sound: AudioStreamPlayer = $Sound
const GAME_OVER = preload("res://assets/audio/game_over.wav")

var _scores : int = 0;

func _ready() -> void:
	_scores = 0
	
func _enter_tree() -> void:
	SignalHub.on_plane_died.connect(game_over)
	SignalHub.on_plane_scored.connect(increase_score)


func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#print(event)
	if event.is_action_pressed("exit") :
		GameManager.get_main_screen()
	elif spress_space_label.visible == true and event.is_action_pressed("jump"):
		ScoreManager.high_score = _scores
		GameManager.get_main_screen()

func game_over() -> void:
	sound.stop()
	sound.stream = GAME_OVER
	sound.play()
	game_over_label.show()
	await get_tree().create_timer(2.0).timeout
	game_over_label.hide()
	spress_space_label.show()

func increase_score() -> void:
	sound.play()
	_scores +=1
	score.text = "%04d" % _scores
	
	
	
	
