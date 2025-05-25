extends Area2D

class_name Gem

const SPEED: float = 200.0

signal gem_off_screen

func _ready() -> void:
	pass

	
func _process(delta: float) -> void:
	position.y += SPEED * delta
	
	if position.y > Game.get_vpr().end.y:
		print("GEm: Gem fails off")
		gem_off_screen.emit()
		die()


func die() -> void:
	set_process(false)
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("GEM: Gem hit paddle")
	die()
