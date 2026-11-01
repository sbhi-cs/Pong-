extends Label
var index = 0
var descriptions = [
	"SLOW ENEMY AI, SLOW BALL, \nLOW ACCELLERATION RATE. \nVERY EASY",
	"BALL AND ENEMY AI SPEED UP, \nACCELLERATION RATE INCREASED. \nRECOMMENDED",
	"BALL AND ENEMY AI SUPERFAST, \nACCELLERATION RATE INCREASED. \nTIP: USE BALL ACCELLERATION",
]

var impossibleactive = false
var impossibledesc = "DON'T EVEN TRY"
@onready var mode_node = get_node_or_null("../HBoxContainer/modetext")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mode_node.impossible_activated.connect(_set_impossible_true)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left") == true:
		index -= 1
	elif Input.is_action_just_pressed("ui_right") == true:
		index += 1
	text = descriptions[index % 3]
	
	if impossibleactive == true:
		text = impossibledesc


func _on_leftarrow_pressed() -> void:
	index -= 1


func _on_rightarrow_pressed() -> void:
	index += 1
	
func _set_impossible_true():
	impossibleactive = true
