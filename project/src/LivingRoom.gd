extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node := find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position


func _on_Chair_start_interaction():
	if GlobalVariables.workout_previously_triggered:
		$Player.hide()
		$Player.active = false
		$Chair/Interaction/SittingSprite.show()
		$HUD/Dialog/InteractDialog1.show()

		yield(get_tree().create_timer(3), "timeout")
		$HUD/Dialog/InteractDialog1.hide()
		$Chair/Interaction/SittingSprite.texture = load("res://assets/sprites/"+ 
				"chairRemote.png")

		yield(get_tree().create_timer(2), "timeout")
		$Chair/Interaction/Television.show()
		$Chair/Interaction/SittingSprite.texture = load("res://assets/sprites/"+ 
				"chairSit.png")

		$HUD/Dialog/InteractDialog2.show()
		yield(get_tree().create_timer(4), "timeout")
		$HUD/Dialog/InteractDialog2.hide()

		yield(get_tree().create_timer(2), "timeout")
		$HUD/Dialog/InteractDialog3.show()

		yield(get_tree().create_timer(4), "timeout")
		$HUD/Dialog/InteractDialog3.hide()
		$Chair/Interaction/AnimationPlayer.play("Cutaway")

		yield(get_tree().create_timer(2), "timeout")
		$Chair/Interaction/SittingSprite.texture = load("res://assets/sprites/"+ 
				"chairSleep.png")
		$Chair/Interaction/Television.texture = load("res://assets/sprites/" + 
				"tvShine.png")

		yield(get_tree().create_timer(6.5), "timeout")
		$Chair/Interaction/AnimationPlayer.play("Fade_out")
		yield(get_tree().create_timer(10.5), "timeout")

		if get_tree().change_scene("res://src/GameOver.tscn") != OK:
			print ("An unexpected error occured while trying to switch to" + 
					"Game Over scene")
