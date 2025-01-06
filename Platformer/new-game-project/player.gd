extends CharacterBody2D

#defining variables for gravity and speed
const SPEED = 130.0
const JUMP_VELOCITY = -300.0

#creates a variable for the player
@onready var player = $AnimatedSprite2D

func _rotate_player(delta):
	if Input.is_action_pressed("ui_right"):
		player.flip_h = false  # Face right
	elif Input.is_action_pressed("ui_left"):
		player.flip_h = true  # Face left

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


# melee_attack doesn't work yet. Need to find out how to detect keypress
#func _melee_attack(delta):
#	if Input.is_action_pressed("q"):
#		player.play("Attack")

	
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if is_on_floor():
		
		if direction != 0:
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
		



	move_and_slide()
