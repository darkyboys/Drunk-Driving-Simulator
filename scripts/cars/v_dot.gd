extends VehicleBody3D

@export var MAX_STEER:float = 0.9;
@export var ENGINE_POWER:int = 400;

func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	var screen_size = get_viewport().get_visible_rect().size
	var new_pos = mouse_pos

	if mouse_pos.x >= screen_size.x:
		new_pos.x = 0
	elif mouse_pos.x < 0:
		new_pos.x = screen_size.x - 1

	if new_pos != mouse_pos:
		Input.warp_mouse(new_pos)
		
	steering = move_toward(steering, Input.get_axis("right", "left") * MAX_STEER, delta * 10);
	engine_force = Input.get_axis("down", "up") * ENGINE_POWER;
	
	$"Engine Sound".pitch_scale = $".".linear_velocity.length() * 10 * delta;
	#print ($".".linear_velocity.length() * 3.6);
	$Control/speed/Label.text = "SPEED: ";
	$Control/speed/Label.text += str(int ($".".linear_velocity.length() * 3.6));
	$Control/speed/Label.text += "KM/H";

func _on_engine_sound_finished() -> void:
	$"Engine Sound".play();
