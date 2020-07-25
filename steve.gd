extends KinematicBody2D

var _jump = -600
var _velocity = Vector2(0,0);
const _speed = 180
const _gravity = 20

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		_velocity.x = _speed
		$Sprite.play("walk")
		$Sprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		_velocity.x = -_speed
		$Sprite.play("walk")
		$Sprite.flip_h = true
	else:
		$Sprite.play("idlle")
		
	if not is_on_floor():
		$Sprite.play("air")
	
	_velocity.y = _velocity.y + _gravity;

	
	if Input.is_action_pressed("jump") and is_on_floor():
		_velocity.y = _jump
	
	_velocity = move_and_slide(_velocity,Vector2.UP)
	
	_velocity.x = lerp(_velocity.x,0,0.1);
