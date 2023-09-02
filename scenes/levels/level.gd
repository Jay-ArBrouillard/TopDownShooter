extends Node2D

const MAP_SIZE = Vector2(64, 64)

@onready var tileMap = $TileMap
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_world()

func generate_world():
	var spawn = tileMap.local_to_map(Vector2(0, 0))
	var moisture = FastNoiseLite.new()
	var temperature = FastNoiseLite.new()
	var altitude = FastNoiseLite.new()
	
	var emptyLandCells = []
	
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
	altitude.frequency = 0.001
	
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			var coords = Vector2i(spawn.x - MAP_SIZE.x / 2 + x, spawn.y - MAP_SIZE.y / 2 + y)
			var m = moisture.get_noise_2d(coords.x, coords.y) * 10
			var t = temperature.get_noise_2d(coords.x, coords.y) * 10
			var a = altitude.get_noise_2d(coords.x, coords.y) * 150
			
			var atlasCoords = Vector2(3 if a < 1 else round((m + 10) / 5), round((t + 10) / 5))
			tileMap.set_cell(0, coords, 1, atlasCoords, 0)
			
			# is land
			if atlasCoords.x != 3:
				emptyLandCells.append(coords)
				
	tileMap.set_cells_terrain_connect(1, emptyLandCells, 0, 0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func test_function():
	print("this is function in level.gd")

func _on_gate_player_entered_gate(body):
	print("entered gate: ", body)

func _on_player_laser_used(laser_position: Vector2, direction: Vector2):
	print("laser from level: ", laser_position)
	var laser: Area2D = laser_scene.instantiate() as Area2D
	laser.position = laser_position
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)

func _on_player_grenade_used(grenade_position: Vector2, direction: Vector2):
	print("grenade from level: ", grenade_position)
	var grenade: RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_position
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
