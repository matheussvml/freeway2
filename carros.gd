extends RigidBody2D


func _ready():
	var cordocarro = ["carro 1","carro 2","carro 3","carro 4","carro 5","carro 6","carro 7","carro 8","carro 9","carro 10","carro 11","carro 12","carro 13","carro 14"]#$AnimatedSprite.frames.get.animation.name()
	$AnimatedSprite.animation = cordocarro[randi() % cordocarro.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
