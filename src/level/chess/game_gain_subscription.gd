extends GainSubscription
class_name GameGainSubscription

func handle_gain(gain: Gain):
	var game_gain = gain as GameGain
	if not game_gain:
		return
	
	print("game gain %s." % game_gain.value)
