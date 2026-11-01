extends Button

var gamemodes = ["EASY", "MEDIUM", "HARD"]
var index = 0 
var secret_code = ["ui_up", "ui_up", "ui_down", "ui_down", "ui_left", "ui_right", "ui_left", "ui_right", "ui_konami1", "ui_left"]
var code_index = 0
var impossibleactive = false

signal impossible_activated
signal nextscreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left") == true:
		index -= 1
	elif Input.is_action_just_pressed("ui_right") == true:
		index += 1
	text = gamemodes[index % 3]
	
	if impossibleactive == true:
		text = "IMPOSSIBLE"
	
	if Input.is_action_just_pressed("ui_accept"):
		pressed.emit()
		
func _input(event):
	if not event is InputEventKey:
		return
	if not event.pressed or event.echo:
		return
	secretcodecheck(event)

func secretcodecheck(event):
	if event.is_action_pressed(secret_code[code_index]):
		code_index += 1
		print(code_index)
		if code_index >= 10:
			impossibleactive = true
			impossible_activated.emit()
			code_index = 0
			return
		elif code_index > 0:
			return
		else:
			code_index = 0
			return
	else:
		code_index = 0
		print("reset")
		return

func _on_leftarrow_pressed() -> void:
	index -= 1


func _on_rightarrow_pressed() -> void:
	index += 1


func _on_pressed() -> void:
	if impossibleactive == true:
		Global.mode = "IMPOSSIBLE"
	else:
		Global.mode = gamemodes[index % 3]
