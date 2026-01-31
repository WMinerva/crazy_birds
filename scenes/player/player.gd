extends RigidBody2D

@export var force_multiplier: int
@onready var line_2d: Line2D = $Line2D

const MAX_DRAG_DISTANCE = 150
var is_dragged = false
var start_position


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line_2d.clear_points()
	start_position = position
	sleeping_state_changed.connect(_on_sleeping_state_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if is_dragged:
		drag()
		update_line()
		check_release()


func update_line():
	line_2d.clear_points()
	line_2d.add_point(to_local(start_position))
	line_2d.add_point(to_local(position))


func check_release():
	if Input.is_action_just_released("drag"):
		launch()


func drag():
	var mouse_position = get_global_mouse_position()
	# position = mouse_position
	var drag_vector = mouse_position - start_position

	if drag_vector.length() > MAX_DRAG_DISTANCE:
		drag_vector = drag_vector.normalized() * MAX_DRAG_DISTANCE
	if drag_vector.x > 0:
		drag_vector.x = 0
	position = start_position + drag_vector


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("drag"):
		is_dragged = true
	# if event.is_action_released("drag"):
	# 	launch()


func launch():
	is_dragged = false
	freeze = false
	var force_vector = (start_position - position) * force_multiplier
	apply_impulse(force_vector)
	line_2d.visible = false


func _on_sleeping_state_changed() -> void:
	queue_free()
