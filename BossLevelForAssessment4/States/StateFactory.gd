class_name StateFactory

var states

func _init():
	states = {
		"Idle": idleState,
		"Attack": AttackState,
		"Chase": ChaseState
	}
	

func get_state(state_name: String):
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No state ", state_name, " in state factory!")
