extends Node2D

#var test_array: Array[String] = ["Test", "bayar", "layar"]
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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
