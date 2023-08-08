extends Node2D

var test_array: Array[String] = ["Test", "bayar", "layar"]

# Called when the node enters the scene tree for the first time.
func _ready():
#	$Player.rotation_degrees = 0
#
#	for i in test_array:
#		print(i)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	$Player.rotation_degrees += 500 * delta
#
#	if Input.is_action_pressed("left"):
#		$Player.position.x -= 300 * delta
#
#	if Input.is_action_pressed("right"):
#		$Playear.position.x += 300 * delta
#
#	if Input.is_action_pressed("up"):
#		$Player.position.y -= 300 * delta
#
#	if Input.is_action_pressed("down"):
#		$Player.position.y += 300 * delta
	pass
	
func test_function():
	print("this is function in level.gd")

func _on_gate_player_entered_gate(body):
	print("entered gate: ", body)

func _on_player_laser_used():
	print("laser from level")

func _on_player_grenade_used():
	print("grenade from level")
