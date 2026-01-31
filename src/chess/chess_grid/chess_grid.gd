@tool
extends Resource
class_name ChessGrid
## 棋盘，负责棋子增删改查
##

@export
var items: Array[Chess] = []

func fill(size: int):
	items = []
	for i in range(0, size):
		items.push_back(null)

func set_item(index: int, item: Chess):
	items[index] = item

func get_empty_index() -> int:
	for index in range(0, items.size()):
		var item = items[index]
		if item == null:
			return index
	return -1

func get_item(index: int) -> Chess:
	return items[index]
