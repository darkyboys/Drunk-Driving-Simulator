extends Node2D

@export var IMG_PATHS:Array = [
	"res://assets/drawables/imgs/00.jpg",
	"res://assets/drawables/imgs/01.jpg",
	"res://assets/drawables/imgs/02.jpg",
	"res://assets/drawables/imgs/03.jpg"
];

@export var START_PATH = "";

func _ready() -> void:
	var num:int = randi_range(0, 3);
	$Sprite2D.texture = load(IMG_PATHS[num]) as Texture;

func _process(delta: float) -> void:
	if $ProgressBar.value > 90:
		$ProgressBar.value = 90;
	else: $ProgressBar.value += 70 * delta;

func start(path):
	$ProgressBar.value = 0;
	$ProgressBar/Timer.start();
	START_PATH = path;


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file(START_PATH);
