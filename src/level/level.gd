extends Node2D
class_name Level

@onready var chess_grid_pane: ChessGridPanel = $ChessGridPanel
@onready var task_manager: TaskManager = $TaskManager

var chess_grid = preload("res://src/level/chess_grid_defaullt.tres") 


func update_chess(index: int):
	var item = chess_grid.get_item(index)
	chess_grid_pane.update_chess(index, item)

func init_level():
	chess_grid_pane.chess_grid = chess_grid
	chess_grid.chess_change.connect(update_chess)
	
	for index in chess_grid.items.size():
		var item = chess_grid.items.get(index)
		if item is Chess:
			chess_grid_pane.update_chess(index, item)

func _ready() -> void:
	init_level()
