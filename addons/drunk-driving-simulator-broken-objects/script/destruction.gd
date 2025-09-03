extends RigidBody3D

@export var BROKEN_OBJECT:PackedScene;
@export var TARGET_SPAWN:Node3D;
@export var TARGET_INHERITANCE:Node3D;
@export var COLLIDER_DESCRIPTION:String;
@export var SOUND:AudioStreamPlayer3D;

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"));
	contact_monitor = true;
	max_contacts_reported = 10;

func _on_body_entered(body: Node) -> void:
	if (body.editor_description == COLLIDER_DESCRIPTION):
		#var broken_barrel:PackedScene = load("res://addons/drunk-driving-simulator-broken-objects/barrel-broken.tscn");
		var object:Node3D = BROKEN_OBJECT.instantiate();
		TARGET_SPAWN.add_child(object);
		
		SOUND.play();
		object.position = TARGET_INHERITANCE.position;
		object.rotation = TARGET_INHERITANCE.rotation;
		TARGET_INHERITANCE.queue_free();
