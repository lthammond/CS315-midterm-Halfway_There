extends Node2D

func _ready():
	if PlayerPositionThroughDoor.door_name:
		var door_node = find_node(PlayerPositionThroughDoor.door_name)
		if door_node:
			$Player.global_position = door_node.global_position


func _on_Mailbox_start_interaction():
	print("Hello")
	$Mailbox/Interaction/AnimationPlayer.play("Fade_Dark")
	yield(get_tree().create_timer(8), "timeout")
