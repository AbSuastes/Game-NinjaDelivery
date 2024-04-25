extends Node2D
var player_inhouse = false
var casa_ped = 0
@onready var hud_message = get_node("HUD/Mensajes/Mess")
@onready var hud_money = get_node("HUD/HUD/Cont/Amount")


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = $Player
	Global.current_scene = "Main"
	if Global.storeExit == "Sushi_Store":
		player.position.x = Global.player_store_exit_posx
		player.position.y = Global.player_store_exit_posy
	elif Global.storeExit == "Cafe":
		player.position.x = Global.player_store_exit_posx
		player.position.y = Global.player_store_exit_posy

	hud_message.text = " "
	hud_message.text = str(Global.pick_name) + " " + str(Global.pick_adress)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene()
	Global.check_wallet()
	hud_money.text = "$" + str(Global.player_wallet)
	checar_pedido()
	if Input.is_action_just_pressed("console"):
		print("Esta en casa " + str(casa_ped))
		print("Casa pedido " + str(Global.pick_number))
		print("EL jugador esta en casa " + str(player_inhouse))


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene_rest = true
		
func _on_cafeteria_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene_cafe = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene_rest = false

func _on_cafeteria_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene_cafe = false
		
func change_scene():
	if Global.transition_scene_rest == true:
		if Global.current_scene == "Main":
			get_tree().change_scene_to_file("res://Scenes/sushi_rest.tscn")
			Global.finish_changescene()
	elif Global.transition_scene_cafe == true:
		if Global.current_scene == "Main":
			get_tree().change_scene_to_file("res://Scenes/cafe_rest.tscn")
			Global.finish_changescene()
	
			

func pedido_entregado():
	Global.pick_name = "Sin pedido"
	Global.pick_img = ""
	Global.pick_adress = "Sin pedido"
	Global.pick_zone = 0
	Global.pick_number = 0
	Global.pick_tip = 0
	
func checar_pedido():
	if player_inhouse and Input.is_action_just_pressed("Ui_Accept") and Global.pick_number == casa_ped:
		# Realiza la acción deseada
		hud_message.text = " "
		hud_message.text = "Gracias"
		Global.player_wallet = Global.player_wallet + Global.pick_tip
		pedido_entregado()
		casa_ped = 0
		
	elif player_inhouse and Input.is_action_just_pressed("Ui_Accept") and Global.pick_number != casa_ped:
		hud_message.text = " "
		hud_message.text = "¡Esta casa no pidio nada!"
	


#comparaciones de casa con el pedido
func _on_casa_1_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 1

func _on_casa_1_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0


func _on_casa_2_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 2


func _on_casa_2_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0


func _on_casa_3_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 3

func _on_casa_3_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0
		
func _on_casa_4_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 4

func _on_casa_4_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0

func _on_casa_5_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 5


func _on_casa_5_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0


func _on_casa_6_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 6


func _on_casa_6_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0

func _on_casa_7_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 7


func _on_casa_7_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0


func _on_casa_8_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 8

func _on_casa_8_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0


func _on_casa_9_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 9


func _on_casa_9_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0

func _on_casa_10_body_entered(body):
	if body.name == "Player":
		player_inhouse = true
		casa_ped = 10


func _on_casa_10_body_exited(body):
	if body.name == "Player":
		player_inhouse = false
		casa_ped = 0






