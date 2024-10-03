extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var state
var State_Factory = StateFactory.new()
var Chase = false
var Melee = false 


func _ready():
	change_state("Idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = State_Factory.get_state(new_state_name).new()
	state.setup("change_state",$AnimatedSprite2D,self)
	add_child(state)
	if state == null:
		print("Error: State not found for ", new_state_name)
		return





func _on_melee_dector_body_entered(body):
	if body.name == "PlayerIcon":
		Melee = true
		change_state("Attack")
	pass 

func _on_melee_dector_body_exited(body):
	if body.name == "PlayerIcon":
		Melee = false
		change_state("Idle")
	pass # Replace with function body.

func _on_player_dection_body_entered(body):
	if body.name == "PlayerIcon":
		Chase = true
		change_state("Chase")
	pass # Replace with function body.


func _on_player_dection_body_exited(body):
	if body.name == "PlayerIcon":
		Chase = true 
		change_state("Chase")
	pass



