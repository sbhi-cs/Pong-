extends CharacterBody2D

var hit_distance
var speedconst = 300
var speed = 300
var accelrate = 1.05
@onready var enemy_paddle = get_node_or_null("../enemypaddle")

signal playerscore
signal enemyscore

func _ready():
	global_position = Vector2(640, 400)
	match Global.mode:
		"EASY":
			speedconst = 200
			accelrate = 1.02
		"MEDIUM":
			speedconst = 300
			accelrate = 1.05
		"HARD":
			speedconst = 400
			accelrate = 1.1
		"IMPOSSIBLE":
			speedconst = 800
			accelrate = 1.25
	speed = speedconst

	velocity = Vector2(speed-100, speed-100) #starting ball speed
func _physics_process(delta: float) -> void:
	
	if global_position.x < 0:
		enemyscore.emit()
		speed = speedconst
		velocity.x = -sign(velocity.x) * speed
		velocity.y = speed
		global_position = Vector2(640, 400)
	elif global_position.x > 1280:
		playerscore.emit()
		speed = speedconst
		velocity.x = -sign(velocity.x) * speed
		velocity.y = speed
		global_position = Vector2(640, 400)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.get_collider().name == "topboundary" || collision.get_collider().name == "bottomboundary":
			velocity = velocity.bounce(collision.get_normal()) # just normal collission if bouncing off top or bottom
		else:
			speed *= accelrate # accels ball after every hit
			hit_distance = collision.get_collider().global_position.y - (collision.get_position().y)
			hit_distance /= 100 # ok to keep constant since it cant be over 1
			hit_distance *= 1.3
			velocity.x *= -1
			velocity.y = -hit_distance * speed 
			velocity = velocity.normalized() * speed
			
	
