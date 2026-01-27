class_name GainHandlerContainer

var _data: Dictionary[String, GainHandler] = {}

func register(name: String, handler: GainHandler):
	print("%s gain handler registered." % name)
	_data[name] = handler

func handle(gain_meta: GainMeta) -> Gain:
	var handler = _data.get(gain_meta.gain_name)
	if not handler:
		printerr("%s gain handler not match.")
		return null
		
	return handler.handle(gain_meta)
