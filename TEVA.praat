#
# TEVA 1.1
# 
# Master Praat script
#
#     TEVA: main.praat is the master GUI of TEVA
#     It is written in Praat script for the demo window 
#     
#     Copyright (C) 2010-2012  R.J.J.H. van Son and the Netherlands Cancer Institute
# 
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 2 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software
#     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
# 

te.recordingMode = 0
if te.recordingMode
	demoAppName$ = "RecTEVA"
else
	demoAppName$ = "TEVA"
endif

# Define variable that might be reset in Initialise*.praat
if not variableExists("build_SHA$")
	build_SHA$ = "-"
endif

# The standard Main Page layout
buttonsFileName$ = "MainPage"

# These are simply "useful" defaults
if build_SHA$ = "-"
	localTableDir$ = "Data"
else
	localTableDir$ = ""
endif
buttonsTableName$ = "MainPage"
configTableName$ = "Config"
feedbackTablePrefix$ = "Feedback"
feedbackTableName$ = ""
printsignalTablePrefix$ = "PrintSignal"
printsignalTableName$ = ""
te.buttons$ = ""
te.config$ = ""
recordedSound$ = ""
alertText$ = ""
config.input$ = "Microphone"
config.ratingForm$ = "Vowel"
config.vasScaleTicks = 0
te.recordingTimeStamp$ = ""
te.currentFileName$ = ""
te.saveAudio = 0
te.openSound = 0
te.originalRecording = 0
te.source = 0
te.spectrogram = 0
te.harmonicity = 0
te.gneSound = 0
te.pitch = 0
te.formant = 0
te.ratingTable = -1
te.rating$ = ""
te.useFullASTselection = 1
te.useAnnotationInterface = 0
te.defaultLanguage$ = "EN"
config.rememberPreferences = 1
config.randomizeSpeakerData = 0
config.recordingTaskFile$ = ""
config.recordingTarget$ = ""
config.recordingScreen$ = ""
te.recordingTaskTable = 0
te.restartRecordingTask = 0
te.waitRecordingTask = 1

# Pop-Up window and other colors
popUp.bordercolor$ = "{0.5,0.5,1}"
popUp.backgroundcolor$ = "{0.9,0.9,1}"
popUp.warncolor$ = "{1,0.9,0.9}"
popUp.gocolor$ = "{0.9,1,0.9}"

# Voicing markers
te.voicingcolor$ = "{0.3, 0.3, 0.9}"

# If running in a packed script binary
if index_regex(preferencesDirectory$, "(?i'demoAppName$')$")
	preferencesAppDir$ = preferencesDirectory$
elsif index_regex(preferencesDirectory$, "[pP]raat(\-dir| Prefs)?$")
	# If running as a Praat script, create a new preferences directory
	if unix
		preferencesAppDir$ = "'preferencesDirectory$'/../.'demoAppName$'"
	else
		preferencesAppDir$ = "'preferencesDirectory$'/../'demoAppName$'"
	endif
else
	# Make a subdirectory in the current preferences directory
	preferencesAppDir$ = "'preferencesDirectory$'/'demoAppName$'"
endif

wipeFeedbackArea$ = ""
te.recordingSampleFrequency = 44100
te.defaultSampleFreq = 22050
config.frequency = 1000
config.showFormants = 0
config.speakerSerial$ = "None"
config.saveAll = 0
config.autoSelect = 0
config.calcGNE = 0
te.calcLowHighHNR = 0
config.selectionWindow = 2.0
config.muteOutput = 0

# Parameters for isolating recorded speech from noise
# Should be mostly left alone unless you are using ultra clean
# or very noisy recordings
noiseThresshold = -30
minimumPitch = 60
soundMargin = 0.25
minimumIntensity = 30

# Set up button height
buttonbevel = 0

# Define canvas
viewportMargin = 5
defaultFontSize = 12
defaultFont$ = "Helvetica"
defaultFontColor$ = "Black"
defaultLineWidth = 1
recordingLightX = 0
recordingLightY = 100
printerName$ = "BHK301"
printerPresets$ = "Standard"

##########################################################
# 
# Setup for alternative Recording layout for the Main Page
# 
##########################################################
if te.recordingMode
	buttonsFileName$ = "RecPage"
	config.speakerSerial$ = "Forw"
	config.recordingTaskFile$ = "[#a as in %%hat%<newline>##ee# as in %%heed%<newline>##oo# as in %%hood%]"
	config.recordingTarget$ = "'homeDirectory$'/Desktop"
endif

##########################################################
# 
# This is the actual code run at startup
# 
##########################################################
# This has to be initialized very early because of loading of automatic experiments
mainPage.outputPraatObject$ = "Draw"

# Load supporting scripts
# Include tables in script format (always needed)
include CreateTables.praat

# When using this script as a library in "include <script>", 
# suppress the execution of actual code but DO run the 
# non-interactive initialisation
if variableExists("non_interactive_initialize")
	# Initialization from Initialise.praat
	call global_initialization
	call global_setup
	call initializeMainPage
endif
if variableExists("non_interactive") or variableExists("non_interactive_initialize")
	# Jump
	goto NON_INTERACTIVE
endif

# Set up system
call reset_viewport

# Load supporting scripts
include lib/LPCsourceLib.praat

# Set up system and load preferences
include Initialise.praat
# Include the main page buttons and procedures
include MainPage.praat
# Include the configuration page buttons and procedures
include Config.praat

# Start instruction loop
while demoWaitForInput()
	.label$ = ""
	.clickX = -1
	.clickY = -1
	.pressed$ = ""
	if demoClicked()
		.clickX = demoX()
		.clickY = demoY()
		call buttonClicked 'te.buttons$' '.clickX' '.clickY'
		.label$ = buttonClicked.label$
	elsif demoKeyPressed()
		.pressed$ = demoKey$()
		call keyPressed 'te.buttons$' '.pressed$'
		.label$ = keyPressed.label$
	endif
	
	# You cannot select a text field
	if startsWith(.label$, "$") or startsWith(.label$, "!")
		# All caps labels are "unhideable"
		if index_regex(.label$, "[a-z]") > 0
			.label$ = ""
		endif
	endif
	
	# Do things
	if .label$ != ""
		# Push button down
		call Draw_button 'te.buttons$' '.label$' 1
		call process_label '.label$' '.clickX' '.clickY' '.pressed$'
		# push button up should be done by process_label
	endif
endwhile

call end_program

label NON_INTERACTIVE

# Note that include files are read at load time, not at execution
# time. So all code is present irrespective of whether the execution
# path touches it. Note that in non-interactive mode, no initialization
# is performed. Use "call global_initialization" and "call global_setup"
# To initialize the system (see Initialise.praat)

########################################################
# 
# Definitions of procedures
# 
########################################################
#
# Do what is asked
procedure process_label .label$ .clickX .clickY .pressed$
	# Log raw commands to replay in file
	call log_command 'te.buttons$' '.label$' '.clickX' '.clickY' '.pressed$'
	
	# Process the command
	if .label$ <> "" and not startsWith(.label$,"!")
		.label$ = replace$(.label$, "_", " ", 0)
		call process'te.buttons$''.label$' '.clickX' '.clickY' '.pressed$'
	elsif .label$ <> "" and startsWith(.label$,"!")
		.label$ = right$(.label$, length(.label$)-1)
		.label$ = replace$(.label$, "_", " ", 0)
		call process'te.buttons$''.label$' '.clickX' '.clickY' '.pressed$'
	endif
endproc

# Intialize buttons
procedure init_buttons
	# Set Speaker color
	call switch_speaker_next_button 'config.speakerSerial$'

	call Draw_all_buttons 'te.buttons$'
endproc

# Draw all buttons
procedure Draw_all_buttons .table$
	.varPrefix$ = replace_regex$(.table$, "^(.)", "\l\1", 0)
	if index_regex(.table$, "[^0-9]") > 0
		select Table '.table$'
	else
		select '.table$'
		.table$ = selected$("Table")
	endif
	.numRows = Get number of rows
	
	for .row to .numRows
		.label$ = Get value... '.row' Label
		if startsWith(.label$, ">")
		    call Draw_button_internal 1 '.table$' '.label$' 0
		elsif startsWith(.label$, "()")
			.pressed$ = "0"
			.labelName$ = replace_regex$(.label$, "^[^A-Za-z]+([^_]+)(_.*)?$", "\l\1", 0)
			.varValue$ = replace_regex$(.label$, "^[^_]+_(.*)$", "\1", 0)
			if variableExists("rating.'.labelName$'$") 
				.tmp$ = rating.'.labelName$'$
				if .tmp$ = .varValue$
					.pressed$ = "2"
				endif
			endif
		    call Draw_button_internal 1 '.table$' '.label$' '.pressed$'
			
        elsif not startsWith(.label$, "!") 
			.pressed = 0
			# Determine the "pressed" state of a button
			# A variable with the same name as the button will act as a
			# "pressed state"
			.variableName$ = .varPrefix$+"."+(replace_regex$(.label$, "^(.)", "\l\1", 0))
			# Simple boolean variables
			if index(.variableName$, "_") <= 0 and variableExists(.variableName$)
				# True: Pressed
				if '.variableName$' > 0
					.pressed = 2
				# <0: Grayed out
				elsif '.variableName$' < 0
					.pressed = -1
				endif
			# Complex buttons with an variableName+'_'+value structure
			# varableName$ -> name of button, e.g., "language"
			elsif index(.variableName$, "_")
				.generalVar$ = left$(.variableName$, rindex(.variableName$, "_") - 1)
				.currentVariableName$ = .generalVar$
				# Is it a string?
				if variableExists(.generalVar$+"$")
					.currentVariableName$ = .generalVar$ + "$"
				endif
				# Remove one level of indirection
				if variableExists(.currentVariableName$)
					if index(.currentVariableName$, "$")
						.currentVariableName$ = '.currentVariableName$'
					else
						.currentValue = '.currentVariableName$'
						.currentVariableName$ = "'.currentValue'"
					endif
					# Remove next level of indirection
					.currentContent$ = "'.currentVariableName$'"
					if .currentContent$ = "_DISABLED_"
						.pressed = -1
					endif
					# Reconstruct label from current values
					.currentLabelValue$ = .generalVar$ + "_" + .currentContent$
					# Set PRESSED from label
					 if .variableName$ = .currentLabelValue$
						.pressed = 2
					endif
				endif
			endif
			# You did erase everything before you started here? So do not do that again
		    call Draw_button_internal 0 '.table$' '.label$' '.pressed'
        endif
	endfor
endproc

# Draw a button from a predefined button table
# Normally, erase the area around a button
procedure Draw_button .table$ .label$ .push
	call Draw_button_internal 1 '.table$' '.label$' '.push'
endproc

# Use this function if you want to control erasing
procedure Draw_button_internal .erase_button_area .table$ .label$ .push
    if startsWith(.label$, "!")
    	goto NOBUTTON
    endif
	# Scale rounding of rounded rectangles
	.wc = 1
	.mm = demo Horizontal wc to mm... '.wc' 
    # Allow to overide ! skip directive
    .forceDraw = 0
    if startsWith(.label$, "+")
    	.label$ = right$(.label$, length(.label$)-1)
     	.forceDraw = 1
    endif

    select Table '.table$'
    .row = Search column... Label '.label$'
	if .row < 1
		if not startsWith(.label$, "!")
			.rowHidden = Search column... Label !'.label$'
			if .rowHidden > 0
				goto NOBUTTON
			endif
		endif
		call emergency_table_exit Button Table '.table$' does not have a row with label '.label$'
	endif
	
	# Perspective shift sizes
	.shiftDown = 0
	.shiftX = 0
	.shiftY = 0
	if buttonbevel <> 0
		.shiftDown = 0.05
    	.shiftX = 0.30
    	.shiftY = 0.50
	endif
	
	# Set drawing parameters
	.topBackGroundColorUp$ = "{0.93,0.93,0.93}"
	.topLineColorUp$ = "Black"
	.topLineWidthUp = 1.5
	.topBackGroundColorDown$ = "{0.82,0.82,0.9}"
	.topLineColorDown$ = "{0.3,0.3,0.3}"
	.topLineWidthDown = 1.5
	.topBackGroundColorDisabled$ = "{0.90,0.90,0.90}"
	.topLineColorDisabled$ = "{0.85,0.85,0.85}"
	.topLineWidthDisabled = 1.5
	.flankBackGroundColorUp$ = "{0.6,0.6,0.6}"
	.flankLineColorUp$ = "{0.2,0.2,0.2}"
	.flankLineWidthUp = 1.5
	.flankBackGroundColorDown$ = "{0.75,0.75,0.75}"
	.flankLineColorDown$ = .flankLineColorUp$
	.flankLineWidthDown = 1.5
	.buttonFontSize = defaultFontSize
	
	# Get button values
    .leftX = Get value... '.row' LeftX
    .rightX = Get value... '.row' RightX
    .lowY = Get value... '.row' LowY
    .highY = Get value... '.row' HighY
    .buttonText$ = Get value... '.row' Text
    .buttonKey$ = Get value... '.row' Key
    .buttonColor$ = Get value... '.row' Color
    .buttonDraw$ = Get value... '.row' Draw
    .buttonKey$ = Get value... '.row' Key
    
    # No visible button
    if .leftX <= 0 and .rightX <= 0 and .lowY <= 0 and .highY <= 0
    	goto NOBUTTON
    endif

	.rotation = 0
	if index_regex(.buttonText$, "^![0-9\.]+!")
		.rotation = extractNumber(.buttonText$, "!")
		.buttonText$ = replace_regex$(.buttonText$, "^![0-9\.]+!", "", 0)
	endif

    # Replace button text with ALERT
    if .push = 3
        .buttonText$ = alertText$
    endif
	
	# Adapt font size to button size
	.maxWidth = (.rightX - .leftX) - 2
	.maxHeight = (.highY - .lowY) - 1
	if .rotation = 0
		# Adapt size of button to length of text if necessary
		call adjustFontSizeOnWidth '.buttonFontSize' '.maxWidth' '.buttonText$'
		.buttonFontSize = adjustFontSizeOnWidth.newFontSize
		if adjustFontSizeOnWidth.diff > 0
			.rightX += adjustFontSizeOnWidth.diff/2
			.leftX -= adjustFontSizeOnWidth.diff/2
		endif
		call set_font_size '.buttonFontSize'

		# Adapt size of button to length of text
		call adjustFontSizeOnHeight '.buttonFontSize' '.maxHeight'
		if adjustFontSizeOnHeight.diff > 0
			.lowY -= adjustFontSizeOnHeight.diff/2
			.highY += adjustFontSizeOnHeight.diff/2
		endif
		.buttonFontSize = adjustFontSizeOnHeight.newFontSize
	else
		# With non-horizontal text, only change font size
		call adjustRotatedFontSizeOnBox '.buttonFontSize' '.maxWidth' '.maxHeight' '.rotation' '.buttonText$'
		.buttonFontSize = adjustRotatedFontSizeOnBox.newFontSize
	endif
	
	# Reset and erase button area
	call reset_viewport
    demo Line width... 'defaultLineWidth'
    .shiftLeftX = .leftX - .shiftX
    .shiftRightX = .rightX
    .shiftLowY = .lowY - .shiftY
    .shiftHighY = .highY
	if .erase_button_area
		# Make erase area minutely larger
		.eraseLeft = .shiftLeftX - 0.1
		.eraseRight = .shiftRightX + 0.1
		.eraseBottom = .shiftLowY - 0.01
		.eraseTop = .shiftHighY + 0.01
		demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
	endif
	# Set a "gray area" around buttons with a _
	if index(.label$, "_")
		# Make erase area minutely larger
		.eraseLeft = .shiftLeftX - 0.5
		.eraseRight = .shiftRightX + 0.5
		.eraseBottom = .shiftLowY - 0.8
		.eraseTop = .shiftHighY + 0.8
		demo Paint rectangle... {0.92,0.92,0.92} .eraseLeft .eraseRight .eraseBottom .eraseTop
	endif
	
    # If label starts with "$", it is a text field. Then do not draw the button
	if startsWith(.label$, "()")
		.radius = min((.shiftRightX - .shiftLeftX), (.highY - .lowY)/4)
		.innerRadius = 2* .radius / 3
		.circleX = (.shiftRightX + .shiftLeftX)/2
		.circleY = .shiftHighY - .radius

    	# Give some depth to button: Draw flank outline
		if .shiftDown or .shiftX or .shiftY
			if .push <= 0
    			demo Paint circle: .flankBackGroundColorUp$, .circleX, .circleY, .radius
				demo Colour: .flankLineColorUp$
    			demo Line width: .flankLineWidthUp
			else
    			demo Paint circle: .flankBackGroundColorDown$, .circleX, .circleY, .radius
				demo Colour: .flankLineColorDown$
    			demo Line width: .flankLineWidthDown
			endif
    		demo Draw circle: .circleX, .circleY, .radius
		endif
		
		.circleX = (.rightX + .leftX)/2
		.circleY = .highY - .radius

    	# Draw the button top
		if .push = 0
			demo Paint circle: .topBackGroundColorUp$, .circleX, .circleY, .radius
			demo Colour: .topLineColorUp$
			demo Line width: .topLineWidthUp
		elsif .push < 0
			demo Paint circle: .topBackGroundColorDisabled$, .circleX, .circleY, .radius
			demo Colour: .topLineColorDisabled$
			demo Line width: .topLineWidthDisabled
		elsif .push = 1
			demo Paint circle: .topBackGroundColorDisabled$, .circleX, .circleY, .radius
			demo Paint circle: "Grey", .circleX, .circleY, .innerRadius
			demo Colour: .topLineColorDisabled$
			demo Line width: .topLineWidthDisabled
		else
			# Button Down
			.circleX = (.rightX + .leftX)/2 - .shiftDown
			.circleY = .highY -.radius - .shiftDown

			demo Paint circle: .topBackGroundColorDown$, .circleX, .circleY, .radius
			demo Paint circle: "Black", .circleX, .circleY, .innerRadius
			demo Colour: .topLineColorDown$
			demo Line width: .topLineWidthDown
		endif
    	demo Draw circle: .circleX, .circleY, .radius
		
	elsif not startsWith(.label$, "$")
    	# Give some depth to button: Draw flank outline
		if .shiftDown or .shiftX or .shiftY
			if .push <= 0
    			demo Paint rounded rectangle... '.flankBackGroundColorUp$' .shiftLeftX .shiftRightX .shiftLowY .shiftHighY '.mm'
				demo Colour... '.flankLineColorUp$'
    			demo Line width... '.flankLineWidthUp'
			else
    			demo Paint rounded rectangle... '.flankBackGroundColorDown$' .shiftLeftX .shiftRightX .shiftLowY .shiftHighY '.mm'
				demo Colour... '.flankLineColorDown$'
    			demo Line width... '.flankLineWidthDown'
			endif
    		demo Draw rounded rectangle... .shiftLeftX .shiftRightX .shiftLowY .shiftHighY '.mm'
		endif
		# Button Down will shift the top perspective

    	# Draw the button top
		if .push = 0
    		demo Paint rounded rectangle... '.topBackGroundColorUp$' '.leftX' '.rightX' '.lowY' '.highY' '.mm'
			demo Colour... '.topLineColorUp$'
    		demo Line width... '.topLineWidthUp'
		elsif .push < 0
    		demo Paint rounded rectangle... '.topBackGroundColorDisabled$' '.leftX' '.rightX' '.lowY' '.highY' '.mm'
			demo Colour... '.topLineColorDisabled$'
    		demo Line width... '.topLineWidthDisabled'
		else
			# Button Down
			.leftX -= .shiftDown
			.rightX -= .shiftDown
			.lowY -= .shiftDown
			.highY -= .shiftDown

    		demo Paint rounded rectangle... '.topBackGroundColorDown$' .leftX .rightX .lowY .highY '.mm'
			demo Colour... '.topLineColorDown$'
    		demo Line width... '.topLineWidthDown'
		endif
    	demo Draw rounded rectangle... '.leftX' '.rightX' '.lowY' '.highY' '.mm'
    	
    	
	endif
    # The button text and symbol
	.horWC = demo Horizontal mm to wc... 10.0
	.verWC = demo Vertical mm to wc... 10.0
	if .verWC > 0
		.verCoeff = .horWC / .verWC
	else
		.verCoeff = 1
	endif

    .centerX = (.leftX + .rightX)/2
    .centerY = .lowY + 0.6*(.highY-.lowY)
    .radius = min(.verCoeff * (.highY - .lowY ), (.rightX - .leftX))/3
	.keyText$ = replace$(.buttonKey$, "\", "", 0)
	.keyText$ = replace$(.keyText$, "-", "", 0)
	.newText$ = ""
	if .keyText$ <> ""
		.newText$ = replace_regex$(.buttonText$, "['.keyText$']", "#%&", 1)
	endif
	if .newText$ = ""
		.newText$ = .buttonText$
	endif
	if .push = 1 or .push = -1
		demo Grey
		if .buttonColor$ = "Red"
			.buttonColor$ = "Pink"
		elsif .buttonColor$ = "Blue"
			.buttonColor$ = "{0.5,0.5,1}"
		else
			.buttonColor$ = "Grey"
		endif
    elsif .push >= 2
        .buttonColor$ = "Maroon"
    elsif .push <= -2
        .buttonColor$ = "{0.85,0.85,0.85}"
	else
    	demo Colour... Black
	endif

    call '.buttonDraw$' '.buttonColor$' '.centerX' '.centerY' '.radius' 
	call set_font_size '.buttonFontSize'
    demo Colour... '.buttonColor$'
	if .rotation = 0
		.anchorY = .lowY
		.verticalAlignment$ = "Bottom"
	else
		.anchorY = .lowY + 0.5*(.highY-.lowY)
		.verticalAlignment$ = "Half"
	endif
	# Handle VAScale bars
    if startsWith(.label$, ">")
		# Wipe previous Text
		.eraseLeft = .leftX
		.textLength = demo Text width (wc)... '.newText$'
		.eraseRight = .eraseLeft + .textLength
		.eraseBottom = .highY + 1
		.eraseTop = .eraseBottom + adjustFontSizeOnHeight.lineHeight
		demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
		
		# Write new label
		demo Text special... '.leftX' Left '.highY' Bottom 'defaultFont$' '.buttonFontSize' '.rotation' '.buttonText$'
		# Write other texts
		.leftMark$ = ""
		.rightMark$ = ""
		if index(.buttonKey$, ";") > 0
			.leftMark$ = left$(.buttonKey$, index(.buttonKey$, ";")-1)
			.rightMark$ = extractLine$(.buttonKey$, ";")
		endif
		if index_regex(.leftMark$, "\S")
			.textX = .leftX - 1
			# Wipe area
			.eraseRight = .textX
			.textLength = demo Text width (wc)... '.leftMark$'
			call points_to_wc '.buttonFontSize'
			.textHeight = points_to_wc.wc
			.eraseLeft = .eraseRight - .textLength - 1
			.eraseBottom = .lowY
			.eraseTop = .eraseBottom + .textHeight + 1
			demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
			# Write left mark
			demo Text special... '.textX' Right '.lowY' Bottom 'defaultFont$' '.buttonFontSize' '.rotation' '.leftMark$'
		endif
		if index_regex(.rightMark$, "\S")
			.textX = .rightX + 0.5
			# Wipe area
			.eraseLeft = .textX
			.textLength = demo Text width (wc)... '.rightMark$'
			call points_to_wc '.buttonFontSize'
			.textHeight = points_to_wc.wc
			.eraseRight = .eraseLeft + .textLength + 1
			.eraseBottom = .lowY
			.eraseTop = .eraseBottom + .textHeight + 1
			demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
			demo Text special... '.textX' Left '.lowY' Bottom 'defaultFont$' '.buttonFontSize' '.rotation' '.rightMark$'
		endif
		# Draw ticks
		if config.vasScaleTicks
			.deltaSmallTick = (.rightX - .leftX)/20
			.deltaLargeTick = (.rightX - .leftX)/10
			demo Colour... {0.6,0.6,0.8}
			demo Line width... 1
	 		# Small scale ticks
	 		.tickhighY = .highY - (.highY-.lowY)/3
	 		.ticklowY = .lowY + (.highY-.lowY)/3
			.scaleTick = .leftX + .deltaSmallTick
			while .scaleTick < .rightX
				demo Draw line... '.scaleTick' '.ticklowY' '.scaleTick' '.tickhighY'
				.scaleTick +=  .deltaLargeTick
			endwhile
	 		# Big scale ticks
	 		.tickhighY = .highY - (.highY-.lowY)/5
	 		.ticklowY = .lowY + (.highY-.lowY)/5
			.scaleTick = .leftX + .deltaLargeTick
			.tickTexts = 10
			while .scaleTick < .rightX
				demo Text special... '.scaleTick' Centre '.lowY' Top 'defaultFont$' 7 0 '.tickTexts'
				demo Draw line... '.scaleTick' '.ticklowY' '.scaleTick' '.tickhighY'
				.scaleTick +=  .deltaLargeTick
				.tickTexts += 10
			endwhile
		endif
		
		# Draw current position tick
		.varName$ = replace_regex$(.label$, "^[^a-zA-Z]+([a-zA-Z])", "\l\1", 0)
		.varName$ = "rating.'.varName$'"
		.varNameArray$ = "'.varName$'Array"
		.fraction = -1
		# Several values
		if variableExists(.varNameArray$+"[1]") and '.varName$'Array[1] > -1
			.vasColor$ = "Blue"
			.numFractions = '.varName$'ArrayLength
			for .fi to .numFractions
				.fraction = '.varNameArray$'[.fi]
				if .fraction != undefined
					if .fraction < 0
						.fraction = 0.5
						.vasColor$ = "Grey"
					endif
					.midpoint = .leftX + .fraction * (.rightX - .leftX)
					demo Colour... '.vasColor$'
					demo Line width... 1.5
					demo Draw line... '.midpoint' '.lowY' '.midpoint' '.highY'
				endif
			endfor
		# Single marker
		elsif variableExists(.varName$)
			.vasColor$ = "Red"
			.fraction = -1
			.fraction = '.varName$'
			if .fraction < 0
				.fraction = 0.5
				.vasColor$ = "Grey"
			endif
			.midpoint = .leftX + .fraction * (.rightX - .leftX)
			demo Colour... '.vasColor$'
			demo Line width... 1.5
			demo Draw line... '.midpoint' '.lowY' '.midpoint' '.highY'
		endif
	elsif startsWith(.label$, "()")
		demo Text special... '.centerX' Centre '.lowY' Half 'defaultFont$' '.buttonFontSize' 0 '.newText$'
    else
		demo Text special... '.centerX' Centre '.anchorY' '.verticalAlignment$' 'defaultFont$' '.buttonFontSize' '.rotation' '.newText$'
	endif
	demoShow()

	# Reset
	call set_font_size 'defaultFontSize'
    demo 'defaultFontColor$'
    demo Line width... 'defaultLineWidth'
    
    label NOBUTTON
endproc

procedure set_window_title .table$ .addedText$
    select Table '.table$'
    .row = Search column... Label !WindowTitle
	if .row < 1
		call emergency_table_exit Button Table '.table$' does not have a row with label !WindowTitle
	endif
	.windowText$ = Get value... '.row' Text
	call convert_praat_to_latin1 '.windowText$'
	.windowText$ = convert_praat_to_latin1.text$

	if index(.windowText$, "$$$")
		.displayWindowText$ = replace$(.windowText$, "$$$", .addedText$, 0)
	else
		.displayWindowText$ = .windowText$ + .addedText$
	endif
	
    demoWindowTitle(.displayWindowText$ )
endproc

# Handle language setting 
procedure processLanguageCodes .table$ .label$
	.table$ = "Config"
    call Draw_button 'te.config$' Language_'config.language$' 0
    call Draw_button 'te.config$' '.label$' 2
    # Someone might have to use more than 2 chars for the language code
    .numChars = length(.label$) - length("Language_")
	.lang$ = right$(.label$, .numChars)
    # Load new tables
    call set_language '.lang$'
endproc

# Set the language
procedure set_language .lang$
	.redraw_config = 0
    # Remove old tables
    if te.buttons$ <> ""
        select Table 'te.buttons$'
        Remove
		.redraw_config = 1
    endif
    if te.config$ <> ""
        select Table 'te.config$'
        Remove
		.redraw_config = 1
    endif
    if te.ratingTable > 0
		select te.ratingTable
		Remove
		te.ratingTable = -1
		te.rating$ = ""
    endif
    
    # Set language
	call checkTable 'buttonsFileName$'_'.lang$'
	# Handle alternative Main Page layout
	if not checkTable.available
		call checkTable 'buttonsTableName$'_'.lang$'
	endif
	
	if checkTable.available
		config.language$ = .lang$
		
		if config.language$ = "JA"
			CJK font style preferences: "Japanese"
		elsif config.language$ = "ZH"
			CJK font style preferences: "Chinese"
		endif
	else
		config.language$ = "EN"
	endif
    
    # Load buttons tables
    call loadLanguageTable 'buttonsTableName$' 'config.language$'
    select loadLanguageTable.tableID
    te.buttons$ = selected$("Table")
    call relative2absolutePosition 'te.buttons$'
	if config.ratingExperiment
		call hide_buttons_for_rating_experiment
	endif
    # Load configuration table
    call loadLanguageTable 'configTableName$' 'config.language$'
    select loadLanguageTable.tableID
    te.config$ = selected$("Table")
    call relative2absolutePosition 'te.config$'
    
    # Hide platform specific buttons on load
	if windows
		call hide_button 'te.config$' SaveFMT_PDF
	else
		call hide_button 'te.config$' SaveFMT_EMF
	endif
    

	# Make language change visible
	if .redraw_config
		call Draw_config_page
	endif
endproc

###############################################################
#
# Button Drawing Routines
#
###############################################################

# A stub for buttons that do not have a drawing routine (yet)
procedure DrawNull .color$ .x .y .size
endproc

procedure DrawHelp .color$ .x .y .size
	.currentFontSize = 24
	.y -= .size
	.maxHeight = 2*.size
	call adjustFontSizeOnHeight '.currentFontSize' '.maxHeight'
	.currentFontSize = adjustFontSizeOnHeight.currentFontSize
	call set_font_size '.currentFontSize'
	demo Colour... '.color$'
	demo Text... '.x' Centre '.y' Bottom ?
	call set_font_size 'defaultFontSize'
endproc

procedure DrawSave .color$ .x .y .size
	.currentFontSize = 24
	.y -= 0.5*.size
	.maxHeight = 1.5*.size
	call adjustFontSizeOnHeight '.currentFontSize' '.maxHeight'
	.currentFontSize = adjustFontSizeOnHeight.currentFontSize
	call set_font_size '.currentFontSize'
	demo Colour... '.color$'
	demo Text... '.x' Centre '.y' Bottom \# 
	call set_font_size 'defaultFontSize'
endproc

###############################################################
#
# Button Processing Routines
#
###############################################################
# Convert relative button positions to absolute button positions
procedure relative2absolutePosition .table$
	select Table '.table$'
	.numRows = Get number of rows
	
	for .row to .numRows
		# Get button values, between lines
		# ^+/-x means "add/subtract x to/from value on the previous row"
		if .row > 1
			.prevRow = .row - 1
			select Table '.table$'
			.leftXtxt$ = Get value... '.row' LeftX
			.rightXtxt$ = Get value... '.row' RightX
			.lowYtxt$ = Get value... '.row' LowY
			.highYtxt$ = Get value... '.row' HighY
			if startsWith(.leftXtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' LeftX
				.leftXtxt$ = right$(.leftXtxt$, length(.leftXtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.leftXtxt$'
				select Table '.table$'
				Set numeric value... '.row' LeftX 'r2aConversionOfValue2.result'
			elsif startsWith(.rightXtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' RightX
				.rightXtxt$ = right$(.rightXtxt$, length(.rightXtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.rightXtxt$'
				select Table '.table$'
				Set numeric value... '.row' RightX 'r2aConversionOfValue2.result'
			endif
			if startsWith(.lowYtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' LowY
				.lowYtxt$ = right$(.lowYtxt$, length(.lowYtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.lowYtxt$'
				select Table '.table$'
				Set numeric value... '.row' LowY 'r2aConversionOfValue2.result'
			elsif startsWith(.highYtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' HighY
				.highYtxt$ = right$(.highYtxt$, length(.highYtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.highYtxt$'
				select Table '.table$'
				Set numeric value... '.row' HighY 'r2aConversionOfValue2.result'
			endif
		endif
		
		# Get button values, per line
		# +/-x means "add/subtract x to/from value of other edge"
		select Table '.table$'
		.leftXtxt$ = Get value... '.row' LeftX
		.rightXtxt$ = Get value... '.row' RightX
		.lowYtxt$ = Get value... '.row' LowY
		.highYtxt$ = Get value... '.row' HighY
		if index_regex(.rightXtxt$, "^[+-]")
			call r2aConversionOfValue2 '.leftXtxt$' '.rightXtxt$'
			select Table '.table$'
			Set numeric value... '.row' RightX 'r2aConversionOfValue2.result'
		elsif index_regex(.leftXtxt$, "^[+-]")
			call r2aConversionOfValue2 '.rightXtxt$' '.leftXtxt$'
			select Table '.table$'
			Set numeric value... '.row' LeftX 'r2aConversionOfValue2.result'
		endif
		if index_regex(.highYtxt$, "^[+-]")
			call r2aConversionOfValue2 '.lowYtxt$' '.highYtxt$'
			select Table '.table$'
			Set numeric value... '.row' HighY 'r2aConversionOfValue2.result'
		elsif index_regex(.lowYtxt$, "^[+-]")
			call r2aConversionOfValue2 '.highYtxt$' '.lowYtxt$'
			select Table '.table$'
			Set numeric value... '.row' LowY 'r2aConversionOfValue2.result'
		endif
	endfor
endproc

procedure r2aConversionOfValue2 .value1$ .value2$
	.result = 0
	if index_regex(.value2$, "^[+-]")
		.sign$ = replace_regex$(.value2$, "^([+-]).*$", "\1", 0)
		.newValue$ = replace_regex$(.value2$, "^[+-](.*)$", "\1", 0)
		.result = '.value1$' '.sign$' '.newValue$'
	else
		.result = '.value2$'
	endif
endproc

# Hide and UnHide buttons by manipulating the ! marker in the table
procedure hide_button .table$ .label$
	if startsWith(.label$, "!")
		.cleanLabel = length(.label$) - 1
		.label$ = right$(.label$, .cleanLabel)
	endif
	call nowarn_findLabel '.table$' '.label$'
	if nowarn_findLabel.row > 0
		select Table '.table$'
		Set string value... 'nowarn_findLabel.row' Label !'.label$'
	endif
endproc

procedure unhide_button .table$ .label$
	if not startsWith(.label$, "!")
		.label$ = "!"+.label$
	endif
	call nowarn_findLabel '.table$' '.label$'
	if nowarn_findLabel.row > 0
		.cleanLabel = length(.label$) - 1
		.label$ = right$(.label$, .cleanLabel)
		select Table '.table$'
		Set string value... 'nowarn_findLabel.row' Label '.label$'
	endif
endproc

procedure hide_all_buttons .table$
	select Table '.table$'
	.numRows = Get number of rows
	for .row to .numRows
		select Table '.table$'
		.label$ = Get value: .row, "Label"
		if not startsWith(.label$, "!")
			call hide_button '.table$' '.label$'
		endif
	endfor
endproc

# Search row in table on label
procedure findKey .table$ .label$
	.row = 0
	select Table '.table$'
	.to$ = selected$("Table")
	.to$ = "Table_"+.to$
	.numRows = Get number of rows
	for .i to .numRows
		.currentKey$ = '.to$'$[.i, "Key"]
		if .label$ = .currentKey$
			.row = .i
			goto KEYFOUND
		endif
	endfor
	label KEYFOUND
	if .row <= 0 and index(.label$, "_") <= 0
		printline "'.label$'" is not a key in '.table$'
	endif
endproc

procedure findLabel .table$ .label$
	call nowarn_findLabel '.table$' '.label$'
	.row = nowarn_findLabel.row
	if .row <= 0 and index(.label$, "_") <= 0
		call emergency_table_exit "'.label$'" is not a key in '.table$'
	endif
endproc

procedure nowarn_findLabel .table$ .label$
	.row = 0
	select Table '.table$'
	.to$ = selected$("Table")
	.to$ = "Table_"+.to$
	.numRows = Get number of rows
	for .i to .numRows
		.currentKey$ = '.to$'$[.i, "Label"]
		if .label$ = .currentKey$
			.row = .i
			goto LABELFOUND
		endif
	endfor
	label LABELFOUND
	if .row > .numRows
		.row = 0
	endif
endproc

# Read feedback table and get keyed text
procedure get_feedback_text .language$ .key$
	if not endsWith(feedbackTableName$, "_'.language$'")
		if feedbackTableName$ <> ""
			select Table 'feedbackTableName$'
			Remove
		endif
		call loadTable 'feedbackTablePrefix$'_'.language$'
		feedbackTableName$ = selected$("Table")
	endif
	call findKey 'feedbackTableName$' '.key$'
	.row = findKey.row
	select Table 'feedbackTableName$'
	.text$ = Get value... '.row' Text
	# Expand variables, eg, 'praatVersion$'
	call expand_praat_variables '.text$'
	.text$ = expand_praat_variables.text$	
endproc

# Get the label
procedure buttonClicked .table$ .x .y
	.label$ = ""
	select Table '.table$'
	.bo$ = selected$("Table")
	.bo$ = "Table_"+.bo$
	.numRows = Get number of rows
	for .i to .numRows
		if .label$ = "" or startsWith(.label$, "!")
			.leftX = '.bo$'[.i, "LeftX"]
			.rightX = '.bo$'[.i, "RightX"]
			.lowY = '.bo$'[.i, "LowY"]
			.highY = '.bo$'[.i, "HighY"]
			if .x > .leftX and .x < .rightX and .y > .lowY and .y < .highY
				.label$ = '.bo$'$[.i, "Label"]
				.fractionX = 0.5
				.fractionY = 0.5
				if (.rightX - .leftX) > 0
					.fractionX = (.x - .leftX)/(.rightX - .leftX)
				endif
				if (.highY - .lowY) > 0
					.fractionY = (.y - .lowY)/(.highY - .lowY)
				endif
			endif
		endif
	endfor
endproc

procedure keyPressed table$ .pressed$
	.label$ = ""
	# Magic
	if .pressed$ = "" and not demoShiftKeyPressed()
		.label$ = "Refresh"
	endif
	.lowerPressed$ = replace_regex$(.pressed$, ".", "\L&", 0)
	.upperPressed$ = replace_regex$(.pressed$, ".", "\U&", 0)
	select Table 'table$'
	.bo$ = selected$("Table")
	.bo$ = "Table_"+.bo$
	.numRows = Get number of rows
	for .i to .numRows
		if .label$ = ""
			.key$ = '.bo$'$[.i, "Key"]
			if index(.key$, .lowerPressed$) or index(.key$, .upperPressed$)
				.label$ = '.bo$'$[.i, "Label"]
			endif
		endif
	endfor
endproc

procedure play_sound .sound
    if .sound and not config.muteOutput
    	select '.sound'
		if not currentStartTime and not currentEndTime
    		Play
		else
			Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 false
			Rename... TmpPart
			Play
			Remove
		endif
    endif
endproc

procedure record_sound
	.currentSpeakerID$ = speakerID$
	call reset_analysis
	speakerID$ = .currentSpeakerID$
	.recordingTaskPrompt = 0
	.sampleFreq = te.defaultSampleFreq
	if config.frequency <= 5000
		.sampleFreq = 11025
	endif
	
	# There is a very nasty delay before the first recording starts, do a dummy record
	if not variableExists("recordingInitialized")
		call basic_sound_recording 'te.recordingSampleFrequency' 0.1
		Remove
		recordingInitialized = 1
	endif

    # Show a task window
	.rectime = 'config.recordingTime$'
	if speakerID$ = ""
		call get_speakerInfo 1
		speakerID$ = get_speakerInfo.id$
	endif
    if te.recordingTaskTable > 0
		.recordingTaskPrompt = 1
		call get_speakerInfo 'speakerID$'
		if get_speakerInfo.row > 0
			.recordingTaskPrompt = get_speakerInfo.row
		endif
		select te.recordingTaskTable
		.numRows = Get number of rows
		.timeColumn = Get column index... time
		if .timeColumn > 0 and .recordingTaskPrompt <= .numRows
			.rectime = Get value... '.recordingTaskPrompt' time
		endif
		if .rectime = undefined or .rectime <= 0
			.rectime = 'config.recordingTime$'
		endif
		# When doing a recording task, wipe the screen
		demo Erase all
    endif
    
    # Display prompt if needed (Warning BEFORE the recording light)
	if .recordingTaskPrompt > 0
		.originalPopUpcolor$ = popUp.backgroundcolor$
		popUp.backgroundcolor$ = popUp.warncolor$
		.origFontColor$ = defaultFontColor$
		defaultFontColor$ = "Grey"
		call display_prompt 'te.recordingTaskTable' '.recordingTaskPrompt'
		defaultFontColor$ = .origFontColor$
		demo 'defaultFontColor$'
		popUp.backgroundcolor$ = .originalPopUpcolor$
		# Wait a moment
		call basic_sound_recording 'te.recordingSampleFrequency' 'te.waitRecordingTask'
		Remove
	endif

	# Display a recording light
	demo Paint circle... Red 'recordingLightX' 'recordingLightY' 2
	demoShow()
    
    # Display prompt if needed (AFTER the recording light)
	if .recordingTaskPrompt > 0
		popUp.backgroundcolor$ = popUp.gocolor$
		call display_prompt 'te.recordingTaskTable' '.recordingTaskPrompt'
		popUp.backgroundcolor$ = .originalPopUpcolor$
	endif

    # Record
 	call basic_sound_recording 'te.recordingSampleFrequency' '.rectime'
    .recording = basic_sound_recording.sound

	# Keep track of current sound
	call getTimeStamp
	te.recordingTimeStamp$ = getTimeStamp.string$
	te.currentFileName$ = ""
	
    # Remove prompt if needed (Warning BEFORE the recording light)
	if .recordingTaskPrompt > 0
		# When doing a recording task, wipe the screen
		demo Erase all
	else
		# Remove recording light
		demo Paint circle... White 'recordingLightX' 'recordingLightY'  2.5
	    call wipeArea 'wipeFeedbackArea$'
	endif

    # Downsample for speed
    if .sampleFreq <> te.recordingSampleFrequency
		.downsampled = Resample... '.sampleFreq' 50
		select .recording
		Remove
		.recording = .downsampled
		select .recording
		.downsampled = -1
    endif
    
	call draw_recording_level

	# Process sound
	select .recording
    Rename... Speech
	te.openSound = selected("Sound")
    recordedSound$ = selected$("Sound")
    select te.openSound
	currentStartTime = 0
	currentEndTime = Get total duration
	
	# Cut out real sound from silences/noise (if NO prompt)
	if te.recordingTaskTable <= 0
		call sound_detection 'recordedSound$' 'soundMargin'
	else
		call remove_margins 'recordedSound$' 'soundMargin'
	endif
	select Sound 'recordedSound$'
	te.openSound = selected("Sound")
	currentStartTime = 0
	currentEndTime = Get total duration
	# Reset selected window
	selectedStartTime = currentStartTime
	selectedEndTime = currentEndTime
	
	# Logging
	call log_recording MainPage ReadFromFile 'recordedSound$'
	
	# A sound is recorded, wipe file name
	currentSoundName$ = "RECORDED SOUND"
	
	if config.autoSelect
		call argMinASTselection
	endif
	
	select te.openSound
endproc

# Uses global variables!!!
procedure basic_sound_recording .samplingFrequency .recordingTime
	.sound = nocheck noprogress nowarn Record Sound (fixed time)... 'config.input$' 0.99 0.5 '.samplingFrequency' '.recordingTime'
	if .sound = undefined
		.sound = Create Sound: "Pronunciation", 0, .recordingTime, .samplingFrequency, "0"
	endif
	
	# The recorded sound should now be the selected object!!!
	select .sound
endproc

procedure setup_recordingTask
	.skiprecording = 0
	.noPostfix = 0

	# Initialize TEVA
	call unload_RecordingTask
	
	# Update config.recordingTaskFile$
	if not fileReadable(config.recordingTaskFile$) and fileReadable("'defaultDirectory$'/'config.recordingTaskFile$'")
		if config.recordingTarget$ = ""
			.filenameStart = rindex_regex(config.recordingTaskFile$, "[\\/:]+[^\\/:]+$")
			config.recordingTarget$ = left$(config.recordingTaskFile$, .filenameStart - 1)
			config.recordingTarget$ = "'defaultDirectory$'/'config.recordingTarget$'"
		endif
		config.recordingTaskFile$ = "'defaultDirectory$'/'config.recordingTaskFile$'"
	endif
	
	# Read a list of prompts from a text file and create a default recording task table
	if fileReadable(config.recordingTaskFile$) and index_regex(config.recordingTaskFile$, "\.(txt|TXT|text)$") > 0
		.strings = Read Strings from raw text file: config.recordingTaskFile$
		.numStrings = Get number of strings
		.s = 1
		.text$ = Get string: .s
		while startsWith(.text$, "//")
			.s += 1
			.text$ = Get string: .s
		endwhile
		te.recordingTaskTable = Create Table with column names... RecordingTaskTable 1 postfix time align font size text
		Set string value... 1 postfix _p1
		Set numeric value... 1 time 'config.recordingTime$'
		Set string value... 1 align centre
		Set string value... 1 font Helvetica
		Set numeric value... 1 size 24
		Set string value... 1 text '.text$'
		.start = .s + 1
		.w = 1
		for .s from .start to .numStrings
			select .strings
			.text$ = Get string: .s
			# Skip empty lines
			if index_regex(.text$, "\S") and not startsWith(.text$, "//")
				select te.recordingTaskTable
				Append row
				.w += 1
				Set string value... .w postfix _p'.w'
				Set numeric value... .w time 'config.recordingTime$'
				Set string value... .w align centre
				Set string value... .w font Helvetica
				Set numeric value... .w size 24
				Set string value... .w text '.text$'
			endif
		endfor
		select .strings
		Remove
	# Read a recording task
	elsif fileReadable(config.recordingTaskFile$)
		call readTable 'config.recordingTaskFile$'
		te.recordingTaskTable = readTable.tableID
		# Do a sanity check
		if te.recordingTaskTable > 0
			.fullName$ = selected$ ()
			.type$ = extractWord$(.fullName$, "")
			if .type$ <> "Table"
				Remove
				te.recordingTaskTable = -1
				config.recordingTaskFile$ = ""
				.skiprecording = 1
			else
				.textIndex = Get column index: "text"
				if .textIndex <= 0
					Remove
					te.recordingTaskTable = -1
					config.recordingTaskFile$ = ""
					.skiprecording = 1
				else
					.textIndex = Get column index: "postfix"
					if .textIndex <= 0
					.noPostfix = 1
					endif
				endif
				
			endif
		endif
	# Create a recording task from a single line of text
	elsif startsWith(config.recordingTaskFile$, "[") and endsWith(config.recordingTaskFile$, "]")
		.text$ = left$(config.recordingTaskFile$, length(config.recordingTaskFile$) - 1)
		.text$ = right$(.text$, length(.text$) - 1)
		te.recordingTaskTable = Create Table with column names... RecordingTaskTable 1 postfix time align font size text
		.lineEnd = index(.text$, "<newline>")
		.i = 1
		repeat
			select te.recordingTaskTable
			.numRows = Get number of rows
			if .numRows < .i
				Append row
			endif
			if .lineEnd > 0
				.currentLine$ = left$(.text$, .lineEnd - 1)
				.text$ = right$(.text$, length(.text$) - (.lineEnd + 8))
				.lineEnd = index(.text$, "<newline>")
			else
				.currentLine$ = .text$
				.text$ = ""
				.lineEnd = 0
			endif
			Set string value... '.i' postfix _rec'.i'
			Set numeric value... '.i' time 'config.recordingTime$'
			Set string value... '.i' align centre
			Set string value... '.i' font Helvetica
			Set numeric value... '.i' size 24
			Set string value... '.i' text '.currentLine$'
			.i += 1
		until length(.text$) <= 0
	endif
	if te.recordingTaskTable > 0		
		# Switch to serial
		config.speakerSerial$ = "Forw"
		# Set up new Speaker table
		call initializeSpeakerData
		# Set TEVA to store all audio
		te.saveAudio = 1
		# Initialize Speaker Data
		speakerInfo$ = ""
		speakerComments$ = ""
		pathologicalType = 0
		# Ask for speaker ID
		.table$ = "MainPage"
		.label$ = "Record"
		call getLanguageTexts '.table$' '.label$'
		call get_feedback_text 'config.language$' Speaker
		# Get feedback texts
		call get_feedback_text 'config.language$' SpeakerID
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.inputText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Cancel
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.cancelText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Continue
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.continueText$ = convert_praat_to_latin1.text$
		clicked = -1
		beginPause(getLanguageTexts.helpText$)
			sentence (.inputText$, "")
		clicked = endPause ("'.cancelText$'", "'.continueText$'", 2, 1)
		if clicked = 2
			.inputText$ = replace_regex$(.inputText$, ".+", "\l&\$", 0)
			.inputText$ = replace_regex$(.inputText$, "[ ]", "_", 0)
			.inputText$ = replace_regex$(.inputText$, "\$", "", 0)
			speakerID$ = '.inputText$'$
			te.restartRecordingTask = 0
		endif
		# On Windows, clear the screen
		if windows
			call init_window
		endif

		# If a speaker ID has been supplied
		if speakerID$ <> ""
			# Date and time
			call i8n_date
			.datetime$ = i8n_date.printDate$
			# New speakerDataTable
			config.speakerData$ = ""
			config.speakerDataTable = Create Table with column names... Speaker_Data 1 ID Text Description StartTime EndTime Audio SaveAudio AST
			select te.recordingTaskTable
			.numRows = Get number of rows
			if .noPostfix
				.postfix = "rec1"
			else
				.postfix$ = Get value... 1 postfix
			endif
			.prompt$ = Get value... 1 text
			.filename$ = replace_regex$(speakerID$, "[^a-zA-Z0-9\.\-_]", "_", 0)
			if .filename$ <> ""
				createDirectory("'config.recordingTarget$'/'.filename$'")
			endif
			config.speakerData$ = "'config.recordingTarget$'/'.filename$'/'.filename$'_'.datetime$'.Table"
			select config.speakerDataTable
			Set string value... 1 ID '.filename$''.postfix$'
			Set string value... 1 Audio 'config.recordingTarget$'/'.filename$'/'.filename$''.postfix$'_'.datetime$'.wav
			# Initilaise on first row
			speakerID$ = "'.filename$''.postfix$'"
			call set_new_speakerdata 'speakerID$'
			
			# Fill other rows
			for .i from 2 to .numRows
				select te.recordingTaskTable
				if .noPostfix
					.postfix = "rec'.i'"
				else
					.postfix$ = Get value... '.i' postfix
				endif
				.prompt$ = Get value... '.i' text
				select config.speakerDataTable
				Append row
				Set string value... '.i' ID '.filename$''.postfix$'
				Set string value... '.i' Audio 'config.recordingTarget$'/'.filename$'/'.filename$''.postfix$'_'.datetime$'.wav
			endfor
		else
			.skiprecording = 1
		endif
	endif	
	
endproc

procedure unload_RecordingTask
    if te.recordingTaskTable > 0		
		select te.recordingTaskTable
		Remove
		te.recordingTaskTable = -1
		te.restartRecordingTask = 1
	endif
	call initializeSpeakerData
	call reset_analysis
	call get_speakerInfo 0
	call get_nextSpeaker 0
	call get_previousSpeaker 0
	te.saveAudio = 0
endproc

procedure display_prompt .table .number
	.maxWidth = 95
	if .table > 0
		select .table
		.align$ = "left"
		.alignColumn = Get column index... align
		.numRows = Get number of rows
		if .number > 0 and .number <= .numRows
			# Get the values
			if .alignColumn > 0
				.align$ = Get value... '.number' align
			endif
			.font$ = Get value... '.number' font
			.fontSize = Get value... '.number' size
			.font$ = extractWord$(.font$, "")
			.text$ = Get value... '.number' text
			
			# Add newlines
			if index(.text$, "\n") <= 0
				demo '.font$'
				call set_font_size '.fontSize'
	
				.line$ = ""
				.newtext$ = " "
				while index_regex(.text$, "\S") > 0
					.word$ = replace_regex$(.text$, "^([\S]*[^\S]*[\S]*)(.*$)", "\1", 0)
					.text$ = replace_regex$(.text$, "^([\S]*[^\S]*[\S]*)(.*$)", "\2", 0)
					.textWidth = demo Text width (wc)... "'.line$''.word$'"
					if .textWidth <= .maxWidth
						.line$ = .line$ + .word$
					else
						.newtext$ = .newtext$ + "\n" + .line$
						.line$ = .word$
					endif
				endwhile
				if index_regex(.line$, "\S") > 0
					.text$ = .newtext$ + "\n" + .line$
				endif
				demo 'defaultFont$'
				call set_font_size 'defaultFontSize'
			endif
			
			# Write popup
			call text2popuptable '.align$' '.font$' '.fontSize' "'.text$'"
			display_prompt.popUpTable = text2popuptable.textTable
			call write_text_table display_prompt.popUpTable
			
		endif
	endif
endproc

procedure draw_recording_level
	if recordedSound$ <> ""
		select te.openSound
    	demo Paint circle... White 'recordingLightX' 'recordingLightY'  2.5
		# Feedback on recording level
		.extremum = Get absolute extremum... 0 0 None
		.radius = 2 * .extremum
		.blue = 0
		.green = 0
		.red = 0
		if .extremum >= 0.95
			.red = 1
		elsif .extremum >= 0.49
			.green = 1
		else
			.green = .extremum / 0.5
		endif
		.color$ = "{'.red','.green','.blue'}"
		demo Colour... '.color$'
		demo Line width... 1
		if .radius > 0
			demo Draw circle... 'recordingLightX' 'recordingLightY'  '.radius'
		endif
		# Reset
    	demoShow()
		demo Colour... Black
		demo Line width... 'defaultLineWidth'
	endif
endproc

# Select real sound from recording
procedure remove_margins .sound$ .margin
	select Sound '.sound$'
	.origSound = selected("Sound")
	.soundlength = Get total duration
	.intensity = Get intensity (dB)
	.begintime = 0
	.endtime = .soundlength
	.internalSilence = 2*.margin
	
	# Silence and remove noise, DANGEROUS
	.textgridSound = To TextGrid (silences)... 'minimumPitch' 0 'noiseThresshold' '.internalSilence' 0.1 silent sounding
	Rename... Input'.sound$'

	select .textgridSound
	.numberofIntervals = Get number of intervals... 1
	if .numberofIntervals > 2 and .intensity > minimumIntensity
		select .textgridSound
		# First interval
		.value$ = Get label of interval... 1 1
		.intbegin = Get starting point... 1 1
		.intend = Get end point... 1 1
		if .value$ = "silent" and .intend > .margin
			.begintime = .intend - .margin
		endif
		# Last interval
		.value$ = Get label of interval... 1 '.numberofIntervals'
		.intbegin = Get starting point... 1 '.numberofIntervals'
		.intend = Get end point... 1 '.numberofIntervals'
		if .value$ = "silent" and .intbegin + .margin < .soundlength
			.endtime = .intbegin + .margin
		endif
		
		# Copy sound
		select .origSound
    	.newSound = Extract part... '.begintime' '.endtime' Rectangular 1.0 no
		Rename... '.sound$'
		select .origSound
		Remove
		select .newSound
	endif
	
endproc

# Uses some global variable
procedure sound_detection .sound$ .margin
	select Sound '.sound$'
	.soundlength = Get total duration
	.internalSilence = 2*.margin
	
	# Silence and remove noise, DANGEROUS
	To TextGrid (silences)... 'minimumPitch' 0 'noiseThresshold' '.internalSilence' 0.1 silent sounding
	Rename... Input'.sound$'

	select TextGrid Input'.sound$'
	.numberofIntervals = Get number of intervals... 1
	if .numberofIntervals < 2
		.numberofIntervals = 0
	endif

	# Remove buzzing and other obnoxious sounds (if switched on)
	for .i from 1 to .numberofIntervals
	   select TextGrid Input'.sound$'
	   .value$ = Get label of interval... 1 '.i'
	   .begintime = Get starting point... 1 '.i'
	   .endtime = Get end point... 1 '.i'

		# Remove noise
		if .value$ = "silent"
			select Sound '.sound$'
			Set part to zero... '.begintime' '.endtime' at nearest zero crossing
		endif
	endfor

	# Select target sound
	.maximumIntensity = -1
	.counter = 1
	for i from 1 to .numberofIntervals
	   select TextGrid Input'.sound$'

	   .value$ = Get label of interval... 1 'i'
	   .begintime = Get starting point... 1 'i'
	   .endtime = Get end point... 1 'i'

	   if .value$ != "silent"
    	   if .begintime > .margin
        	  .begintime -= .margin
    	   else
        	   .begintime = 0
    	   endif
    	   if .endtime + .margin < .soundlength
        	   .endtime += .margin
    	   else
        	   .endtime = .soundlength
    	   endif

    	   select Sound '.sound$'
    	   Extract part... '.begintime' '.endtime' Rectangular 1.0 no
    	   Rename... Tmp'.sound$'
    	   Subtract mean
    	   .newIntensity = Get intensity (dB)
    	   if .newIntensity > .maximumIntensity
        	   if .maximumIntensity > 0
            	   select Sound New'.sound$'
            	   Remove
        	   endif
        	   select Sound Tmp'.sound$'
        	   Rename... New'.sound$'
        	   .maximumIntensity = .newIntensity
    	   else
        	   select Sound Tmp'.sound$'
        	   Remove
    	   endif
    	   # 
	   endif
	endfor
	if .maximumIntensity > minimumIntensity
		select Sound '.sound$'
		Remove
		select Sound New'.sound$'
		Rename... '.sound$'
	elsif .maximumIntensity > -1
		select Sound New'.sound$'
		Remove
	endif
	select TextGrid Input'.sound$'
	Remove
endproc

procedure end_program
	# Clean up
	call reset_analysis
	call write_preferences ""
	demo Erase all
	select all
	Remove
	exit
endproc

######################################################
#
# Configuration Page
#
######################################################
procedure config_page
    demo Erase all
    demoWindowTitle("'demoAppName$': Change settings")
    .label$ = ""
    call Draw_config_page
    
    while (.label$ <> "Return") and demoWaitForInput() 
		.clickX = -1
		.clickY = -1
		.pressed$ = ""		
	    .label$ = ""
	    if demoClicked()
		    .clickX = demoX()
		    .clickY = demoY()
		    call buttonClicked 'te.config$' '.clickX' '.clickY'
		    .label$ = buttonClicked.label$
	    elsif demoKeyPressed()
		    .pressed$ = demoKey$()
		    call keyPressed 'te.config$' '.pressed$'
		    .label$ = keyPressed.label$
	    endif

		# You cannot select a text field
		if startsWith(.label$, "$")
			.label$ = ""
		endif
		
	    # Do things
	    if .label$ != ""
		    # Handle push button in process_config
			call Draw_button 'te.config$' '.label$' 1
		    call process_config '.label$' '.clickX' '.clickY' '.pressed$'
	    endif
        
        if .label$ = "Return"
            goto GOBACK
        endif
    endwhile

    # Go back
    label GOBACK
    call init_window
endproc

procedure Draw_config_page
	demo Erase all
	# Draw background
	if config.showBackground
		call draw_background Background
	endif
	# Draw buttons
    call Draw_all_buttons 'te.config$'
	call set_window_title 'te.config$'  
    # Set correct buttons (alert)
	call setConfigMainPage
endproc

# Do what is asked
procedure process_config .label$ .clickX .clickY .pressed$
	# Log raw commands to replay in file
	call log_command 'te.config$' '.label$' '.clickX' '.clickY' '.pressed$'
	
	if .label$ <> "" and not startsWith(.label$,"!")
		.label$ = replace$(.label$, "_", " ", 0)
		call process'te.config$''.label$' '.clickX' '.clickY' '.pressed$'
	endif
endproc

###############################################################
#
# Presenting help texts
#
###############################################################

# Process Help
procedure help_loop .table$ .redrawProc$
	# General Help text
	call  write_help_title '.table$'
	
    .label$ = ""
    call Draw_button '.table$' Help 2
    
    .redrawScreen = 0
    while (.label$ <> "Help") and demoWaitForInput() 
	    .label$ = ""
	    if demoClicked()
		    .clickX = demoX()
		    .clickY = demoY()
		    call buttonClicked '.table$' '.clickX' '.clickY'
		    .label$ = buttonClicked.label$
	    elsif demoKeyPressed()
		    .pressed$ = demoKey$()
		    call keyPressed '.table$' '.pressed$'
		    .label$ = keyPressed.label$
	    endif

	    if .label$ != "" and .label$ <> "Help"
			# Redraw screen
			if .redrawScreen
				demo Erase all
				call '.redrawProc$'
			else
    			.redrawScreen = 1
			endif
			call Draw_button '.table$' Help 2
			call  write_help_title '.table$'

		    # Handle push button in process_config
		    call write_help_text '.table$' '.label$'
	    endif
        
    endwhile
	
	# Reset button
    call Draw_button '.table$' Help 0
	demo Erase all
	call '.redrawProc$'
endproc

# Write help text
procedure write_help_text .table$ .label$
	# Log raw commands to replay in file
	call log_command Help '.table$' '.label$'
	
	call findLabel '.table$' '.label$'
	.row = findLabel.row
	select Table '.table$'
	# Get text
	if .row <= 0
		call findLabel '.table$' Help
		.row = findLabel.row
		select Table '.table$'
	endif
	.helpText$ = Get value... '.row' Helptext
	.helpKey$ = Get value... '.row' Key
	.helpKey$ = replace$(.helpKey$, "\", "", 0)
	.helpKey$ = replace$(.helpKey$, "_", "\_ ", 0)
	if index_regex(.helpKey$, "\S")
		.helpText$ = .helpText$+" ("+.helpKey$+")"
	endif
	# Get button values
    .leftX = Get value... '.row' LeftX
    .rightX = Get value... '.row' RightX
    .lowY = Get value... '.row' LowY
    .highY = Get value... '.row' HighY
	
	# PopUp dimensions
	.currentHelpFontSize = defaultFontSize
    call set_font_size '.currentHelpFontSize'
	.helpTextSize = demo Text width (wc)... '.helpText$'
	.helpTextSize += 4
	if .leftX > 50
		.htXleft = 20
		.htXright = .htXleft + .helpTextSize + 5
		.xstart = .leftX
	else
		.htXright = 80
		.htXleft = .htXright - .helpTextSize - 5
		.xstart = .rightX
	endif
	if .lowY > 50
		.htYlow = 40
		.htYhigh = .htYlow + 7
		.ystart = .lowY
		.yend = .htYhigh
	else
		.htYhigh = 60
		.htYlow = .htYhigh - 7
		.ystart = .highY
		.yend = .htYlow
	endif

	# Adapt font size to horizontal dimensions
	.maxWidth = 90
	call adjustFontSizeOnWidth '.currentHelpFontSize' '.maxWidth' '.helpText$'
	.currentHelpFontSize = adjustFontSizeOnWidth.newFontSize
	if .htXleft < 0 or .htXright > 100
		.htXleft = 0
		.htXright = .htXleft + adjustFontSizeOnWidth.textWidth + 5
	endif
	call set_font_size '.currentHelpFontSize'

	# Adapt vertical dimensions to font height
	call points_to_wc '.currentHelpFontSize'
	.lineHeight = points_to_wc.wc
	if .lineHeight > .htYhigh - .htYlow - 4
		.htYhigh = .htYlow + .lineHeight + 4
	endif

	# Determine arrow endpoints
	.xend = .htXleft
	if abs(.htXleft - .xstart) > abs(.htXright - .xstart)
		.xend = .htXright
	endif
	if abs((.htXleft+.htXright)/2 - .xstart) < min(abs(.htXright - .xstart),abs(.htXleft - .xstart))
		.xend = (.htXleft+.htXright)/2
	endif
	
	.xtext = .htXleft + 2
	.ytext = .htYlow + 1
	
	# Draw pop-up
	.mm2wc = demo Horizontal mm to wc... 1
	.lineWidth = 2/.mm2wc
	.arrowSize = .lineWidth / 3
	demo Line width... '.lineWidth'
 	demo Colour... 'popUp.bordercolor$'
	demo Paint rectangle... 'popUp.backgroundcolor$' '.htXleft' '.htXright' '.htYlow' '.htYhigh'
	demo Draw rectangle... '.htXleft' '.htXright' '.htYlow' '.htYhigh'
	demo Line width... '.arrowSize'
	demo Arrow size... '.arrowSize'
	demo Draw arrow... '.xstart' '.ystart' '.xend' '.yend'
	demo Line width... 'defaultLineWidth'
	demo Arrow size... 1
	demo 'defaultFontColor$'
	demo Text... '.xtext' Left '.ytext' Bottom '.helpText$'
	demoShow()
	call set_font_size 'defaultFontSize'
	
endproc

procedure write_help_title .table$
	# Set help text title
	# General Help text
	call findLabel '.table$' Help
	.row = findLabel.row
	select Table '.table$'
	.helpTitle$ = Get value... '.row' Helptext
	.helpKey$ = Get value... '.row' Key
	.helpKey$ = replace$(.helpKey$, "\", "", 0)
	.helpKey$ = replace$(.helpKey$, "_", "\_ ", 0)
	.helpTitle$ = .helpTitle$+" ("+.helpKey$+")"
	
	call reset_viewport
	.helpTitleFontSize = 14
	# Adapt size of button to length of text
	.maxWidth = 80
	call adjustFontSizeOnWidth '.helpTitleFontSize' '.maxWidth' '.helpTitle$'
	.helpTitleFontSize = adjustFontSizeOnWidth.newFontSize
	call set_font_size '.helpTitleFontSize'
	.helpTop = 100
	
	demo Select inner viewport... 0 100 0 100
	demo Axes... 0 100 0 100
	demo Text... 50 Centre '.helpTop' Top '.helpTitle$'
    call set_font_size 'defaultFontSize'
	call reset_viewport
endproc

###############################################################
#
# Miscelaneous procedures
#
###############################################################
procedure printPageToPrinter
	call print_window
	demo Print... 'printerName$' 'printerPresets$'
	call init_window
endproc

procedure getOpenFile .openDialogue$
	# Check existence of (first) audiofile
	.testFile$ = replace_regex$(.openDialogue$, "\{([^,]+)[^\}]*\}", "\1", 0)
	if fileReadable(.testFile$)
		.filename$ = .openDialogue$
	elsif index_regex(.openDialogue$, "[^0-9]") <= 0
		.filename$ = .openDialogue$
	else
		call convert_praat_to_latin1 '.openDialogue$'
		.openDialogue$ = convert_praat_to_latin1.text$
		.filename$ = chooseReadFile$ (.openDialogue$)
	endif
	if .filename$ <> "" and fileReadable(.filename$) and index_regex(.filename$, "(?i\.(txt|tsv|table)$)")
		# Reset all internal structures
		call reset_analysis
		call initializeSpeakerData
		call unload_RecordingTask
		
		config.speakerData$ = .filename$
		.dataDir$ = replace_regex$(config.speakerData$, "(^|[/:\\])[^/:\\]+$", "", 0)
		call load_local_preferences '.dataDir$'
		.filename$ = ""
	endif
	# Get the file. We insist on the correct extention as we cannot check for "incorrect" files in other ways.
	call readAudio '.filename$'
	.sndInput = readAudio.audioID
	if .sndInput > 0
		# Reset all internal structures
		call reset_analysis
		
		select .sndInput
		.numChannels = Get number of channels
		if .numChannels > 1
			.monoInput= Convert to mono
			select .sndInput
			Remove
			select .monoInput
		endif
		call log_command "# Open File: '.filename$'"
		# Keep track of current sound
		te.currentFileName$ = .filename$

		# Get only the filename
		.endDirectory = rindex_regex(.filename$, "[/\\:]")
		.startName = .endDirectory + 1
		.nameLength = rindex(.filename$, ".") - .startName
		currentSoundName$ = mid$(.filename$, .startName, .nameLength)
		currentDirectoryName$ = left$(.filename$, .endDirectory)
		
		te.openSound = selected("Sound")
		recordedSound$ = selected$("Sound")
		
		# Set up empty speaker data table if none is present
		if config.speakerDataTable <= 0
			config.speakerData$ = ""
			config.speakerDataTable = Create Table with column names... Speaker_Data 1 ID Text Description Audio AST StartTime EndTime
			Set string value... 1 ID 'recordedSound$'
			Set string value... 1 Audio 'te.currentFileName$'
		endif
		
		# Keep track of current sound
		select te.openSound
		te.recordingTimeStamp$ = ""
		currentStartTime = 0
		currentEndTime = Get total duration
		# Reset selected window
		selectedStartTime = currentStartTime
		selectedEndTime = currentEndTime
	endif
endproc

procedure set_new_speakerdata .newSpeakerID$
	if .newSpeakerID$ = "" or .newSpeakerID$ = "-"
		if currentSoundName$ <> ""
			.newSpeakerID$ = currentSoundName$
		else
			.newSpeakerID$ = recordedSound$
		endif
	endif
	speakerID$ = .newSpeakerID$
	call get_speakerInfo 'speakerID$'
	speakerInfo$ = get_speakerInfo.text$
	speakerComments$ = get_speakerInfo.description$
	pathologicalType = 'get_speakerInfo.ast$'
	te.currentFileName$ = get_speakerInfo.audio$
	
	# If this was loaded from a Speaker Data file, set the Select Window
	if get_speakerInfo.row > 0 and get_speakerInfo.endTime > 0 
		selectedStartTime = get_speakerInfo.startTime
		selectedEndTime = get_speakerInfo.endTime
		call predictASTvalue
		predictedPathType = predictASTvalue.ast
	elsif config.autoSelect
		# If no selection if given, determine it
		call argMinASTselection
	endif
	
endproc

procedure readFromFile .filename$
	call readAudio '.filename$'
	.sndInput = readAudio.audioID
	if .sndInput > 0
		currentStartTime = 0
		currentEndTime = Get total duration
		Rename... Speech
		recordedSound$ = selected$("Sound")	
		call post_processing_sound
	endif
endproc

procedure runCommandFile .filename$
	runningCommandMode = 1
	
	if fileReadable(.filename$)
		.commandFile = Read Strings from raw text file... '.filename$'
		.numStrings = Get number of strings
		for .i to .numStrings
			select .commandFile
			.line$ = Get string... '.i'
			if index_regex(.line$, "\S") > 0 and index_regex(.line$, "^\s*#") <= 0
				if index_regex(.line$, "^\s*Help") > 0		
					.helpText$ = replace_regex$(.line$, "^\s*Help\s+", "", 0)

		    		call write_help_text '.helpText$'
					# Wait for click
					if 	te.skipNextStep = 1
						te.skipNextStep = 0
					else
						demoWaitForInput()
					endif
					
					if index_regex(.helpText$, "^Config")
    					call Draw_config_page
					elsif index_regex(.helpText$, "^MainPage")
						call init_window
					endif
				else
					.table$ = replace_regex$(.line$, "^\s*([^\s]+)\s+(.*)$", "\1", 0)
					.command$ = replace_regex$(.line$, "^\s*([^\s]+)\s+([^\s]+)\s+(.*)$", "\2", 0)
					.command$ = replace_regex$(.command$, "_", " ", 0)
					.remainder$ = replace_regex$(.line$, "^\s*([^\s]+)\s+([^\s]+)\s+(.*)$", "\3", 0)
					call process'.table$''.command$' '.remainder$'
					# Handle page switches and pausing after command, but not for Return and Help
					# Switch page
					if .command$ = "Return"
						if .table$ = "Config"
							call init_window
						elsif .table$ = "MainPage"
							call Draw_config_page
						endif
					elsif .command$ = "Help" or te.skipNextStep = 1
						# Skip
						te.skipNextStep = 0
					else
						# Wait for click
						demoWaitForInput()
					endif
				endif
			endif
		endfor
		select .commandFile
		Remove
		
	endif
	runningCommandMode = 0
endproc

procedure load_local_preferences .dataDir$
	.dataDir$ = replace_regex$(.dataDir$, "[/:\\]$", "", 0)
	# Reset default directory
	defaultDirectory$ = .dataDir$
	
	# Default preferences file
	.localPrefs$ = "'.dataDir$'/'demoAppName$'preferences.tsv"
	
	# Look for a suitable preferences file in the current or parent directory
	if fileReadable("'.dataDir$'/'demoAppName$'preferences.tsv")
		.localPrefs$ = "'.dataDir$'/'demoAppName$'preferences.tsv"
	elsif fileReadable("'.dataDir$'/.tevarc")
		.localPrefs$ = "'.dataDir$'/.tevarc"
	elsif fileReadable("'.dataDir$'/../'demoAppName$'preferences.tsv")
		.localPrefs$ = "'.dataDir$'/../'demoAppName$'preferences.tsv"
	elsif fileReadable("'.dataDir$'/../.tevarc")
		.localPrefs$ = "'.dataDir$'/../.tevarc"
	endif

	if fileReadable(.localPrefs$)
		call write_preferences ""
		call read_preferences '.localPrefs$'
		call switch_speaker_next_button 'config.speakerSerial$'
	endif
endproc

procedure points_to_wc .points
	.mm = .points * 0.3527777778
	.wc = demo Vertical mm to wc... '.mm'
endproc

procedure reset_viewport
	.low = viewportMargin
	.high = 100 - viewportMargin
	demo Select inner viewport... '.low' '.high' '.low' '.high'
	demo Axes... 0 100 0 100
endproc

procedure set_font_size .fontSize
	call reset_viewport
	demo Font size... '.fontSize'
	call reset_viewport
endproc

procedure wipeArea .areaCommand$
	call reset_viewport
	'.areaCommand$'
endproc

procedure adjustFontSizeOnWidth .currentFontSize .maxWidth .text$
	demo 'defaultFont$'
	call set_font_size '.currentFontSize'
	.textWidth = demo Text width (wc)... '.text$'
	while .textWidth > .maxWidth and .currentFontSize > 2
		.currentFontSize -= 0.5
		call set_font_size '.currentFontSize'
		.textWidth = demo Text width (wc)... '.text$'
	endwhile
	.diff = .textWidth - .maxWidth
	.newFontSize = .currentFontSize	
endproc

procedure adjustRotatedFontSizeOnBox .currentFontSize .maxWidth .maxHeight .rotation .text$
	demo 'defaultFont$'
	.radians = .rotation/360 * 2 * pi
	.horWC = demo Horizontal mm to wc... 10.0
	.verWC = demo Vertical mm to wc... 10.0
	if .horWC > 0
		.verCoeff = .verWC / .horWC
	else
		.verCoeff = 1
	endif
	call set_font_size '.currentFontSize'
	.textLength = demo Text width (wc)... '.text$'
	while (.textLength * .verCoeff * sin(.radians) > .maxHeight or .textLength * cos(.radians) > .maxWidth) and .currentFontSize > 2
		.currentFontSize -= 0.5
		call set_font_size '.currentFontSize'
		.textLength = demo Text width (wc)... '.text$'
	endwhile
	.diff = .textLength - .maxHeight
	.newFontSize = .currentFontSize	
endproc

procedure adjustFontSizeOnHeight .currentFontSize .maxHeight
	call points_to_wc '.currentFontSize'
	.lineHeight = points_to_wc.wc
	while .lineHeight > .maxHeight and .currentFontSize > 2
		.currentFontSize -= 0.5
		call points_to_wc '.currentFontSize'
		.lineHeight = points_to_wc.wc
	endwhile
	.diff = .lineHeight - .maxHeight
	.newFontSize = .currentFontSize
endproc

# Load a table with button info etc.
# Load local tables if present. Else load
# build-in scripted tables
procedure loadTable .tableName$
	.table = -1
	.tableFileName$ = .tableName$
	if .tableName$ = "MainPage"
		.tableFileName$ = buttonsFileName$
	endif
	# Search for the table in local, preference, and global directories
	if localTableDir$ <> "" and fileReadable("'localTableDir$'/'.tableFileName$'.Table")
    	.table = nocheck Read from file... 'localTableDir$'/'.tableFileName$'.Table
    	Rename: .tableName$
	elsif fileReadable("'preferencesTableDir$'/'.tableFileName$'.Table")
    	.table = nocheck Read from file... 'preferencesTableDir$'/'.tableFileName$'.Table
    	Rename: .tableName$
	elsif fileReadable("'globaltablelists$'/'.tableFileName$'.Table")
    	.table = nocheck Read from file... 'globaltablelists$'/'.tableFileName$'.Table
    	Rename: .tableName$
	elsif variableExists(.tableName$)
		.tableID = '.tableName$'
		select .tableID
		.table = .tableID
	# Load them from script
	elsif variableExists("procCreate'.tableFileName$'$")
		call Create'.tableFileName$'
    	Rename: .tableName$
		.table = selected("Table")
	else
		call emergency_table_exit '.tableFileName$' cannot be found
	endif
	
	# Check whether this is a real table
	selectObject: .table
	.fullName$ = selected$ ()
	.type$ = extractWord$(.fullName$, "")
	if .type$ <> "Table"
		Remove
		.table = -1
	endif

	if .table <= 0
		call emergency_table_exit '.tableFileName$' corrupted or cannot be found
	endif
endproc

procedure checkTable .tableName$
	.available = 0
	if localTableDir$ <> "" and fileReadable("'localTableDir$'/'.tableName$'.Table")
    	.available = 1
	elsif fileReadable("'preferencesTableDir$'/'.tableName$'.Table")
    	.available = 1
	elsif fileReadable("'globaltablelists$'/'.tableName$'.Table")
    	.available = 1
	# Load them from script
	elsif variableExists("procCreate'.tableName$'$")
    	.available = 1
	else
    	.available = 0
    endif
endproc


procedure check_and_load_language .tableName$ .language$
	.tableFileName$ = .tableName$
	# Handle alternative Main Page layouts
	if .tableName$ = "MainPage"
		call checkTable 'buttonsFileName$'_'.language$'
		if checkTable.available
			.tableFileName$ = buttonsFileName$
		endif
	endif
	
	call checkTable '.tableFileName$'_'.language$'
	.table = -1
	if checkTable.available
		call loadTable '.tableFileName$'_'.language$'
	else
		call loadTable '.tableFileName$'_'te.defaultLanguage$'
	endif
	.table = loadTable.table
endproc

# Create a pop-up window with text from a Text Table
procedure write_text_table .table$
	.xleft = 5
 	.xright = 95
  	.ylow = 20
   	.yhigh = 85
	.lineHeight = 2.5
	.align$ = "Left"
	.tabString$ = "mmmmmm"

	# Get table with text and longest line
	call loadTable '.table$'
	.instructionText = selected()
	.numLines = Get number of rows
	.instructionFontSize = 14
	.referenceText$ = ""
	.maxlength = 0
	.maxLine = 0
	.maxFontSize = 0
	.maxWidth = 0
	.maxHeight = .lineHeight
	.currentHeight = .lineHeight
	.currentColor$= defaultFontColor$
	for .l to .numLines
		select '.instructionText'
		.currentText$ = Get value... '.l' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables '.currentText$'
		.currentText$ = expand_praat_variables.text$

		.font$ = Get value... '.l' font
		.fontSize = Get value... '.l' size
		# Get optional font color
		.currentColor$ = defaultFontColor$
		.colorColumn = Get column index... color
		if .colorColumn > 0
			.currentColor$ = Get value... '.l' color
			if index_regex(.currentColor$, "[^ \-\?]") <= 0
				.currentColor$ = defaultFontColor$
			endif
		endif
		# Get optional line height
		.heightColumn = Get column index... height
		if .heightColumn > 0
			.currentHeight = Get value... '.l' height
		endif
		call set_font_size '.fontSize'
		.textWidth = demo Text width (wc)... '.currentText$'
		if .fontSize > .maxFontSize
			.maxFontSize = .fontSize
		endif
		if .textWidth > .maxWidth
			.maxWidth = .textWidth
			.instructionFontSize = .fontSize
			.maxLine = .l
		endif
		if .currentHeight > .maxHeight
			.maxHeight = .currentHeight
		endif
	endfor
	select '.instructionText'
	.referenceText$ = Get value... '.maxLine' text
	# Handle tabs
	.testTabString$ = left$(.tabString$, ceiling(length(.tabString$)/2))
	.referenceText$ = replace$(.referenceText$, "<tab>", .testTabString$, 0)
	
	.maxLineFont$ = Get value... '.maxLine' font
	.instructionFontSize = Get value... '.maxLine' size
	.lineHeight = .maxHeight
	call set_font_size '.maxFontSize'
	
	# Adapt size of button to length of text
	.maxWidth = (.xright - .xleft) - 4
	.origFontSize = .instructionFontSize
	call adjustFontSizeOnWidth '.instructionFontSize' '.maxWidth' '.referenceText$'
	call adjustFontSizeOnHeight '.maxFontSize' '.lineHeight'
	.instructionFontSize = min(adjustFontSizeOnWidth.newFontSize, adjustFontSizeOnHeight.newFontSize)
	if adjustFontSizeOnWidth.diff > 0
		.xright += adjustFontSizeOnWidth.diff/4
		.xleft -= 3*adjustFontSizeOnWidth.diff/4
	endif
	call set_font_size '.instructionFontSize'
	.fontSizeFactor = .instructionFontSize / .origFontSize
	
	.tabSize = demo Text width (wc)... '.tabString$'
	
	# Adjust width to size of text
	.textWidth = demo Text width (wc)... '.referenceText$' + 4
	.xmid = (.xright + .xleft) / 2
	.xleft = .xmid - .textWidth / 2
	.xright = .xmid + .textWidth / 2

	.numRows = Get number of rows
	# Calculate length from number of lines.
 	.dy = .lineHeight
	.midY = .yhigh - (.yhigh - .ylow)/2
	.yhigh = .midY + (.numRows+1) * .dy / 2
	.ylow = .yhigh - (.numRows+1) * .dy
	.textleft = .xleft + 2
	.textXAnchor = .textleft
	
	demo Line width... 8
 	demo Colour... 'popUp.bordercolor$'
	demo Paint rectangle... 'popUp.backgroundcolor$' '.xleft' '.xright' '.ylow' '.yhigh'
	demo Draw rectangle... '.xleft' '.xright' '.ylow' '.yhigh'
	demo Line width... 'defaultLineWidth'
	demo '.currentColor$'
 	.ytext = .yhigh - 2 - .dy
	for .i to .numRows
		select '.instructionText'
		.font$ = Get value... '.i' font
		.fontSize = Get value... '.i' size
		.font$ = extractWord$(.font$, "")
		.currentHeight = .lineHeight
		if .heightColumn > 0
			.currentHeight = Get value... '.i' height
		endif
		.align$ = "Left"
		.alignColumn = Get column index... align
		if .alignColumn > 0
			.align$ = Get value... '.i' align
		endif
		if index_regex(.align$, "(?icentre)")
			.textXAnchor = .xmid
		elsif index_regex(.align$, "(?iright)")
			.textXAnchor = .xright - 2
		else
			.textXAnchor = .textleft
		endif
		# Scale font
		.fontSize = floor(.fontSize*.fontSizeFactor)
		if .fontSize < 4
			.fontSize = 4
		endif
		.line$ = Get value... '.i' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables "'.line$'"
		.line$ = expand_praat_variables.text$

		# Display text
		if index(.line$, "<tab>") <= 0
			demo Text special... '.textXAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.line$'
		else
			if index_regex(.align$, "(?icentre)")
				.leftAnchor = .textleft
				.currentAnchor = .leftAnchor
				while index_regex(.line$, "\S")
					if index(.line$, "<tab>")
						.tabline$ = left$(.line$, index(.line$, "<tab>") - 1)
						.line$ = right$(.line$, length(.line$) - index(.line$, "<tab>") - 4)
					else
						.tabline$ = .line$
						.line$ = ""
					endif
					.textWidth = demo Text width (wc)... '.tabline$'
					.centerAnchor = .tabSize * ceiling((.currentAnchor + .textWidth/2)/.tabSize)
					demo Text special... '.centerAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.tabline$'
					.currentAnchor += .textWidth
					.currentAnchor = .leftAnchor + .tabSize * ceiling((.currentAnchor - .leftAnchor)/.tabSize)
					# Prevent overlap
					if .currentAnchor < .centerAnchor + .textWidth/2
						.currentAnchor = .centerAnchor + .textWidth/2
					endif
				endwhile
			elsif index_regex(.align$, "(?iright)")
				.currentAnchor = .textXAnchor
				while index_regex(.line$, "\S")
					if rindex(.line$, "<tab>")
						.tabline$ = right$(.line$, length(.line$) - rindex(.line$, "<tab>") - 4)
						.line$ = left$(.line$, rindex(.line$, "<tab>") - 1)
					else
						.tabline$ = .line$
						.line$ = ""
					endif
					.textWidth = demo Text width (wc)... '.tabline$'
					demo Text special... '.currentAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.tabline$'
					.currentAnchor -= .textWidth
					.currentAnchor = .textXAnchor - .tabSize * ceiling((.textXAnchor - .currentAnchor)/.tabSize)
				endwhile
			else
				.currentAnchor = .textXAnchor
				while index_regex(.line$, "\S")
					if index(.line$, "<tab>")
						.tabline$ = left$(.line$, index(.line$, "<tab>") - 1)
						.line$ = right$(.line$, length(.line$) - index(.line$, "<tab>") - 4)
					else
						.tabline$ = .line$
						.line$ = ""
					endif
					.textWidth = demo Text width (wc)... '.tabline$'
					demo Text special... '.currentAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.tabline$'
					.currentAnchor += .textWidth
					.currentAnchor = .textXAnchor + .tabSize * ceiling((.currentAnchor - .textXAnchor)/.tabSize)
				endwhile
			endif
		endif
		.ytext -= .currentHeight
	endfor	
	demoShow()	
	call set_font_size 'defaultFontSize'
	demo 'defaultFontColor$'
	
	select '.instructionText'
	Remove
endproc

# Create a pop-up window with a given text
procedure write_text_popup .font$ .size .text$
	.xleft = 10
 	.xright = 90
  	.ylow = 20
   	.yhigh = 85
	.lineHeight = 3

	# Adapt size of button to length of text
	.maxWidth = (.xright - .xleft) - 4
	call adjustFontSizeOnWidth '.size' '.maxWidth' '.text$'
	call adjustFontSizeOnHeight '.size' '.lineHeight'
	.popupFontSize = min(adjustFontSizeOnWidth.newFontSize, adjustFontSizeOnHeight.newFontSize)
	if adjustFontSizeOnWidth.diff > 0
		.xright += adjustFontSizeOnWidth.diff/4
		.xleft -= 3*adjustFontSizeOnWidth.diff/4
	else
		.xleft = ((.xright + .xleft) - adjustFontSizeOnWidth.textWidth)/2 - 2
		.xright = ((.xright + .xleft) + adjustFontSizeOnWidth.textWidth)/2 + 2
	endif

	.numRows = 1
	# Calculate length from number of lines.
 	.dy = .lineHeight
	.midY = .yhigh - (.yhigh - .ylow)/2
	.yhigh = .midY + (.numRows+1) * .dy / 2
	.ylow = .yhigh - (.numRows+1) * .dy
	.textleft = .xleft + 2
	.xmid = (.textleft + .xright - 2)/2
	
	demo Line width... 8
 	demo Colour... 'popUp.bordercolor$'
	demo Paint rectangle... 'popUp.backgroundcolor$' '.xleft' '.xright' '.ylow' '.yhigh'
	demo Draw rectangle... '.xleft' '.xright' '.ylow' '.yhigh'
	demo Line width... 'defaultLineWidth'
	demo 'defaultFontColor$'
 	.ytext = .yhigh - 2 - .dy
	# Write text
	demo Text special... '.xmid' Centre '.ytext' Bottom '.font$' '.popupFontSize' 0 '.text$'

	demoShow()	
	demo 'defaultFont$'
	call set_font_size 'defaultFontSize'
endproc

procedure text2popuptable .align$ .font$ .size .popUpText$
	if variableExists(.popUpText$)
		.popUpText$ = "'.popUpText$'"
	endif
	if .popUpText$ <> ""
		if startsWith(.popUpText$, """")
			.popUpText$ = right$(.popUpText$, length(.popUpText$) - 1)
			.popUpText$ = left$(.popUpText$, length(.popUpText$) - 1)
		endif
		call points_to_wc '.size'
		.height = points_to_wc.wc
		if index_regex(.popUpText$, "\S") <= 0
			.popUpText$ = "-"
		endif
		.textTable = Create Table with column names... Text 1 align font size height text
		# Set values
		Set string value... 1 align '.align$'
		Set string value... 1 font '.font$'
		Set numeric value... 1 size '.size'
		Set numeric value... 1 height '.height'
		Set string value... 1 text 
		
		while length(.popUpText$) > 0
			select .textTable
			Insert row... 1
			.endOfLine = rindex_regex(.popUpText$, "\\n")
			.leftPart = .endOfLine - 1
			.rightPart = length(.popUpText$) - .endOfLine
			if .endOfLine > 0
				.rightPart -= 1
			endif
			.currentLine$ = right$(.popUpText$, .rightPart)
			if startsWith(.currentLine$, " ")
				.currentLine$ = "\\ " + .currentLine$
			endif
			.popUpText$ = left$(.popUpText$, .leftPart)

			# Set values
			Set string value... 1 align '.align$'
			Set string value... 1 font '.font$'
			Set numeric value... 1 size '.size'
			Set numeric value... 1 height '.height'
			Set string value... 1 text '.currentLine$'
		endwhile
		select .textTable
		.numRows = Get number of rows
		if .numRows > 1
			Remove row... '.numRows'
		endif
	endif
endproc

# Write the background from a Text Table
# The background table can contain embeded commands that are evaluated at runtime: 
# BE CAREFUL WITH THE SECURITY OF THE BACKGROUND TABLE
procedure draw_background .table$
	.xleft = 0
 	.xright = 100
  	.ylow = 0
   	.yhigh = 100
	.lineHeight = 5
	.defaultColour$ = "{0.9,0.9,0.9}"
	.defaultAlign$ = "centre"

	# Get table with text and longest line
	call loadTable '.table$'
	.backgroundText = selected()
	.numLines = Get number of rows
	.backgroundFontSize = 28
	.referenceText$ = ""
	.maxlength = 0
	.maxLine = 0
	.maxFontSize = 0
	.maxWidth = 0
	.textLines = 0
	for .l to .numLines
		select '.backgroundText'
		.currentText$ = Get value... '.l' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables '.currentText$'
		.currentText$ = expand_praat_variables.text$
		
		.font$ = Get value... '.l' font
		.fontSize = Get value... '.l' size
		if .fontSize > .maxFontSize
			.maxFontSize = .fontSize
		endif
		if not startsWith(.font$, "!")
			call set_font_size '.fontSize'
			.textWidth = demo Text width (wc)... '.currentText$'
			if .textWidth > .maxWidth
				.maxWidth = .textWidth
				.backgroundFontSize = .fontSize
				.maxLine = .l
			endif

			.textLines += 1
		endif
	endfor
	if .maxLine > 0
		select '.backgroundText'
		.referenceText$ = Get value... '.maxLine' text
		.maxLineFont$ = Get value... '.maxLine' font
		.backgroundFontSize = Get value... '.maxLine' size
		.backgroundFontColour$ = Get value... '.maxLine' colour
		call set_font_size '.maxFontSize'
	else
		.maxFontSize = .backgroundFontSize
	endif
	
	# Adapt size of button to length of text
	.maxWidth = (.xright - .xleft) - 4
	.origFontSize = .backgroundFontSize
	call adjustFontSizeOnWidth '.backgroundFontSize' '.maxWidth' '.referenceText$'
	.fontSizeFactor = adjustFontSizeOnWidth.newFontSize / .backgroundFontSize
	.backgroundFontSize = adjustFontSizeOnWidth.newFontSize
	call set_font_size '.backgroundFontSize'
	
	call adjustFontSizeOnHeight '.backgroundFontSize' '.lineHeight'
	.lineHeight /= adjustFontSizeOnHeight.newFontSize / .backgroundFontSize
	if adjustFontSizeOnHeight.newFontSize >= .origFontSize and (.textLines+1) * .lineHeight > (.yhigh - .ylow - 4)
		.lineHeight = (.yhigh - .ylow - 4)/(.textLines + 1)
		call adjustFontSizeOnHeight '.maxFontSize' '.lineHeight'
		.fontSizeFactor = adjustFontSizeOnHeight.newFontSize / .backgroundFontSize
	endif

	.numRows = Get number of rows
	# Calculate length from number of lines.
 	.dy = .lineHeight
	.midY = .yhigh - (.yhigh - .ylow)/2
	.yhigh = .midY + (.textLines+1) * .dy / 2
	.ylow = .yhigh - (.textLines+1) * .dy
	.textleft = .xleft + 2
	.textright = .xright - 2
	.textmid = (.xright - .xleft)/2
	
	demo 'defaultFontColor$'
 	.ytext = .yhigh - 2 - .dy
	for .i to .numRows
		select '.backgroundText'
		.font$ = Get value... '.i' font
		.fontSize = Get value... '.i' size
		.fontColour$ = Get value... '.i' colour
		.fontColour$ = replace_regex$(.fontColour$, "^[\- ]$", ".defaultColour$", 1)
		.fontAlign$ = Get value... '.i' align
		.fontAlign$ = replace_regex$(.fontAlign$, "^[\- ]$", ".defaultAlign$", 1)
		.line$ = Get value... '.i' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables '.line$'
		.line$ = expand_praat_variables.text$
				
		 # Scale font
		 .fontSize = floor(.fontSize*.fontSizeFactor)
		if not startsWith(.font$, "!")
			.font$ = extractWord$(.font$, "")

			if .fontAlign$ = "centre"
				.xtext = .textmid
			elsif .fontAlign$ = "right"
				.xtext = .textright
			else
				.xtext = .textleft
			endif
			if .fontSize < 4
				.fontSize = 4
			endif
			# Clean up text
			demo Colour... '.fontColour$'
			demo Text special... '.xtext' '.fontAlign$' '.ytext' Bottom '.font$' '.fontSize' 0 '.line$'
			.ytext -= .dy
		elsif .font$ = "!demo command"
			demo Colour... '.fontColour$'
			.line$ = replace_regex$(.line$, "\{FONTSIZE\$\}", "'.fontSize'", 0)
			.line$ = replace_regex$(.line$, "\{XTEXT\$\}", "'.xtext'", 0)
			.line$ = replace_regex$(.line$, "\{YTEXT\$\}", "'.ytext'", 0)
			.line$ = replace_regex$(.line$, "\{DY\$\}", "'.dy'", 0)
			.line$ = replace_regex$(.line$, "\{[^\}]*\}", "", 0)
			while index(.line$, "[[")
				.nextBracketOpen = index(.line$, "[[")
				.nextBracketOpen += 2
				.nextBracketClose = index(.line$, "]]")
				.bracketLength = .nextBracketClose - .nextBracketOpen
				.result$ = ""
				if .bracketLength > 0
					.expression$ = mid$(.line$, .nextBracketOpen, .bracketLength)
					.expression$ = replace_regex$(.expression$, "\s", "", 0)
					if length(.expression$) > 0
						# Test expression for security, only allow explicitely defined functions
						.allowedStrings$ = "e|pi|not|and|or|div|mod|abs|round|floor|ceiling"
						.allowedStrings$ = .allowedStrings$ + "|sqrt|min|max|imin|imax|sin|cos|tan|arcsin|arccos|arctan|arctan2|sinc|sincpi"
						.allowedStrings$ = .allowedStrings$ + "|exp|ln|log10|log2|sinh|cosh|tanh|arcsinh|arccosh|arctanh"
						.allowedStrings$ = .allowedStrings$ + "|sigmoid|invSigmoid|erf|erfc|randomUniform|randomInteger|randomGauss|randomPoisson"
						.allowedStrings$ = .allowedStrings$ + "|lnGamma|gaussP|gaussQ|invGaussQ|chiSquareP|chiSquareQ"
						.allowedStrings$ = .allowedStrings$ + "|invChiSquareP|invChiSquareQ|studentP|studentQ|invStudentP|invStudentQ"
						.allowedStrings$ = .allowedStrings$ + "|beta|besselI|besselK"
						.testExpression$ = replace_regex$(.expression$, "(^|\W)('.allowedStrings$')(?=$|\W)", "\1\3", 0)
						.testExpression$ = replace_regex$(.testExpression$, "[0-9\.,\-+/*^()<>= ]", "", 0)
						if .testExpression$ = ""
							.calc = '.expression$'
							.result$ = "'.calc'"
						else
							.result$ = "[[ ILLEGAL CONSTRUCT:  '.expression$' ]]"
						endif
					endif
				endif
				
				# Replace expression by result
				.lastLeft = .nextBracketOpen - 3
				.newLine$ = left$(.line$, .lastLeft)  
				.newLine$ =  .newLine$ + .result$
				.numCopy = length(.line$) - .nextBracketClose - 1
				.newLine$ =  .newLine$ + right$(.line$, .numCopy)
				.line$ = .newLine$
			endwhile
			demo '.line$'
		endif
	endfor	
	demo 'defaultFontColor$'
	demoShow()	
	call set_font_size 'defaultFontSize'
	
	select '.backgroundText'
	Remove
endproc

procedure convert_praat_to_utf8 .text$
	.text$ = replace_regex$(.text$, "\\a""", "\xc3\xa4", 0)
	.text$ = replace_regex$(.text$, "\\A""", "\xc3\x84", 0)
	.text$ = replace_regex$(.text$, "\\o""", "\xc3\xb6", 0)
	.text$ = replace_regex$(.text$, "\\O""", "\xc3\x96", 0)
	.text$ = replace_regex$(.text$, "\\u""", "\xc3\xbc", 0)
	.text$ = replace_regex$(.text$, "\\U""", "\xc3\x9c", 0)
	.text$ = replace_regex$(.text$, "\\i""", "\xc3\xaf", 0)
	.text$ = replace_regex$(.text$, "\\I""", "\xc3\x8f", 0)
	.text$ = replace_regex$(.text$, "\\e""", "\xc3\xab", 0)
	.text$ = replace_regex$(.text$, "\\E""", "\xc3\x8b", 0)
	.text$ = replace_regex$(.text$, "\\y""", "\xc3\xbf", 0)
	.text$ = replace_regex$(.text$, "\\e'", "\xc3\xa9", 0)
	.text$ = replace_regex$(.text$, "\\E'", "\xc3\x89", 0)
	.text$ = replace_regex$(.text$, "\\ss", "\xc3\x9f", 0)
endproc

procedure convert_praat_to_html .text$
	.text$ = replace_regex$(.text$, "\\a""", "\&auml;", 0)
	.text$ = replace_regex$(.text$, "\\A""", "\&Auml;", 0)
	.text$ = replace_regex$(.text$, "\\o""", "\&ouml;", 0)
	.text$ = replace_regex$(.text$, "\\O""", "\&Ouml;", 0)
	.text$ = replace_regex$(.text$, "\\u""", "\&uuml;", 0)
	.text$ = replace_regex$(.text$, "\\U""", "\&Uuml;", 0)
	.text$ = replace_regex$(.text$, "\\i""", "\&iuml;", 0)
	.text$ = replace_regex$(.text$, "\\I""", "\&Iuml;", 0)
	.text$ = replace_regex$(.text$, "\\e""", "\&euml;", 0)
	.text$ = replace_regex$(.text$, "\\E""", "\&Euml;", 0)
	.text$ = replace_regex$(.text$, "\\y""", "\&yuml;", 0)
	.text$ = replace_regex$(.text$, "\\Y""", "\&Yuml;", 0)
	.text$ = replace_regex$(.text$, "\\e'", "\&eacute;", 0)
	.text$ = replace_regex$(.text$, "\\E'", "\&acute;", 0)
	.text$ = replace_regex$(.text$, "\\ss", "\&szlig;", 0)
	# Subscript __x_
	.text$ = replace_regex$(.text$, "__([^_]+)_", "<sub>\1</sub>", 0)
	.text$ = replace_regex$(.text$, "_(\w+)", "<sub>\1</sub>", 0)
	.text$ = replace_regex$(.text$, "\\_ ", "_", 0)
	# Supercript ^^x^
	.text$ = replace_regex$(.text$, "\^\^([^\^]+)\^", "<sup>\1</sup>", 0)
	.text$ = replace_regex$(.text$, "\^(\w+)", "<sup>\1</sup>", 0)
	.text$ = replace_regex$(.text$, "\\\^ ", "\^", 0)
	# Italic %%x%
	.text$ = replace_regex$(.text$, "%%([^%]+)%", "<i>\1</i>", 0)
	.text$ = replace_regex$(.text$, "%(\w+)", "<i>\1</i>", 0)
	.text$ = replace_regex$(.text$, "\\% ", "%", 0)
	# Bold ##x#
	.text$ = replace_regex$(.text$, "##([^#]+)#", "<b>\1</b>", 0)
	.text$ = replace_regex$(.text$, "#(\w+)", "<b>\1</b>", 0)
	.text$ = replace_regex$(.text$, "\\# ", "#", 0)
endproc

procedure convert_praat_to_latin1 .text$
	.text$ = replace_regex$(.text$, "\\a""", "\xe4", 0)
	.text$ = replace_regex$(.text$, "\\A""", "\xc4", 0)
	.text$ = replace_regex$(.text$, "\\o""", "\xf6", 0)
	.text$ = replace_regex$(.text$, "\\O""", "\xd6", 0)
	.text$ = replace_regex$(.text$, "\\u""", "\xfc", 0)
	.text$ = replace_regex$(.text$, "\\U""", "\xdc", 0)
	.text$ = replace_regex$(.text$, "\\i""", "\xef", 0)
	.text$ = replace_regex$(.text$, "\\I""", "\xcf", 0)
	.text$ = replace_regex$(.text$, "\\e""", "\xeb", 0)
	.text$ = replace_regex$(.text$, "\\E""", "\xcb", 0)
	.text$ = replace_regex$(.text$, "\\y""", "\xff", 0)
	.text$ = replace_regex$(.text$, "\\Y""", "Y", 0)
	.text$ = replace_regex$(.text$, "\\e'", "\xe9", 0)
	.text$ = replace_regex$(.text$, "\\E'", "\xc9", 0)
	.text$ = replace_regex$(.text$, "\\ss", "\xdf", 0)
	# Subscript __x_
	.text$ = replace_regex$(.text$, "__([^_]+)_", "\1", 0)
	.text$ = replace_regex$(.text$, "_(\w+)", "\1", 0)
	.text$ = replace_regex$(.text$, "\\_ ", "_", 0)
	# Supercript ^^x^
	.text$ = replace_regex$(.text$, "\^\^([^\^]+)\^", "\1", 0)
	.text$ = replace_regex$(.text$, "\^(\w+)", "\1", 0)
	.text$ = replace_regex$(.text$, "\\\^ ", "\^", 0)
	# Italic %%x%
	.text$ = replace_regex$(.text$, "%%([^%]+)%", "\1", 0)
	.text$ = replace_regex$(.text$, "%(\w+)", "\1", 0)
	.text$ = replace_regex$(.text$, "\\% ", "%", 0)
	# Bold ##x#
	.text$ = replace_regex$(.text$, "##([^#]+)#", "\1", 0)
	.text$ = replace_regex$(.text$, "#(\w+)", "\1", 0)
	.text$ = replace_regex$(.text$, "\\# ", "#", 0)
endproc

procedure protect_praat_special_characters .text$
	.text$ = replace_regex$(.text$, "([_%^#])", "\\\1 ", 0)
endproc


# Expand 'variable$' into the value of variable$.
# Eg, 'praatVersion$' becomes 5.1.45 or whatever is the current version
# Single quotes can be protected by \'
procedure expand_praat_variables .text$
	if startsWith(.text$, """") and endsWith(.text$, """")
		.text$ = left$(.text$, length(.text$) - 1)
		.text$ = right$(.text$, length(.text$) - 1)
	endif
	if index(.text$, "'")
		.tempText$ = replace_regex$(.text$, "(^|[^\\])'([\w\$\.]+)'", "\1""+\2+""", 0)
		.tempText$ = replace_regex$(.tempText$, "[\\]'", "'", 0)
		.tempText$ = """"+.tempText$+""""
		# Check whether all the variables actually exist. Ignore any variable that does not exist
		.checkVars$ = .tempText$
		while length(.checkVars$) > 0 and index(.checkVars$, "+")
			.start = index(.checkVars$, "+")
			.checkVars$ = right$(.checkVars$, length(.checkVars$) - .start)
			.end = index(.checkVars$, "+")
			if .end
				.variable$ = left$(.checkVars$, .end - 1)
				if not variableExists(.variable$)
					.tempText$ = replace$(.tempText$, """+'.variable$'+""", "'"+.variable$+"'", 0)
				endif
				.checkVars$ = right$(.checkVars$, length(.checkVars$) - .end)
			else
				.checkVars$ = ""
			endif
		endwhile
		.text$ = '.tempText$'
	endif
endproc

# Extract language specific prompts
procedure getLanguageTexts .table$ .label$
	# Get Cancel text
	call get_feedback_text 'config.language$' Cancel
	call convert_praat_to_latin1 'get_feedback_text.text$'
	.cancelText$ = convert_praat_to_latin1.text$
	# Get continue text
	call get_feedback_text 'config.language$' Continue
	call convert_praat_to_latin1 'get_feedback_text.text$'
	.continueText$ = convert_praat_to_latin1.text$
	# Get button text
	call findLabel '.table$' '.label$'
	.row = findLabel.row
	select Table '.table$'
	.text$ = Get value... '.row' Text
	# Get help text
	call findLabel '.table$' '.label$'
	.row = findLabel.row
	select Table '.table$'
	.helpText$ = Get value... '.row' Helptext
	call convert_praat_to_latin1 '.helpText$'
	.helpText$ = convert_praat_to_latin1.text$
	# Get feedback text
	.inputText$ = Get value... '.row' Text
	call convert_praat_to_latin1 '.inputText$'
	.inputText$ = convert_praat_to_latin1.text$
	.inputText$ = replace_regex$(.inputText$, "\W+", "", 0)
endproc

# Get a time stamp in normalized format
procedure getTimeStamp
	.currentDateTime$ = date$()
	.string$ = replace_regex$(.currentDateTime$, "[A-Z][a-z]+\s+([A-Z][a-z]+)\s+(\d+)\s+(\d+)\W(\d+)\W(\d+)\s+(\d+)$", "\6-\1-\2T\3-\4-\5", 0)
endproc

procedure getButtonText .table$ .label$
	call getLanguageTexts '.table$' '.label$'
	.buttonText$ = replace_regex$(getLanguageTexts.text$, "!\d*!", "", 0)
	call convert_praat_to_utf8 '.buttonText$'
	.utf8$ = convert_praat_to_utf8.text$
	call convert_praat_to_latin1 '.buttonText$'
	.latin1$ = convert_praat_to_latin1.text$
	call convert_praat_to_html '.buttonText$'
	.html$ = convert_praat_to_html.text$
endproc

procedure reset_analysis
	.closed = 0
    if te.openSound > 0
		.closed = 1
        select te.openSound
        # If this file should be saved, do it now!
		if te.saveAudio > 0
			if config.speakerDataTable > 0 and config.speakerData$ <> ""
				select config.speakerDataTable
				Save as tab-separated file... 'config.speakerData$'
			endif
			select te.openSound
			.tmpPartSoundID = Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 true
			Save as WAV file... 'te.currentFileName$'
			select te.openSound
		endif
		if te.pitch > 0
			plus te.pitch
		endif
		if pitchTierName$ != ""
			plus PitchTier 'pitchTierName$'
		endif
		if intensityName$ != ""
			plus Intensity 'intensityName$'
		endif
 		if te.harmonicity > 0
			plus te.harmonicity
		endif
 		if gneName$ <> ""
			plus Sound 'gneName$'
		endif
 		if ltasName$ <> ""
			plus Ltas 'ltasName$'
		endif
 		if pointProcessName$ <> ""
			plus PointProcess 'pointProcessName$'
		endif
		if te.voicingTextGrid > 0
			plus 'te.voicingTextGrid'
		endif
 		if te.spectrogram > 0
			plus 'te.spectrogram'
			plus 'te.formant'
		endif
		Remove
		
		te.openSound = 0
		te.pitch = 0
		te.spectrogram = 0
		te.formant = 0
		te.harmonicity = 0
		te.gneSound = 0
		selectedEndTime = 0
		selectedStartTime = 0
		currentStartTime = 0
		currentEndTime = 0
		
        recordedSound$ = ""
        currentSoundName$ = ""
		call get_speakerInfo 0
        
		pitchName$ = ""
		pitchTierName$ = ""
		ltasName$ = ""
		intensityName$ = ""
		spectrogramName$ = ""
		formantName$ = ""
		pointProcessName$ = ""
		te.voicingTextGrid = -1
		gneName$ = ""
		harmonicityName$ = ""
		te.currentFileName$ = ""
		
		maxTimeIntensity = 0
		
		call reset_sourcemanipulations
    endif
endproc

# A table error, can be insiduously caused by an outdate preferences file!
procedure emergency_table_exit .message$
	# If you come here as a user, your preferences file is borked
	if preferencesAppFile$ <> "" and fileReadable(preferencesAppFile$)
		deleteFile(preferencesAppFile$)
	endif
	# Put out message
	call get_feedback_text 'config.language$' Cancel
	call convert_praat_to_latin1 'get_feedback_text.text$'
	.cancelText$ = convert_praat_to_latin1.text$
	beginPause: "Fatal Error"
	comment: .message$
	endPause: .cancelText$, 1
	exit '.message$'
endproc

procedure loadLanguageTable .tableName$ .language$
	call loadTable '.tableName$'
    .table$ = selected$("Table")
    .tableID = selected("Table")
    Append column... Text
    Append column... Key
    Append column... Helptext
    .numLabels = Get number of rows
    call check_and_load_language '.tableName$' '.language$'
    .tableLang$ = selected$("Table")
    .tableLangID = selected("Table")
    for .row to .numLabels
		select .tableID
		.label$ = Get value... '.row' Label
        call findLabel '.tableLang$' '.label$'
	    if findLabel.row > 0
            select .tableLangID
        	.valueText$ = Get value... 'findLabel.row' Text
        	.valueKey$ = Get value... 'findLabel.row' Key
        	.valueHelp$ = Get value... 'findLabel.row' Helptext
        	select .tableID
        	Set string value... '.row' Text '.valueText$'
        	Set string value... '.row' Key '.valueKey$'
        	Set string value... '.row' Helptext '.valueHelp$'
		elsif index(.label$, "_")
			# Load alternative language table
			.startChar = rindex(.label$, "_")
			.otherLanguage$ = right$(.label$, length(.label$) - .startChar)
			call check_and_load_language '.tableName$' '.otherLanguage$'
    		.otherLang$ = selected$("Table")
    		.otherLangID = selected("Table")
        	call findLabel '.otherLang$' '.label$'
	    	if findLabel.row > 0
            	select .otherLangID
        		.valueText$ = Get value... 'findLabel.row' Text
        		.valueKey$ = Get value... 'findLabel.row' Key
        		.valueHelp$ = Get value... 'findLabel.row' Helptext
        		select .tableID
        		Set string value... '.row' Text '.valueText$'
        		Set string value... '.row' Key '.valueKey$'
        		Set string value... '.row' Helptext '.valueHelp$'
        	else
            	call emergency_table_exit Cannot find Label: '.otherLang$' '.label$'
        	endif
			select .otherLangID
			Remove
        else
            call emergency_table_exit Cannot find Label: '.tableLang$' '.label$'
        endif
    endfor
    select .tableLangID
    Remove
endproc

# Emulate mkdir -p, use /
procedure extend_directory_path .root$ .path$
	.root$ = replace_regex$(.root$, """", "", 0)
	.path$ = replace_regex$(.path$, """", "", 0)

	if startsWith(.path$, .root$)
		.path$ = replace_regex$(.path$, "^'.root$'/*", "", 0)
	endif

	while .path$ <> "" and index_regex(.path$, "[^ \t\n\-\?\!]")
		.nextDir$ = replace_regex$(.path$, "^([^/]*)(/(.*)|$)", "\1", 0)
		.path$ = replace_regex$(.path$, "^([^/]*)(/(.*)|$)", "\3", 0)
		# Disallow things containing only NOPE characters
		if .nextDir$ <> "" and index_regex(.nextDir$, "[^ \t\n\-\?\!]")
			.root$ = .root$+"/"+.nextDir$
			createDirectory(.root$)
		endif
	endwhile
endproc

# Read a list of audio files and concatenate them
procedure readAudioList .filename$
	.start = index(.filename$, "{")
	.end = index(.filename$, "}")
	.length = length(.filename$)
	.prev$ = left$(.filename$, .start - 1)
	.post$ = right$(.filename$, .length - .end)
	.inside$ = mid$(.filename$, .start + 1, .end - .start - 1)
	.n = 0
	while length(.inside$) > 0
		.stretch = index(.inside$, ",") - 1
		if .stretch < 0
			.stretch = length(.inside$)
		endif
		.mid$ = left$(.inside$, .stretch)
		if length(.inside$) - .stretch - 1 > 0
			.inside$ = right$(.inside$, length(.inside$) - .stretch - 1)
		else
			.inside$ = ""
		endif
		# Read audio file
		if index_regex(.prev$+.mid$+.post$, "(?i\.(wav|au|snd|aif[fc]?|flac|mp3))$") > 0 and fileReadable(.prev$+.mid$+.post$)
			.n += 1
			.tmp = Read from file: .prev$+.mid$+.post$
			# Check result and clean up if wrong
			if .tmp = undefined or .tmp <= 0
				.audio[.n] = -1
				.n -= 1
			else
				.fullName$ = selected$ ()
				.type$ = extractWord$(.fullName$, "")
				if .type$ <> "Sound"
					Remove
					.audio[.n] = -1
					.n -= 1
				else
					selectObject: .tmp
					.audio[.n] = Resample: te.defaultSampleFreq, 50
					selectObject: .tmp
					Remove
				endif
			endif
		
		endif
	endwhile
	selectObject: .audio[1]
	for .i from 2 to .n
		plusObject: .audio[.i]
	endfor
	.audioID = Concatenate
	selectObject: .audio[1]
	for .i from 2 to .n
		plusObject: .audio[.i]
	endfor
	Remove
	selectObject: .audioID
endproc

# Safely read an audio file
procedure readAudio .filename$
	.audioID = -1
	# Check existence of (first) audiofile
	.testFile$ = replace_regex$(.filename$, "\{([^,]+)[^\}]*\}", "\1", 0)

	if .filename$ <> "" and fileReadable(.testFile$) and index_regex(.testFile$, "(?i\.(wav|au|snd|aif[fc]?|flac|mp3))$") > 0
		# Do some magic, concatenate audio inside {} brackects
		if index(.filename$, "{")
			call readAudioList '.filename$'
			.audioID = readAudioList.audioID
		else
			.audioID = nocheck Read from file... '.filename$'
		endif
		if .audioID = undefined or .audioID <= 0
			.audioID = -1
		else
			.fullName$ = selected$ ()
			.type$ = extractWord$(.fullName$, "")
			if .type$ <> "Sound"
				Remove
				.audioID = -1
			endif
		endif
		
		# No audio file has been read
		if .audioID <= 0
			call get_feedback_text 'config.language$' BrokenTable
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.brokenTableText$ = convert_praat_to_latin1.text$
			call getLanguageTexts Config SpeakerData
			.inputText$ = getLanguageTexts.inputText$
			beginPause(".inputText$")
				comment("'getLanguageTexts.helpText$': '.brokenTableText$'")
			clicked = endPause ("'getLanguageTexts.continueText$'", 1, 1)
		endif
	elsif .filename$ <> "" and index_regex(.filename$, "[^0-9]") <= 0
		select '.filename$'
		.fullName$ = selected$ ()
		.type$ = extractWord$(.fullName$, "")
		.name$ = extractWord$(.fullName$, " ")
		if .type$ = "Sound"
			.audioID = Copy: .name$
		endif
	endif
endproc

# Safely read a table
procedure readTable .filename$
	.tableID = -1
	if .filename$ <> "" and fileReadable(.filename$) and index_regex(.filename$, "(?i\.(tsv|table|csv))$") > 0
		.tableID = nocheck Read from file... '.filename$'
		if .tableID = undefined or .tableID <= 0
			.tableID = -1
		else
			.fullName$ = selected$ ()
			.type$ = extractWord$(.fullName$, "")
			if .type$ <> "Table"
				Remove
				.tableID = -1
			endif
		endif
		
		# No table has been read
		if .tableID <= 0
			call get_feedback_text 'config.language$' BrokenTable
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.brokenTableText$ = convert_praat_to_latin1.text$
			call getLanguageTexts Config SpeakerData
			.inputText$ = getLanguageTexts.inputText$
			beginPause(".inputText$")
				comment("'getLanguageTexts.helpText$': '.brokenTableText$'")
			clicked = endPause ("'getLanguageTexts.continueText$'", 1, 1)
		endif
	endif
endproc

########################################################################
# 
# Convert signal source
# 
########################################################################
procedure reset_sourcemanipulations
	if te.originalRecording > 0
		select te.originalRecording
		Remove
		te.originalRecording = 0
	endif
	if te.source > 0
		select te.source
		Remove
		te.source = 0
	endif
	config.source$ = "Original"
endproc

procedure copy_source_into_target .prosody .articulationrate
	if te.originalRecording <= 0
		select te.openSound
		te.originalRecording = Copy: "OriginalSound"
	endif
	.originalRecording = te.originalRecording
	te.originalRecording = -1
	.source = te.source
	te.source = -1
	# Reset everything and load the file again
	@getOpenFile: "'.originalRecording'"
	te.originalRecording = .originalRecording
	te.source = .source
	@resynthesize_with_TE_source: .prosody, .articulationrate, te.openSound, te.source
	select te.openSound
	Remove
	te.openSound = resynthesize_with_TE_source.newSound
	config.source$ = "Change"
endproc
