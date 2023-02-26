extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the area_entered signal to the _on_SuctionArea_area_entered function
	connect("body_entered", self, "_on_SuctionArea_area_entered")
		
# Define the strength of the suction effect
const SUCTION_STRENGTH = -5000

func _on_SuctionArea_area_entered(object):
	# Apply a suction force to any objects that enter the area
	var body = object
	var direction = position - body.global_position
	
		# Disable gravity while the object is inside the suction area
	body.gravity_scale = 0
	
	# Apply suction force towards the lower base of the area
	var distance = direction.length()
	var strength = SUCTION_STRENGTH / distance  # Strength decreases with distance
	var velocity = direction.normalized() * strength
	body.move_and_collide(velocity)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
