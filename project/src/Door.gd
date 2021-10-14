extends Area2D

export(String, FILE, "*.tscn,*.scn") var target_scene

func _ready():
	$ScreenFader/ColorRect/AnimationPlayer.play("Fade_in")


func _input(event):
	if event.is_action_pressed("interact"):
		if get_overlapping_bodies().size() > 0:
			$TransitionSound.play()
			$ScreenFader/ColorRect/AnimationPlayer.play("Fade_out")


func next_level():
	var next_scene := get_tree().change_scene(target_scene)
	
	if next_scene != OK:
		print("Something went wrong while switching scenes")

	PlayerPositionThroughDoor.door_name = name
