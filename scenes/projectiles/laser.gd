extends Area2D

@export var speed: int = 1500
var direction: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
