extends Node

#------------GAME VARIABLES---------------------
var money : int = 0
var small_weights : Dictionary = {}  # smol_equip
var med_weights : Dictionary = {}    # smol_equip
var big_weights : Dictionary = {}    # mid_equip
var giga_weights : Dictionary = {}   # mid_equip
var threadmills : Dictionary = {}    # beeg_equip
var mats : Dictionary = {}           # beeg_equip
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
