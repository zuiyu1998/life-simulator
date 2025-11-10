class_name ChessDrag

signal drag_completed(data:ChessDrag)

var chess: Chess
var item_index: int
var preview = Control
var success = false

func _init(p_chess: Chess, p_item_index: int, p_preview: Control) -> void:
	chess = p_chess
	item_index = p_item_index
	preview = p_preview
	preview.tree_exiting.connect(_on_tree_exiting)
	
func _on_tree_exiting()->void:
	drag_completed.emit(self)
