extends Control

func _ready():
	$AnimationPlayer.play("Drop_title")

func _on_PlayButton_pressed():
	$Background.texture = load("res://assets/backgrounds/menubackground2.png")
	$AnimationPlayer.play("Fade_out")
	yield(get_tree().create_timer(3), "timeout")
	if get_tree().change_scene("res://src/Bedroom.tscn") != OK:
		print ("An unexpected error occured while trying to switch to Bedroom scene")
