class_name ChessGainHandlerContainer

var _data: Dictionary[String, ChessGainHandler] = {}

func register(name: String, handler: ChessGainHandler):
	print("%s chess gain handler register." % name)
	_data[name] = handler


func get_handler(name: String) -> ChessGainHandler:
	return _data[name]
