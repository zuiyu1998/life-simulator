@tool
extends GridContainer
class_name ChessGridPanel

const chess_slot_tscn = preload("res://src/level/chess_grid/chess_slot.tscn")

var controller: ChessGridController = ChessGridController.new()

@export
var item_size: int = 9: set = _set_item_size

func _set_item_size(v: int):
	item_size = v
	var child_count = get_child_count()
	var count = child_count - item_size
	if count == 0:
		for i in range(0, count):
			var child = get_child(item_size + i)
			controller.set_chess_slot(i, child)
	elif count > 0:
		for i in range(0, count):
			var child = get_child(item_size + i)
			remove_child(child)
			controller.set_chess_slot(item_size + i, null)
			
		for i in range(0, item_size):
			var child = get_child(i)
			controller.set_chess_slot(i, child)	
	else:
		for i in range(0, child_count):
			var child = get_child(i)
			controller.set_chess_slot(i, child)
			
		for i in range(0, -count):
			var chess_slot = chess_slot_tscn.instantiate() as ChessSlot
			add_child(chess_slot)
			controller.set_chess_slot(child_count + i, chess_slot)


func _ready() -> void:
	_set_item_size(item_size)
