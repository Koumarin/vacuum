extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Define the strength of the suction effect
const SUCTION_STRENGTH = 200

func _on_SuctionArea_area_entered(object):
	# Apply a force towards the center of the suction area
	var direction = (position - object.position).normalized()
	object.apply_impulse(Vector2.ZERO, direction * SUCTION_STRENGTH)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
