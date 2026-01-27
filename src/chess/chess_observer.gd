class_name ChessObserver

# 消费处理器集合
var cost_handler_container = CostHandlerContainer.new()
# 增益处理器集合
var gain_handler_container = GainHandlerContainer.new()

var cost_subscriptions: Dictionary = {}
var gain_subscriptions: Dictionary = {}


func register_gain_subscription(name: String, subscription: GainSubscription):
	print_debug("%s gain subscription registered." % name)
	gain_subscriptions[name] = subscription


func register_cost_subscription(name: String, subscription: CostSubscription):
	print_debug("%s cost subscription registered." % name)
	cost_subscriptions[name] = subscription


func register_gain_handler(name: String, handler: GainHandler):
	gain_handler_container.register(name, handler)


func register_cost_handler(name: String, handler: CostHandler):
	cost_handler_container.register(name, handler)


func handle_gain(gain: Gain):
	var gain_subscription = gain_subscriptions.get(gain.get_gain_name()) as GainSubscription
	if gain_subscription:
		gain_subscription.handle_gain(gain)


func handle_cost(cost: Cost):
	var cost_subscription = cost_subscriptions.get(cost.get_cost_name()) as CostSubscription
	if cost_subscription:
		cost_subscription.handle_cost(cost)


func hanlde_chess(chess: Chess):
	for gain_meta in chess.gains:
		var gain = gain_handler_container.handle(gain_meta)
		if gain:
			handle_gain(gain)
		else:
			printerr("gain not found.")

	for cost_meta in chess.costs:
		var cost = cost_handler_container.handle(cost_meta)
		if cost:
			handle_cost(cost)
		else:
			printerr("cost not found.")
