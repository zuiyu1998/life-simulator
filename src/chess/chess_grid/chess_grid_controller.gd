class_name ChessGridController

const chess_slot_tscn = preload("res://src/chess/chess_grid/chess_slot.tscn")

signal chess(item: Chess)

var data: ChessGrid = ChessGrid.new()

var chess_slots: Dictionary = {}


static func get_chess_slot() -> ChessSlot:
	return chess_slot_tscn.instantiate()

func set_data(v: ChessGrid):
	data = v
	update_view()

func set_chess_slot(i: int,v: ChessSlot):
	chess_slots[str(i)] = v

func on_drag(index: int, item: Chess, drag_index: int) -> bool:
	var culItem = data.get_item(index)
	
	if culItem == null:
		set_item(drag_index, null)
		set_item(index, item)
		return true
	
	if culItem.chess_name == item.chess_name and culItem.level == item.level:
		var clone = culItem.duplicate()
		emit_signal("chess", clone)
		culItem.level += 1
		set_item(drag_index, null)
		set_item(index, culItem)
		return true
	
	return false

func set_item(index: int, item: Chess):
	data.set_item(index, item)
	var slot = chess_slots.get(str(index)) as ChessSlot
	if slot:
		slot.update_chess(item)


func get_item(index: int) -> Chess:
	return data.get_item(index)


func update_view():
	for index in range(0, data.items.size()):
		var slot = chess_slots.get(str(index)) as ChessSlot
		if slot:
			slot.update_chess(data.get_item(index))
	
