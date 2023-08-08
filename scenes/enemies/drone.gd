extends CharacterBody2D

const SPEED: int = 10

func _process(_delta):
	var direction = Vector2.RIGHT
	
	velocity += direction * SPEED
	
	move_and_slide()
	
#	if get_slide_collision_count() > 0:
#		position.x = 0
