extends GainHandler
class_name MoneyGainHandler

func handle(gain_meta: GainMeta) -> Gain:
	if gain_meta.gain_name == "money":
		var gain = MoneyGain.new()
		gain.value = gain_meta.value
		return gain
	else:
		return EmptyGain.new()
