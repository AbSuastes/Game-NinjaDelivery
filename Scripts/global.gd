extends Node

var current_scene = "Main"
var transition_scene_rest = false
var transition_scene_cafe = false

var player_storeenter_posx = 0
var player_storeenter_posy = 0

var player_store_exit_posx = 136
var player_store_exit_posy = 120
var player_wallet = 0

var pick_name = ""
var pick_img= ""
var pick_adress = "None"
var pick_zone = 0
var pick_number = 0
var pick_tip = 0

var storeExit = "none"

#sushi rest support var
var sushi_products = {
	0: {
		"Name": "Sushi",
		"Img": preload("res://Items/Sushi.png")
		},
	1: {
		"Name": "Sashimi",
		"Img": preload("res://Items/Sashimi.png")
		},
	2: {
		"Name": "Salmon",
		"Img": preload("res://Items/FishSteak.png")
		},
	3: {
		"Name": "Shrimp",
		"Img": preload("res://Items/Shrimp.png")
		},
}
var vent_pedidos = false


#funciones multiples
func _process(_delta):
	check_wallet()
	
func finish_changescene():
	if transition_scene_rest== true:
		transition_scene_rest = false
		if current_scene == "Main":
			current_scene = "Sushi_Rest"
		else:
			current_scene = "Main"
	elif transition_scene_cafe == true:
		transition_scene_cafe = false
		if current_scene == "Main":
			current_scene = "Cafe"
		else:
			current_scene = "Main"
		
func check_wallet():
	if Input.is_action_just_pressed("wallet"):
		print("$" + str(player_wallet))


