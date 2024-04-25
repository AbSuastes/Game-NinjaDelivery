extends CharacterBody2D
# Velocidad de movimiento del jugador
@export var speed = 200

# Referencia al AnimationPlayer
var animation_player

func _ready():
	animation_player = $AnimationPlayer
	move_and_slide()
	
func player():
	pass

func _physics_process(delta):
	# Obtener el vector de movimiento basado en la entrada del jugador
	var input_vector = Input.get_vector("left", "right", "up", "down").normalized()
	if input_vector != Vector2.ZERO:
		velocity = input_vector * speed 
		
	if input_vector == Vector2.ZERO:
		velocity = Vector2.ZERO
	
	# Mover al jugador
	move_and_slide()
	
	# Determinar y reproducir la animación basada en la dirección del movimiento
	if input_vector != Vector2.ZERO:
		var velocity = input_vector * speed
		var animation_name = ""
		
		if abs(input_vector.x) > abs(input_vector.y):
			animation_name = "w_right" if input_vector.x > 0 else "w_left"
		else:
			animation_name = "w_down" if input_vector.y > 0 else "w_up"
		
		animation_player.play(animation_name)
	else:
		# Opción para detener la animación o reproducir una animación de estar parado si está disponible
		animation_player.play("idle")  # O ajusta a tu animación de estar parado según corresponda
		

