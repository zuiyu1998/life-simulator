extends GutTest

class TestGain extends Gain:
	var value: int = 0
	
	func get_gain_name() -> StringName:
		return "test_gain"
	

class TestGainHandler extends GainHandler:
	func handle(gain_meta: GainMeta) -> Gain:
		var gain = TestGain.new()
		gain.value = gain_meta.value
		return gain


func get_test_gain_meta() -> GainMeta:
	var meta = GainMeta.new()
	meta.gain_name = "test_gain"
	meta.value = 10
	return meta

func test_gain():
	var container = GainHandleContainer.new()
	var gain_meta = get_test_gain_meta()
	
	var gain = container.handle(gain_meta)
	assert_eq(gain, null)
	
	container.register("test_gain", GainHandler.new())
	gain = container.handle(gain_meta)
	assert_eq(gain is EmptyGain, true)
	
	container.register("test_gain", TestGainHandler.new())
	gain = container.handle(gain_meta)
	assert_eq(gain is TestGain, true)
	
	var test_gain = gain as TestGain
	assert_eq(test_gain.value, 10)
	
	
