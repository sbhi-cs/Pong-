extends CharacterBody2D

var hit_distance
var speed = 300
@onready var enemy_paddle = get_node_or_null("../enemypaddle")

signal playerscore
signal enemyscore

func _ready():
	global_position = Vector2(640, 400)
	velocity = Vector2(200, 200) #ball goes 200 pixel a second vertical and horizontal
func _physics_process(delta: float) -> void:
	
	if global_position.x < 0:
		enemyscore.emit()
		speed = 300
		velocity.x = -sign(velocity.x) * 200
		velocity.y = 200
		global_position = Vector2(640, 400)
	elif global_position.x > 1280:
		playerscore.emit()
		speed = 300
		velocity.x = -sign(velocity.x) * 200
		velocity.y = 200
		global_position = Vector2(640, 400)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.get_collider().name == "topboundary" || collision.get_collider().name == "bottomboundary":
			velocity = velocity.bounce(collision.get_normal())
		else:
			speed *= 1.05 # accels ball after every hit
			hit_distance = collision.get_collider().global_position.y - (collision.get_position().y)
			hit_distance /= 100
			hit_distance *= 1.5
			velocity.x *= -1
			velocity.y = -hit_distance * speed 
			velocity = velocity.normalized() * speed
			
	
