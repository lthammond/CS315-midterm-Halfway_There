extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node := find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
	if GlobalVariables.update_started:
			$Background/UpdatedScreen.show()


func _on_Computer_start_interaction():
	if GlobalVariables.card_collection_previously_triggered and \
			!GlobalVariables.update_started:
		$Player.active = false
		$Computer/Interaction/AnimationPlayer.play("Fade_dark")
		yield(get_tree().create_timer(4), "timeout")
		$Computer/Interaction/AnimationPlayer.play("Raise_screen")
		yield(get_tree().create_timer(3), "timeout")
		$Computer/Interaction/ComputerSprite.texture = load("res://assets/" + 
				"sprites/computerUpdating.png")
		$Computer/Interaction/ComputerSprite/UpdatePercentLabel.show()
		$Background/UpdatedScreen.show()

		GlobalVariables.update_started = true
		for i in range(50):
			$Computer/Interaction/ComputerSprite/PercentageBar.rect_size.x += 1
			$Computer/Interaction/ComputerSprite/UpdatePercentLabel \
					.bbcode_text = "%d" % (i + 1)
			yield(get_tree().create_timer(rand_range(0.1, 0.8)), "timeout")

		yield(get_tree().create_timer(3), "timeout")
		$Computer/Interaction/AnimationPlayer.play("Fade_light")
		yield(get_tree().create_timer(6), "timeout")
		$Player.active = true
