extends CharacterBody2D

var direction : Vector2 = Vector2.RIGHT
var speed : float = 300

func _physics_process(delta):
	position += direction * speed * delta
