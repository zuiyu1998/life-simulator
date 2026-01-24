class_name CostHandler
# 一个虚函数，用于处理棋子消耗的代价

func handle(_cost_meta: CostMeta) -> Cost:
	return EmptyCost.new()
