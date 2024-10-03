extends State
class_name idleState

func _ready():
	get_parent().velocity.x = 0
	Chase()
	
func Chase():
	var parent = get_parent()
	if parent.has_method("change_state"):
		parent.change_state("Chase")
	else:
		print("change_state method not found in parent")

func Idle():
	var parent = get_parent()
	if parent.has_method("change_state"):
		parent.change_state("Idle")
	else:
		print("change_state method not found in parent")

func Exit():
	print("Exiting idle")
