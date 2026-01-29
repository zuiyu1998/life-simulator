extends GainHandler
class_name HealthGainHandler

func handle(gain_meta: GainMeta) -> Gain:
	if gain_meta.gain_name == "health":
		var gain = HealthGain.new()
		gain.value = gain_meta.value
		return gain
	else:
		return EmptyGain.new()
