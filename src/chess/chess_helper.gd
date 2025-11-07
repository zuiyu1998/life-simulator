class_name ChessHelper

const CHESS_LIST = [
	preload("res://src/chess/resources/appple.tres"),
	preload("res://src/chess/resources/banana.tres")
]

static func get_chess() -> Chess:
	var item_index = randi_range(0, CHESS_LIST.size() - 1)
	var chess = CHESS_LIST[item_index] as Chess
	return chess.duplicate()
