extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.winner == "HOW" || Global.winner == "STOP TRYING":
		text = Global.winner
	else:
		text = Global.winner + " WINS"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
