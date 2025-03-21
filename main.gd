extends Control

@onready var money_label: Label = %MoneyLabel
@onready var make_a_drink_button: Button = %MakeADrinkButton

@export var money = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money_label.text = str(money)


func _on_make_a_drink_button_button_up() -> void:
	money += 1
