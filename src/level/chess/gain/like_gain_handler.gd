extends GainHandler
class_name LikeGainHandler

func handle(gain_meta: GainMeta) -> Gain:
	if gain_meta.gain_name == "like":
		var gain = LikeGain.new()
		gain.value = gain_meta.value
		return gain
	else:
		return EmptyGain.new()
