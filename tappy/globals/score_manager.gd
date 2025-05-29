extends Node

const SCORE_PATH: String = "user://tappy.tres"
var _high_score: int = 0;

var high_score: int : 
	get : return _high_score
	set(value) : 
		if value > _high_score:
			_high_score = value
			save_high_score()
	
func _ready() -> void:
	load_high_score()

# Called when the node enters the scene tree for the first time.
func load_high_score() -> void:
	if ResourceLoader.exists(SCORE_PATH):
		var hsr: HighScoreRes = ResourceLoader.load(SCORE_PATH)
		if hsr:
			high_score = hsr.high_score


func save_high_score() -> void:
	var hsr: HighScoreRes = HighScoreRes.new()
	hsr.high_score = high_score
	ResourceSaver.save(hsr,SCORE_PATH)
