extends Node3D

@export var target_node: Node3D

func _ready():
	if not target_node:
		push_warning("No target node assigned!")
		return
	
	_process_node(target_node)


func _process_node(node: Node):
	# Process only MeshInstance3D nodes
	if node is MeshInstance3D:
		_add_rigidbody_to_mesh(node)
	
	# Recurse into children
	for child in node.get_children():
		_process_node(child)


func _add_rigidbody_to_mesh(mesh_node: MeshInstance3D):
	var mesh = mesh_node.mesh
	if not mesh:
		return

	# Store global transform
	var mesh_global = mesh_node.global_transform

	# Create RigidBody3D
	var rigidbody = RigidBody3D.new()
	rigidbody.name = mesh_node.name + "_Rigidbody"

	# Create CollisionShape3D
	var collision_shape = CollisionShape3D.new()
	collision_shape.shape = mesh.create_convex_shape()
	rigidbody.add_child(collision_shape)

	# Add RigidBody3D to the scene at the same parent as mesh
	var original_parent = mesh_node.get_parent()
	original_parent.add_child(rigidbody)
	rigidbody.global_transform = mesh_global

	# Duplicate mesh to preserve exact global transform
	var mesh_copy = mesh_node.duplicate()
	mesh_copy.name = mesh_node.name
	mesh_copy.transform = Transform3D.IDENTITY  # now relative to rigidbody
	rigidbody.add_child(mesh_copy)

	# Remove original mesh
	mesh_node.queue_free()
