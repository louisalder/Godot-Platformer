extends CharacterBody2D

# Define speed and jump velocity
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 500.0

# Variable to access for player sprite
@onready var player = $AnimatedSprite2D

func _rotate_player():
	# Flip the sprite based on the movement direction
	if Input.is_action_pressed("ui_right"):
		player.flip_h = false  # Face right
	elif Input.is_action_pressed("ui_left"):
		player.flip_h = true  # Face left

func _physics_process(delta: float) -> void:
	# Handles movement left and right
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	# Apply gravity when not on the floor
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump logic
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		


	# Animation if statements
	if is_on_floor():
		if direction != 0:
			player.play("Run")
		else:
			player.play("Idle")
	else:
		player.play("Jump")

	_rotate_player()
	
func _process(delta):
	if Input.is_action_just_pressed("Attack") and is_on_floor() and not player.is_playing():
		player.play("Attack")


	# Move the character and resolve collisions
	move_and_slide()
