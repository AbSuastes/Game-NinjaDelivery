extends Camera2D

@export var tilemap: TileMap 
# Called when the node enters the scene tree for the first time.
func _ready():
#Acesa al tilemap y su dimension rectangulo
	var mapRect = tilemap.get_used_rect()
	var tileSize= tilemap.get_rendering_quadrant_size
	
	limit_right = mapRect.size.x * 16
	limit_bottom =  mapRect.size.y * 16


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
