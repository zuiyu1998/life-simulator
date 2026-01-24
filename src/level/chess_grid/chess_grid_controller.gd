class_name ChessGridController

const chess_slot_tscn = preload("res://src/level/chess_grid/chess_slot.tscn")

var data: ChessGrid = ChessGrid.new()
var view: ChessGridPanel

var chess_slots: Dictionary = {}

func get_item(index: int) -> Chess:
	return data.get_item(index)

func set_item_size():
	pass

func do_init():
	# 初始化数据
	var size = view.item_size - data.items.size()
	if size > 0:
		for i in range(0, size):
			data.items.push_back(null)
	elif size < 0:
		for i in range(0, -size):
			data.items.pop_back()
	
	for i in range(0, view.item_size):
		var chess_slot = chess_slot_tscn.instantiate()
		chess_slots.set(str(0), chess_slot)
		view.add_child(chess_slot)
