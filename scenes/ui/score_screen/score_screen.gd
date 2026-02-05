extends Control

@onready var v_box_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for level in GameManager.levels_launches:
		var label = Label.new()
		label.text = "Level " + str(level) + " : " + str(GameManager.levels_launches[level])
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		v_box_container.add_child(label)

	var button = Button.new()
	button.text = "GO BACK"
	v_box_container.add_child(button)
	button.pressed.connect(_on_button_pressed)


func _on_button_pressed():
	GameManager.reset_game()
