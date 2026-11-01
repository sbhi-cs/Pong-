extends Label

@onready var ball_node = get_node_or_null("../Ball")
var escore = 0
signal enemywin

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball_node.enemyscore.connect(_increment_enemy_points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if escore >= 7:
		if Global.mode == "IMPOSSIBLE":
			Global.winner = "STOP TRYING"
			enemywin.emit()
		else:
			Global.winner = "ENEMY"
			enemywin.emit()

func _increment_enemy_points():
	escore += 1
	text = str(escore)
