extends Control

@onready var money_label: Label = %MoneyLabel
@onready var make_a_drink_button: Button = %MakeADrinkButton
@onready var bot_count_label: Label = %BotCountLabel
@onready var hire_boba_bot_button: Button = %HireBobaBotButton
@onready var bot_cost_label: Label = %BotCostLabel

var money = 0
var bot_count = 0
var bot_cost = 10
var bot_update_rate = 5.0 # in seconds
var elapsed_time = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed_time += delta
	if elapsed_time >= bot_update_rate:
		elapsed_time -= bot_update_rate
		money += bot_count
		
	money_label.text = str(money)
	bot_count_label.text = str(bot_count) + " bot" if bot_count <= 1 else str(bot_count) + " bots"


func _on_make_a_drink_button_button_up() -> void:
	money += 1


func _on_hire_boba_bot_button_button_up() -> void:
	if money < bot_cost:
		return
	
	money -= bot_cost
	bot_count += 1
