extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acept_ped()


func _on_button_pressed():
	get_node("AnimationPlayer").play("Salida")
	get_tree().paused = false

func acept_ped():
	if Input.is_action_just_pressed("Ui_Accept"):
		if Global.vent_pedidos == true:
			get_node("AnimationPlayer").play("Salida")
			get_tree().paused = false
			Global.vent_pedidos = false
