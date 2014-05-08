#
# TEVA 2.0
# 
# Praat script handling configuration page
#
#     TEVA: Config.praat loads the code needed for the 
#     settings and the Settings page of TEVA.
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

###############################################################
#
# Button Drawing Routines
#
###############################################################

procedure DrawCredits .color$ .x .y .size
	.size *= 0.71
	.lineheight = 2*.size
	call adjustFontSizeOnHeight 24 '.lineheight'
	.currentFontSize = adjustFontSizeOnHeight.newFontSize
    demo Paint circle... {0.2,0.2,0.8} '.x' '.y' '.size'
	demo Colour... White
	demo Text special... '.x' centre '.y' half Times '.currentFontSize' 0 i
	demoShow()
	demo Colour... Black
	call set_font_size 'defaultFontSize'	
endproc

procedure DrawInstruction .color$ .x .y .size
	.size *= 0.71
	.lineheight = 2*.size
	call adjustFontSizeOnHeight 24 '.lineheight'
	.currentFontSize = adjustFontSizeOnHeight.newFontSize
    demo Paint circle... {0.2,0.2,0.8} '.x' '.y' '.size'
	demo Colour... White
	demo Text special... '.x' centre '.y' half Times '.currentFontSize' 0 P
	demoShow()
	demo Colour... Black
	call set_font_size 'defaultFontSize'	
endproc

procedure DrawManual .color$ .x .y .size
	.size *= 0.71
	.lineheight = 2*.size
	call adjustFontSizeOnHeight 24 '.lineheight'
	.currentFontSize = adjustFontSizeOnHeight.newFontSize
    demo Paint circle... {0.2,0.2,0.8} '.x' '.y' '.size'
	demo Colour... White
	demo Text special... '.x' centre '.y' half Times '.currentFontSize' 0 M
	demoShow()
	demo Colour... Black
	call set_font_size 'defaultFontSize'	
endproc

procedure DrawLogging .color$ .x .y .size
    .size /= 2
	.y += .size
    if .color$ = "Blue"
    	.color$ = "{0.5,0.5,1}"
     else
    	.color$ = "Blue"
     endif
    demo Paint circle... '.color$' '.x' '.y' '.size'
endproc

procedure DrawTest .color$ .x .y .size
	.size /= 2
	.y += .size/4
    demo Paint circle... '.color$' '.x' '.y' '.size'
endproc

###############################################################
#
# Obligatory button Drawing Routines
# 
# These MUST be defined
#
###############################################################

procedure DrawReturn .color$ .x .y .size
    call DrawConfig '.color$' '.x' '.y' '.size'
endproc

# Set the correct button states after redrawing the window
procedure setConfigMainPage
    #call Draw_button 'te.config$' Language_'config.language$' 2
    call Draw_button 'te.config$' Input_'config.input$' 2
	call setFrequencyButton
    # Handle logging buttons with forced button draw
    if logging
    	call Draw_button 'te.config$' Logging 'logging'
    endif

endproc

procedure setFrequencyButton
	select Table 'te.config$'
	.numLabels = Get number of rows
	for .i to .numLabels
		.currentLabel$ = Get value... '.i' Label
		if startsWith(.currentLabel$, "Frequency_")
			call Draw_button 'te.config$' '.currentLabel$' 0
		endif
	endfor
	
	.freqkHz = config.frequency / 1000
	call Draw_button 'te.config$' Frequency_'.freqkHz'k 2
endproc

procedure setPitchButton
	select Table 'te.config$'
	.numLabels = Get number of rows
	for .i to .numLabels
		.currentLabel$ = Get value... '.i' Label
		if startsWith(.currentLabel$, "Pitchalgorithm_")
			call Draw_button 'te.config$' '.currentLabel$' 0
		endif
	endfor
	
	# Reset the pitch calculations
	if te.pitch > 0
		select te.pitch
		Remove
		te.pitch = 0
		pitchName$ = ""		
	endif
	call Draw_button 'te.config$' Pitchalgorithm_'config.pitchalgorithm$' 2
endproc

###############################################################
#
# Button Processing Routines
#
###############################################################

procedure processConfigLanguage .language$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Language_'.language$'"
	call processLanguageCodes '.table$' '.label$'
endproc

procedure processConfigSpeakerData .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerData"
	# Remove old data table
	# Get help text
	call getLanguageTexts '.table$' '.label$'
	.newFile$ = chooseReadFile$ (getLanguageTexts.helpText$)
	if config.speakerDataTable > 0 and .newFile$ <> config.speakerData$
		select config.speakerDataTable
		Remove
	endif
	config.speakerData$ = .newFile$
	# Set local preferences
	.dataDir$ = replace_regex$(config.speakerData$, "(^|[/:\\])[^/:\\]+$", "", 0)
	call load_local_preferences '.dataDir$'
	# Data table is not yet read!
	config.speakerDataTable = -1
	speakerID$ = ""
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSpeakerDirectory .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerDirectory"
	# Remove old data table
	# Get help text
	call getLanguageTexts '.table$' '.label$'
	.dataDir$ = chooseDirectory$ (getLanguageTexts.helpText$)
	# Remove old DataTable
	if config.speakerDataTable > 0 and .dataDir$ <> ""
		select config.speakerDataTable
		Remove
		# Data table is not yet read!
		config.speakerDataTable = -1
		config.speakerData$ = ""
	speakerID$ = ""
	endif
	# Set local preferences
	call load_local_preferences '.dataDir$'
	
	# Get all sound files
	config.speakerDataTable = Create Table with column names... Speaker_Data 1 ID Text Description Audio AST StartTime EndTime
	.fileList = Create Strings as file list... DataDirList '.dataDir$'
	.numFiles = Get number of strings
	
	.idList$ = tab$
	for .file to .numFiles
		select .fileList
		.fileName$ = Get string... '.file'
		if index_regex(.fileName$, "(?i\.(wav|au|snd|aif[fc]?|flac)$)")
			# Create a unique ID
			.id$ = replace_regex$(.fileName$, "\.[^\.]*$", "", 0)
			if index_regex(.idList$, "\t'.id$'\t")
				.num = 1
				while index_regex(.idList$, "\t'.id$'_item'.num'\t")
					.num += 1
				endwhile
				.id$ = "'.id$'_item'.num'"
			endif
			.idList$ = .idList$+.id$+tab$
			
			select config.speakerDataTable
			Append row
			.row = Get number of rows
			.row -= 1
			Set string value... '.row' ID '.id$'
			.audioString$ = .dataDir$+"/"+.fileName$
			.audioString$ = replace_regex$(.audioString$, "/[/]+", "/", 0)
			Set string value... '.row' Audio '.audioString$'
			Set numeric value... '.row' StartTime 0 
			Set numeric value... '.row' EndTime 0 
		endif
	endfor
	select config.speakerDataTable
	.row = Get number of rows
	if .row > 1
		Remove row... .row
	endif

	# clean up
	select .fileList
	Remove
	
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSpeakerMerge .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerMerge"
	# Get help text
	call getLanguageTexts '.table$' '.label$'
	.newFile$ = chooseReadFile$ (getLanguageTexts.helpText$)
	# Read new file
	if .newFile$ != "" and fileReadable(.newFile$)
		.tmpNewSpeakerData = Read from file... '.newFile$'
		# Make sure data table is read
		if config.speakerDataTable <= 0 and config.speakerData$ <> ""
			call get_speakerInfo 1
		endif
		# Merge AST values as new columns
		call merge_AST_values config.speakerDataTable .tmpNewSpeakerData
		
		# Merge Rating values
		call merge_table_values config.speakerDataTable .tmpNewSpeakerData "^Rating\."
		
		# Save result
		call WriteSpeakerData
		
		select .tmpNewSpeakerData
		Remove
	endif
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSpeakerRevert .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerRevert"
	if config.speakerData$ <> "" and fileReadable(config.speakerData$) 
...    and config.speakerDataBackup$ <> "" and fileReadable(config.speakerDataBackup$)
		if config.speakerDataTable > 0
			# Get feedback texts
			call getLanguageTexts '.table$' '.label$'
			.inputText$ = getLanguageTexts.inputText$
			beginPause("")
				comment(getLanguageTexts.helpText$)
			clicked = endPause ("'getLanguageTexts.cancelText$'", "'getLanguageTexts.continueText$'", 2, 1)
			if clicked = 2
				select config.speakerDataTable
				Remove
				config.speakerDataTable = -1
			endif
		endif
		if config.speakerDataTable <= 0 and config.speakerDataBackup$ <> "" and fileReadable(config.speakerDataBackup$)
			config.speakerDataTable = Read from file... 'config.speakerDataBackup$'
			config.createBackup = 1
			select config.speakerDataTable
			Save as tab-separated file... 'config.speakerData$'
		endif
	endif
	
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSaveSpeaker .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SaveSpeaker"
	# Get help text
	if config.speakerDataTable > 0 or (config.speakerData$ <> "" and fileReadable(config.speakerData$))
		# If the table has not yet been read, do that now
		if config.speakerDataTable <= 0
			call ReadSpeakerData 'config.speakerData$'
		endif
		# Get (new) filename, default to .tsv extension if not such
		.newFileName$ = config.speakerData$
		if index_regex(.newFileName$, "\.(?itsv|table)") <= 0
			.newFileName$ = replace_regex$(.newFileName$, "\.(\w+)$", ".tsv", 0)
		endif
		call getLanguageTexts '.table$' '.label$'
		.filename$ = chooseWriteFile$ (getLanguageTexts.helpText$, .newFileName$)
		if .filename$ <> ""
			call normalize_speakerData '.filename$'
			select normalize_speakerData.table
			Save as tab-separated file... '.filename$'
			Remove
			config.speakerData$ = .filename$
		endif
	endif
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSaveAudio .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SaveAudio"
	# Get help text
	if te.openSound > 0
		call getLanguageTexts '.table$' '.label$'
		.writeDialogue$ = getLanguageTexts.helpText$
		call convert_praat_to_latin1 '.writeDialogue$'
		.writeDialogue$ = convert_praat_to_latin1.text$
		.filename$ = chooseWriteFile$ (.writeDialogue$, "'te.currentFileName$'")
		if .filename$ <> ""
			te.currentFileName$ = .filename$
			select te.openSound
			.tmpPartSoundID = Extract part... 'selectedStartTime' 'selectedStartTime' rectangular 1.0 true
			Save as WAV file... '.filename$'
			Remove
		endif
	endif
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSaveAll .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SaveAll"

	config.saveAll = not config.saveAll

	.displayButton = 2*config.saveAll
    call Draw_button 'table$' '.label$' '.displayButton'
endproc

procedure processConfigCloseSpeaker .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "CloseSpeaker"
	
	# Get feedback texts
	call getLanguageTexts '.table$' '.label$'
	.inputText$ = getLanguageTexts.inputText$
	beginPause("")
		comment(getLanguageTexts.helpText$)
	clicked = endPause ("'getLanguageTexts.cancelText$'", "'getLanguageTexts.continueText$'", 2, 1)
	if clicked = 2
		if config.speakerDataTable > 0
			select config.speakerDataTable
			Remove
		endif
		# Initialize Speaker Data
		config.speakerData$ = ""
		config.speakerDataTable = -1
		speakerID$ = ""
		speakerInfo$ = ""
		speakerComments$ = ""
		pathologicalType = 0
		config.speakerDataBackup$ = ""
	endif
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSpeakerSerial .input$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerSerial"

    call Draw_button '.table$' '.label$'_'config.speakerSerial$' 0
	config.speakerSerial$ = .input$
	call switch_speaker_next_button 'config.speakerSerial$'
    call Draw_button '.table$' '.label$'_'config.speakerSerial$' 2
endproc

procedure processConfigSaveFMT .fmt$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SaveFMT"

	if windows and index("EMF EPS", .fmt$) <= 0
		.fmt$ = config.saveFMT$
	elsif not windows and index("EMF", .fmt$) > 0
		.fmt$ = config.saveFMT$
	else
		call Draw_button '.table$' SaveFMT_'config.saveFMT$' 0
		config.saveFMT$ = .fmt$
		call Draw_button '.table$' SaveFMT_'config.saveFMT$' 2
	endif

endproc

procedure processConfigAutoSelect .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "AutoSelect"

	config.autoSelect = not config.autoSelect

	.displayButton = 2*config.autoSelect
    call Draw_button 'table$' '.label$' '.displayButton'
endproc

procedure processConfigSpeakerRandomize .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerRandomize"
	
	if config.speakerDataTable <= 0 and config.speakerData$ <> ""
		call get_speakerInfo 1
	endif
	if config.speakerDataTable > 0
		# Get feedback texts
		call getLanguageTexts '.table$' '.label$'
		.inputText$ = getLanguageTexts.inputText$
		beginPause("")
			comment(getLanguageTexts.helpText$)
		clicked = endPause ("'getLanguageTexts.cancelText$'", "'getLanguageTexts.continueText$'", 2, 1)
		if clicked = 2
			select config.speakerDataTable
			Randomize rows
		endif
	endif
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSpeakerSort .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerSort"
	
	if config.speakerDataTable <= 0 and config.speakerData$ <> ""
		call get_speakerInfo 1
	endif
	if config.speakerDataTable > 0
		# Get feedback texts
		call getLanguageTexts '.table$' '.label$'
		.inputText$ = getLanguageTexts.inputText$
		beginPause("")
			comment(getLanguageTexts.helpText$)
		clicked = endPause ("'getLanguageTexts.cancelText$'", "'getLanguageTexts.continueText$'", 2, 1)
		if clicked = 2
			select config.speakerDataTable
			Sort rows... ID Audio Text Description
		endif
	endif
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigRecordingTime .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "RecordingTime"
	.fileLabel$ = "RecordingTask"
	# Original values
	.orig_recordingTime$ = config.recordingTime$
	.orig_recordingTaskFile$ = config.recordingTaskFile$
	.orig_recordingTarget$ = config.recordingTarget$
	# Get feedback texts
	call getLanguageTexts '.table$' '.label$'
	.inputText$ = getLanguageTexts.text$
	call get_feedback_text 'config.language$' RecordingTask
	.inputTaskFile$ = get_feedback_text.text$
	call get_feedback_text 'config.language$' RecordingTarget
	.inputTarget$ = get_feedback_text.text$
	call get_feedback_text 'config.language$' RecordingClear
	.inputTaskClear$ = get_feedback_text.text$
	clicked = -1
	while clicked <> 5 and clicked <> 1
		beginPause(getLanguageTexts.helpText$)
			positive (.inputText$, config.recordingTime$)
			sentence (.inputTaskFile$, config.recordingTaskFile$)
			sentence (.inputTarget$, config.recordingTarget$)
		clicked = endPause ("'getLanguageTexts.cancelText$'", "'.inputTaskFile$'", "'.inputTarget$'", "'.inputTaskClear$'", "'getLanguageTexts.continueText$'", 5, 1)
		# Cancel
		if clicked = 1
			config.recordingTime$ = .orig_recordingTime$
			config.recordingTaskFile$ = .orig_recordingTaskFile$
			config.recordingTarget$ = .orig_recordingTarget$
		# Input task file
		elsif clicked = 2
			.filename$ = chooseReadFile$ (.inputTaskFile$)
			if .filename$ <> "" and fileReadable(.filename$)
				# Clean up existing sound and Table
				call reset_analysis
				if te.recordingTaskTable > 0
					select te.recordingTaskTable
					Remove
					te.recordingTaskTable = 0
					te.recordingTaskPrompt = 0
				endif
				config.recordingTaskFile$ = .filename$
			endif
		# Target directory
		elsif clicked = 3
			# Keep track of the task!
			.inputTaskFile$ = replace_regex$(.inputTaskFile$, ".+", "\l&\$", 0)
			.inputTaskFile$ = replace_regex$(.inputTaskFile$, "\$", "", 0)
			.inputFile$ = '.inputTaskFile$'$
			config.recordingTaskFile$ = .inputFile$
			
			.dirname$ = chooseDirectory$ (.inputTarget$)
			if .dirname$ <> ""
				config.recordingTarget$ = .dirname$
			endif
		# Clear
		elsif clicked = 4
			if te.recordingTaskTable > 0
				select te.recordingTaskTable
				Remove
				te.recordingTaskTable = 0
				te.recordingTaskPrompt = 0
			endif
			if config.recordingTaskFile$ <> ""
				config.recordingTaskFile$ = ""
				te.recordingTaskPrompt = 0
			endif
			config.recordingTarget$ = ""
		# Continue
		elsif clicked = 5
			# The text of the field name equals the name of the variable! That is, an indirection
			.inputText$ = replace_regex$(.inputText$, ".+", "\l&\$", 0)
			.inputText$ = replace_regex$(.inputText$, "\$", "", 0)
			.inputValue = '.inputText$'
			config.recordingTime$ = "'.inputValue'"
			# The text of the field name equals the name of the variable! That is, an indirection
			.inputTaskFile$ = replace_regex$(.inputTaskFile$, ".+", "\l&\$", 0)
			.inputTaskFile$ = replace_regex$(.inputTaskFile$, "\$", "", 0)
			.inputFile$ = '.inputTaskFile$'$
			if .inputFile$ <> ""
				if fileReadable(.inputFile$)
					if te.recordingTaskTable > 0
						select te.recordingTaskTable
						Remove
						te.recordingTaskTable = 0
						te.recordingTaskPrompt = 0
					endif
					config.recordingTaskFile$ = .inputFile$
				elsif startsWith(.inputFile$, """") and endsWith(.inputFile$, """")
					.inputFile$ = left$(.inputFile$, length(.inputFile$) - 1)
					.inputFile$ = right$(.inputFile$, length(.inputFile$) - 1)
					config.recordingTaskFile$ = "["+.inputFile$+"]"
				elsif startsWith(.inputFile$, "[") and endsWith(.inputFile$, "]")
					# Clean up existing sound and Table
					call reset_analysis
					if te.recordingTaskTable > 0
						select te.recordingTaskTable
						Remove
						te.recordingTaskTable = 0
						te.recordingTaskPrompt = 0
					endif
					config.recordingTaskFile$ = .inputFile$
				endif
			elsif .inputFile$ = ""		
				if te.recordingTaskTable > 0
					select te.recordingTaskTable
					Remove
					te.recordingTaskTable = 0
					te.recordingTaskPrompt = 0
				endif
				config.recordingTaskFile$ = ""
			endif
		endif
	endwhile
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigShowBackground .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "ShowBackground"
	config.showBackground = not config.showBackground
	.displayButton = 2*config.showBackground
    call Draw_button 'table$' '.label$' '.displayButton'
endproc

procedure processConfigInput .input$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Input_'.input$'"
    call Draw_button '.table$' Input_'config.input$' 0
	config.input$ = .input$
    call Draw_button '.table$' Input_'config.input$' 2
endproc

procedure processConfigTest .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Test"
    call Draw_button '.table$' '.label$' 2
	Record mono Sound...
    call Draw_button '.table$' '.label$' 0
endproc

procedure processConfigMuteOutput .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "MuteOutput"
	config.muteOutput = not config.muteOutput;
	.displayButton = 2*config.muteOutput
    call Draw_button '.table$' '.label$' '.displayButton'
endproc

procedure processConfigRatingForm .input$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "RatingForm_'.input$'"
    call Draw_button '.table$' RatingForm_'config.ratingForm$' 0
	config.ratingForm$ = .input$
	if te.ratingTable > 0
		select te.ratingTable
		Remove
		te.ratingTable = -1
	endif
    call Draw_button '.table$' RatingForm_'config.ratingForm$' 2
endproc

procedure processConfigVasScaleTicks .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "VasScaleTicks"
	config.vasScaleTicks = not config.vasScaleTicks
	.displayButton = 2*config.vasScaleTicks
    call Draw_button 'table$' '.label$' '.displayButton'
endproc

procedure processConfigFrequency .frequencyK$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Frequency"
	.freqHz = extractNumber(.frequencyK$, "")
	config.frequency = .freqHz * 1000
	ingnored_sampleFrequency = 2*config.frequency
	call setFrequencyButton
endproc

procedure processConfigPitchalgorithm .pitchalgorithm$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Pitchalgorithm"
	config.pitchalgorithm$ = .pitchalgorithm$
	call setPitchButton
endproc

procedure processConfigShowFormants .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "ShowFormants"
	config.showFormants = not config.showFormants
	.displayButton = 2*config.showFormants
    call Draw_button 'table$' '.label$' '.displayButton'
endproc

procedure processConfigCalcGNE .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "CalcGNE"
	config.calcGNE = not config.calcGNE
	.displayButton = 2*config.calcGNE
    call Draw_button 'table$' '.label$' '.displayButton'
endproc

procedure processConfigInstruction .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Instruction"
	call Draw_button '.table$' '.label$' 1
	call write_text_table Instruction_'config.language$'
	demoWaitForInput()
    call Draw_button '.table$' '.label$' 0
    demo Erase all
    call Draw_config_page
endproc

procedure processConfigManual .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Manual"
	call Draw_button '.table$' '.label$' 1
	if fileReadable("ManPages/NKI_TE-VOICE_ANALYSIS_tool__'config.language$'_.man")
		Read from file... ManPages/NKI_TE-VOICE_ANALYSIS_tool__'config.language$'_.man
	else
		Go to manual page... NKI TE-VOICE ANALYSIS tool ('config.language$')
	endif
	# Wait until the manual is put to the background
	demoWaitForInput()
    call Draw_button '.table$' '.label$' 0
    demo Erase all
    call Draw_config_page
endproc

###############################################################
#
# Obligatory button Processing Routines
# 
# These MUST be defined
#
###############################################################

procedure processConfigReturn .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Return"
	call Draw_button '.table$' '.label$' 1
	call write_preferences ""
endproc

procedure processConfigRefresh .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Refresh"
	call Draw_config_page
endproc

procedure processConfigCredits .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Credits"
	call Draw_button '.table$' '.label$' 1
	call write_text_table Credits_'config.language$'
	demoWaitForInput()
    call Draw_button '.table$' '.label$' 0
    demo Erase all
    call Draw_config_page
endproc

procedure processConfigHelp .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Help"
	if runningCommandMode = 0
		call help_loop	'.table$' Draw_config_page
	else
		te.skipNextStep = 1
	endif
endproc

procedure processConfigRun .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Run"
	
    call Draw_button '.table$' '.label$' 2
	# Get help text
	call findLabel '.table$' '.label$'
	.row = findLabel.row
	select Table '.table$'
	.helpText$ = Get value... '.row' Helptext
	call convert_praat_to_latin1 '.helpText$'
	.helpText$ = convert_praat_to_latin1.text$
	
	# Open file and run it
	if runningCommandMode = 0
		.filename$ = chooseReadFile$ (.helpText$)
	endif
	if .filename$ <> "" and fileReadable(.filename$)
		call runCommandFile '.filename$'
	endif
	# Reset button
    call Draw_button '.table$' '.label$' 0
    demo Erase all
    call Draw_config_page
endproc

procedure processConfigLogging .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Logging"
	if runningCommandMode = 0
		logging = not logging
		.displayButton = logging
    	call Draw_button 'te.config$' '.label$' '.displayButton'
    	if logging
        	call start_logging
    	endif
	else
		te.skipNextStep = 1
	endif
endproc

procedure processConfigOpenLog .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "OpenLog"
	call Draw_button '.table$' '.label$' 1
	# Get help text
	call findLabel '.table$' '.label$'
	.row = findLabel.row
	select Table '.table$'
	.helpText$ = Get value... '.row' Helptext
	call convert_praat_to_utf8 '.helpText$'
	.openDialogue$ = convert_praat_to_utf8.text$
	
	.dirname$ = chooseDirectory$ (.openDialogue$)
	if .dirname$ <> ""
		config.openLog$ = .dirname$
	endif
	
	# Reset button
	call Draw_button '.table$' '.label$' 0
	# Draw
    call Draw_config_page
endproc	

###############################################################
#
# Miscelaneous supporting code
#
###############################################################

procedure start_logging
	.logDirectory$ = ""
	if fileReadable("'config.openLog$'/logging.txt")
		.logDirectory$ < 'config.openLog$'/logging.txt
		.logDirectory$ = extractLine$(.logDirectory$, "")
	endif
	if .logDirectory$ = "" or not fileReadable(.logDirectory$)
    		.logDirectory$ = "'config.openLog$'"
	endif
    config.currentLogDirectory$ = "'.logDirectory$'/log'logtimeStamp$'"
    createDirectory(config.currentLogDirectory$)
	fileappend "'config.currentLogDirectory$'/logFile.txt" # 'logtimeStamp$''newline$'
    # Flip switch
    logging = 1
endproc

procedure log_command .logtext$
	if logging
		fileappend "'config.currentLogDirectory$'/logFile.txt" '.logtext$''newline$'
	endif
endproc

procedure log_recording .recordedSound$
	if logging
		# Log files
		.currentDate$ = date$()
		call getTimeStamp
		.timeStamp$ = getTimeStamp.string$

		.outfilename$ = .timeStamp$+".wav"
		.logtext$ = "# "+.currentDate$+tab$+.outfilename$
		call log_command '.logtext$'
		call log_command MainPage ReadFromFile 'config.currentLogDirectory$'/'.outfilename$'

		# The recorded sound
		select te.openSound
		Write to WAV file... 'config.currentLogDirectory$'/'.outfilename$'
	endif
endproc

procedure log_fileOpen .filename$
	if logging
		# Log files
		call getTimeStamp
		.timeStamp$ = getTimeStamp.string$

		.logtext$ = "MainPage+tab$+ReadFromFile+tab$+.filename$+newline$
    	# Plain log text
		fileappend "'config.currentLogDirectory$'/logFile.txt" .label$ .clickX .clickY .pressed$
	endif
endproc

procedure paint_logging_light
    select Table Config
    .row = Search column... Label Logging
	if .row > 0
		# Get button values
	    .leftX = Get value... '.row' LeftX
	    .rightX = Get value... '.row' RightX
	    .lowY = Get value... '.row' LowY
	    .highY = Get value... '.row' HighY
	    .buttonColor$ = Get value... '.row' Color
	    .centerX = (.leftX + .rightX)/2
	    .centerY = (.lowY + .highY)/2
	    .radius = (.highY - .lowY )/(4*2)
	    .wipeRadius = 1.1*.radius
	    if logging
	    	demo Paint circle... White '.centerX' '.centerY' '.wipeRadius'
	    	demo Paint circle... '.buttonColor$' '.centerX' '.centerY' '.radius'
	    	demoShow()
	    else
	    	demo Paint circle... White '.centerX' '.centerY' '.wipeRadius'
	    	demoShow()
	    endif
	endif
endproc

# The Credits
procedure write_credits
	.xleft = 20
 	.xright = 90
  	.ylow = 20
   	.yhigh = 85
	.lineHeight = 2.5
	.referenceText$ = "organisational, and financial support from the staff and board of the Digitale Universiteit."
	.creditsFontSize = 12

	# Adapt size of button to length of text
	.maxWidth = (.xright - .xleft) - 3
	call adjustFontSizeOnWidth '.creditsFontSize' '.maxWidth' '.referenceText$'
	.creditsFontSize = adjustFontSizeOnWidth.newFontSize
	if adjustFontSizeOnWidth.diff > 0
		.xright += adjustFontSizeOnWidth.diff/4
		.xleft -= 3*adjustFontSizeOnWidth.diff/4
	endif
	call set_font_size '.creditsFontSize'

	demo Line width... 8
 	demo Colour... {0.5,0.5,1}
	demo Paint rectangle... {0.9,0.9,1} '.xleft' '.xright' '.ylow' '.yhigh'
	demo Draw rectangle... '.xleft' '.xright' '.ylow' '.yhigh'
	demo Line width... 'defaultLineWidth'
	demo Black
	.xleft += 2
 	.dy = .lineHeight
 	.ytext = .yhigh - 2 - .dy
 	demo Text... '.xleft' Left '.ytext' Bottom TEVA version 0.1
	.ytext -= 2*.dy
 	demo Text... '.xleft' Left '.ytext' Bottom For more information, visit our website: http://www.
	.ytext -= .dy
 	demo Text... '.xleft' Left '.ytext' Bottom Based on Praat (http://www.praat.org)
	.ytext -= 2*.dy
 	demo Text... '.xleft' Left '.ytext' Bottom * Created and Copyrights 2010 by Rob van Son (UvA) - R.J.J.H.vanSon@gmail.com
  
	demoShow()	
	call set_font_size 'defaultFontSize'
endproc

# Merge Speaker tables

# Merge AST values, ie, add columns
procedure merge_AST_values .currentTable .newTable
	if .currentTable > 0 and .newTable > 0
		select .currentTable
		.numCols = Get number of columns
		.astNum = 1
		for .col to .numCols
			.colLabel$ = Get column label... .col
			if index_regex(.colLabel$, "^AST[\d]*$") > 0
				.astNum += 1
			endif
		endfor
		.lastColumn$ = "AST'.astNum'"
		Append column... '.lastColumn$'
		.numRows = Get number of rows
		for .row to .numRows
			# Find new row corresponding to current row
			select .currentTable
			.id$ = Get value... .row ID
			select .newTable
			.astColumnIndex = Get column index... AST
			.tmpRow = Search column... ID '.id$'
			if .tmpRow > 0 and .astColumnIndex > 0
				# Get new value
				.astValue$ = Get value... .tmpRow AST
				
				# Add value
				select .currentTable
				Set string value... .row '.lastColumn$' '.astValue$'
			endif
		endfor
	endif
endproc

# Merge Rating values, ie, add values. Use regex, e.g., .colpattern$ = "^Rating\."
# Only merges rows also in .currentTable. Rows only in .newTable are dropped
procedure merge_table_values .currentTable .newTable .colpattern$
	.colpattern$ = replace_regex$(.colpattern$, "(^""|""$)", "", 0)
	if .currentTable > 0 and .newTable > 0
		# Handle columns in .newTable that are also in .currentTable
		select .currentTable
		.numCols = Get number of columns
		for .col to .numCols
			select .currentTable
			.colLabel$ = Get column label... .col
			if index_regex(.colLabel$, .colpattern$) > 0
				select .newTable
				.newCol = Get column index... '.colLabel$'

				if .newCol > 0
					select .newTable
					.numRows = Get number of rows
					for .row to .numRows
						select .newTable
						.id$ = Get value... .row ID
						.newValue$ = Get value... .row '.colLabel$'
						select .currentTable
						.tmpRow = Search column... ID '.id$'
						if .tmpRow > 0 and index_regex(.newValue$, "[0-9\.]")
							.oldValue$ = Get value... .tmpRow '.colLabel$'
							select .currentTable
							# No old value, take new value
							if index_regex(.oldValue$, "[0-9\.]") <= 0
								.oldValue$ = .newValue$
								# Add value
								Set string value... .tmpRow '.colLabel$' '.newValue$'
							elsif .oldValue$ <> "" and index_regex(.oldValue$, "(^|;)'.newValue$'(;|$)") <= 0
								# Append new value to old value
								.newValue$ = "'.oldValue$';'.newValue$'"
								# Add value
								Set string value... .tmpRow '.colLabel$' '.newValue$'
							endif
						endif
					endfor
				endif
			endif
		endfor
		
		# Handle columns in .newTable that are not in .currentTable
		select .newTable
		.numCols = Get number of columns
		for .col to .numCols
			select .newTable
			.colLabel$ = Get column label... .col
			if index_regex(.colLabel$, .colpattern$) > 0
				select .currentTable
				.newCol = Get column index... '.colLabel$'
				if .newCol <= 0
					Append column... '.colLabel$'
					select .newTable
					.numRows = Get number of rows
					for .row to .numRows
						select .newTable
						.id$ = Get value... .row ID
						.newValue$ = Get value... .row '.colLabel$'
						select .currentTable
						.tmpRow = Search column... ID '.id$'
						if .tmpRow > 0
							Set string value... .tmpRow '.colLabel$' '.newValue$'
						endif
					endfor
				endif
			endif
		endfor
endproc

procedure rating_String .speakerID$
	.subtext$ = ""
	
	call predictVQvalue
	predictedPathVQ = predictVQvalue.vq / 10

	# Get Ratings
	# Rating.quality
	call get_RatingInfo Rating.quality '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + " " + get_RatingInfo.subtext$
	else
		# There is always a computed value
		call get_printsignal_text 'config.language$' Rating.quality
		.subtext$ = .subtext$ + " " + get_printsignal_text.text$ + ": -"
	endif
	call get_printsignal_text 'config.language$' CompVQ
	.compvqText$ = get_printsignal_text.text$
	.subtext$ = .subtext$ + ", " + .compvqText$ + ": 'predictedPathVQ:0'"
	
	# Rating.continuity
	call get_RatingInfo Rating.continuity '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif
	
	# Rating.impression
	call get_RatingInfo Rating.impression '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif
	
	# Rating.intelligibility
	call get_RatingInfo Rating.intelligibility '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif
	
	# Rating.fluency
	call get_RatingInfo Rating.fluency '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif
	
	# Rating.noise
	call get_RatingInfo Rating.noise '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif
	
	# Rating.voice
	call get_RatingInfo Rating.voice '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif
	
	# Rating.voice
	call get_RatingInfo Rating.voice '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif

	# Rating.grade
	call get_RatingInfo Rating.grade '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif

	# Rating.roughness
	call get_RatingInfo Rating.roughness '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif

	# Rating.breathiness
	call get_RatingInfo Rating.breathiness '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif

	# Rating.asthenia
	call get_RatingInfo Rating.asthenia '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif

	# Rating.strain
	call get_RatingInfo Rating.strain '.speakerID$'
	if get_RatingInfo.subtext$ <> ""
		.subtext$ = .subtext$ + "; " + get_RatingInfo.subtext$
	endif
endproc

procedure get_RatingInfo .ratinglabel$ .speakerID$
	.subtext$ = ""
	call get_speakerInfo '.speakerID$'
	if config.speakerDataTable > 0
		select config.speakerDataTable
		.col = Get column index... '.ratinglabel$'
		.rating_value = -1
		if .col > 0
			.rating_value = do("Get value...", get_speakerInfo.row, .ratinglabel$)
			if .rating_value = undefined
				.rating_value = -1
			else
				.rating_value /= 10
			endif
		endif
		if .rating_value >= 0
			call get_printsignal_text 'config.language$' '.ratinglabel$'
			.subtext$ = get_printsignal_text.text$ + ": '.rating_value:1'"
		endif
	endif
endproc
