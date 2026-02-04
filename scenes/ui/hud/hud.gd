extends Control

@onready var launcheslabel: Label = $MarginContainer/Launcheslabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.player_launched.connect(_on_player_launched)


func _on_player_launched():
	#launcheslabel.text = "Launches: %d" % GameManager.launches
	launcheslabel.text = "Launches: " + str(GameManager.launches)
