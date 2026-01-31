extends RigidBody2D

@export var velocity_threshold: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D):
	# print("Contacto")
	if body.is_in_group("player"):
		queue_free()
		return
	if body is RigidBody2D and body.linear_velocity.length() > velocity_threshold:
		queue_free()
