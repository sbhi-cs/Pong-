extends CharacterBody2D


var speed = 300.0

func _ready():
	global_position = Vector2(60, 400)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("speed_up"):
		speed = 450
	else:
		speed = 300
	# shift makes your paddle go faster
	
	if global_position.y > 700:
		global_position.y = 700
	if global_position.y < 100:
		global_position.y = 100
		# gives paddle boundaries
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * speed
	else:
		velocity.y = direction * speed * -1
		
		

	move_and_slide()
	
	global_position.x = 60
