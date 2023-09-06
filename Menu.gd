extends Node




func _process(delta):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene("res://Main.tscn")



func _on_Button_pressed():
	get_tree().change_scene("res://Main.tscn")


