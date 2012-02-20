#
# TEanalysis 2.0
# 
# Praat script handling configuration page
#
#     TEanalysis: Config.praat loads the code needed for the 
#     settings and the Settings page of TEanalysis.
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
    #call Draw_button 'config$' Language_'config.language$' 2
    call Draw_button 'config$' Input_'config.input$' 2
	call setFrequencyButton
    # Handle logging buttons with forced button draw
    if logging
    	call Draw_button 'config$' Logging 'logging'
    endif
endproc

procedure setFrequencyButton
	select Table 'config$'
	.numLabels = Get number of rows
	for .i to .numLabels
		.currentLabel$ = Get value... '.i' Label
		if startsWith(.currentLabel$, "Frequency_")
			call Draw_button 'config$' '.currentLabel$' 0
		endif
	endfor
	
	.freqkHz = config.frequency / 1000
	call Draw_button 'config$' Frequency_'.freqkHz'k 2
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
	# Get help text
	call getLanguageTexts '.table$' '.label$'
	config.speakerData$ = chooseReadFile$ (getLanguageTexts.helpText$)
	if config.speakerDataTable > 0
		select config.speakerDataTable
		Remove
	endif
	config.speakerDataTable = -1
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
			# Clean up backup file, if there is one
			.deleteBackupFile = 1
			# Do NOT delete the speakerDataBackup file if it is the current open file
			if config.speakerDataBackup$ = "" or config.speakerData$ = config.speakerDataBackup$
				.deleteBackupFile = 0
			endif
			config.speakerData$ = .filename$
			select config.speakerDataTable
			Save as tab-separated file... 'config.speakerData$'
			# Remove SpeakerData Backup file, but only if it is not the file just saved!
			if .deleteBackupFile and config.speakerData$ <> config.speakerDataBackup$ and fileReadable(config.speakerData$)
				# Note that the backup is ONLY deleted if the saved file actually exists!
				deleteFile(config.speakerDataBackup$)
			endif
		endif
	endif
    call Draw_button 'table$' '.label$' 0
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
		# Purge all changes and delete the backup file
		if config.speakerDataBackup$ <> "" and fileReadable(config.speakerDataBackup$)
			deleteFile(config.speakerDataBackup$)
		endif
	endif
    call Draw_button 'table$' '.label$' 0
endproc

procedure processConfigSpeakerSerial .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerSerial"
	# Get help text
	config.speakerDataSerial = not config.speakerDataSerial
	if config.speakerDataSerial
		call findLabel 'buttons$' Speaker
		if findLabel.row > 0
			select Table 'buttons$'
			Set string value... 'findLabel.row' Color Blue
		else
			select Table 'buttons$'
			Set string value... 'findLabel.row' Color Black
		endif
	endif
	.displayButton = 2*config.speakerDataSerial
    call Draw_button 'table$' '.label$' '.displayButton'
endproc

procedure processConfigRecordingTime .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "RecordingTime"
	# Get feedback texts
	call getLanguageTexts '.table$' '.label$'
	.inputText$ = getLanguageTexts.inputText$
	beginPause(getLanguageTexts.helpText$)
		positive (.inputText$, config.recordingTime$)
	clicked = endPause ("'getLanguageTexts.cancelText$'", "'getLanguageTexts.continueText$'", 2, 1)
	if clicked = 2
		# The text of the field name equals the name of the variable! That is, an indirection
		.inputText$ = replace_regex$(.inputText$, ".+", "\l&\$", 0)
		.inputText$ = replace_regex$(.inputText$, "\$", "", 0)
		.inputValue = '.inputText$'
		config.recordingTime$ = "'.inputValue'"
	endif
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

procedure processConfigFrequency .frequencyK$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Frequency"
	.freqHz = extractNumber(.frequencyK$, "")
	config.frequency = .freqHz * 1000
	ingnored_sampleFrequency = 2*config.frequency
	call setFrequencyButton
endproc

procedure processConfigShowFormants .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "ShowFormants"
	config.showFormants = not config.showFormants
	.displayButton = 2*config.showFormants
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
		skipNextStep = 1
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
    	call Draw_button 'config$' '.label$' '.displayButton'
    	if logging
        	call start_logging
    	endif
	else
		skipNextStep = 1
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
	if .row < 1
		exit Button Table Config does not have a row with label Logging
	endif
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
 	demo Text... '.xleft' Left '.ytext' Bottom TEanalysis version 0.1
	.ytext -= 2*.dy
 	demo Text... '.xleft' Left '.ytext' Bottom For more information, visit our website: http://www.
	.ytext -= .dy
 	demo Text... '.xleft' Left '.ytext' Bottom Based on Praat (http://www.praat.org)
	.ytext -= 2*.dy
 	demo Text... '.xleft' Left '.ytext' Bottom * Created and Copyrights 2010 by Rob van Son (UvA) - R.J.J.H.vanSon@gmail.com
  
	demoShow()	
	call set_font_size 'defaultFontSize'
endproc

