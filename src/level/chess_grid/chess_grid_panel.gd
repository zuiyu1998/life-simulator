@tool
extends GridContainer
class_name ChessGridPanel

var controller: ChessGridController

@export
var item_size: int = 9: set = _set_item_size

func _set_item_size(v: int):
	item_size = v
	_ensure()
	controller.set_item_size()

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

func _ensure():
	if not controller:
		controller = ChessGridController.new()
		controller.view = self	

func _ready() -> void:
	_ensure()

	controller.do_init()
