class_name ChessSpawner
extends Resource
## 棋子生成器

@export
var items: Array[ChessSpawnerItem] = []

var chess_indexs: Array[int] = []
var range_end = 0

func reset_start_end():
	chess_indexs = []
	var start = 0
	var end = 0
	for index in items.size():
		var item = items[index]
		start = end
		item.start = start
		end = item.weight + start
		item.end = end
		
		for _index in range(item.start, item.end):
			chess_indexs.push_back(index)
	range_end = end

func get_chess() -> Chess:
	var index = randi_range(0, range_end - 1)
	var item_index = chess_indexs[index]
	var chess = items[item_index].chess
	return chess.duplicate()
