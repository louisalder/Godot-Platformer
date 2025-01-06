extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var player = $AnimatedSprite2D

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		player.flip_h = false  # Face right
	elif Input.is_action_pressed("ui_left"):
		player.flip_h = true  # Face left

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta



	
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if is_on_floor():
		
		if direction != 0:
			velocity.x = direction * SPEED
			player.play("Run")
			
		if direction == 0:
			velocity.x=0
			player.play("Idle")  # Play the "Idle" animation
			

			
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			player.play("Jump")
			


			

	move_and_slide()
