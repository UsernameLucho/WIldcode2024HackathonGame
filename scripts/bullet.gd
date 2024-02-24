extends CharacterBody2D

var direction : Vector2 = Vector2.UP
var speed : float = 300

func _physics_process(delta):
	position += direction * speed * delta

func _on_screen_exited():
	queue_free()
func _on_body_entered(body): 
	if body is Enemy: 
		$Enemy.health -= 100
