extends Camera

var sens = .1
var hspd = 0
var fspd = 0
var uspd = 0
var rotationx = 45
var rotationy = -45
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	#10/30/21 prevent mouse from leaving screen of window
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movementvector = Vector3(0,0,0)
	#camera controls: 
	#	d and a strafing 
	#	q and e up and down
	#	w and s back and forth
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if Input.is_key_pressed(KEY_D):
		hspd = delta * lerp(hspd, 15, .8)
		movementvector += hspd * self.get_global_transform().basis.x 
	if Input.is_key_pressed(KEY_A):
		hspd = delta * lerp(hspd, -15, .8)
		movementvector += hspd * self.get_global_transform().basis.x
	if Input.is_key_pressed(KEY_Q):
		uspd = delta * lerp(uspd, 15, .8)
		movementvector += uspd * self.get_global_transform().basis.y
	if Input.is_key_pressed(KEY_E):
		uspd = delta * lerp(uspd, -15, .8)
		movementvector += uspd * self.get_global_transform().basis.y
	if Input.is_key_pressed(KEY_W):
		fspd = delta * lerp(fspd, -15, .8)
		movementvector += fspd * self.get_global_transform().basis.z
	if Input.is_key_pressed(KEY_S):
		fspd = delta * lerp(hspd, 15, .8)
		movementvector += fspd * self.get_global_transform().basis.z
	self.transform = Transform (self.get_global_transform().basis.x, 
	self.get_global_transform().basis.y, self.get_global_transform().basis.z,
	 lerp(self.transform.origin, movementvector + self.transform.origin, .5))
	hspd = lerp(hspd,0, .25)
	uspd = lerp(uspd,0, .25)
	fspd = lerp(fspd,0, .25)
	pass
	
func _input(event):
	if event is InputEventMouseMotion and event.button_mask == 1:
		#10/05/21 this was pretty funny. rotation happened in all 3 axes
		#self.rotate_y(deg2rad(sens*event.relative.x))
		#self.rotate_x(deg2rad(sens*event.relative.y))
		rotationx += deg2rad(sens*event.relative.x)
		rotationy += deg2rad(sens*event.relative.y)
		self.transform.basis = Basis()
		rotate_object_local(Vector3(0, 1, 0), rotationx)
		rotate_object_local(Vector3(1, 0, 0), rotationy)
	if event is InputEventKey and event.get_scancode() == KEY_F and !(event.is_echo()):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
