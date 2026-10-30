extends Label

@onready var playerscore_node = get_node_or_null("../PlayerScore")
@onready var enemyscore_node = get_node_or_null("../EnemyScore")
@onready var ball_node = get_node_or_null("../Ball")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerscore_node.playerwin.connect(_set_player_win)
	enemyscore_node.enemywin.connect(_set_enemy_win)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _set_player_win():
	text = "Player Wins!"
	ball_node.velocity = Vector2(0, 0)
	ball_node.set_physics_process(false)
	
func _set_enemy_win():
	text = "Enemy Wins!"
	ball_node.velocity = Vector2(0, 0)
	ball_node.set_physics_process(true)
