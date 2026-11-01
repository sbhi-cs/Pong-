extends Node2D
@onready var playerscore_node = get_node_or_null("PlayerScore")
@onready var enemyscore_node = get_node_or_null("EnemyScore")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerscore_node.playerwin.connect(_set_player_win)
	enemyscore_node.enemywin.connect(_set_enemy_win)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _set_player_win():
	get_tree().change_scene_to_file("res://winscreen.tscn")

func _set_enemy_win():
	get_tree().change_scene_to_file("res://winscreen.tscn")
