extends Node

const GAME = preload("res://scenes/game/game.tscn")
const MAIN = preload("res://scenes/main/main.tscn")


func get_game_screen() -> void:
	get_tree().change_scene_to_packed(GAME)
func get_main_screen() -> void:
	get_tree().change_scene_to_packed(MAIN)
