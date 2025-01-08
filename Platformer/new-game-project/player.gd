extends CharacterBody2D

<<<<<<< Updated upstream
#defining variables for gravity and speed
const SPEED = 130.0
const JUMP_VELOCITY = -300.0

#creates a variable for the player
@onready var player = $AnimatedSprite2D

func _rotate_player(delta):
=======
# Define speed and jump velocity
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 500.0

# Variable to access for player sprite
@onready var player = $AnimatedSprite2D

func _rotate_player():
	# Flip the sprite based on the movement direction
>>>>>>> Stashed changes
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

<<<<<<< Updated upstream
# melee_attack doesn't work yet. Need to find out how to detect keypress
#func _melee_attack(delta):
#	if Input.is_action_pressed("q"):
#		player.play("Attack")

	
	var direction := Input.get_axis("ui_left", "ui_right")
	
=======
	# Animation if statements
>>>>>>> Stashed changes
	if is_on_floor():
		if direction != 0:
<<<<<<< Updated upstream
		# if movement is not null, the player does the run animation.
			velocity.x = direction * SPEED
			player.play("Run")
			
		if direction == 0:
			velocity.x=0
			player.play("Idle")  # if not, it plays the "Idle" animation
			
		# if the user presses ui_accept, the player jumps
		elif Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			player.play("Jump")

# doesn't work yet		
#if movement isn't null, and player isn't on the floor
	if direction != 0 and not is_on_floor():
		velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED
		


=======
			player.play("Run")
		else:
			player.play("Idle")
	else:
		player.play("Jump")

	_rotate_player()
>>>>>>> Stashed changes

	# Move the character and resolve collisions
	move_and_slide()
