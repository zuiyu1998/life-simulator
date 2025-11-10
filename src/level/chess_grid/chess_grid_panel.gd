extends GridContainer
class_name ChessGridPanel

const chess_slot_tscn = preload("res://src/level/chess_grid/chess_slot.tscn")

@export
var item_size: int = 9

var chess_grid: ChessGrid

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
		
	
func init_chess_grid():
	for x in range(0, item_size):
		var chess_slot = chess_slot_tscn.instantiate() as ChessSlot
		
		chess_slot.chess_grid_panel = self
		add_child(chess_slot)

func _ready() -> void:
	init_chess_grid()
