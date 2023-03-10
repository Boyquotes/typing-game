extends Panel

@onready var text_input = $TextInput
@onready var display_message = $LabelBackground/DisplayMessage
@onready var incorrect_display = $CorrectLabel/CorrectDisplay
@onready var correct_display = $IncorrectLabel/IncorrectDisplay

var correct : int = 0
var incorrect : int= 0

var message: Array = ["Godot", "English", "Computer", "Programming", "Indonesia"]
var random_number: int = randi() % message.size()

func _ready():
	randomize()
	showing_message(random_number)

func _process(delta):
	pass

func create_another_random_numbers() -> void:
	if random_number == random_number:
		random_number = randi() % message.size()

func showing_message(rand_number) -> void:
	display_message.text = message[rand_number]

func _on_text_input_text_submitted(new_text) -> void:
	if text_input.text == message[random_number]:
		correct += 1
		correct_display.text = "Correct: {0}".format({0: correct})
		text_input.text = ""
		create_another_random_numbers()
		print(display_message.text)
		showing_message(random_number)
	else:
		incorrect += 1
		incorrect_display.text = "Incorrect: {0}".format({0: incorrect})
		text_input.text = ""
		create_another_random_numbers()
		showing_message(random_number)
		
