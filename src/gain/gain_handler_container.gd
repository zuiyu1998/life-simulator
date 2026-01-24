class_name GainHandleContainer

var _data: Dictionary[String, GainHandler] = {}

func register(name: String, handler: GainHandler):
	print("%s gain handler registered.")
	_data[name] = handler

func handle(gain: Gain) -> Object:
	var handler = _data[gain.gain_name]
	if not handler:
		printerr("%s gain handler not match.")
		return null
		
	return handler.handle(gain)
