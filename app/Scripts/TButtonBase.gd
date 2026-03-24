extends TextureButton
class_name TButtonBase

@export var upSound : AudioStreamPlayer;
@export var downSound : AudioStreamPlayer;

func _ready() -> void:
	_readyv()
	button_down.connect(down);
	button_up.connect(up);

func _readyv():
	pass

func down() -> void:
	downSound.play()

func up() -> void:
	upSound.play()
