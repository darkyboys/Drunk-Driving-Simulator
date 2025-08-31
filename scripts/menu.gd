extends Node3D

@export var AUDIO_PATH:Array = [
	"res://assets/audio/Bavarian Seascape.mp3",
	"res://assets/audio/Cumbish.mp3",
	"res://assets/audio/Lobby Song.mp3",
	"res://assets/audio/Palm and Soul.mp3",
	"res://assets/audio/Shenzhen Nightlife.mp3",
	"res://assets/audio/Village Tarantella.mp3"
	];

func _ready() -> void:
	var num: int = randi_range(0, 5)
	$bgm.stream = load(AUDIO_PATH[num]) as AudioStream;
	$bgm.play();

func _on_bgm_finished() -> void:
	var num: int = randi_range(0, 5)
	$bgm.stream = load(AUDIO_PATH[num]) as AudioStream;
	$bgm.play();
