extends Node2D

@onready var level: Level = $Level

func _ready() -> void:
	level.chess_grid = preload("res://test/data/chess_grid_defaullt.tres")
	level.chess_spawner = preload("res://test/data/chess_spawner_default.tres")
	level.skill_set = preload("res://test/data/skill_set_default.tres")
	level.task = preload("res://test/data/task_test.tres")
	level.mount()
