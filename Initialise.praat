#
# TEanalysis 0.1
# 
# Intializing Praat script
#
#     TEanalysis: Initialize.praat defines and sets the global variables
#     and loads general application specific code 
#     
#     Copyright (C) 2010  R.J.J.H. van Son and the Netherlands Cancer Institute
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

procedure global_initialization
	# Information for logging
	currentDate$ = date$()
	dateYear$ = right$(currentDate$, length(currentDate$) - rindex(currentDate$, " "))
	call getTimeStamp
	logtimeStamp$ = getTimeStamp.string$
	config.currentLogDirectory$ = ""
	
	# Define canvas
	viewportMargin = 5
	wipeFeedbackArea$ = "demo Paint rectangle... White 0 80 13 20"
	# Note: These are relative to the INNER viewport
	headerXL = 5
	headerXR = 85
	headerYL = 95
	headerYH = 100
	wipeHeaderArea$ = "demo Paint rectangle... White 'headerXL' 'headerXR' 'headerYL' 'headerYH'"
	
	canvasXL = 5
	canvasXR = 85
	canvasYL = 25
	canvasYH = 95
	canvasCorrection = 0
	wipeCanvasArea$ = "demo Paint rectangle... White 'canvasXL' 'canvasXR' 'canvasYL' 'canvasYH'"
	
	# Pop-Up window colors
	popUp.bordercolor$ = "{0.5,0.5,1}"
	popUp.backgroundcolor$ = "{0.9,0.9,1}"
	
	# (Re-)Initialize parameters
	runningCommandMode = 0
	alertText$ = ""
	buttonsFilePath$ = "Data/MainPage.Table"
	buttonsLangFilePath$ = left$(buttonsFilePath$, rindex(buttonsFilePath$, ".Table")-1)
	configFilePath$ = "Data/Config.Table"
	configLangFilePath$ = left$(configFilePath$, rindex(configFilePath$, ".Table")-1)
	feedbackFilePath$ = "Data/Feedback_"
	instructionTable$ = "Instruction"
	buttons$ = ""
	config$ = ""
	config.input$ = "Microphone"
	config.showBackground = 1
	config.recordingTime$ = "4"
	config.speakerData$ = ""
	config.speakerDataTable = -1
	printerName$ = "BHK301"
	printerPresets$ = "Standard"
	
	pathologicalType = 0
	pathologicalTypeText$ = "- Pathological type = 'pathologicalType'"
	pathologicalAutoType = Create TableOfReal... PathAutoType 1 1
	Set row label (index)... 1 Median
	Set value... 1 1 -1
	
	# What signal to draw
	buttons.draw$ = "Sound"
	pitchName$ = ""
	pitchTierName$ = ""
	ltasName$ = ""
	intensityName$ = ""
	spectrogramName$ = ""
	harmonicityName$ = ""
	gneName$ = ""
	pointProcessName$ = ""
	
	# Global time
	currentStartTime = 0
	currentEndTime = 0
	selectedStartTime = currentStartTime
	selectedEndTime = currentEndTime
	minPitch = 0
	minHarmonicity = 0
	minIntensity = 0
	maxPitch = 0
	maxIntensity = 0
	maxTimeIntensity = 0
	maxHarmonicity = 0
	maxTimeHarmonicity = 0
	
	config.language$ = "EN"
	logging = 0
	# preferencesAppDir$ must have been defined, which happens in the App file
	preferencesAppFile$ = preferencesAppDir$+"/'demoAppName$'rc.txt"
	preferencesTableDir$ = "'preferencesAppDir$'/Data"
	config.openLog$ = "'preferencesAppDir$'/log"
	preferencesScriptsDir$ = "'preferencesAppDir$'/scripts"
	defaultFontSize = 12
	defaultFont$ = "Helvetica"
	defaultLineWidth = 1
	currentSoundName$ = ""
	speakerID$ = ""
	speakerInfo$ = ""
	speakerComments$ = ""
	noDrawingOrWriting = 0
	
	globaltablelists$ = ""
	if unix
		globaltablelists$ = "/etc/praat/'demoAppName$'/Data"	
	elsif macintosh
		globaltablelists$ = "/Library/Praat/'demoAppName$'/Data"
	elsif windows
		globaltablelists$ = "C:/Documents and Settings/All Users/Application Data/praat/'demoAppName$'/Data"
	endif
	
	#
	drawSound = 1
	drawPitch = 0
	drawPitchTier = 0
	drawIntensity = 0
endproc

procedure global_setup
	# Set up directories if they do not exist already
	call set_up_directories
	# Get saved preferences
	call read_preferences ""
	# Set inital language
	call set_language 'config.language$'
endproc

# Initialize
call global_initialization
call global_setup

# Draw inital window
call init_window

###############################################################
#
# Miscelaneous supporting code
#
###############################################################

###############################################################
#
# Obligatory procedures
#
###############################################################

# Initialize demo Window
procedure init_window
    demo Erase all
	demo Line width... 'defaultLineWidth'
	demo 'defaultFont$'
	call set_font_size 'defaultFontSize'
	demo Black
	call reset_viewport
	# Draw background
	if config.showBackground
		call draw_background Background
	endif
    # Define buttons in a table
    call init_buttons
	# Handle window title
	.typeRoman$ = "-"
	if pathologicalType = 1
		.typeRoman$ = "I"
	elsif pathologicalType = 2
		.typeRoman$ = "II"
	elsif pathologicalType = 3
		.typeRoman$ = "III"
	elsif pathologicalType = 4
		.typeRoman$ = "IV"
	endif
	call findLabel 'buttons$' !PathologicalType
	.row = findLabel.row
	select Table 'buttons$'
	pathologicalTypeText$ = Get value... '.row' Text
	pathologicalTypeText$ = "'pathologicalTypeText$' '.typeRoman$'"
	call autoSetPathType
	if pathologicalType > 0
		call write_header_text Blue 'speakerID$' 'pathologicalTypeText$'
	endif
	# Draw something
	call draw_signal
	# Set draw button
	call set_draw_signal_button
	# Sound recording level
	call draw_recording_level
	# Logging light
	call paint_logging_light
endproc

procedure print_window
    demo Erase all
	demo Line width... 'defaultLineWidth'
	demo 'defaultFont$'
	call set_font_size 'defaultFontSize'
	demo Black
	call reset_viewport
	call autoSetPathType
	# Draw something
	call draw_signal
	# Sound recording level
	call draw_recording_level
endproc

# Make sure all Preferences directories are available
procedure set_up_directories
	createDirectory(preferencesDirectory$)	
	createDirectory(preferencesAppDir$)
	createDirectory(config.openLog$)
	createDirectory(preferencesScriptsDir$)
	
endproc

# 
# Retrieve and store setting between sessions
#
procedure read_preferences .preferencesFile$
	if not fileReadable(.preferencesFile$)
		.preferencesFile$ = preferencesAppFile$
	endif
	if fileReadable(.preferencesFile$)
		Read from file... '.preferencesFile$'
		.preferenceTable$ = selected$("Table")
		.numPrefKeys = Get number of rows

		for .row to .numPrefKeys
			.variableName$ = Get value... '.row' Key
			if variableExists(.variableName$)
				.variableValue = Get value... '.row' Value
				if .variableValue <> undefined
					'.variableName$' = '.variableValue'
				endif
			elsif variableExists(.variableName$+"$")
				.variableValue$ = Get value... '.row' Value
				.variableName$ = .variableName$+"$"
				'.variableName$' = "'.variableValue$'"
			endif
		endfor
		
		select Table '.preferenceTable$'
		Remove
	endif
endproc

procedure write_preferences .preferencesFile$
	Create Table with column names... Preferences 0 Key Value
	if index_regex(.preferencesFile$, "[a-zA-Z0-9]") <= 0
		.preferencesFile$ = preferencesAppFile$
	endif
	.row = 0
	
	for .tableNum from 1 to 2
		if .tableNum = 1
			.table$ = "Config"
		elsif .tableNum = 2
			.table$ = "MainPage"
		endif
		.varPrefix$ = replace_regex$(.table$, "^(.)", "\l\1", 0)

		select Table '.table$'
		.numTableRows = Get number of rows
		for .tablerow to .numTableRows
			select Table '.table$'
			.label$ = Get value... '.tablerow' Label
			.variableName$ = .varPrefix$+"."+(replace_regex$(.label$, "^(.)", "\l\1", 0))
			.keyName$ = .variableName$
			.value$ = ""
			if variableExists(.variableName$)
				.value = '.variableName$'
				.value$ = "'.value'"
			elsif variableExists(.variableName$ + "$")
				.variableName$ = .variableName$ + "$"
				.value$ = '.variableName$'
			elsif index(.variableName$, "_") > 0
				.variableName$ = left$(.variableName$, rindex(.variableName$, "_") - 1)	
				.keyName$ = .variableName$
				select Table Preferences
				.prefRow = Search column... Key '.keyName$'
				if .prefRow <= 0
					if variableExists(.variableName$)
					   .value = '.variableName$'
					   .value$ = "'.value'"
					elsif variableExists(.variableName$ + "$")
					   .variableName$ = .variableName$ + "$"
					   .value$ = '.variableName$'
					endif
				endif
			endif

			if .value$ <> ""
				select Table Preferences
				Append row
				.row += 1
				Set string value... '.row' Key '.keyName$'
				Set string value... '.row' Value '.value$'
			endif
		endfor
	endfor
	
	select Table Preferences
	Write to table file... '.preferencesFile$'
	Remove

endproc

procedure get_nextSpeaker .speakerID$
	call get_speakerInfo '.speakerID$'
	.row = get_speakerInfo.row
	call ReadSpeakerData 'config.speakerData$'
	if config.speakerDataTable > 0
		select config.speakerDataTable
		.numRows = Get number of rows
		.row += 1
		if .row <= 0
			.row = .numRows
		elsif .row > .numRows
			.row = 1
		endif
		.speakerID$ = Get value... '.row' ID
	endif
	call  get_speakerInfo '.speakerID$'
   .id$ = get_speakerInfo.id$
   .text$ = get_speakerInfo.text$
   .description$ = get_speakerInfo.description$
   .audio$ = get_speakerInfo.audio$
   .ast$ = get_speakerInfo.ast$
endproc

procedure get_previousSpeaker .speakerID$
	call get_speakerInfo '.speakerID$'
	.row = get_speakerInfo.row
	call ReadSpeakerData 'config.speakerData$'
	if config.speakerDataTable > 0
		select config.speakerDataTable
		.numRows = Get number of rows
		.row -= 1
		if .row <= 0
			.row = .numRows
		elsif .row > .numRows
			.row = 1
		endif
		.speakerID$ = Get value... '.row' ID
	endif
	call  get_speakerInfo '.speakerID$'
   .id$ = get_speakerInfo.id$
   .text$ = get_speakerInfo.text$
   .description$ = get_speakerInfo.description$
   .audio$ = get_speakerInfo.audio$
   .ast$ = get_speakerInfo.ast$
endproc

procedure get_speakerInfo .speakerID$
	.id$ = .speakerID$
	.text$ = speakerInfo$
	.description$ = speakerComments$
	.audio$ = te.currentFileName$
	.ast$ = "'pathologicalType'"
	.row = 0
	if .speakerID$ <> "" and config.speakerData$ <> "" and fileReadable (config.speakerData$)
		call ReadSpeakerData 'config.speakerData$'
		if config.speakerDataTable > 0
			select config.speakerDataTable
			.numRows = Get number of rows
			.numEntries = .numRows
			.numCols = Get number of columns
			.row = Search column... ID '.speakerID$'
			if .row <= 0 and index_regex(.speakerID$, "^\d+$") > 0
				.row = '.speakerID$'
				if .row < 0 or .row > .numRows
					.row = 0
				endif
			endif
			if .row > 0
				.id$ = Get value... '.row' ID
				.text$ = Get value... '.row' Text
				.description$ = Get value... '.row' Description
				.audio$ = Get value... '.row' Audio
				if .audio$ = "-"
					.audio$ = ""
				elsif .audio$ <> ""
					# Root of audio files is in config.speakerData$, if not rooted elsewhere
					#if index_regex(.audio$, "^(?i[\\/:~]|[a-z]:)") <= 0
					#	.audio$ = replace_regex$(config.speakerData$, "[^\\/:]+$", "'.audio$'", 0)
					#endif
				endif
				.ast$ = Get value... '.row' AST
				if index_regex(.ast$, "\d") <= 0
					.ast$ = "0"
				endif
			endif
		endif
	endif
endproc

# Non-interactive procedure to load a specific speaker from Speaker Data
procedure loadSpeaker speakerID$
	call get_speakerInfo 'speakerID$'
	speakerID$ = get_speakerInfo.id$
	speakerInfo$ = get_speakerInfo.text$
	speakerComments$ = get_speakerInfo.description$
	te.currentFileName$ = get_speakerInfo.audio$
	pathologicalType = 'get_speakerInfo.ast$'
	call getOpenFile 'te.currentFileName$'
	Rename... Speech
	.duration = Get total duration
	call post_processing_sound
endproc

# Read a text file with speaker data with format
# ID: text
# Text without empty lines
# <empty line>
#
# If you read a table (tsv/Table) it should have the columns
# ID Text Description Audio
#
procedure ReadSpeakerData .speakerData$
	if .speakerData$ <> "" and fileReadable(.speakerData$) and (.speakerData$ <> config.speakerData$ or config.speakerDataTable <= 0)
		if index_regex(.speakerData$, "\.(?itsv|table)")
			config.speakerDataTable = Read from file... '.speakerData$'
			# Complete columns
			.col = Get column index... ID
			if .col <= 0
				Append column... ID
			endif
			.col = Get column index... Text
			if .col <= 0
				Append column... Text
			endif
			.col = Get column index... Description
			if .col <= 0
				Append column... Description
			endif
			.col = Get column index... Audio
			if .col <= 0
				Append column... Audio
			endif
			.col = Get column index... AST
			if .col <= 0
				Append column... AST
			endif
		else
			# Reset SpeakerData table
			config.speakerData$ = .speakerData$
			if  config.speakerDataTable > 0
				select config.speakerDataTable
				Remove
				config.speakerDataTable = -1
			endif
			# Create new SpeakerData table
			.rawStrings = Read Strings from raw text file... '.speakerData$'
			.numStrings = Get number of strings
			if .numStrings > 0
				config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST
				.currentText$ = ""
				.currentDescription$ = ""
				for .row to .numStrings
					select .rawStrings
					.currentString$ = Get string... '.row'
					if index_regex(.currentString$, "\S")
						if .currentText$ = ""
							.currentText$ = .currentString$
						else
							.currentDescription$ = .currentDescription$ + .currentString$ + newline$
						endif
					else
						if .currentText$ <> ""
							.id$ = replace_regex$(.currentText$, "^\W*([\w\- ]+).*$", "\1", 0)
							# Get AST
							.ast$ = "-"
							if index_regex(.currentText$, "Type: IV($|[^[IV])")
								.ast$ = "4"
							elsif index_regex(.currentText$, "Type: III($|[^[IV])")
								.ast$ = "3"
							elsif index_regex(.currentText$, "Type: II($|[^[IV])")
								.ast$ = "2"
							elsif index_regex(.currentText$, "Type: I($|[^[IV])")
								.ast$ = "1"
							elsif index_regex(.currentText$, "Type: \d+")
								.ast$ = replace_regex$(.currentText$, ".*Type: (\d+).*$", "\1", 0)
							endif
							select config.speakerDataTable
							Append row
							.numRows = Get number of rows
							Set string value... '.numRows' ID '.id$'
							Set string value... '.numRows' Text '.currentText$'
							Set string value... '.numRows' Description '.currentDescription$'
							Set string value... '.numRows' Audio -
							Set string value... '.numRows' AST '.ast$'
							.id$ = ""
							.currentText$ = ""
							.currentDescription$ = ""
							.ast$ = "-"
						endif
					endif
				endfor
				if .currentText$ <> ""
					.id$ = replace_regex$(.currentText$, "^\W*([\w\- ]+).*$", "\1", 0)
					select config.speakerDataTable
					Append row
					.numRows = Get number of rows
					Set string value... '.numRows' ID '.id$'
					Set string value... '.numRows' Text '.currentText$'
					Set string value... '.numRows' Description '.currentDescription$'
					Set string value... '.numRows' Audio -
					if pathologicalType > 0
						Set string value... '.numRows' AST 'pathologicalType'
					else
						Set string value... '.numRows' AST -
					endif
					.id$ = ""
					.currentText$ = ""
					.currentDescription$ = ""
				endif
				# Remove empty first row
				select config.speakerDataTable
				Remove row... 1
			endif
			select .rawStrings
			Remove
		endif
	endif
endproc

procedure load_audio_file .fileName$
	if .fileName$ <> "" and fileReadable(.fileName$)
		call getOpenFile '.fileName$'
		Rename... Speech
		call post_processing_sound
		# Draw
		call init_window
	endif
endproc

procedure WriteSpeakerData
	call get_speakerInfo 'speakerID$'
	# Table does not exist
	if config.speakerDataTable <= 0
		config.speakerData$ = ""
		config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST
		select config.speakerDataTable
		.row = Get number of rows
	elsif get_speakerInfo.row > 0
		.row = get_speakerInfo.row
	else
		select config.speakerDataTable
		Append row
		.row = Get number of rows
	endif
	select config.speakerDataTable
	Set string value... '.row' ID 'speakerID$'
	Set string value... '.row' Text 'speakerInfo$'
	Set string value... '.row' Description 'speakerComments$'
	Set string value... '.row' Audio 'te.currentFileName$'
	if pathologicalType > 0
		Set string value... '.row' AST 'pathologicalType'
	else
		Set string value... '.row' AST -
	endif
	
endproc

procedure autoSetPathType
	if pathologicalType <= 0
		select pathologicalAutoType
		.rowIndex = Get row index... Median
		Set value... '.rowIndex' 1 -1
		.numOfTypes = Get number of rows
		Sort by column... 1 0
		.offset = 0
		for .i from 1 to .numOfTypes
			.value = Get value... '.i' 1
			if .value <= 0
				.offset += 1
				.numOfTypes -= 1
			endif
		endfor
		if .numOfTypes > 0
			if floor(.numOfTypes / 2) = ceiling(.numOfTypes / 2 )
				.medianType = floor(.numOfTypes / 2 ) + 1
				.lower = Get value... '.medianType' 1
				.medianType += .offset
				.upper = Get value... '.medianType' 1
				.pathologicalAutoType = (.lower + .upper)/2
			else
				.medianType = ceiling(.numOfTypes / 2 ) + .offset
				.pathologicalAutoType = Get value... '.medianType' 1
			endif
			pathologicalTypeText$ = replace_regex$(pathologicalTypeText$, "[\d\-\.]+\s*$", "'.pathologicalAutoType'", 0)
		endif
	endif
	if not noDrawingOrWriting
		call set_window_title 'buttons$' 'speakerID$' 'pathologicalTypeText$'
	endif
endproc

procedure setPathType .pathType
	pathologicalType = .pathType
	call get_speakerInfo 'speakerID$'
	if get_speakerInfo.row > 0
		if pathologicalType > 0
			Set string value... 'get_speakerInfo.row' AST 'pathologicalType'
		else
			Set string value... 'get_speakerInfo.row' AST -
		endif
	endif
endproc
