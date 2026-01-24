class_name CostHandlerContainer

var _data: Dictionary[String, CostHandler] = {}

func register(name: String, handler: CostHandler):
	print("%s chess cost handler register." % name)
	_data[name] = handler


func handle(cost_meta: CostMeta) -> Cost:
	var handler = _data.get(cost_meta.cost_name)
	if not handler:
		printerr("%s cost handler not match.")
		return null
		
	return handler.handle(cost_meta)
