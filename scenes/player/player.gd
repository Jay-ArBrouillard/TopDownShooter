extends CharacterBody2D

signal laser_used
signal grenade_used

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
		laser_used.emit()
		can_laser = false
		$LaserTimer.start()

	# Grenade
	if Input.is_action_pressed("secondary action") and can_grenade:
		grenade_used.emit()
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
