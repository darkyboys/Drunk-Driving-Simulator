extends Control


func _on_exit_request() -> void:
	$"Select map".hide();
	


func _on_start_button_down() -> void:
	$"Select map".show();


# Maps
func _map_prototype_button_down() -> void:
	$Loading.show();
	$Loading.start("res://scenes/maps/prototype.tscn");

func _on_3d_lab_button_down() -> void:
	$Loading.show();
	$Loading.start("res://scenes/maps/3d_lab.tscn");
