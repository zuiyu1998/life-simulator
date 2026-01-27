extends GainHandler
class_name GameGainHandler

func handle(gain_meta: GainMeta) -> Gain:
	if gain_meta.gain_name == "game":
		var gain = GameGain.new()
		gain.value = gain_meta.value
		return gain
	else:
		return EmptyGain.new()
