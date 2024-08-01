extends Node2D

class_name Wall

signal terror

@onready var aroof = $Roof/Sprite2D
@onready var afloor = $Floor/Sprite2D

func _ready():
	# aroof.global_position.x = afloor.global_position.x + afloor.texture.get_width()
	pass


func ded(body):
	terror.emit()
	shtap()
	(body as Boeing).shtap()


func shtap():
	pass

func _on_floor_body_entered(body:Node2D):
	ded(body)


func _on_roof_body_entered(body:Node2D):
	ded(body)
