extends Control


# Toggles Big Bitch Mode (fullscreen)
func _on_fullscreen_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
#----------------

# Toggles the Breaking Bad Mexico Filter
func _on_mexico_filter_check_button_toggled(toggled_on) -> void:
	if toggled_on == true:
		$MexicoFilterRect.show()
	else:
		$MexicoFilterRect.hide()
		
#----------------- 

#Calling all the buttons and warnings for the required check
@onready var Check1 = $OptionsVContainer/Checkboxes/StroknitCheck
@onready var Check2 = $OptionsVContainer/Checkboxes/DiddlerCheck
@onready var Check3 = $OptionsVContainer/Checkboxes/RightsForfeitCheck
@onready var Okbutton = $OkButton
@onready var WarningLabel = $WarningLabel

#Declares that there is a condition to check all boxes, and it's not fulfilled by default
var all_checked: bool = false

#Connects signals to the checkboxes when the scene is called, seeing if
#the boxes are checked, and what to do if they are.


func _ready() -> void:
# Is Check 1, 2, and 3 checked? If so, send the "on check box toggled" signal.
	for checkbox in [Check1, Check2, Check3]: checkbox.toggled.connect(_on_check_box_toggled)

#Did you press the ok button? if so, send the "on ok button pressed" signal
	Okbutton.pressed.connect(_on_ok_button_pressed)

#update the button state of condition before we get into it, just in case
	_update_button_state()

#thus concludes what the ready function does

#if ANY check box is toggled, update the state of the button condition.
#The signal that actually cares about the checkboxes being toggled is here.
func _on_check_box_toggled(_toggled_on: bool) -> void:
	_update_button_state()

#What actually happens to update the condition of the button, and what the condition is
func _update_button_state() -> void:
	all_checked = Check1.button_pressed and Check2.button_pressed and Check3.button_pressed
	#This bit is confusing so listen up.
	#these checks aren't given the "toggle" signal. that's because the "toggle" signal
	#isn't a boolean, it just says "HEY, I'M TOGGLED, DOES ANYONE CARE?" this does not.
	#the real boolean is "button pressed", which sounds like it isnt a toggle
	#BUT it has "toggle mode" on, so it actually is.

#What happens when you press the ok button
func _on_ok_button_pressed() -> void:
	#Note that this button DOES NOT have toggle mode on, so it is not treated like a toggle
	#because of that, it only updates when the user clicks it.
	if all_checked:
		WarningLabel.visible = true
		WarningLabel.text = "ALL SYSTEMS GO!!!"
		print("Yippee wahoo, this is a placeholder for the next scene i think")
	else:
		WarningLabel.visible = true
		WarningLabel.text = "YAINT FUCKIN CHECKED THE TERMS AND CONDITIONS"
