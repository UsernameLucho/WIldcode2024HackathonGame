class_name Enemy extends Area2D 
signal killed(points) 
@export var speed = 150 
@export var hp = 1 
@export var points = 100 
func _physics_process(delta): 
	global_position.y += speed * delta 
	# Check if the enemy has reached y coordinate 700 
	if global_position.y >= 700: # Teleport back to a random x-coordinate within the range (0, 1152) 
		global_position.x = randi() % 1152 
		global_position.y = -20 
func die(): 
	queue_free() 
	
func _on_body_entered(body): 
	if body is Player: 
		$Player.health -= 10
		
		
func _on_visible_on_screen_notifier_2d_screen_exited(): 
	queue_free() 
	
func take_damage(amount): 
	hp -= amount 
	if hp <= 0: 
		killed.emit(points) 
		die()
