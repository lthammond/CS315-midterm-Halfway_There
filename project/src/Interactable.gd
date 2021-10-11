extends Area2D

signal start_interaction


func _input(event):
	if event.is_action_pressed("interact"):
		if get_overlapping_bodies().size() > 0:
			emit_signal("start_interaction")
