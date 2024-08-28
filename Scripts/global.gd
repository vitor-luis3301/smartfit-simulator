extends Node

#------------GAME VARIABLES---------------------
var money : int = 10000
var inventory = {
	
}
#-----------------------------------------------

# -----------------SETTINGS---------------------
var fullscreen : bool = false
var windowed : bool = true
var borderless : bool = false

func Fullscreen():
	fullscreen = true
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)

func Windowed():
	windowed = true
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func Borderless(option):
	borderless = option
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, option)
#-----------------------------------------------
