extends Resource
class_name ChessGrid
## 棋盘，负责棋子增删改查
##

signal chess_change
signal merge(item: Chess)

@export
var items: Array[Chess] = []

func fill(size: int):
	items = []
	for i in range(0, size):
		items.push_back(null)

func set_item(index: int, item: Chess):
	items[index] = item
	emit_signal("chess_change", index)

func get_empty_index() -> int:
	for index in range(0, items.size()):
		var item = items[index]
		if item == null:
			return index
	return -1

func get_item(index: int) -> Chess:
	return items[index]

# 合并棋子
func on_drag(index: int, item: Chess) -> bool:
	var culItem = items.get(index)
	
	if culItem == null:
		set_item(index, item)
		emit_signal("chess_change", index)
		return true
	
	if culItem.chess_name == item.chess_name and culItem.level == item.level:
		var clone = culItem.duplicate()
		emit_signal("merge", clone)
		culItem.level += 1
		emit_signal("chess_change", index)
		return true
	
	return false
