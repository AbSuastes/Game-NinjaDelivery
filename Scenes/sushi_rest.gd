extends Node

@onready var item_name = get_node("Pedidos_trigg/Entregas/Item_holder/Name")
@onready var item_img = get_node("Pedidos_trigg/Entregas/Item_holder/Item_img")
@onready var item_adress = get_node("Pedidos_trigg/Entregas/Item_holder/Adress")

var item_num = 0
var item_zone = 0
var item_tip = [0.5, 1, 1.5, 2]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	Global.current_scene = "Sushi_Rest"
	Global.check_wallet()
	print(Global.vent_pedidos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()

func _on_area_2d_body_entered(body):
	
	if body.has_method("player"):
		Global.transition_scene_rest = true
		


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene_rest = false

func change_scene():
	if Global.transition_scene_rest == true:
		if Global.current_scene == "Sushi_Rest":
			get_tree().change_scene_to_file("res://Main.tscn")
			Global.storeExit = "Sushi_Store"
			Global.player_store_exit_posx = 136
			Global.player_store_exit_posy = 120
			Global.finish_changescene()
		else:
			pass


func _on_pedidos_body_entered(body):
	var random_ped = randi_range(0,3)
	Global.vent_pedidos = true
	if body.name == "Player":
		get_tree().paused = true #pausar el juego
		
		get_node("Pedidos_trigg/Entregas/AnimationPlayer").play("Entrada") #llama la escena de los pedidos
		item_img.texture = Global.sushi_products[random_ped]["Img"]
		item_name.text = Global.sushi_products[random_ped]["Name"]
		item_num = randi_range(1,10)
		item_adress.text = "Calle principal Num " + str(item_num)
		item_zone = 1
		pickup_item()
		print(Global.pick_name)
		print(Global.pick_adress)
		print(Global.pick_tip)
		
		
	

func pickup_item():
	Global.pick_name = item_name.text
	Global.pick_img = item_img.texture
	Global.pick_adress = item_adress.text
	Global.pick_zone = item_zone
	Global.pick_number = item_num
	Global.pick_tip = item_tip[randi_range(0, item_tip.size() -1)]


