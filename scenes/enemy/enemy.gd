extends RigidBody2D

@export var explosion_scene: PackedScene
@export var velocity_threshold: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D):
	# print("Contacto")
	if body.is_in_group("player"):
		destroy_enemy()
		return
	if body is RigidBody2D and body.linear_velocity.length() > velocity_threshold:
		destroy_enemy()


func destroy_enemy():
	queue_free()
	explode()


func explode():
	var explosion_instance = explosion_scene.instantiate()
	# get_parent().add_child(explosion_instance)
	add_sibling(explosion_instance)
	explosion_instance.position = position
