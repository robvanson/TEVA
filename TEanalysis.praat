#
# TEanalysis 0.1
# 
# Master Praat script
#
#     TEanalysis: main.praat is the master GUI of TEanalysis
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

demoAppName$ = "Teanalysis"

# Define variable that might be reset in Initialise*.praat
if not variableExists("build_SHA$")
	build_SHA$ = "-"
endif

# These are simply "useful" defaults
localTableDir$ = "Data"
buttonsTableName$ = "MainPage"
configTableName$ = "Config"
feedbackTablePrefix$ = "Feedback"
feedbackTableName$ = ""
buttons$ = ""
config$ = ""
recordedSound$ = ""
alertText$ = ""
config.input$ = "Microphone"
te.recordingTimeStamp$ = ""
te.currentFileName$ = ""
te.openSound = 0
te.spectrogram = 0
te.harmonicity = 0
te.formant = 0

# Pop-Up window and other colors
popUp.bordercolor$ = "{0.5,0.5,1}"
popUp.backgroundcolor$ = "{0.9,0.9,1}"

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
sampleFrequency = 44100
config.frequency = 5000
config.showFormants = 1
config.speakerSerial = 0

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
defaultLineWidth = 1
recordingLightX = 0
recordingLightY = 100
printerName$ = "BHK301"
printerPresets$ = "Standard"

##########################################################
# 
# This is the actual code run at startup
# 
##########################################################

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
# Set up system and load preferences
include Initialise.praat
# Include the main page buttons and procedures
include MainPage.praat
# Include the configuration page buttons and procedures
include Config.praat
# Include tables in script format
include CreateTables.praat

# Start instruction loop
while demoWaitForInput()
	.label$ = ""
	.clickX = -1
	.clickY = -1
	.pressed$ = ""
	if demoClicked()
		.clickX = demoX()
		.clickY = demoY()
		call buttonClicked 'buttons$' '.clickX' '.clickY'
		.label$ = buttonClicked.label$
	elsif demoKeyPressed()
		.pressed$ = demoKey$()
		call keyPressed 'buttons$' '.pressed$'
		.label$ = keyPressed.label$
	endif
	
	# You cannot select a text field
	if startsWith(.label$, "$")
		.label$ = ""
	endif
	
	# Do things
	if .label$ != ""
		# Push button down
		call Draw_button 'buttons$' '.label$' 1
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
	call log_command 'buttons$' '.label$' '.clickX' '.clickY' '.pressed$'
	
	# Process the command
	if .label$ <> "" and not startsWith(.label$,"!")
		.label$ = replace$(.label$, "_", " ", 0)
		call process'buttons$''.label$' '.clickX' '.clickY' '.pressed$'
	elsif .label$ <> "" and startsWith(.label$,"!")
		.label$ = right$(.label$, length(.label$)-1)
		.label$ = replace$(.label$, "_", " ", 0)
		call process'buttons$''.label$' '.clickX' '.clickY' '.pressed$'
	endif
endproc

# Intialize buttons
procedure init_buttons
	# Set Speaker color
	call switch_speaker_next_button 'config.speakerSerial'

	call Draw_all_buttons 'buttons$'
endproc

# Draw all buttons
procedure Draw_all_buttons .table$
	.varPrefix$ = replace_regex$(.table$, "^(.)", "\l\1", 0)
	select Table '.table$'
	.numRows = Get number of rows
	
	for .row to .numRows
		.label$ = Get value... '.row' Label
        if not startsWith(.label$, "!") 
			.pressed = 0
			# Determine the "pressed" state of a button
			# A variable with the same name as the button will act as a
			# "pressed state"
			.variableName$ = .varPrefix$+"."+(replace_regex$(.label$, "^(.)", "\l\1", 0))
			# Simple boolean vairables
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
		exit Button Table '.table$' does not have a row with label '.label$'
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
	.topBackGroundColorDown$ = "{0.89,0.89,0.94}"
	.topLineColorDown$ = "{0.3,0.3,0.3}"
	.topLineWidthDown = 1.5
	.topBackGroundColorDisabled$ = "{0.85,0.85,0.85}"
	.topLineColorDisabled$ = "{0.70,0.70,0.70}"
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
    .buttonColor$ = Get value... '.row' Color
    .buttonDraw$ = Get value... '.row' Draw
    .buttonKey$ = Get value... '.row' Key

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
		.eraseLeft = .shiftLeftX - 0.01
		.eraseRight = .shiftRightX + 0.01
		.eraseBottom = .shiftLowY - 0.01
		.eraseTop = .shiftHighY + 0.01
		demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
	endif
	
    # If label starts with "$", it is a text field. Then do not draw the button
	if not startsWith(.label$, "$")
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
	.newText$ = replace_regex$(.buttonText$, "['.buttonKey$']", "#%&", 1)
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
    demo Text special... '.centerX' Centre '.anchorY' '.verticalAlignment$' 'defaultFont$' '.buttonFontSize' '.rotation' '.newText$'
	demoShow()

	# Reset
	call set_font_size 'defaultFontSize'
    demo Black
    demo Line width... 'defaultLineWidth'
    
    label NOBUTTON
endproc

procedure set_window_title .table$ .addedText$
    select Table '.table$'
    .row = Search column... Label !WindowTitle
	if .row < 1
		exit Button Table '.table$' does not have a row with label !WindowTitle
	endif
	.windowText$ = Get value... '.row' Text
	call convert_praat_to_latin1 '.windowText$'
	.windowText$ = convert_praat_to_latin1.text$

    demoWindowTitle(.windowText$+ " " +.addedText$)
endproc

# Handle language setting 
procedure processLanguageCodes .table$ .label$
	.table$ = "Config"
    call Draw_button 'config$' Language_'config.language$' 0
    call Draw_button 'config$' '.label$' 2
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
    if buttons$ <> ""
        select Table 'buttons$'
        Remove
		.redraw_config = 1
    endif
    if config$ <> ""
        select Table 'config$'
        Remove
		.redraw_config = 1
    endif
    
    # Set language
    config.language$ = .lang$
    
    # Load buttons tables
	call loadTable 'buttonsTableName$'
    buttons$ = selected$("Table")
    Append column... Text
    Append column... Key
    Append column... Helptext
    .numLabels = Get number of rows
	call loadTable 'buttonsTableName$'_'config.language$'
    .buttonsLang$ = selected$("Table")
    for .row to .numLabels
		select Table 'buttons$'
		.label$ = Get value... '.row' Label
        call findLabel '.buttonsLang$' '.label$'
	    if findLabel.row > 0
            select Table '.buttonsLang$'
        	.valueText$ = Get value... 'findLabel.row' Text
        	.valueKey$ = Get value... 'findLabel.row' Key
        	.valueHelp$ = Get value... 'findLabel.row' Helptext
        	select Table 'buttons$'
        	Set string value... '.row' Text '.valueText$'
        	Set string value... '.row' Key '.valueKey$'
        	Set string value... '.row' Helptext '.valueHelp$'
		elsif index(.label$, "_")
			# Load alternative language table
			.startChar = rindex(.label$, "_")
			.otherLanguage$ = right$(.label$, length(.label$) - .startChar)
			call loadTable 'buttonsTableName$'_'.otherLanguage$'
    		.otherbuttonsLang$ = selected$("Table")
        	call findLabel '.otherbuttonsLang$' '.label$'
	    	if findLabel.row > 0
            	select Table '.buttonsLang$'
        		.valueText$ = Get value... 'findLabel.row' Text
        		.valueKey$ = Get value... 'findLabel.row' Key
        		.valueHelp$ = Get value... 'findLabel.row' Helptext
        		select Table 'buttons$'
        		Set string value... '.row' Text '.valueText$'
        		Set string value... '.row' Key '.valueKey$'
        		Set string value... '.row' Helptext '.valueHelp$'
        	else
            	exit Cannot find Label: '.otherbuttonsLang$' '.label$'
        	endif
			select Table '.otherbuttonsLang$'
			Remove
        else
            exit Cannot find Label: '.buttonsLang$' '.label$'
        endif
    endfor
    select Table '.buttonsLang$'
    Remove
    
    # Load configuration table
	call loadTable 'configTableName$'
    config$ = selected$("Table")
    Append column... Text
    Append column... Key
    Append column... Helptext
    .numLabels = Get number of rows
    call loadTable 'configTableName$'_'config.language$'
    .configLang$ = selected$("Table")
    for .row to .numLabels
		select Table 'config$'
		.label$ = Get value... '.row' Label
        call findLabel '.configLang$' '.label$'
	    if findLabel.row > 0
            select Table '.configLang$'
        	.valueText$ = Get value... 'findLabel.row' Text
        	.valueKey$ = Get value... 'findLabel.row' Key
        	.valueHelp$ = Get value... 'findLabel.row' Helptext
        	select Table 'config$'
        	Set string value... '.row' Text '.valueText$'
        	Set string value... '.row' Key '.valueKey$'
        	Set string value... '.row' Helptext '.valueHelp$'
		elsif index(.label$, "_")
			.startChar = rindex(.label$, "_")
			.otherLanguage$ = right$(.label$, length(.label$) - .startChar)
			.otherLabel$ = left$(.label$, .startChar)
			call loadTable 'configTableName$'_'.otherLanguage$'
    		.otherconfigLang$ = selected$("Table")
        	call findLabel '.otherconfigLang$' '.label$'
	    	if findLabel.row > 0
            	select Table '.otherconfigLang$'
        		.valueText$ = Get value... 'findLabel.row' Text
        		.valueKey$ = Get value... 'findLabel.row' Key
        		.valueHelp$ = Get value... 'findLabel.row' Helptext
        		select Table 'config$'
        		Set string value... '.row' Text '.valueText$'
        		Set string value... '.row' Key '.valueKey$'
        		Set string value... '.row' Helptext '.valueHelp$'
        	else
            	exit Cannot find Label: '.otherconfigLang$' '.label$'
        	endif
			select Table '.otherconfigLang$'
			Remove
        else
            exit Cannot find Label: '.configLang$' '.label$'
        endif
    endfor
    select Table '.configLang$'
    Remove

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
		exit "'.label$'" is not a key in '.table$'
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
procedure buttonClicked table$ .x .y
	.label$ = ""
	select Table 'table$'
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
    if .sound
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
	call reset_analysis
	
	# There is a very nasty delay before the first recording starts, do a dummy record
	if not variableExists("recordingInitialized")
    	noprogress nowarn Record Sound (fixed time)... 'config.input$' 0.99 1 44100 0.1
		Remove
		recordingInitialized = 1
	endif
	# Display a recording light
    demo Paint circle... Red 'recordingLightX' 'recordingLightY' 2
    demoShow()
	# In Windows interaction between demoWaitForInput and Record Sound blocks drawing the feedback
	if windows and endsWith(build_SHA$, " XP")
		# Display a pause window to flush the graphics buffer
		beginPause ("DESTROY WINDOW ")
			comment (" ")
		endPause ("DESTROY WINDOW ", 1, 1)
    	demo Paint circle... Red 'recordingLightX' 'recordingLightY' 2
    	demoShow()
	endif
    noprogress nowarn Record Sound (fixed time)... 'config.input$' 0.99 1 44100 'config.recordingTime$'
	# Keep track of current sound
	call getTimeStamp
	te.recordingTimeStamp$ = getTimeStamp.string$
	te.currentFileName$ = ""
	
    demo Paint circle... White 'recordingLightX' 'recordingLightY'  2.5
    call wipeArea 'wipeFeedbackArea$'

	call draw_recording_level

	# Process sound
    Rename... Tmp
    Resample... 'sampleFrequency' 50
    Rename... Speech
	te.openSound = selected("Sound")
    recordedSound$ = selected$("Sound")
    select Sound Tmp
    Remove
    select te.openSound
	currentStartTime = 0
	currentEndTime = Get total duration
	
	# Cut out real sound from silences/noise
	call sound_detection 'recordedSound$' 'soundMargin'
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
	call write_preferences ""
	call regular_save_backup_file
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
    demoWindowTitle("TEanalysis: Change settings")
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
		    call buttonClicked 'config$' '.clickX' '.clickY'
		    .label$ = buttonClicked.label$
	    elsif demoKeyPressed()
		    .pressed$ = demoKey$()
		    call keyPressed 'config$' '.pressed$'
		    .label$ = keyPressed.label$
	    endif

		# You cannot select a text field
		if startsWith(.label$, "$")
			.label$ = ""
		endif
		
	    # Do things
	    if .label$ != ""
		    # Handle push button in process_config
			call Draw_button 'config$' '.label$' 1
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
    call Draw_all_buttons 'config$'
	call set_window_title 'config$'  
    # Set correct buttons (alert)
	call setConfigMainPage
endproc

# Do what is asked
procedure process_config .label$ .clickX .clickY .pressed$
	# Log raw commands to replay in file
	call log_command 'config$' '.label$' '.clickX' '.clickY' '.pressed$'
	
	if .label$ <> "" and not startsWith(.label$,"!")
		.label$ = replace$(.label$, "_", " ", 0)
		call process'config$''.label$' '.clickX' '.clickY' '.pressed$'
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
	demo Line width... '.lineWidth'
	demo Arrow size... '.lineWidth'
 	demo Colour... 'popUp.bordercolor$'
	demo Paint rectangle... 'popUp.backgroundcolor$' '.htXleft' '.htXright' '.htYlow' '.htYhigh'
	demo Draw rectangle... '.htXleft' '.htXright' '.htYlow' '.htYhigh'
	demo Draw arrow... '.xstart' '.ystart' '.xend' '.yend'
	demo Line width... 'defaultLineWidth'
	demo Arrow size... 1
	demo Black
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
	if fileReadable(.openDialogue$)
		.filename$ = .openDialogue$
	else
		call convert_praat_to_latin1 '.openDialogue$'
		.openDialogue$ = convert_praat_to_latin1.text$
		.filename$ = chooseReadFile$ (.openDialogue$)
	endif
	if .filename$ <> "" and fileReadable(.filename$) and index_regex(.filename$, "(?i\.(txt|tsv|table)$)")
		config.speakerData$ = .filename$
		.dataDir$ = replace_regex$(config.speakerData$, "(^|[/:\\])[^/:\\]+$", "", 0)
		call load_local_preferences '.dataDir$'
		if config.speakerDataTable > 0
			call regular_save_backup_file
			select config.speakerDataTable
			Remove
		endif
		config.speakerDataTable = -1
		speakerID$ = ""
		.filename$ = ""
	endif
	
	# Reset all internal structures
	call reset_analysis

	# Get the file
	if .filename$ <> "" and fileReadable(.filename$)
		Read from file... '.filename$'
		call log_command "# Open File: '.filename$'"
		# Keep track of current sound
		te.currentFileName$ = .filename$

		# Get only the filename
		.startName = rindex_regex(.filename$, "[/\\:]") + 1
		.nameLength = rindex(.filename$, ".") - .startName
		currentSoundName$ = mid$(.filename$, .startName, .nameLength) 
	else
		Create Sound from formula... Speech Mono 0 1 44100 0
	endif
	te.openSound = selected("Sound")
	recordedSound$ = selected$("Sound")
	# Keep track of current sound
	te.recordingTimeStamp$ = ""
	currentStartTime = 0
	currentEndTime = Get total duration
	# Reset selected window
	selectedStartTime = currentStartTime
	selectedEndTime = currentEndTime
endproc

procedure readFromFile .filename$
	if .filename$ <> "" and fileReadable(.filename$)
		Read from file... '.filename$'
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
					if 	skipNextStep = 1
						skipNextStep = 0
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
					elsif .command$ = "Help" or skipNextStep = 1
						# Skip
						skipNextStep = 0
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
	if fileReadable("'.dataDir$'/.tevarc") or fileReadable("'.dataDir$'/TEVApreferences.tsv")
		.localPrefs$ = "'.dataDir$'/TEVApreferences.tsv"
		if fileReadable("'.dataDir$'/.tevarc")
			.localPrefs$ = "'.dataDir$'/.tevarc"
		endif
		call write_preferences ""
		call read_preferences '.localPrefs$'
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
	# Search for the table in local, preference, and global directories
	if fileReadable("'localTableDir$'/'.tableName$'.Table")
    	Read from file... 'localTableDir$'/'.tableName$'.Table
	elsif fileReadable("'preferencesTableDir$'/'.tableName$'.Table")
    	Read from file... 'preferencesTableDir$'/'.tableName$'.Table
	elsif fileReadable("'globaltablelists$'/'.tableName$'.Table")
    	Read from file... 'globaltablelists$'/'.tableName$'.Table
	elsif variableExists(.tableName$)
		.tableID = '.tableName$'
		select .tableID
	# Load them from script
	else
		call Create'.tableName$'
	endif
endproc

# Create a pop-up window with text from a Text Table
procedure write_text_table .table$
	.xleft = 10
 	.xright = 90
  	.ylow = 20
   	.yhigh = 85
	.lineHeight = 2.5

	# Get table with text and longest line
	call loadTable '.table$'
	.instructionText = selected()
	.numLines = Get number of rows
	.instructionFontSize = 14
	.referenceText$ = ""
	.maxlenght = 0
	.maxLine = 0
	.maxFontSize = 0
	.maxWidth = 0
	for .l to .numLines
		select '.instructionText'
		.currentText$ = Get value... '.l' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables '.currentText$'
		.currentText$ = expand_praat_variables.text$

		.font$ = Get value... '.l' font
		.fontSize = Get value... '.l' size
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
	endfor
	select '.instructionText'
	.referenceText$ = Get value... '.maxLine' text
	.maxLineFont$ = Get value... '.maxLine' font
	.instructionFontSize = Get value... '.maxLine' size
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

	.numRows = Get number of rows
	# Calculate length from number of lines.
 	.dy = .lineHeight
	.midY = .yhigh - (.yhigh - .ylow)/2
	.yhigh = .midY + (.numRows+1) * .dy / 2
	.ylow = .yhigh - (.numRows+1) * .dy
	.textleft = .xleft + 2
	
	demo Line width... 8
 	demo Colour... 'popUp.bordercolor$'
	demo Paint rectangle... 'popUp.backgroundcolor$' '.xleft' '.xright' '.ylow' '.yhigh'
	demo Draw rectangle... '.xleft' '.xright' '.ylow' '.yhigh'
	demo Line width... 'defaultLineWidth'
	demo Black
 	.ytext = .yhigh - 2 - .dy
	for .i to .numRows
		select '.instructionText'
		.font$ = Get value... '.i' font
		.fontSize = Get value... '.i' size
		.font$ = extractWord$(.font$, "")
		# Scale font
		.fontSize = floor(.fontSize*.fontSizeFactor)
		if .fontSize < 4
			.fontSize = 4
		endif
		.line$ = Get value... '.i' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables '.line$'
		.line$ = expand_praat_variables.text$
		
		# Display text
		demo Text special... '.textleft' Left '.ytext' Bottom '.font$' '.fontSize' 0 '.line$'
		.ytext -= .dy
	endfor	
	demoShow()	
	call set_font_size 'defaultFontSize'
	
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
	demo Black
 	.ytext = .yhigh - 2 - .dy
	# Write text
	demo Text special... '.xmid' Centre '.ytext' Bottom '.font$' '.popupFontSize' 0 '.text$'

	demoShow()	
	demo 'defaultFont$'
	call set_font_size 'defaultFontSize'
endproc

procedure text2popuptable .font$ .size .variableName$
	if variableExists(.variableName$)
		.variableName$ = '.variableName$'
		.currentText$ = '.variableName$'
		if index_regex(.currentText$, "\S") <= 0
			.currentText$ = "-"
		endif
		.textTable = Create Table with column names... Text 1 font size text
		# Set values
		Set string value... 1 font '.font$'
		Set numeric value... 1 size '.size'
		Set string value... 1 text  
		
		while length(.currentText$) > 0
			select .textTable
			Insert row... 1
			.endOfLine = rindex_regex(.currentText$, "\n")
			.leftPart = .endOfLine - 1
			.rightPart = length(.currentText$) - .endOfLine
			.currentLine$ = right$(.currentText$, .rightPart)
			.currentText$ = left$(.currentText$, .leftPart)
			# Set values
			Set string value... 1 font '.font$'
			Set numeric value... 1 size '.size'
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
	.maxlenght = 0
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
	
	demo Black
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
	demo Black
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
    if te.openSound > 0
        select te.openSound
		if pitchName$ != ""
			plus Pitch 'pitchName$'
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
		if voicingTextGrid > 0
			plus 'voicingTextGrid'
		endif
 		if te.spectrogram > 0
			plus 'te.spectrogram'
			plus 'te.formant'
		endif
		Remove
		te.openSound = 0
		te.spectrogram = 0
		te.formant = 0
		te.harmonicity = 0
		
        recordedSound$ = ""
		pitchName$ = ""
		pitchTierName$ = ""
		ltasName$ = ""
		intensityName$ = ""
		spectrogramName$ = ""
		formantName$ = ""
		pointProcessName$ = ""
		voicingTextGrid = -1
		gneName$ = ""
		harmonicityName$ = ""
		
		maxTimeIntensity = 0
		maxTimeHarmonicity = 0
    endif
endproc
