extends CharacterBody2D


@export var speed: float = 100.0
@export var jump_velocity: float = -400.0
@export var gravity: float = 900.0

var is_dead = false
@export var death_jump_velocity: float = -300.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# dead situiation
	if is_dead:
		velocity.y += gravity * delta
		move_and_slide()
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = jump_velocity
		

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		animated_sprite_2d.play("walk")
		velocity.x = direction * speed
		
		if direction == -1:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		animated_sprite_2d.play("default")
	
	
	
	move_and_slide()
	
	
func game_over():
	if is_dead: 
		return
	is_dead = true
	velocity.x = 0
	velocity.y = death_jump_velocity
	
