@tool
extends GridContainer
class_name ChessGridPanel

const chess_slot_tscn = preload("res://src/level/chess_grid/chess_slot.tscn")

@export
var item_size: int = 9:
	set(v):
		item_size = v
		if chess_grid:
			chess_grid.fill(item_size)
			do_init()

@export
var chess_grid: ChessGrid:
	set(v):
		chess_grid = v
		
		if chess_grid:
			chess_grid.fill(item_size)
			do_init()

func update_chess(index: int, chess: Chess):
	var chess_slot = get_child(index)
	if not chess_slot is ChessSlot:
		return
	
	if chess is Chess:
		chess_slot.update_chess_icon(chess.image)
		chess_slot.update_chess_bg(chess.level)
	else:
		chess_slot.update_chess_icon(null)
		chess_slot.update_chess_bg(0)


func do_init():
	for child in get_children():
		child.queue_free()
	
	for x in range(0, item_size):
		var chess_slot = chess_slot_tscn.instantiate() as ChessSlot
		add_child(chess_slot)
