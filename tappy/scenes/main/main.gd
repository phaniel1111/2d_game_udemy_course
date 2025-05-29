extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var score: Label = $score

func _ready() -> void:
	animation_player.play("flash")
	get_tree().paused = false
	get_high_score()
	
func get_high_score() -> void:
	score.text = "%04d" % ScoreManager.high_score
	

func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#print(event)
	if event.is_action_pressed("jump") and !event.is_echo():
		GameManager.get_game_screen()
