extends Node2D

const SPEED: float = 120.0
@onready var laser: Area2D = $Laser


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	position.x -= SPEED *delta
	
	if position.x < get_viewport_rect().position.x - 100.0:
		queue_free()

func die():
	set_process(false)
	queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("PIPES: existed screen")
	die()


func _on_pipe_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die()
	


func _on_laser_body_entered(body: Node2D) -> void:
	if body is Tappy:
		laser.body_entered.disconnect(_on_laser_body_entered)
		SignalHub.on_plane_scored.emit()
		print("x")
