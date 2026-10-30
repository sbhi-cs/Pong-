extends Label

var pscore = 0
@onready var ball_node = get_node_or_null("../Ball")
signal playerwin


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball_node.playerscore.connect(_increment_player_points)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pscore >= 7:
		playerwin.emit()
	
func _increment_player_points():
	pscore += 1
	text = str(pscore)
	
