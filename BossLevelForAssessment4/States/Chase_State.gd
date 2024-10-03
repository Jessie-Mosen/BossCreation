extends State
class_name ChaseState
var SPEED = 50

func _ready():
	Run()

func _physics_process(delta):
	if has_node("../../PlayerIcon"):
		var boss = get_parent()
		if boss.Chase == true:
			var player = get_node("../../PlayerIcon")
			var direction = (player.position - boss.position).normalized()
			var boss_sprite = boss.get_node("AnimatedSprite2D")
			boss_sprite.flip_h = direction.x <= 0
			boss.velocity.x = direction.x * SPEED


func Chase():
	animation.play("Running")

func Exit():
	print("Exiting Chase")

func Run():
		animation.play("Running")
