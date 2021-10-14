extends Control


func _ready():
	$Labels/Sentence1.show()
	yield(get_tree().create_timer(5), "timeout")
	$Labels/Sentence2.show()
	yield(get_tree().create_timer(5), "timeout")
	$Labels/Sentence3.show()
	yield(get_tree().create_timer(5), "timeout")
	$Labels/Sentence4.show()
	$FinalSentenceSound.play()
	yield(get_tree().create_timer(2), "timeout")
	$MainMenuButton.show()


func _on_MainMenuButton_pressed():
	GlobalVariables.underwear_deactivated = false
	GlobalVariables.tasks_completed = 0
	if get_tree().change_scene("res://src/MainMenu.tscn") != OK:
		print ("An unexpected error occured while trying to switch to Main" +
			  "Menu scene")
