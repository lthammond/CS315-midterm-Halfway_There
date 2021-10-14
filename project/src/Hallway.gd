extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node := find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position

	yield(get_tree().create_timer(1), "timeout")
	if !GlobalVariables.hallwayTextRead:
		$HUD/Dialog/HallwayTextLabel.show()
		GlobalVariables.hallwayTextRead = true


func _on_CardCollection_start_interaction():
	if GlobalVariables.trading_cards_recieved and \
			!GlobalVariables.card_collection_previously_triggered:
		$Player.active = false
		$CardCollection/Interaction/AnimationPlayer.play("Fade_dark")
		yield(get_tree().create_timer(5), "timeout")
		$CardCollection/Interaction/AnimationPlayer.play("Raise_binder")
		yield(get_tree().create_timer(7), "timeout")
		$CardCollection/Interaction/AnimationPlayer.play("Fade_light")
		yield(get_tree().create_timer(6), "timeout")
		$HUD/Dialog/InteractionDialoge3.hide()
		GlobalVariables.card_collection_previously_triggered = true
		$Player.active = true
