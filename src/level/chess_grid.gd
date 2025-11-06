class_name ChessGrid
## 棋盘，负责棋子增删改查


var _items: Dictionary[Vector2i, ChessGridItem] = {}

func set_item(x: int, y: int, item: ChessGridItem):
	_items.set(Vector2i(x, y), item)

func get_item(x: int, y: int) -> ChessGridItem:
	return _items.get(Vector2i(x, y))

# 合并棋子
func merge(x: int, y: int, item: ChessGridItem) -> bool:
	var index = Vector2i(x, y)
	var culItem = _items.get(index)
	
	if culItem == null:
		_items.set(index, item)
		return true
	
	if culItem.level == item.level:
		culItem.level += 1
		return true
	
	return false

class ChessGridItem:
	var chess: Chess
	var level: int
