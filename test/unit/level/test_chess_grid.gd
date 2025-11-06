extends GutTest

func test_chess_grid():
	var chess_grid = ChessGrid.new()
	var item1 = ChessGrid.ChessGridItem.new()
	item1.level = 0
	item1.chess = Chess.new()
	chess_grid.set_item(0, 0, item1)
	
	
	var item2 = ChessGrid.ChessGridItem.new()
	item2.level = 0
	item2.chess = Chess.new()
	chess_grid.set_item(0, 1, item1)
	
	chess_grid.merge(0, 1, item2)
	
	var item3 = chess_grid.get_item(0, 1)
	
	assert_eq(item3.level, 1)
