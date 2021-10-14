extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node := find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position


func _on_Mailbox_start_interaction():
	if GlobalVariables.calendar_previously_triggered and !GlobalVariables \
			.trading_cards_recieved:
		$Player.active = false
		$Mailbox/Interaction/AnimationPlayer.play("Fade_dark")
		yield(get_tree().create_timer(7), "timeout")
		$Mailbox/Interaction/AnimationPlayer.play("Fade_light")
		yield(get_tree().create_timer(4.5), "timeout")
		GlobalVariables.trading_cards_recieved = true
		$Player.active = true
