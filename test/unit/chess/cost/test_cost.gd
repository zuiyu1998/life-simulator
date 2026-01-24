extends GutTest

class TestCost extends Cost:
	var value: int = 0
	
	func get_gain_name() -> StringName:
		return "test_cost"
	

class TestCostHandler extends CostHandler:
	func handle(cost_meta: CostMeta) -> Cost:
		var cost = TestCost.new()
		cost.value = cost_meta.value
		return cost


func get_test_cost_meta() -> CostMeta:
	var meta = CostMeta.new()
	meta.cost_name = "test_cost"
	meta.value = 10
	return meta

func test_cost():
	var container = CostHandlerContainer.new()
	var cost_meta = get_test_cost_meta()
	
	var cost = container.handle(cost_meta)
	assert_eq(cost, null)
	
	container.register("test_cost", CostHandler.new())
	cost = container.handle(cost_meta)
	assert_eq(cost is EmptyCost, true)
	
	container.register("test_cost", TestCostHandler.new())
	cost = container.handle(cost_meta)
	assert_eq(cost is TestCost, true)
	
	var test_cost = cost as TestCost
	assert_eq(test_cost.value, 10)
	
	
