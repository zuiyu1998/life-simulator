class_name ChessCostHandlerContainer

var _data: Dictionary[String, ChessCostHandler] = {}

func register(name: String, handler: ChessCostHandler):
	print("%s chess cost handler register." % name)
	_data[name] = handler


func get_handler(name: String) -> ChessCostHandler:
	return _data[name]
