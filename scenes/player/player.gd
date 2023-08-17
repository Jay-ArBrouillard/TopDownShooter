extends CharacterBody2D

signal laser_used(laser_position: Vector2)
signal grenade_used(grenade_position: Vector2)

var can_laser: bool = true
var can_grenade: bool = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()

	# Shooting
	if Input.is_action_pressed("primary action") and can_laser:
		# randomly select a marker2D from LaserStartPositions
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi_range(0, laser_markers.size()-1)]
		can_laser = false
		$LaserTimer.start()
		# emit the laser position selected
		laser_used.emit(selected_laser.global_position)

	# Grenade
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		grenade_used.emit($GrenadePosition.global_position)


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
