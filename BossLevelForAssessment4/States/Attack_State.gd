# AttackState.gd
extends State
class_name AttackState


func _ready():
	var anim = get_node("../AnimatedSprite2D")
	anim.animation_finished.connect(Callable(self, "_on_animation_finished"))
	Attack()


func _on_animation_finished(anim_name):
	if (anim_name == "Attack") or (anim_name == "Chase"):
		if get_parent().Melee == true:
			animation.play("Attack")


func Attack():
	animation.play("Attack")



func Exit():
	print("Exiting Attack")

