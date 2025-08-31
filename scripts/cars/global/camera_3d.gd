extends Camera3D

@export var MOUSE_SENSITIVITY = 0.3;
var previous_mouse_x = 0;
var g_mouse;

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN;
	
func _process(delta: float) -> void:
	var mouse = get_viewport().get_mouse_position();
	g_mouse = mouse;
	
	# Compairing the positions
	if (mouse.x < previous_mouse_x):
		$"..".progress_ratio += MOUSE_SENSITIVITY * delta;
	if (mouse.x > previous_mouse_x):
		$"..".progress_ratio -= MOUSE_SENSITIVITY * delta;

func _on_timer_timeout() -> void:
	previous_mouse_x = g_mouse.x;
	$Timer.start();
