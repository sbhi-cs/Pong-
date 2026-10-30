extends CharacterBody2D


var speed = 300.0
var yboundarymin = global_position.y - 100
var yboundarymax = global_position.y + 100
@onready var ball_node = get_node_or_null("../Ball")

func _ready():
	global_position = Vector2(1220, 400)
	print(ball_node)

func _physics_process(delta: float) -> void:
	
	if ball_node.velocity.x < 0: # moves code back to middle if ball is going opp way from enemy (toward player)
		velocity.y = 0
		if global_position.y > 400:
			velocity.y = -175
		elif global_position.y < 400:
			velocity.y = 175
	
	elif ball_node.global_position.y < yboundarymin:
		velocity.y = -200
	elif ball_node.global_position.y > yboundarymax:
		velocity.y = 200
	else:
		velocity.y = 0
	
	
	
	yboundarymin = global_position.y - 100
	yboundarymax = global_position.y + 100
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
	
	global_position.x = 1220
