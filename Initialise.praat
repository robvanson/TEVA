#
# TEanalysis 0.1
# 
# Intializing Praat script
#
#     TEanalysis: Initialize.praat defines and sets the global variables
#     and loads general application specific code 
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
	canvasLeftCorrection = 0.5
	canvasRightCorrection = -1.5
	wipeCanvasArea$ = "demo Paint rectangle... White 'canvasXL' 'canvasXR' 'canvasYL' 'canvasYH'"
	
	# Pop-Up window and other colors
	popUp.bordercolor$ = "{0.5,0.5,1}"
	popUp.backgroundcolor$ = "{0.9,0.9,1}"
	
	# Voicing markers
	te.voicingcolor$ = "{0.3, 0.3, 0.9}"
	
	# (Re-)Initialize parameters
	runningCommandMode = 0
	alertText$ = ""
	buttonsFilePath$ = "Data/MainPage.Table"
	buttonsLangFilePath$ = left$(buttonsFilePath$, rindex(buttonsFilePath$, ".Table")-1)
	configFilePath$ = "Data/Config.Table"
	configLangFilePath$ = left$(configFilePath$, rindex(configFilePath$, ".Table")-1)
	feedbackFilePath$ = "Data/Feedback_"
	instructionTable$ = "Instruction"
	te.buttons$ = ""
	te.config$ = ""
	config.input$ = "Microphone"
	config.showBackground = 1
	config.recordingTime$ = "4"
	config.speakerData$ = ""
	config.speakerDataBackup$ = ""
	config.createBackup = 0
	config.speakerDataTable = -1
	config.speakerSerial = 0
	config.autoSelect = 0
	config.showFormants = 1
	config.muteOutput = 0
	config.selectionWindow = 1.75
	config.ratingForm$ = "A"
	config.vasScaleTicks = 0
	
	pathologicalType = 0
	pathologicalTypeText$ = "- Pathological type = 'pathologicalType'"
	predictedPathType = 0
	# Table for CART
	pathologicalParameters = Create TableOfReal... PathParam 1 1
	Set row label (index)... 1 AST
	Set value... 1 1 -1
	pathologicalAutoType = Create TableOfReal... PathAutoType 1 1
	Set row label (index)... 1 Median
	Set value... 1 1 -1
	
	# What signal to draw
	mainPage.draw$ = "Sound"
	pitchName$ = ""
	pitchTierName$ = ""
	ltasName$ = ""
	intensityName$ = ""
	spectrogramName$ = ""
	harmonicityName$ = ""
	gneName$ = ""
	pointProcessName$ = ""
	voicingTextGrid = -1
	
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
	preferencesAppFile$ = preferencesAppDir$+"/'demoAppName$'rc.tsv"
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
	noDrawingSelection = 0
	selectionIsDrawn = 0

	
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
	te.useFullASTselection = 0
endproc

procedure global_setup
	# Set up directories if they do not exist already
	call set_up_directories
	# Get saved preferences
	call read_preferences ""
	# Set inital language
	call set_language 'config.language$'
	# Set Speaker color
	call switch_speaker_next_button 'config.speakerSerial'
endproc

procedure switch_speaker_next_button .set_nextItem
	# Speaker & !NextItem -> !Speaker & NextItem
	if .set_nextItem
		call hide_button 'te.buttons$' Speaker
		call unhide_button 'te.buttons$' !NextItem
	# !Speaker & Next -> Speaker & !NextItem
	elsif not .set_nextItem
		call unhide_button 'te.buttons$' !Speaker
		call hide_button 'te.buttons$' NextItem
	endif
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
	# Set canvas (if available)
	call findLabel 'te.buttons$' !CANVAS
	.row = findLabel.row
	if .row > 0
		select Table 'te.buttons$'
		canvasXL = Get value... '.row' LeftX
		canvasXR = Get value... '.row' RightX
		canvasYL = Get value... '.row' LowY
		canvasYH = Get value... '.row' HighY
		wipeCanvasArea$ = "demo Paint rectangle... White 'canvasXL' 'canvasXR' 'canvasYL' 'canvasYH'"

	endif
	
	# Draw background
	if config.showBackground
		call draw_background Background
	endif
    # Define buttons in a table
    call init_buttons
	# Handle window title
	.typeRoman$ = "-"
	if pathologicalType > 0
		call toRoman pathologicalType
		.typeRoman$ = toRoman.roman$
	endif
	call findLabel 'te.buttons$' !PathologicalType
	.row = findLabel.row
	select Table 'te.buttons$'
	pathologicalTypeText$ = Get value... '.row' Text
	pathologicalTypeText$ = "'pathologicalTypeText$' '.typeRoman$'"
	# If present, get other path type entries
	otherASTentries$ = ""
	call get_speakerInfo 'speakerID$'
	if get_speakerInfo.row > 0
		select config.speakerDataTable
		.iColl = 2
		.column = Get column index... AST'.iColl'
		while .column > 0
			.pathType$ = Get value... get_speakerInfo.row AST'.iColl'
			if index_regex(.pathType$, "[^0-9]") <= 0
				call toRoman '.pathType$'
				.pathType$ = toRoman.roman$
			endif
			otherASTentries$ = otherASTentries$+" "+.pathType$
			# Next round
			.iColl += 1
			.column = Get column index... AST'.iColl'
		endwhile
	endif
	# Set automatic Pathological type and write header
	call autoSetPathType
	if pathologicalType > 0 or otherASTentries$ <> ""
		call get_speakerInfo 'speakerID$'
		.speakerNumber = get_speakerInfo.row
		if .speakerNumber > 0
			.numText$ = "['.speakerNumber']"
		else
			.numText$ = ""
		endif
		call protect_praat_special_characters 'speakerID$'
		if pathologicalType > 0
			call write_header_text Blue '.numText$' 'protect_praat_special_characters.text$' 'pathologicalTypeText$' 'otherASTentries$'
		else
			call write_header_text Blue '.numText$' 'protect_praat_special_characters.text$' - 'otherASTentries$'
		endif
	endif
	# Set draw button
	call set_draw_signal_button
	# Sound recording level
	call draw_recording_level
	# Logging light
	call paint_logging_light
	# Draw something (do it last so the axes do not get erased)
	selectionIsDrawn = 0
	call draw_signal
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
			.label$ = replace_regex$(.label$, "^[!]", "", 0)
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
   .startTime = get_speakerInfo.startTime
   .endTime = get_speakerInfo.endTime
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
   .startTime = get_speakerInfo.startTime
   .endTime = get_speakerInfo.endTime
endproc

procedure get_speakerInfo .speakerID$
	.id$ = .speakerID$
	.text$ = speakerInfo$
	.description$ = speakerComments$
	.audio$ = te.currentFileName$
	.ast$ = "'pathologicalType'"
	.row = 0
	.startTime = -1
	.endTime = -1
	
	if .speakerID$ <> "" and config.speakerData$ <> "" and fileReadable (config.speakerData$)
		call ReadSpeakerData 'config.speakerData$'
	endif
	
	if .speakerID$ <> ""
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
			elsif .row <= 0 and index_regex(.speakerID$, "[^\d]") > 0
				# Do a limited match
				for .r to .numRows
					if .row <= 0
						select config.speakerDataTable
						.currentKey$ = Get value... '.r' ID
						if startsWith(.currentKey$, .speakerID$) > 0
							.row = .r
						endif
					endif
				endfor
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
					if index_regex(.audio$, "^(?i[\\/:~]|[a-z]:)") <= 0
						.audio$ = replace_regex$(config.speakerData$, "[^\\/:]+$", "'.audio$'", 0)
					endif
				endif
				.ast$ = Get value... '.row' AST
				if index_regex(.ast$, "\d") <= 0
					if index_regex(.text$, "Type[:=\s]+IV($|[^[IV])")
						.ast$ = "4"
					elsif index_regex(.text$, "Type[:=\s]+III($|[^[IV])")
						.ast$ = "3"
					elsif index_regex(.text$, "Type[:=\s]+II($|[^[IV])")
						.ast$ = "2"
					elsif index_regex(.text$, "Type[:=\s]+I($|[^[IV])")
						.ast$ = "1"
					elsif index_regex(.text$, "Type[:=\s]+\d+")
						.ast$ = replace_regex$(.text$, ".*Type[:=\s]+(\d+).*$", "\1", 0)
					else
						.ast$ = "0"
					endif
				endif
				.startTime = Get value... '.row' StartTime
				.endTime = Get value... '.row' EndTime
				if .startTime = undefined or .endTime = undefined
					.startTime = -1
					.endTime = -1
				endif
			endif
		endif
	endif
endproc

procedure delete_speakerData .speakerID$
	call get_nextSpeaker '.speakerID$'
	.newID$ = get_nextSpeaker.id$
	call get_speakerInfo '.speakerID$'
	.deleteRow = get_speakerInfo.row
	if .deleteRow > 0
		select config.speakerDataTable
		Remove row... '.deleteRow'
		.speakerID$ = .newID$
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
	# Create a new table or read the file
	if .speakerData$ <> "" and fileReadable(.speakerData$) and config.speakerDataTable <= 0
		# New SpeakerData, forget old backup
		config.speakerDataBackup$ = ""
		config.createBackup = 1
		
		# Set local preferences
		.dataDir$ = replace_regex$(config.speakerData$, "(^|[/:\\])[^/:\\]+$", "", 0)
		call load_local_preferences '.dataDir$'
		# Find the table
		if index_regex(.speakerData$, "\.(?itsv|table)")
			.numSelected = numberOfSelected()
			if .numSelected > 0
				.currentSelected = selected()
			else
				.currentSelected = -1
			endif
			config.speakerDataTable = nocheck Read from file... '.speakerData$'
			if config.speakerDataTable <= 0 or .currentSelected = config.speakerDataTable
				config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime
				call get_feedback_text 'config.language$' BrokenTable
				call convert_praat_to_latin1 'get_feedback_text.text$'
				.brokenTableText$ = convert_praat_to_latin1.text$
				call getLanguageTexts Config SpeakerData
				.inputText$ = getLanguageTexts.inputText$
				beginPause(".inputText$")
					comment("'getLanguageTexts.helpText$': '.brokenTableText$'")
				clicked = endPause ("'getLanguageTexts.continueText$'", 1, 1)
			else
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
				.col = Get column index... StartTime
				if .col <= 0
					Append column... StartTime
				endif
				.col = Get column index... EndTime
				if .col <= 0
					Append column... EndTime
				endif
			endif
			# Set local preferences
			.dataDir$ = replace_regex$(config.speakerData$, "(^|[/:\\])[^/:\\]+$", "", 0)
			call load_local_preferences '.dataDir$'
		else
			# Reset SpeakerData table
			if  config.speakerDataTable > 0
				select config.speakerDataTable
				Remove
				config.speakerDataTable = -1
				speakerID$ = ""
			endif
			config.speakerData$ = .speakerData$
			# Create new SpeakerData table
			.rawStrings = Read Strings from raw text file... '.speakerData$'
			.numStrings = Get number of strings
			if .numStrings > 0
				config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime
				.currentText$ = ""
				.currentDescription$ = ""

				for .row to .numStrings
					select .rawStrings
					.currentString$ = Get string... '.row'
					if index_regex(.currentString$, "\S")
						if .currentText$ = ""
							.currentText$ = .currentString$
						else
							# Use fake newlines
							.currentDescription$ = .currentDescription$ + .currentString$ + "\n"
						endif
					else
						.currentDescription$ = replace_regex$(.currentDescription$, "\\n$", "", 0)
						if .currentText$ <> ""
							.id$ = replace_regex$(.currentText$, "^\W*([\w\- ]+).*$", "\1", 0)
							# Get AST
							.ast$ = "-"
							if index_regex(.currentText$, "Type[:=\s]+IV($|[^[IV])")
								.ast$ = "4"
							elsif index_regex(.currentText$, "Type[:=\s]+III($|[^[IV])")
								.ast$ = "3"
							elsif index_regex(.currentText$, "Type[:=\s]+II($|[^[IV])")
								.ast$ = "2"
							elsif index_regex(.currentText$, "Type[:=\s]+I($|[^[IV])")
								.ast$ = "1"
							elsif index_regex(.currentText$, "Type[:=\s]+\d+")
								.ast$ = replace_regex$(.currentText$, ".*Type[:=\s]+(\d+).*$", "\1", 0)
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
		recordedSound$ = selected$("Sound")
		te.openSound = selected("Sound")
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
		config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime
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
	.speakerDataDir$ = replace_regex$(config.speakerData$, "[^\\/:]+$", "", 0)
	.audio$ = te.currentFileName$
	# Catch Windows \ path separator
	if windows
		.speakerDataDir$ = replace_regex$(.speakerDataDir$, "\\", "\\\\", 0)
	endif
	if index_regex(.audio$, "'.speakerDataDir$'") > 0
		.audio$ = replace_regex$(.audio$, "'.speakerDataDir$'", "", 0)
	endif
	Set string value... '.row' Audio '.audio$'
	if pathologicalType > 0
		Set string value... '.row' AST 'pathologicalType'
	else
		Set string value... '.row' AST -
	endif
	
	if config.speakerData$ <> "" and fileReadable(config.speakerData$)
		if config.createBackup
			config.createBackup = 0
			config.speakerDataBackup$ = replace_regex$(config.speakerData$, "(\.\w+)$", "~\1", 0)

			# The backup file is a Table, so give it the correct extension
			if index_regex(config.speakerDataBackup$, "\.(?itsv|table)") <= 0
				config.speakerDataBackup$ = replace_regex$(config.speakerDataBackup$, "\.\w+$", ".tsv", 0)
			endif
			.tmpTable = Read from file... 'config.speakerData$'
			Save as tab-separated file... 'config.speakerDataBackup$'
			select .tmpTable
			Remove
		endif
		select config.speakerDataTable
		Save as tab-separated file... 'config.speakerData$'
	endif
endproc

procedure autoSetPathType
	if pathologicalType = undefined or pathologicalType <= 0
		.pathologicalAutoType = predictedPathType
		if .pathologicalAutoType <> undefined and .pathologicalAutoType > 0
			pathologicalTypeText$ = replace_regex$(pathologicalTypeText$, "[\d\-\.]+\s*$", "'.pathologicalAutoType'", 0)
		endif
	endif
	if not noDrawingOrWriting
		call get_speakerInfo 'speakerID$'
		.speakerNumber = get_speakerInfo.row
		if .speakerNumber > 0
			.numText$ = "['.speakerNumber']"
		else
			.numText$ = ""
		endif
		call set_window_title 'te.buttons$' '.numText$' 'speakerID$' 'pathologicalTypeText$'
	endif
endproc

procedure setPathType .pathType
	pathologicalType = .pathType
	call get_speakerInfo 'speakerID$'
	if get_speakerInfo.row > 0
		if pathologicalType > 0
			Set string value... 'get_speakerInfo.row' AST 'pathologicalType'
			Set string value... 'get_speakerInfo.row' StartTime 'selectedStartTime:4'
			Set string value... 'get_speakerInfo.row' EndTime 'selectedEndTime:4'
		else
			Set string value... 'get_speakerInfo.row' AST -
			Set string value... 'get_speakerInfo.row' StartTime -
			Set string value... 'get_speakerInfo.row' EndTime -
		endif
		call WriteSpeakerData
	endif
endproc

procedure setPathParameter .table .paramName$ .valueText$
	select .table
	.rowIndex = Get row index... '.paramName$'
	if .rowIndex <= 0
		Insert row (index)... 1
		.rowIndex = 1
		Set row label (index)... 1 '.paramName$'
	endif
	if index(.valueText$, "undefined") <= 0
		Set value... '.rowIndex' 1 '.valueText$'
	endif
endproc

procedure getPathParameter .table .paramName$
	.value = undefined
	select .table
	.rowIndex = Get row index... '.paramName$'
	if .rowIndex > 0
		.value = Get value... '.rowIndex' 1
	endif
endproc

procedure toRoman .arabic
	.roman$ = ""
	while .arabic > 0
		if .arabic >= 1000
			.roman$ = .roman$+"M"
			.arabic -= 1000
		elsif .arabic >= 500
			.roman$ = .roman$+"D"
			.arabic -= 500
		elsif .arabic >= 100
			.roman$ = .roman$+"C"
			.arabic -= 100
		elsif .arabic >= 50
			.roman$ = .roman$+"L"
			.arabic -= 50
		elsif .arabic >= 10
			.roman$ = .roman$+"X"
			.arabic -= 10
		elsif .arabic >= 5
			.roman$ = .roman$+"V"
			.arabic -= 5
		elsif .arabic >= 1
			.roman$ = .roman$+"I"
			.arabic -= 1
		endif
	endwhile
	.roman$ = replace$(.roman$, "VIIII", "IX", 0)
	.roman$ = replace$(.roman$, "IIII", "IV", 0)
	.roman$ = replace$(.roman$, "LXXXX", "XC", 0)
	.roman$ = replace$(.roman$, "XXXX", "XL", 0)
	.roman$ = replace$(.roman$, "DCCCC", "CM", 0)
	.roman$ = replace$(.roman$, "CCCC", "CD", 0)
endproc
