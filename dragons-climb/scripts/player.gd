extends CharacterBody2D

@export var speed := 250.0
@export var jump_force := -420.0
@export var gravity := 1200.0


var facing := 1
var invulnerable := false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	var direction := 0
	if Input.is_action_pressed("move_left"):
		direction -= 1
	if Input.is_action_pressed("move_right"):
		direction += 1
		
	if direction != 0:
		facing = direction
		
	velocity.x = direction * speed
	
	if is_on_floor and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		
	if Input	.is_action_just_pressed("attack_left"):
		spawn_slash(-1)
	if Input.is_action_just_pressed("attack_right"):
		spawn_slash(1)
		
	move_and_slide()
	
func spawn_slash(dir):
	var slash = preload("res://scenes/actors/Slash.tscn").instantate()
	slash.direction = dir
	get_parent().add_child(slash)
	slash.global_position = global_position + Vector2(0, 10)
				
						
