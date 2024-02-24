class_name Bullet extends Area2D# credit to this video: https://www.youtube.com/watch?v=2G41KECXXn4

var direction : Vector2 = Vector2.UP
var speed : float = 300

func _physics_process(delta):
	position += direction * speed * delta

func _on_screen_exited():
	queue_free()
	
