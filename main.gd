extends Control

@onready var money_label: Label = %MoneyLabel
@onready var make_a_drink_button: Button = %MakeADrinkButton
@onready var bot_count_label: Label = %BotCountLabel
@onready var hire_boba_bot_button: Button = %HireBobaBotButton
@onready var bot_cost_label: Label = %BotCostLabel
@onready var bot_label: Label = %BotLabel
@onready var bot_progress_bar: ProgressBar = %BotProgressBar


var money = 0
var bot_count = 0
var bot_cost = 10
var bot_update_rate = 5.0 # in seconds
var elapsed_time = 0.0


func handle_bot(delta: float) -> void:
	elapsed_time += delta
	bot_progress_bar.value = elapsed_time / bot_update_rate * 100
	if elapsed_time >= bot_update_rate:
		elapsed_time -= bot_update_rate
		money += bot_count

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if bot_count > 0:
		handle_bot(delta)
		
	hire_boba_bot_button.disabled = money < bot_cost
	bot_label.visible = bot_count > 0
	bot_progress_bar.visible = bot_count > 0
		
	money_label.text = str(money)
	bot_count_label.text = str(bot_count) + " bot" if bot_count <= 1 else str(bot_count) + " bots"
	bot_label.text = str(bot_count) + " cup every 5 seconds" if bot_count <= 1 else str(bot_count) + " cups every 5 seconds"


func _on_make_a_drink_button_button_up() -> void:
	money += 1


func _on_hire_boba_bot_button_button_up() -> void:
	if money < bot_cost:
		return
	
	money -= bot_cost
	bot_count += 1
