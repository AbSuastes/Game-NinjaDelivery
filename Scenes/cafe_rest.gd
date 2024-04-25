extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.current_scene = "Cafe"
	print(Global.current_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()



func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene_cafe = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene_cafe = false

func change_scene():
	if Global.transition_scene_cafe == true:
		if Global.current_scene == "Cafe":
			get_tree().change_scene_to_file("res://Main.tscn")
			Global.storeExit = "Cafe"
			Global.player_store_exit_posx = 1269
			Global.player_store_exit_posy = 140
			Global.finish_changescene()
		else:
			pass
