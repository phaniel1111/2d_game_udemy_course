extends CharacterBody2D

class_name Tappy

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const JUMP_POWER: float = -350.0

var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")


func _ready():
	animated_sprite_2d.play("fly")
	


func _physics_process(delta: float) -> void:
	
	fly(delta)
	
	move_and_slide()
	
	if is_on_floor():
		die()
		
func fly(delta: float) -> void:
	velocity.y += _gravity *delta
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_POWER
		animation_player.play("jump")

func die() -> void:
		animated_sprite_2d.stop()
		set_physics_process(false)
		SignalHub.on_plane_died.emit()
