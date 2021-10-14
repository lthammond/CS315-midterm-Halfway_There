extends Node

# Controls whether or not dialogue should be triggered.
var wakeUpTextRead := false
var hallwayTextRead := false

# Keeps the player from switching back into underwear when reentering Bedroom.
var underwear_deactivated := false

# Keeps the player from activating an interactable more than once.
var calendar_previously_triggered := false
var card_collection_previously_triggered := false
var update_started := false

# Makes sure prerequisites were completed before starting an interaction.
var trading_cards_recieved := false

# Tells HUD how many tasks have been completed.
var tasks_completed := 0
