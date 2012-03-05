#
# TEanalysis 0.1
# 
# Praat script handling buttons page
#
#     TEanalysis: MainPage.praat loads the code needed for the 
#     main, practice, page of DemoApp and the sound handling and recognition.
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
mainPage.outputPraatObject$ = "Draw"


# Define some variables
procedure initializeMainPage
	# Do not recalculate needlessly
	calculateHarmonicityValues.previousSelectedGNEStartTime = -1
	calculateHarmonicityValues.previousSelectedGNEEndTime = -1
	previousHarmonicityStart = -1
	previousHarmonicityEnd = -1
	previousGNEstart = -1
	previousGNEend = -1
endproc
call initializeMainPage

###############################################################
#
# Button Drawing Routines
#
###############################################################

procedure drawTriangle .direction .x .y .size
	# Make sure direction = +/- 1
	if .direction = 0
		.direction = 1 
	endif
	.direction /= abs(.direction)
	
	.offset = 0.01
	.currentHeight = .size
	.currentX = .x - .direction*.size
	
	demo Line width... 2.0

	while .currentHeight> 0
		.ystart = .y + .currentHeight
		.yend = .y - .currentHeight
		demo Draw line... .currentX .ystart .currentX .yend
		.currentHeight -= .offset *3/4
		.currentX += .direction*.offset * 1.5
	endwhile
	demo Line width... 'defaultLineWidth'
endproc

procedure DrawPrevious .color$ .x .y .size
	demo '.color$'
	.y += .size / 2
	.size *= 2/3
	call drawTriangle -1 .x .y .size
	.currentX = drawTriangle.currentX
	.endX = .currentX - 0.5
	.lowY = .y - .size
	.highY = .y + .size
	demo Paint rectangle... '.color$' '.currentX' '.endX' '.lowY' '.highY'
endproc

procedure DrawNext .color$ .x .y .size
	demo '.color$'
	.y += .size / 2
	.size *= 2/3
	call drawTriangle 1 .x .y .size
	.currentX = drawTriangle.currentX
	.endX = .currentX + 0.5
	.lowY = .y - .size
	.highY = .y + .size
	demo Paint rectangle... '.color$' '.currentX' '.endX' '.lowY' '.highY'
endproc


###############################################################
#
# Obligatory button Drawing Routines
# 
# These MUST be defined
#
###############################################################

procedure DrawRecord .color$ .x .y .size
	.size /= 2
    demo Paint circle... '.color$' '.x' '.y' '.size'
endproc

procedure DrawPlay .color$ .x .y .size
	demo '.color$'
	call drawTriangle 1 .x .y .size
endproc

procedure DrawQuit .color$ .x .y .size
	demo Colour... '.color$'
	.lineWidth = 0.5*.size**2
	demo Line width... '.lineWidth'
	.xstart = .x - .size
	.ystart = .y + .size
	.xend = .x + .size
	.yend = .y - .size
	demo Draw line... .xstart .ystart .xend .yend
	.xstart = .x - .size
	.ystart = .y - .size
	.xend = .x + .size
	.yend = .y + .size
	demo Draw line... .xstart .ystart .xend .yend
	demo Line width... 'defaultLineWidth'
	demo Colour... Black
endproc

procedure DrawConfig .color$ .x .y .size
	.size *= 1
	.lineWidth = 0.4*.size
	demo Arrow size... '.lineWidth'
	.lineWidth = 0.4*.size**2
	demo Line width... '.lineWidth'
	.y += .size/2
	.xstart = .x - .size
	.xend = .x + .size
	demo Draw arrow... .xstart .y .xend .y
	demo Line width... 'defaultLineWidth'
endproc

procedure DrawRefresh .color$ .x .y .size
	.lineWidth = 0.5*.size**2
	.size /= 2
	demo Line width... '.lineWidth'
	demo Draw arc... '.x' '.y' '.size' 0 270
	demo Line width... 'defaultLineWidth'
endproc

procedure draw_signal
	# Draw
	if buttons.draw$ = "Sound"
		# Draw Sound
		call DrawSoundObject
	elsif buttons.draw$ = "Pitch"
		# Draw Pitch
		call DrawPitchObject
	elsif buttons.draw$ = "Harmonicity"
		# Draw Harmonicity
		call DrawHarmonicityObject
	elsif buttons.draw$ = "GNE"
		# Draw GNE
		call DrawGNEObject
	elsif buttons.draw$ = "PitchTier"
		# Draw PitchTier
		call DrawPitchTierObject
	elsif buttons.draw$ = "Spectrogram"
		# Draw Spectrogram
		call DrawSpectrogramObject
	elsif buttons.draw$ = "Ltas"
		# Draw Ltas
		call DrawLtasObject
	elsif buttons.draw$ = "Intensity"
		# Draw Intensity
		call DrawIntensityObject
	endif
endproc

procedure print_signal .outFileName$
	.outFileName$ = replace_regex$(.outFileName$, "\.[a-z0-9A-Z]+$","",0)
	
	# Set output format
	.outExtension$ = "eps"
	.outFileType$ = "EPS file"
	if macintosh
		.outExtension$ = "pdf"
		.outFileType$ = "PDF file"
	elsif windows
		.outExtension$ = "emf"
		.outFileType$ = "Windows metafile"
	endif
	
	.outFileName$ = replace_regex$(.outFileName$, "([\\/:])([^\\/:]*)$", "\1'.outExtension$'\1\2", 0)
	.outDirName$ = replace_regex$(.outFileName$, "([\\/:])([^\\/:]*)$", "", 0)
	createDirectory(.outDirName$)
	.outEpsFileName$ = replace_regex$(.outFileName$, "([\\/:])'.outExtension$'([\\/:])([^\\/:]*)$", "\1eps\2\3", 0)
	if .outExtension$ <> "eps"
		.outDirName$ = replace_regex$(.outDirName$, "([\\/:])'.outExtension$'$", "\1eps", 0)
		createDirectory(.outDirName$)
	endif
	# On unix, create PNG files
	.convertEPS2PNG = 0
	if unix
		if fileReadable("/usr/bin/convert")
			.convertEPS2PNG = 1
			.outPngDirName$ = replace_regex$(.outDirName$, "([\\/:])eps$", "\1png", 0)
			.outPngFileName$ = replace_regex$(.outFileName$, "([\\/:])'.outExtension$'([\\/:])([^\\/:]*)$", "\1png\2\3", 0)
			createDirectory(.outPngDirName$)
			.convertEPS2PNGcommand$ = "convert"
			 .convertEPS2PNGoptions$ = "-antialias"
		endif
	endif
	
	# Print
	mainPage.outputPraatObject$ = "Print"
	Erase all
	# Draw Sound
	call DrawSoundObject
	Save as '.outFileType$'... '.outFileName$'_Sound.'.outExtension$'
	if .outExtension$ <> "eps"
		Save as EPS file... '.outEpsFileName$'_Sound.eps
	endif
	if unix and .convertEPS2PNG
		system '.convertEPS2PNGcommand$' '.outEpsFileName$'_Sound.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_Sound.png
	endif
	Erase all

	# Draw Pitch
	call DrawPitchObject
	Save as '.outFileType$'... '.outFileName$'_Pitch.'.outExtension$'
	if .outExtension$ <> "eps"
		Save as EPS file... '.outEpsFileName$'_Pitch.eps
	endif
	if unix and .convertEPS2PNG
		system '.convertEPS2PNGcommand$' '.outEpsFileName$'_Pitch.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_Pitch.png
	endif
	Erase all

	# Draw GNE
	#call DrawGNEObject
	#Save as '.outFileType$'... '.outFileName$'_GNE.'.outExtension$'
	#if .outExtension$ <> "eps"
	#	Save as EPS file... '.outEpsFileName$'_GNE.eps
	#endif
	#if unix and .convertEPS2PNG
	#	system '.convertEPS2PNGcommand$' '.outEpsFileName$'_GNE.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_GNE.png
	#endif
	#Erase all

	# Draw PitchTier
	#call DrawPitchTierObject
	#Save as '.outFileType$'... '.outFileName$'_PitchTier.'.outExtension$'
	#if .outExtension$ <> "eps"
	#	Save as EPS file... '.outEpsFileName$'_PitchTier.eps
	#endif
	#if unix and .convertEPS2PNG
	#	system '.convertEPS2PNGcommand$' '.outEpsFileName$'_PitchTier.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_PitchTier.png
	#endif
	#Erase all

	# Draw Spectrogram
	call DrawSpectrogramObject
	Save as '.outFileType$'... '.outFileName$'_Spectrogram.'.outExtension$'
	if .outExtension$ <> "eps"
		Save as EPS file... '.outEpsFileName$'_Spectrogram.eps
	endif
	if unix and .convertEPS2PNG
		system '.convertEPS2PNGcommand$' '.outEpsFileName$'_Spectrogram.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_Spectrogram.png
	endif
	Erase all

	# Draw Ltas
	call DrawLtasObject
	Save as '.outFileType$'... '.outFileName$'_Ltas.'.outExtension$'
	if .outExtension$ <> "eps"
		Save as EPS file... '.outEpsFileName$'_Ltas.eps
	endif
	if unix and .convertEPS2PNG
		system '.convertEPS2PNGcommand$' '.outEpsFileName$'_Ltas.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_Ltas.png
	endif
	Erase all

	# Draw Intensity
	call DrawIntensityObject
	Save as '.outFileType$'... '.outFileName$'_Intensity.'.outExtension$'
	if .outExtension$ <> "eps"
		Save as EPS file... '.outEpsFileName$'_Intensity.eps
	endif
	if unix and .convertEPS2PNG
		system '.convertEPS2PNGcommand$' '.outEpsFileName$'_Intensity.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_Intensity.png
	endif
	Erase all
	
	# Draw Harmonicity
	call DrawHarmonicityObject
	Save as '.outFileType$'... '.outFileName$'_Harmonicity.'.outExtension$'
	if .outExtension$ <> "eps"
		Save as EPS file... '.outEpsFileName$'_Harmonicity.eps
	endif
	if unix and .convertEPS2PNG
		system '.convertEPS2PNGcommand$' '.outEpsFileName$'_Harmonicity.eps '.convertEPS2PNGoptions$' '.outPngFileName$'_Harmonicity.png
	endif
	Erase all

	# Reset draw
	mainPage.outputPraatObject$ = "Draw"

endproc

procedure set_draw_signal_button
	call Draw_button 'buttons$' Draw_'buttons.draw$' 2
	if buttons.draw$ = "Ltas"
		call Draw_button 'buttons$' Select 1
		call Draw_button 'buttons$' ToSelection 1
		call Draw_button 'buttons$' ZoomOut 1
		call Draw_button 'buttons$' ZoomIn 1
		call Draw_button 'buttons$' Next 1
		call Draw_button 'buttons$' Previous 1
	endif
endproc

###############################################################
#
# Button Processing Routines
#
###############################################################


###############################################################
#
# Obligatory button Processing Routines
# 
# These MUST be defined
#
###############################################################

procedure processMainPageQuit .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Quit"
	call end_program
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPageRefresh .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Refresh"
	call init_window
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPageConfig .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Config"
	call config_page
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPageHelp .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Help"
	if runningCommandMode = 0
		call help_loop 'buttons$' init_window
	else
		skipNextStep = 1
	endif
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPageSave .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Save"
	call saveSound '.table$' '.label$'
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPagePlay .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Play"
	call play_sound 'te.openSound'
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPageSpeaker .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Speaker"
	# Get help text
	call findLabel '.table$' '.label$'
	.row = findLabel.row
	select Table '.table$'
	.helpText$ = Get value... '.row' Helptext
	clicked = -1
	while not config.speakerSerial and clicked <> 4
		# The speaker Text
		.speakerID$ = "ID"
		.speakerIDDefault$ = speakerID$
		if .speakerIDDefault$ = ""
			call get_feedback_text 'config.language$' SpeakerID
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.speakerIDDefault$ = convert_praat_to_latin1.text$
		else
			call get_speakerInfo 'speakerID$'
			.speakerIDDefault$ = "['get_speakerInfo.row'] '.speakerIDDefault$'"
		endif
		.speakerText$ = "Speaker"
		.speakerDefault$ = speakerInfo$
		if .speakerDefault$ = ""
			call get_feedback_text 'config.language$' SpeakerDefault
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.speakerDefault$ = convert_praat_to_latin1.text$
		endif
		# The comments
		call get_feedback_text 'config.language$' SpeakerComments
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.speakerCommentInput$ = convert_praat_to_latin1.text$
		if index_regex(speakerComments$, "\S") <= 0
			.speakerCommentDef$ = .speakerCommentInput$
		else
			call convert_praat_to_latin1 'speakerComments$'
			.speakerCommentDef$ = convert_praat_to_latin1.text$
		endif
		.speakerCommentDef$ = replace_regex$(.speakerCommentDef$, "\n", "\\n", 0)

		# The rest
		call get_feedback_text 'config.language$' Cancel
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.cancelText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Continue
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.continueText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Next
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.nextText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Previous
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.prevText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Current
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.currentText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' SpeakerComments
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.buttonText$ = convert_praat_to_latin1.text$

		# The user text input window (beginPause .... endPause)
		beginPause(.helpText$)
			text (.speakerID$, .speakerIDDefault$)
			text (.speakerText$, .speakerDefault$)
			text (.speakerCommentInput$, .speakerCommentDef$)
		clicked = endPause ("'.prevText$'", "'.currentText$'", "'.nextText$'", "'.continueText$'", 4, 1)
		if clicked = 2 or clicked = 4
			# The text of the field name equals the name of the variable! That is, an indirection
			.speakerID$ = replace_regex$(.speakerID$, ".+", "\l&\$", 0)
			.speakerText$ = replace_regex$(.speakerText$, ".+", "\l&\$", 0)
			.speakerCommentInput$ = replace_regex$(.speakerCommentInput$, ".+", "\l&\$", 0)
			.newSpeakerID$ = '.speakerID$'
			.newSpeakerInfo$ = '.speakerText$'
			.newSpeakerComments$ = '.speakerCommentInput$'
			if .newSpeakerInfo$ = .speakerDefault$
				.newSpeakerInfo$ = ""
			endif
			if .newSpeakerComments$ = .speakerCommentDef$
				.newSpeakerComments$ = ""
			endif
			.change_speakerdata = 0
			if .newSpeakerID$ = "-"
				#Delete record
				call delete_speakerData  'speakerID$'
				.newSpeakerID$ = delete_speakerData.speakerID$
			endif
			if .newSpeakerID$ <> .speakerIDDefault$
				.newSpeakerID$ = replace_regex$(.newSpeakerID$, "^\[\d+\]\s+", "", 0)
				speakerID$ = .newSpeakerID$
				call get_speakerInfo 'speakerID$'
				speakerID$ = get_speakerInfo.id$
				speakerInfo$ = get_speakerInfo.text$
				speakerComments$ = get_speakerInfo.description$
				pathologicalType = 'get_speakerInfo.ast$'
				te.currentFileName$ = get_speakerInfo.audio$
				call load_audio_file 'te.currentFileName$'
				call autoSetPathType
				.change_speakerdata = 1
			else
				if index_regex(.newSpeakerInfo$, "\S")
					speakerInfo$ = .newSpeakerInfo$
					.change_speakerdata = 1
				endif
				if index_regex(.newSpeakerComments$, "\S")
					speakerComments$ = .newSpeakerComments$
					.change_speakerdata = 1
				endif
			endif
			# Store changes
			if .change_speakerdata > 0
				call WriteSpeakerData
			endif
		elsif clicked = 1
			call get_previousSpeaker 'speakerID$'
			speakerID$ = get_previousSpeaker.id$
			speakerInfo$ = get_previousSpeaker.text$
			speakerComments$ = get_previousSpeaker.description$
			te.currentFileName$ = get_previousSpeaker.audio$
			pathologicalType = 'get_previousSpeaker.ast$'
			call load_audio_file 'te.currentFileName$'
			call autoSetPathType
		elsif clicked = 3
			call get_nextSpeaker 'speakerID$'
			speakerID$ = get_nextSpeaker.id$
			speakerInfo$ = get_nextSpeaker.text$
			speakerComments$ = get_nextSpeaker.description$
			te.currentFileName$ = get_nextSpeaker.audio$
			pathologicalType = 'get_nextSpeaker.ast$'
			call load_audio_file 'te.currentFileName$'
			call autoSetPathType
		endif
		if clicked = 2
			call ReadSpeakerData 'config.speakerData$'
			if config.speakerDataTable > 0
				select config.speakerDataTable
				.tmpDataTable = Copy... Speaker_Data
			else
				.tmpDataTable = Create Table with column names... Speaker_Data 1 ID Text Description Audio AST
			endif
			View & Edit
			demoWaitForInput()
			# Table can not be edited in List, so discard it
			select .tmpDataTable
			Remove
		endif
	endwhile
	
	# Just pick next recording
	if config.speakerSerial
		call get_nextSpeaker 'speakerID$'
		# This was the first reference to a speaker, get first empty pos
		if speakerID$ = "" and config.speakerDataTable > 0
			select config.speakerDataTable
			.numRows = Get number of rows
			.row = 0
			for .i to .numRows
				.astValue$ = Get value... '.i' AST
				if index_regex(.astValue$, "^[1-9]") > 0
					.row = .i
				endif
			endfor
			if .row > 0
				speakerID$ = Get value... '.row' ID
				call get_nextSpeaker 'speakerID$'
			endif
		endif
		speakerID$ = get_nextSpeaker.id$
		speakerInfo$ = get_nextSpeaker.text$
		speakerComments$ = get_nextSpeaker.description$
		te.currentFileName$ = get_nextSpeaker.audio$
		pathologicalType = 'get_nextSpeaker.ast$'
		call load_audio_file 'te.currentFileName$'
		call autoSetPathType
	endif
	
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPageFile .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "File"
	# Get help text
	call findLabel '.table$' '.label$'
	.row = findLabel.row
	select Table '.table$'
	.helpText$ = Get value... '.row' Helptext
	
	call getOpenFile '.helpText$'
	Rename... Speech
	recordedSound$ = selected$("Sound")	
	call post_processing_sound
	
	# Reset button
	call Draw_button '.table$' '.label$' 0
	# Draw
	call init_window
endproc	

procedure processMainPageReadFromFile .filename$
	.table$ = "MainPage"
	.label$ = "ReadFromFile"
	
	call readFromFile '.filename$'
	# Draw
	call init_window
endproc

procedure processMainPageRecord .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Record"
	
	if runningCommandMode = 0
    	call record_sound
		call post_processing_sound
	else
		skipNextStep = 1
	endif
	# Reset button
	call Draw_button '.table$' '.label$' 0
	# Draw
	call init_window
endproc

procedure processMainPagePathologicalType .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "!PathologicalType"
	if index_regex(.pressed$, "[0-4]") > 0
		call setPathType '.pressed$'
		call init_window
	endif
endproc

# Process Sound Speech
procedure post_processing_sound
	# Analyze Pitch in Serial step mode
	if config.speakerSerial
		# Supress drawing, but set up Pitch parameters
		noDrawingOrWriting = 1
		call DrawPitchObject
		noDrawingOrWriting = 0
	endif
endproc

procedure processMainPageDraw .type$ .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Draw_'.type$'"
	buttons.draw$ = .type$
	call init_window
endproc

procedure processMainPageToSelection .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "ToSelection"
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
		goto ENDOFTOSELECTION
	endif
	if buttons.draw$ = "Ltas"
		call Draw_button 'buttons$' '.label$' 1
		goto ENDOFTOSELECTION
	endif
	currentStartTime = selectedStartTime
	currentEndTime = selectedEndTime
	call Draw_button 'buttons$' '.label$' 0
	call init_window
	label ENDOFTOSELECTION
endproc

procedure processMainPageSelect .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Select"
	.firstT = -1
	.secondT = -1
	if runningCommandMode = 1
		# Do nothing
		call Draw_button 'buttons$' Select 1
		skipNextStep = 1

		goto ENDOFSELECT
	endif
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
		goto ENDOFSELECT
	endif
	if buttons.draw$ = "Ltas"
		call Draw_button 'buttons$' Select 1
		goto ESCAPESELECT
	endif
	# Redraw window if there is an old selection
	if selectedStartTime > currentStartTime or selectedEndTime < currentEndTime
		selectedStartTime = currentStartTime
		selectedEndTime = currentEndTime
		call init_window
	endif
	# Get feedback text
	call get_feedback_text 'config.language$' Select1
	.feedback1$ = get_feedback_text.text$
	call get_feedback_text 'config.language$' Select2
	.feedback2$ = get_feedback_text.text$
	call reset_viewport
	call Draw_button 'buttons$' Select 2
	call write_feedback_text Blue '.feedback1$'
	while demoWaitForInput()
		.clickX = -1
		.clickY = -1
		if demoClicked()
			.clickX = demoX()
			.clickY = demoY()
			if demoClickedIn (canvasXL, canvasXR, canvasYL, canvasYH)
				.selectedTime = currentStartTime + (currentEndTime - currentStartTime)*(.clickX - canvasXL + canvasCorrection)/(canvasXR - canvasXL)
				demo Colour... Blue
				demo Line width... 2
				demo Draw line... '.clickX' 'canvasYH' '.clickX' 'canvasYL'
				demo Text special... '.clickX' Centre 'canvasYH' Bottom Helvetica 9 0 '.selectedTime:4'
				demoShow()
				demo Colour... Black
				demo Line width... 'defaultLineWidth'
				if .firstT < 0 and .secondT < 0
					.firstT = .selectedTime
					call write_feedback_text Blue '.feedback2$'
				else
					.secondT = .selectedTime
					call wipeArea 'wipeFeedbackArea$'
					goto ENDOFSELECT
				endif
			else
		    	call buttonClicked 'buttons$' '.clickX' '.clickY'
		    	if buttonClicked.label$ = "Select"
					call init_window
					goto ENDOFSELECT
				endif
			endif
		elsif demoKeyPressed()
			call wipeArea 'wipeFeedbackArea$'
			goto ENDOFSELECT
		endif

	endwhile
	call Draw_button 'buttons$' Select 0
	
	label ENDOFSELECT
	# Do things
	if .firstT >= 0 and .secondT >= 0
		selectedStartTime = min(.firstT, .secondT)
		selectedEndTime = max(.firstT, .secondT)
		call DrawCurrentSelection 0 1
		call log_command MainPage SetSelection 'selectedStartTime' 'selectedEndTime' --
	endif
	call reset_viewport
	call Draw_button 'buttons$' Select 0
	
	label ESCAPESELECT
endproc

procedure processMainPageCANVAS .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "CANVAS"
	.firstT = -1
	.secondT = -1
	if runningCommandMode = 1
		# Do nothing
		skipNextStep = 1
		goto ENDOFDISPLAYSELECT
	elsif currentStartTime <= 0 and currentEndTime <= 0
		goto ENDOFDISPLAYSELECT
	elsif .clickX < canvasXL or .clickX > canvasXR
		goto ESCAPEDISPLAYSELECT
	elsif .clickY < canvasYL or .clickX > canvasYH
		goto ESCAPEDISPLAYSELECT
	elsif buttons.draw$ = "Ltas"
		goto ESCAPEDISPLAYSELECT
	endif
	# Redraw window if there is an old selection
	if selectedStartTime > currentStartTime or selectedEndTime < currentEndTime
		selectedStartTime = currentStartTime
		selectedEndTime = currentEndTime
		call init_window
	endif
	# Get feedback text
	call get_feedback_text 'config.language$' Select2
	.feedback2$ = get_feedback_text.text$
	call reset_viewport
	call write_feedback_text Blue '.feedback2$'
	
	# Set first border
	.selectedTime = currentStartTime + (currentEndTime - currentStartTime)*(.clickX - canvasXL + canvasCorrection)/(canvasXR - canvasXL)
	demo Colour... Blue
	demo Line width... 2
	demo Draw line... '.clickX' 'canvasYH' '.clickX' 'canvasYL'
	demo Text special... '.clickX' Centre 'canvasYH' Bottom Helvetica 9 0 '.selectedTime:4'
	demoShow()
	demo Colour... Black
	demo Line width... 'defaultLineWidth'
	if .firstT < 0 and .secondT < 0
		.firstT = .selectedTime
	endif
	
	# Set second border
	while demoWaitForInput()
		.clickX = -1
		.clickY = -1
		if demoClicked()
			.clickX = demoX()
			.clickY = demoY()
			if demoClickedIn (canvasXL, canvasXR, canvasYL, canvasYH)
				.selectedTime = currentStartTime + (currentEndTime - currentStartTime)*(.clickX - canvasXL + canvasCorrection)/(canvasXR - canvasXL)
				demo Colour... Blue
				demo Line width... 2
				demo Draw line... '.clickX' 'canvasYH' '.clickX' 'canvasYL'
				demo Text special... '.clickX' Centre 'canvasYH' Bottom Helvetica 9 0 '.selectedTime:4'
				demoShow()
				demo Colour... Black
				demo Line width... 'defaultLineWidth'
				if .firstT < 0 and .secondT < 0
					.firstT = .selectedTime
					call write_feedback_text Blue '.feedback2$'
				else
					.secondT = .selectedTime
					call wipeArea 'wipeFeedbackArea$'
					goto ENDOFDISPLAYSELECT
				endif
			else
		    	call buttonClicked 'buttons$' '.clickX' '.clickY'
		    	if buttonClicked.label$ = "Select"
					call init_window
					goto ENDOFDISPLAYSELECT
				endif
			endif
		elsif demoKeyPressed()
			call wipeArea 'wipeFeedbackArea$'
			goto ENDOFDISPLAYSELECT
		endif

	endwhile
	
	label ENDOFDISPLAYSELECT
	# Do things
	if .firstT >= 0 and .secondT >= 0
		selectedStartTime = min(.firstT, .secondT)
		selectedEndTime = max(.firstT, .secondT)
		call DrawCurrentSelection 0 1
		call log_command MainPage SetSelection 'selectedStartTime' 'selectedEndTime' --
	endif
	call reset_viewport
	
	label ESCAPEDISPLAYSELECT
endproc

# Pseudo command for executing log commands
procedure processMainPageSetSelection .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "SetSelection"
	selectedStartTime = min(.clickX, .clickY)
	selectedEndTime = max(.clickX, .clickY)

	call DrawCurrentSelection 0 1
	call reset_viewport
endproc

procedure processMainPageZoomOut .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "ZoomOut"
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
		goto ZOOMOUTESCAPE
	endif
	if buttons.draw$ = "Ltas"
		call Draw_button 'buttons$' ZoomOut 1
		goto ZOOMOUTESCAPE
	endif
	.lockSelectionToWindow = selectedStartTime <= currentStartTime or selectedEndTime >= currentEndTime
	.currentInterval = currentEndTime - currentStartTime
	currentStartTime -= .currentInterval/2
	currentEndTime += .currentInterval/2
	
	.soundLength = 0
	if recordedSound$ <> ""
    	select te.openSound
		.soundLength = Get total duration
	endif
	if currentStartTime < 0
		currentStartTime = 0
	endif
	if currentEndTime > .soundLength
		currentEndTime = .soundLength
	endif
	if .lockSelectionToWindow
		selectedStartTime = currentStartTime
		selectedEndTime = currentEndTime
	endif
	call init_window
	
	label ZOOMOUTESCAPE
endproc

procedure processMainPageZoomIn .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "ZoomIn"
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
		goto ZOOMINESCAPE
	endif
	if buttons.draw$ = "Ltas"
		call Draw_button 'buttons$' ZoomIn 1
		goto ZOOMINESCAPE
	endif
	.currentInterval = currentEndTime - currentStartTime
	currentStartTime += .currentInterval/4
	currentEndTime -= .currentInterval/4
	# Reset selected times if needed
	if selectedStartTime <= currentStartTime
		selectedStartTime = currentStartTime
	endif
	if selectedEndTime >= currentEndTime
		selectedEndTime = currentEndTime
	endif
	
	call init_window
	
	label ZOOMINESCAPE
endproc

procedure processMainPageNext .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Next"
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
		goto NEXTESCAPE
	endif
	if buttons.draw$ = "Ltas"
		call Draw_button 'buttons$' Next 1
		goto NEXTESCAPE
	endif
	.selectedInterval = selectedEndTime - selectedStartTime
	selectedStartTime = selectedEndTime
	selectedEndTime += .selectedInterval
	
	.soundLength = 0
	if recordedSound$ <> ""
    	select te.openSound
		.soundLength = Get total duration
	endif
	# Check boundaries
	if selectedStartTime < 0
		selectedStartTime = 0
		selectedEndTime = .selectedInterval
	endif
	if selectedEndTime > .soundLength
		selectedEndTime = .soundLength
		selectedStartTime = selectedEndTime - .selectedInterval
		if selectedStartTime < 0
			selectedStartTime = 0
		endif
	endif
	# Reset currentStart/EndTimes if the selection is outside the window
	.currentInterval = currentEndTime - currentStartTime
	if selectedStartTime < currentStartTime or selectedEndTime > currentEndTime
		.selectedMidpoint = (selectedEndTime + selectedStartTime)/2
		currentStartTime = .selectedMidpoint - .currentInterval / 2
		currentEndTime = .selectedMidpoint + .currentInterval / 2
	endif
	if currentStartTime < 0
		currentStartTime = 0
		currentEndTime = .currentInterval
	endif
	if currentEndTime > .soundLength
		currentEndTime = .soundLength
		currentStartTime = currentEndTime - .currentInterval
		if currentStartTime < 0
			currentStartTime = 0
		endif
	endif

	call init_window
	
	label NEXTESCAPE
endproc

procedure processMainPagePrevious .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Previous"
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
		goto PREVESCAPE
	endif
	if buttons.draw$ = "Ltas"
		call Draw_button 'buttons$' Previous 1
		goto PREVESCAPE
	endif
	.selectedInterval = selectedEndTime - selectedStartTime
	selectedEndTime = selectedStartTime
	selectedStartTime -= .selectedInterval
	
	.soundLength = 0
	if recordedSound$ <> ""
    	select te.openSound
		.soundLength = Get total duration
	endif
	if selectedStartTime < 0
		selectedStartTime = 0
		selectedEndTime = .selectedInterval
	endif
	if selectedEndTime > .soundLength
		selectedEndTime = .soundLength
		selectedStartTime = selectedEndTime - .selectedInterval
		if selectedStartTime < 0
			selectedStartTime = 0
		endif
	endif
	
	# Reset currentStart/EndTimes if the selection is outside the window
	.currentInterval = currentEndTime - currentStartTime
	if selectedStartTime < currentStartTime or selectedEndTime > currentEndTime
		.selectedMidpoint = (selectedEndTime + selectedStartTime)/2
		currentStartTime = .selectedMidpoint - .currentInterval / 2
		currentEndTime = .selectedMidpoint + .currentInterval / 2
	endif
	if currentStartTime < 0
		currentStartTime = 0
		currentEndTime = .currentInterval
	endif
	if currentEndTime > .soundLength
		currentEndTime = .soundLength
		currentStartTime = currentEndTime - .currentInterval
		if currentStartTime < 0
			currentStartTime = 0
		endif
	endif

	call init_window
	
	label PREVESCAPE
endproc


###############################################################
#
# Miscelaneous supporting code
#
###############################################################

# Print the selected object
procedure PrintPraatObject .minimum .maximum .printObjectCommand$
	if not noDrawingOrWriting
		call PrintSuperImposedPraatObject '.minimum' '.maximum' '.printObjectCommand$'

	    call PrintMarksLeft .minimum .maximum
	    if index(.printObjectCommand$, "0 'config.frequency'") > 0
		    call PrintMarksBottom 0 'config.frequency'
	    else
		    call PrintMarksBottom 'currentStartTime' 'currentEndTime'
	    endif

	endif
endproc

procedure PrintSuperImposedPraatObject .minimum .maximum .printObjectCommand$
	if not noDrawingOrWriting
	    # convert Canvas to absolute coordinates
	    .xL = 0.7
	    .xR = 5.8
	    .yL = 0.47
	    .yH = 4.03
	    Select inner viewport... '.xL' '.xR' '.yL' '.yH'
	    Axes... 0 100 0 100
	    if not (index(.printObjectCommand$, "yes") or index(.printObjectCommand$, "no"))
		    Draw rectangle...  0 100 0 100
	    endif
	    Axes... 0 100 0 100
	    '.printObjectCommand$'
	endif
endproc


procedure PrintCurrentSelection .minimum .maximum
	if not noDrawingOrWriting
	    # convert Canvas to absolute coordinates
	    .xL = 0.7
	    .xR = 5.8
	    .yL = .minimum
	    .yH = .maximum
	    # Mark current selection	
		.selectXstart = selectedStartTime
		.selectXend = selectedEndTime

	    if (.selectXstart > currentStartTime and .selectXstart < currentEndTime) or (.selectXend > currentStartTime and .selectXend < currentEndTime)
		    Colour... Blue
		    Line width... 2
		    if .selectXstart > currentStartTime and .selectXstart < currentEndTime
			    Draw line... '.selectXstart' '.yH' '.selectXstart' '.yL'
			    Text special... '.selectXstart' Centre '.yH' Bottom Helvetica 9 0 'selectedStartTime:4'
		    endif
		    if .selectXend > currentStartTime and .selectXend < currentEndTime
			    Draw line... '.selectXend' '.yH' '.selectXend' '.yL'
			    Text special... '.selectXend' Centre '.yH' Bottom Helvetica 9 0 'selectedEndTime:4'
		    endif
		    Colour... Black
		    Line width... 'defaultLineWidth'
	    endif
	endif
endproc

procedure PrintMarksLeft .minimum .maximum
	if abs(.maximum - .minimum) > 0
		.distance = 10^(ceiling(log10(abs(.maximum - .minimum)))-1)
	else
		.distance = 0
	endif
	if .distance > abs(.maximum - .minimum)/2
		.distance /= 10
	endif
	if .distance <> undefined and .distance > 0
		Marks left every... 1 '.distance' yes yes no
	endif	
endproc

procedure PrintMarksBottom .minimum .maximum
	if abs(.maximum - .minimum) > 0
		.distance = 10^(ceiling(log10(abs(.maximum - .minimum)))-1)
	else
		.distance = 0
	endif
	if .distance > abs(.maximum - .minimum)/2
		.distance /= 10
	endif
	while  .distance > 0 and abs(.maximum - .minimum) / 40 > .distance
		.distance *= 10
	endwhile
	if .distance <> undefined and .distance > 0
		Marks bottom every... 1 '.distance' yes yes no
	endif
endproc

# Draw selected object in demo window
procedure DrawPraatObject .minimum .maximum .drawObjectCommand$
	if not noDrawingOrWriting
	    call reset_viewport
	    call wipeArea 'wipeCanvasArea$'
	    call DrawSuperImposedPraatObject '.minimum' '.maximum' '.drawObjectCommand$'

	    call reset_viewport
	endif
endproc

procedure DrawSuperImposedPraatObject .minimum .maximum .drawObjectCommand$
	if not noDrawingOrWriting
	    # convert Canvas to absolute coordinates
	    .xL = canvasXL + viewportMargin
	    .xR = canvasXR - viewportMargin
	    .yL = canvasYL + viewportMargin
	    .yH = canvasYH - viewportMargin
	    demo Select inner viewport... '.xL' '.xR' '.yL' '.yH'
	    if not (index(.drawObjectCommand$, "yes") or index(.drawObjectCommand$, "no"))
		    demo Draw rectangle...  0 100 0 100
	    endif
	    demo Axes... 0 100 0 100
		if not (.minimum = undefined or .maximum = undefined)
			if .minimum = .maximum			
				.minimum -= 1
				.maximum += 1
			endif			
	    	demo '.drawObjectCommand$'
	    	call DrawMarksLeft '.minimum' '.maximum'
	    	if buttons.draw$ = "Ltas"
		    	call DrawMarksBottom 0 'config.frequency'
	    	else
		    	call DrawMarksBottom 'currentStartTime' 'currentEndTime'

		    	if maxTimeHarmonicity > 0
					call DrawMarkAtTime 'maxTimeHarmonicity' '.minimum' '.maximum' Green
				endif
				if voicingTextGrid > 0
					select voicingTextGrid
					.numIntervals = Get number of intervals... 1
					for .interval to .numIntervals
						.label$ = Get label of interval... 1 '.interval'
						if .label$ = "V"
							.start = Get start point... 1 '.interval'
							.end = Get end point... 1 '.interval'
							.duration = .end - .start
							# Interval is in window
							if .start < currentEndTime and .end > currentStartTime
							    demo Colour... {0.5, 0.5, 0.8}
							    demo Line width... 1
							    .botPoint = .minimum - (.maximum - .minimum)/50
							    .leftPoint = max(.start, currentStartTime)
							    .rightPoint = min(.end, currentEndTime)
								demo Draw line... '.leftPoint' '.botPoint' '.rightPoint' '.botPoint'
							    demoShow()
							    demo Colour... Black
							    demo Line width... 'defaultLineWidth'
							endif
						endif
						
					endfor
				endif
				
	    	endif

		endif
	    demoShow()

	endif
endproc

procedure DrawMarkAtTime .time .minimum .maximum .color$
	if not noDrawingOrWriting
		if (.time > currentStartTime and .time < currentEndTime)
		    demo Colour... '.color$'
		    demo Line width... 2
		    .topPoint = .minimum
		    .botPoint = .minimum - (.maximum - .minimum)/30
		    .leftPoint = .time - (currentEndTime - currentStartTime)/100
		    .rightPoint = .time + (currentEndTime - currentStartTime)/100
		    demo Draw line... '.time' '.topPoint' '.leftPoint' '.botPoint'
		    demo Draw line... '.time' '.topPoint' '.rightPoint' '.botPoint'
		    demoShow()
		    demo Colour... Black
		    demo Line width... 'defaultLineWidth'
		endif
	endif
endproc

procedure DrawCurrentSelection .minimum .maximum
	if not noDrawingOrWriting
	    # Mark current selection	
	    .selectXstart = -1
	    .selectXend = -1
	    if (selectedStartTime > currentStartTime and selectedStartTime < currentEndTime)
		    .selectXstart = canvasXL+(selectedStartTime-currentStartTime)/(currentEndTime - currentStartTime) * (canvasXR - canvasXL) - canvasCorrection
	    endif
	    if (selectedEndTime > currentStartTime and selectedEndTime < currentEndTime)
		    .selectXend = canvasXL+(selectedEndTime-currentStartTime)/(currentEndTime - currentStartTime) * (canvasXR - canvasXL) - canvasCorrection
	    endif
	    if .selectXstart > 0 or .selectXend > 0
		    demo Colour... Blue
		    demo Line width... 2
		    call set_font_size 9
		    demo Helvetica
		    .startTextWidth = 0
		    .endTextWidth = 0
		    if .selectXstart > 0
			    demo Draw line... '.selectXstart' 'canvasYH' '.selectXstart' 'canvasYL'
			    demo Text special... '.selectXstart' Centre 'canvasYH' Bottom Helvetica 9 0 'selectedStartTime:4'
			    .startTextWidth = demo Text width (wc)... 'selectedStartTime:4'
		    endif
		    if .selectXend > 0
			    demo Draw line... '.selectXend' 'canvasYH' '.selectXend' 'canvasYL'
			    demo Text special... '.selectXend' Centre 'canvasYH' Bottom Helvetica 9 0 'selectedEndTime:4'
			    .endTextWidth = demo Text width (wc)... 'selectedEndTime:4'
		    endif
		    # Write intervalduration
		    .intervalDuration = selectedEndTime - selectedStartTime
		    .minPos = max(.selectXstart, canvasXL)
		    .maxPos = min(.selectXend, canvasXR)
		    .spaceAvailable = (.maxPos - .minPos) - (.startTextWidth+.endTextWidth)/2
		    .textPosition = (.minPos + .maxPos)/2
		    .intervalDurationText$ = "['.intervalDuration:4']"
		    .textWidth = demo Text width (wc)... '.intervalDurationText$'
		    while index_regex(.intervalDurationText$, "[1-9]") and .textWidth > .spaceAvailable
				.intervalDurationText$ = replace_regex$(.intervalDurationText$, "[\d\.]\]", "]", 0)
				.textWidth = demo Text width (wc)... '.intervalDurationText$'
		    endwhile
		    if index_regex(.intervalDurationText$, "[1-9]")
				demo Text special... '.textPosition' Centre 'canvasYH' Bottom Helvetica 9 0 '.intervalDurationText$'
		    endif
		    
		    demoShow()
		    call set_font_size 'defaultFontSize'
			demo 'defaultFont$'
		    demo Colour... Black
		    demo Line width... 'defaultLineWidth'
	    endif
	    call writeAnalysisValues 'buttons.draw$'
	endif
endproc

procedure DrawMarksLeft .minimum .maximum
	.distance = 10^(ceiling(log10(abs(.maximum - .minimum)))-1)
	if .distance > abs(.maximum - .minimum)/2
		.distance /= 10
	endif
	if .distance <> undefined
		demo Marks left every... 1 '.distance' yes yes no
	endif	
endproc

procedure DrawMarksBottom .minimum .maximum
	.distance = 10^(ceiling(log10(abs(.maximum - .minimum)))-1)
	if .distance > abs(.maximum - .minimum)/2
		.distance /= 10
	endif
	while  .distance > 0 and abs(.maximum - .minimum) / 40 > .distance
		.distance *= 10
	endwhile
	if .distance <> undefined
		demo Marks bottom every... 1 '.distance' yes yes no
	endif
endproc

procedure DrawPitchObject
	if te.openSound > 0 and pitchName$ = ""
		select te.openSound
		noprogress To Pitch... 0 60 600
		pitchName$ = selected$("Pitch")
		minPitch = Get minimum... 0 0 Hertz Parabolic
		minPitch = floor(minPitch)
		maxPitch = Get maximum... 0 0 Hertz Parabolic
		maxPitch = ceiling(maxPitch)
		if minPitch = undefined or maxPitch = undefined
			minPitch = 0
			maxPitch = 600
		endif
		To PointProcess
		pointProcessName$ = selected$("PointProcess")
		voicingTextGrid = To TextGrid (vuv)... 0.2 0.1
	endif

	if pitchName$ <> ""
		select Pitch 'pitchName$'
		call 'mainPage.outputPraatObject$'PraatObject 'minPitch' 'maxPitch' Draw... 'currentStartTime' 'currentEndTime' 'minPitch' 'maxPitch' yes
		call 'mainPage.outputPraatObject$'CurrentSelection 'minPitch' 'maxPitch'
	endif
endproc

# Do not recalculate without need
procedure DrawHarmonicityObject
	if te.harmonicity > 0
		if currentStartTime != previousHarmonicityStart or currentEndTime != previousHarmonicityEnd
			select te.harmonicity
			Remove
			harmonicityName$ = ""
			te.harmonicity = 0
		endif
	endif
	if recordedSound$ <> ""
		if te.harmonicity = 0 or currentStartTime != previousHarmonicityStart or currentEndTime != previousHarmonicityEnd
			.timeStep = (currentEndTime - currentStartTime) / 500
			# do not exagerate precision
			if .timeStep < 0.001
				.timeStep = 0.001
			endif
			.cutStart = 0.9 * currentStartTime
			.cutEnd = 1.1 * currentEndTime
			select Sound Speech
			.tmpPartID = Extract part... '.cutStart' '.cutEnd' rectangular 1.0 true
			Rename... TmpPart
			te.harmonicity = noprogress To Harmonicity (cc)... '.timeStep' 60 0.1 1.0
			# Arbitrarily put a floor of 0dB on the Harmonicity to Noise ratio
			Formula... if self < 0 then 0 else self fi
			harmonicityName$ = selected$("Harmonicity")
			previousHarmonicityStart = currentStartTime
			previousHarmonicityEnd = currentEndTime
			select .tmpPartID
			Remove
		endif
		select te.harmonicity
		minHarmonicity = Get minimum... 0 0 Parabolic
		minHarmonicity = floor(minHarmonicity)
		if minHarmonicity < 0
			minHarmonicity = 0
		endif
		maxHarmonicity = Get maximum... 0 0 Parabolic
		maxHarmonicity = ceiling(maxHarmonicity)
		if minHarmonicity = undefined or maxHarmonicity = undefined
			minHarmonicity = 0
			maxHarmonicity = 30
		endif
		# Get smoothed maximum harmonicity
		select te.harmonicity
		.tmpMatrix = To Matrix
		select .tmpMatrix
		.tmpSound = To Sound (slice)... 1
		.tmpFiltered = Filter (pass Hann band)... 0 5 5
		maxTimeHarmonicity = Get time of maximum... 0 0 Parabolic
		# Remove temporary files
		select .tmpMatrix
		plus .tmpSound
		plus .tmpFiltered
		Remove

		select te.harmonicity
		call 'mainPage.outputPraatObject$'PraatObject 'minHarmonicity' 'maxHarmonicity' Draw... 'currentStartTime' 'currentEndTime' 'minHarmonicity' 'maxHarmonicity'
		call 'mainPage.outputPraatObject$'CurrentSelection 'minHarmonicity' 'maxHarmonicity'
		
	endif
endproc

##################################################################
#
# Mostly useless as the GNE tends to increase for short intervals.
# Do not recalculate without need
procedure DrawGNEObject
	.windowSize = 0.120
	if gneName$ <> ""
		if currentStartTime != previousGNEstart or currentEndTime != previousGNEend
			select Sound 'gneName$'
			Remove
			gneName$ = ""
		endif
	endif
	if recordedSound$ <> ""
		if gneName$ = "" or currentStartTime != previousGNEstart or currentEndTime != previousGNEend
			.timeStep = 0.01
			.cutStart = currentStartTime
			.cutEnd = currentEndTime
			select Sound Speech
			.tmpPartID = Extract part... '.cutStart' '.cutEnd' rectangular 1.0 true
			Rename... TmpPart
			.gneSoundID = Create Sound from formula... GNE Mono '.cutStart' '.cutEnd' 100 0
			for .t from ceiling(.windowSize/(2*.timeStep)) to floor((.cutEnd - .cutStart - .windowSize/2)/.timeStep)
				.t1 = .cutStart + .t*.timeStep - .windowSize/2
				.t2 = .t1 + .timeStep + .windowSize
				select .tmpPartID
				.frameID = Extract part... '.t1' '.t2' rectangular 1.0 true
				.gneID = noprogress To Harmonicity (gne)... 500 4500 1000 80
				.gneValue = Get maximum
				select .frameID
				plus .gneID
				Remove
				select .gneSoundID
				Set value at sample number... '.t' '.gneValue'
			endfor
			select .gneSoundID
			gneName$ = selected$("Sound")
			previousGNEstart = currentStartTime
			previousGNEend = currentEndTime
			select .tmpPartID
			Remove
		endif
		minGNE = 0
		maxGNE = 1

		select Sound 'gneName$'
		call 'mainPage.outputPraatObject$'PraatObject 'minGNE' 'maxGNE' Draw... 'currentStartTime' 'currentEndTime' 0 0 yes Curve
		call 'mainPage.outputPraatObject$'CurrentSelection 'minGNE' 'maxGNE'
		
	endif
endproc

procedure calculateGNEValues
	.maxGNE = 0
	.minGNE = 0
	.meanGNE = 0
	.sdGNE = 0
	if gneName$ <> ""
		select Sound 'gneName$'
		.maxGNE = Get maximum... 'selectedStartTime' 'selectedEndTime' Parabolic
		.minGNE = Get minimum... 'selectedStartTime' 'selectedEndTime' Parabolic
		.meanGNE = Get mean... 'selectedStartTime' 'selectedEndTime'
		.sdGNE = Get standard deviation... 'selectedStartTime' 'selectedEndTime'
	endif
	
	.text$ = "GNE - Max.: '.maxGNE:2', Min.: '.minGNE:2', Mean: '.meanGNE:2', SD: '.sdGNE:3'"
	.shorttextAST$ = ""
endproc

#################################

procedure DrawPitchTierObject
	if recordedSound$ <> "" and pitchTierName$ = ""
	endif
	if pitchTierName$ <> ""
		select PitchTier 'pitchTierName$'
		call 'mainPage.outputPraatObject$'PraatObject 'minPitch' 'maxPitch' Draw... 'currentStartTime' 'currentEndTime' 'minPitch' 'maxPitch' yes
		call 'mainPage.outputPraatObject$'CurrentSelection 'minPitch' 'maxPitch'
	endif
endproc

procedure DrawSpectrogramObject

	if recordedSound$ <> "" and te.spectrogram = 0
		select Sound Speech
		.nyquistFrequency = sampleFrequency / 2
		te.spectrogram = noprogress To Spectrogram... 0.1 '.nyquistFrequency' 0.001 10 Gaussian
		spectrogramName$ = selected$("Spectrogram")
		select Sound Speech
		te.formant = noprogress To Formant (burg)... 0.02 4 4400 0.1 50
		formantName$ = selected$("Formant")
		
	endif

	if te.spectrogram > 0
		select te.spectrogram
		call 'mainPage.outputPraatObject$'PraatObject 0 'config.frequency' Paint... 'currentStartTime' 'currentEndTime' 0 'config.frequency' 80 yes 70 6 0 yes
		if config.showFormants > 0
			if mainPage.outputPraatObject$ = "Draw"
				demo Colour... Maroon
			else
				Colour... Maroon
			endif
			select te.formant
			call 'mainPage.outputPraatObject$'SuperImposedPraatObject 0 'config.frequency' Speckle... 'currentStartTime' 'currentEndTime' 'config.frequency' 25 no
			if mainPage.outputPraatObject$ = "Draw"
				demo Colour... Black
			else
				Colour... Black
			endif
		endif
		call 'mainPage.outputPraatObject$'CurrentSelection 0 'config.frequency'
		call writeAnalysisValues 'buttons.draw$'
	endif
endproc

procedure DrawLtasObject
	if ltasName$ <> ""
		select Ltas 'ltasName$'
		Remove
		ltasName$ = ""
	endif
	if recordedSound$ <> ""
		select te.openSound
		.tmpPartID = Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 false
		Rename... TmpPart
		.tmpSpecID = noprogress To Spectrum... yes
		.tmpLtasID = noprogress To Ltas (1-to-1)
		ltasName$ = selected$("Ltas")
		.minimum = -20
		.maximum = Get maximum... 0 0 None
		call 'mainPage.outputPraatObject$'PraatObject '.minimum' '.maximum' Draw... 0 'config.frequency' '.minimum' '.maximum' yes Curve
		
		call writeAnalysisValues 'buttons.draw$'
		
		select .tmpPartID
		plus .tmpSpecID
		Remove
	endif
endproc

procedure DrawIntensityObject
	if recordedSound$ <> "" and intensityName$ = ""
		select Sound Speech
		noprogress To Intensity... 60 0 yes
		intensityName$ = selected$("Intensity")
		minIntensity = Get minimum... 0 0 Parabolic
		if minIntensity < 0
			minIntensity = 0
		else
			minIntensity = floor(minIntensity)
		endif
		maxIntensity = Get maximum... 0 0 Parabolic
		maxIntensity = ceiling(maxIntensity)
		maxTimeIntensity = Get time of maximum... 0 0 Parabolic
		if minIntensity = undefined or maxIntensity = undefined
			minIntensity = 0
			maxIntensity = 100
		endif
	endif
	
	if intensityName$ <> ""
		select Intensity 'intensityName$'
		call 'mainPage.outputPraatObject$'PraatObject 'minIntensity' 'maxIntensity' Draw... 'currentStartTime' 'currentEndTime' 'minIntensity' 'maxIntensity' yes
		call 'mainPage.outputPraatObject$'CurrentSelection 'minIntensity' 'maxIntensity'
	endif
endproc

procedure DrawSoundObject
	if recordedSound$ <> ""
		select te.openSound
		.minimum = Get minimum... 0 0 None
		.maximum = Get maximum... 0 0 None
		if not (.minimum = undefined or .maximum = undefined)
			if .minimum = .maximum			
				.minimum -= 1
				.maximum += 1
			endif
			call 'mainPage.outputPraatObject$'PraatObject '.minimum' '.maximum' Draw... 'currentStartTime' 'currentEndTime' 0 0 yes Curve
			call 'mainPage.outputPraatObject$'CurrentSelection '.minimum' '.maximum'
		endif
	endif
endproc

procedure write_feedback_text .color$ .feedback$
    call wipeArea 'wipeFeedbackArea$'
	demo Colour... '.color$'
	.newFontSize = 14
	call adjustFontSizeOnWidth '.newFontSize' 80 '.feedback$'
	.newFontSize = adjustFontSizeOnWidth.newFontSize

	demo Text special... 40 Centre 15 bottom Helvetica '.newFontSize' 0 '.feedback$'
	demoShow()
	demo Colour... Black
endproc

procedure write_header_text .color$ .headertext$
    call wipeArea 'wipeHeaderArea$'
	demo Colour... '.color$'
	.newFontSize = 14
	call adjustFontSizeOnWidth '.newFontSize' 80 '.headertext$'
	.newFontSize = adjustFontSizeOnWidth.newFontSize

	demo Text special... 40 Centre 97.5 bottom Helvetica '.newFontSize' 0 '.headertext$'
	demoShow()
	demo Colour... Black
endproc

procedure writeAnalysisValues .drawObject$
	call calculate'.drawObject$'Values
	.textToWrite$ = calculate'.drawObject$'Values.text$
	.textToWrite$ = .textToWrite$ + calculate'.drawObject$'Values.shorttextAST$
	if not noDrawingOrWriting
		call write_feedback_text Blue '.textToWrite$'
	endif
endproc

procedure saveSound .table$ .label$
	# Get feedback texts
	call getLanguageTexts '.table$' '.label$'
	.writeDialogue$ = getLanguageTexts.helpText$
	call convert_praat_to_latin1 '.writeDialogue$'
	.writeDialogue$ = convert_praat_to_latin1.text$
	.filename$ = ""
	
	# Set Footer text
	.footerText$ = "<footer>'newline$'"
	.footerText$ = .footerText$ + "<p style=""text-align:right; font-size:10pt; color:gray; "">"
	.footerText$ = .footerText$ + "<i>Created with NKI TE-VOICE ANALYSIS TOOL 1.0: 'build_SHA$'</i></p>'newline$'"
	.footerText$ = .footerText$ + "</footer>'newline$'"
	
	# Do not print "nothing"
	.currentID$ = ""
	if speakerID$ <> ""
		.currentID$ = replace_regex$(speakerID$, "^\W*([\w\- ]+).*$", "\1", 0)
		.currentID$ = replace_regex$(.currentID$, " ", "_", 0)
	else
		.currentID$ = "TEanalysis"
	endif
	.filename$ = ""
	if currentSoundName$ <> ""
		if unix
			.dirname$ = chooseWriteFile$ (.writeDialogue$, "'.currentID$'")
		else
			.dirname$ = chooseWriteFile$ (.writeDialogue$, "'.currentID$'")
		endif
		if .dirname$ <> ""
	    	.filename$ = replace_regex$(.dirname$, "([\\/:])([\w\-\s]+)$","\1\2\1\2.html",0)
		endif
		# Append directory separator to directory path
		.dirname$ = replace_regex$(.dirname$, "([\\/:])([\w\-\s]+)$","\1\2\1",0)
	endif
	.localAudioFileName$ = ""
	if .filename$ <> ""
	   createDirectory(.dirname$)
	   .outFileName$ = replace_regex$(.filename$, "\.[a-z0-9A-Z]+$","",0)
		# Supress drawing
		noDrawingOrWriting = 1
		# Create new filename if sound is recorded
		if currentSoundName$ <> ""
			.rightPos = length(.filename$) - rindex_regex(.filename$, "[\\/:]")
			.pathlessFilename$ = right$(.filename$, .rightPos)
			.pathlessFilename$ = replace_regex$(.pathlessFilename$, "(\.[a-z0-9A-Z]+)$", "", 0)
			# Create new filename if needed
			if te.currentFileName$ = ""
				.pathlessAudioFilename$ = pathlessFilename$
				if speakerID$ <> "" and index(.filename$, .currentID$)
					te.currentFileName$ = .dirname$+.pathlessAudioFilename$+"_'te.recordingTimeStamp$'.wav"
				else
					te.currentFileName$ = .dirname$+.pathlessAudioFilename$+"_'.currentID$'-'te.recordingTimeStamp$'.wav"
				endif
			else
				.rightPos = length(te.currentFileName$) - rindex_regex(te.currentFileName$, "[\\/:]")
				.pathlessAudioFilename$ = right$(te.currentFileName$, .rightPos)
				.pathlessAudioFilename$ = replace_regex$(.pathlessAudioFilename$, "(\.[a-z0-9A-Z]+)$", "", 0)
				te.currentFileName$ = .dirname$+.pathlessAudioFilename$+".wav"	
			endif
			select te.openSound
			nowarn Save as WAV file... 'te.currentFileName$'
			.rightPos = length(te.currentFileName$) - rindex_regex(te.currentFileName$, "[\\/:]")
			.localAudioFileName$ = right$(te.currentFileName$, .rightPos)
		endif
		
		# Store current data in Table
		if speakerID$ <> ""
			call WriteSpeakerData
		endif
		
		.date$ = date$()
		deleteFile(.filename$)
		# Write to file
		.htmlText$ = ""
		
		# HTML header
		.htmlText$ = .htmlText$ + "<html>'newline$'<head><title>'speakerID$'</title></head>'newline$'"
		.htmlText$ = .htmlText$ + "<body>'newline$'"
		.htmlText$ = .htmlText$ + "<h1 style=""text-align: center;"">'speakerID$'</H1>'newline$'"
		.htmlText$ = .htmlText$ + "<H2 align=""CENTER"">'.date$'</H2>'newline$'"
		
		# Speaker ID en Text
		call get_feedback_text 'config.language$' SpeakerText
		get_feedback_text.text$ = replace$(get_feedback_text.text$, "_", " ", 0)
		call convert_praat_to_html 'get_feedback_text.text$'
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">'convert_praat_to_html.text$':'newline$'"
		.htmlText$ = .htmlText$ + "'speakerInfo$'</p>'newline$'"
		
		if speakerComments$ <> ""
			.htmlText$ = .htmlText$ + "<p><blockquote>'newline$'"
			.htmlText$ = .htmlText$ + "'speakerComments$''newline$'"
			.htmlText$ = .htmlText$ + "</blockquote></p>'newline$'"
		endif
		
		# Link to audio
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">"
		call get_feedback_text 'config.language$' Recording
		call convert_praat_to_html 'get_feedback_text.text$'
		.htmlText$ = .htmlText$ + "'convert_praat_to_html.text$': 'newline$'"
		.htmlText$ = .htmlText$ + "<a href=""'.localAudioFileName$'"" target=""_blank"">'.currentID$'</a>'newline$'"
		.htmlText$ = .htmlText$ + "</p>'newline$'"
		
		# Write Acoustic measurements
		.htmlText$ = .htmlText$ + "<p>'newline$'"
		call calculateTimeValues
		call convert_praat_to_html 'calculateTimeValues.text$'
		.currentLine$ = convert_praat_to_html.text$
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">'.currentLine$'</p>'newline$'"
		
		.htmlText$ = .htmlText$ + "<center><table>'newline$'"
		.htmlText$ = .htmlText$ + "<tr valign=""top"" width=""100%""><td width=""30%"">'newline$'"
		
		call DrawPitchObject
		call calculatePitchValues
		call convert_praat_to_html 'calculatePitchValues.text$'
		.currentLine$ = replace_regex$(convert_praat_to_html.text$, " - ", "</b><blockquote>", 0)
		.currentLine$ = replace_regex$(.currentLine$, ", ", "<br />", 0)
		.htmlText$ = .htmlText$ + "<p><b>'.currentLine$'</blockquote></p>'newline$'"

		.htmlText$ = .htmlText$ + "</td><td width=""30%"">'newline$'"
		
		call DrawSpectrogramObject
		call calculateSpectrogramValues
		call convert_praat_to_html 'calculateSpectrogramValues.text$'
		.currentLine$ = replace_regex$(convert_praat_to_html.text$, " - ", "</b><blockquote>", 0)
		.currentLine$ = replace_regex$(.currentLine$, ", ", "<br />", 0)
		.htmlText$ = .htmlText$ + "<p><b>'.currentLine$'</blockquote></p>'newline$'"
		
		.htmlText$ = .htmlText$ + "</td><td width=""30%"">'newline$'"

		call DrawLtasObject
		call calculateLtasValues
		call convert_praat_to_html 'calculateLtasValues.text$'
		.currentLine$ = replace_regex$(convert_praat_to_html.text$, " - ", "</b><blockquote>", 0)
		.currentLine$ = replace_regex$(.currentLine$, ", ", "<br />", 0)
		.htmlText$ = .htmlText$ + "<p><b>'.currentLine$'</blockquote></p>'newline$'"
		
		.htmlText$ = .htmlText$ + "</td></tr>'newline$'"
		
		.htmlText$ = .htmlText$ + "<tr valign=""top"" width=""100%""><td >'newline$'"
		call DrawIntensityObject
		call calculateIntensityValues
		call convert_praat_to_html 'calculateIntensityValues.text$'
		.currentLine$ = replace_regex$(convert_praat_to_html.text$, " - ", "</b><blockquote>", 0)
		.currentLine$ = replace_regex$(.currentLine$, ", ", "<br />", 0)
		.htmlText$ = .htmlText$ + "<p><b>'.currentLine$'</blockquote></p>'newline$'"

		.htmlText$ = .htmlText$ + "</td><td width=""30%"">'newline$'"
		
		call DrawHarmonicityObject
		call calculateHarmonicityValues
		call convert_praat_to_html 'calculateHarmonicityValues.text$'
		.currentLine$ = replace_regex$(convert_praat_to_html.text$, " - ", "</b><blockquote>", 0)
		.currentLine$ = replace_regex$(.currentLine$, ", ", "<br />", 0)
		.htmlText$ = .htmlText$ + "<p><b>'.currentLine$'</blockquote></p>'newline$'"

		.htmlText$ = .htmlText$ + "</td><td></td></tr>'newline$'"
		.htmlText$ = .htmlText$ + "</table></center>'newline$'"
		.htmlText$ = .htmlText$ + "'newline$'"
		
		.htmlText$ = .htmlText$ + "<center><table>'newline$'"
		.htmlText$ = .htmlText$ + "<tr valign=""top"" width=""100%""><td width=""45%"">'newline$'"
		call autoSetPathType
		call convert_praat_to_html 'pathologicalTypeText$'
		.htmlText$ = .htmlText$ + "<h3>'convert_praat_to_html.text$'</h3>'newline$'"

		# Write AST values
		.htmlText$ = .htmlText$ + "<p><ul>'newline$'"
		call DrawPitchObject
		call calculatePitchValues
		call convert_praat_to_html 'calculatePitchValues.textAST$'
		.htmlText$ = .htmlText$ + "'convert_praat_to_html.text$''newline$'"
		
		call DrawLtasObject
		call calculateLtasValues
		call convert_praat_to_html 'calculateLtasValues.textAST$'
		.htmlText$ = .htmlText$ + "'convert_praat_to_html.text$''newline$'"
		
		call DrawHarmonicityObject
		call calculateHarmonicityValues
		call convert_praat_to_html 'calculateHarmonicityValues.textAST$'
		.htmlText$ = .htmlText$ + "'convert_praat_to_html.text$''newline$'"
		.htmlText$ = .htmlText$ + "</ul></p>'newline$'"
		.htmlText$ = .htmlText$ + "</td></tr>'newline$'"
		.htmlText$ = .htmlText$ + "</table></center>'newline$'"
		.htmlText$ = .htmlText$ + "'newline$'"

		# Print out the build version
		.htmlText$ = .htmlText$ + .footerText$
		
		# Enable drawing
		noDrawingOrWriting = 0
		
		# Now save the pictures
		call print_signal '.filename$'
		
		# Set output format
		.outExtension$ = "eps"
		.outFileType$ = "EPS file"
		if macintosh
			.outExtension$ = "pdf"
			.outFileType$ = "PDF file"
		elsif windows
			.outExtension$ = "emf"
			.outFileType$ = "Windows metafile"
		endif
		
		# Construct picture links
		call getButtonText '.table$' Draw_Sound
		.htmlText$ = .htmlText$ + "<h1 align=""CENTER"" style=""text-align: center;page-break-before:always;"">'getButtonText.html$'</h1><p style=""text-align: center""><a href=""'.outExtension$'/'.pathlessFilename$'_Sound.'.outExtension$'"" target=""_blank""><img src=""'.outExtension$'/'.pathlessFilename$'_Sound.'.outExtension$'"" width=""70%"" /></a></p>'newline$'"

		call getButtonText '.table$' Draw_Pitch
		.htmlText$ = .htmlText$ + "<h1 style=""text-align: center;"">'getButtonText.html$'</h1><p style=""text-align: center""><a href=""'.outExtension$'/'.pathlessFilename$'_Pitch.'.outExtension$'"" target=""_blank""><img src=""'.outExtension$'/'.pathlessFilename$'_Pitch.'.outExtension$'"" width=""70%"" /></a></p>'newline$'"
		call convert_praat_to_html 'calculatePitchValues.text$'
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">'convert_praat_to_html.text$'</p>'newline$'"

		# Print out the build version
		.htmlText$ = .htmlText$ + .footerText$

		call getButtonText '.table$' Draw_Spectrogram
		.htmlText$ = .htmlText$ + "<h1 style=""text-align: center;page-break-before:always;"">'getButtonText.html$'</h1><p style=""text-align: center""><a href=""'.outExtension$'/'.pathlessFilename$'_Spectrogram.'.outExtension$'"" target=""_blank""><img src=""'.outExtension$'/'.pathlessFilename$'_Spectrogram.'.outExtension$'"" width=""70%"" /></a></p>'newline$'"
		call convert_praat_to_html 'calculateSpectrogramValues.text$'
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">'convert_praat_to_html.text$'</p>'newline$'"

		call getButtonText '.table$' Draw_Ltas
		.htmlText$ = .htmlText$ + "<h1 style=""text-align: center;"">'getButtonText.html$'</h1><p style=""text-align: center""><a href=""'.outExtension$'/'.pathlessFilename$'_Ltas.'.outExtension$'"" target=""_blank""><img src=""'.outExtension$'/'.pathlessFilename$'_Ltas.'.outExtension$'"" width=""70%"" /></a></p>'newline$'"
		call convert_praat_to_html 'calculateLtasValues.text$'
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">'convert_praat_to_html.text$'</p>'newline$'"

		# Print out the build version
		.htmlText$ = .htmlText$ + .footerText$

		call getButtonText '.table$' Draw_Intensity
		.htmlText$ = .htmlText$ + "<h1 style=""text-align: center;page-break-before:always;"">'getButtonText.html$'</h1><p style=""text-align: center""><a href=""'.outExtension$'/'.pathlessFilename$'_Intensity.'.outExtension$'"" target=""_blank""><img src=""'.outExtension$'/'.pathlessFilename$'_Intensity.'.outExtension$'"" width=""70%"" /></a></p>'newline$'"
		call convert_praat_to_html 'calculateIntensityValues.text$'
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">'convert_praat_to_html.text$'</p>'newline$'"

		call getButtonText '.table$' Draw_Harmonicity
		.htmlText$ = .htmlText$ + "<h1 style=""text-align: center;"">'getButtonText.html$'</h1><p style=""text-align: center""><a href=""'.outExtension$'/'.pathlessFilename$'_Harmonicity.'.outExtension$'"" target=""_blank""><img src=""'.outExtension$'/'.pathlessFilename$'_Harmonicity.'.outExtension$'"" width=""70%"" /></a></p>'newline$'"
		call convert_praat_to_html 'calculateHarmonicityValues.text$'
		.htmlText$ = .htmlText$ + "<p style=""text-align: center"">'convert_praat_to_html.text$'</p>'newline$'"
		
		# Print out the build version
		.htmlText$ = .htmlText$ + .footerText$
		
		# Closing HTML footer
		.htmlText$ = .htmlText$ + "</body>'newline$'"
		.htmlText$ = .htmlText$ + "</html>'newline$'"
		
		
		# Also write EPS version
		if .outExtension$ <> "eps"
			.htmlText$ > '.filename$'
		endif
		
		# Convert to PNG
		if unix and fileReadable("/usr/bin/convert")
			.pngHtmlText$ = replace_regex$(.htmlText$, "(\.)'.outExtension$'("")", "\1png\2", 0)
			.pngHtmlText$ = replace_regex$(.pngHtmlText$, "("")'.outExtension$'(/)", "\1png\2", 0)
			.pngFilename$ = .filename$
			.pngHtmlText$ > '.pngFilename$'
		endif
		
		# Output EPS
		.epsHtmlText$ = replace_regex$(.htmlText$, "(\.)'.outExtension$'("")", "\1eps\2", 0)
		.epsHtmlText$ = replace_regex$(.epsHtmlText$, "("")'.outExtension$'(/)", "\1eps\2", 0)
		.epsFilename$ = replace_regex$(.filename$, "\.html", ".odt", 0)
		.epsHtmlText$ > '.epsFilename$'
	else
		# Do nothing
	endif
	
endproc

procedure calculatePitchValues
	.numberFrames = 0
	.voicedFrames = 0
	.meanPitch = 0
	.sdPitch = 0
	.voicedFractions = 0
	.jitter = 0
	.shimmer = 0
	.shorttextAST$ = ""
	
	if pitchName$ <> ""
		select Pitch 'pitchName$'
		.startFrame = Get frame number from time... 'selectedStartTime'
		.endFrame = Get frame number from time... 'selectedEndTime'
		for .i from .startFrame to .endFrame
			.numberFrames += 1
			.currentValue = Get value in frame... '.i' Hertz
			if .currentValue != undefined
				.voicedFrames += 1
			endif
		endfor
		.meanPitch = Get mean... 'selectedStartTime' 'selectedEndTime' Hertz
		.sdPitch = Get standard deviation... 'selectedStartTime' 'selectedEndTime' Hertz
		.medianPitch = Get quantile... 'selectedStartTime' 'selectedEndTime' 0.5 Hertz
		if .numberFrames > 0
			.voicedFractions = .voicedFrames/.numberFrames
		endif
		select PointProcess 'pitchName$'
		.jitter = Get jitter (local)... 'selectedStartTime' 'selectedEndTime' 0.0001 0.05 5
		select Sound 'pitchName$'
		plus PointProcess 'pitchName$'
		.shimmer = Get shimmer (local)... 'selectedStartTime' 'selectedEndTime' 0.0001 0.05 5 5
	endif
	if voicingTextGrid > 0
		select voicingTextGrid
		.numberOfIntervals = Get number of intervals... 1
		.maximumVoicingDuration = 0
		.mvdIntervalNumber = 0
		for .interval to .numberOfIntervals
			.label$ = Get label of interval... 1 '.interval'
			if .label$ = "V"
				.start = Get start point... 1 '.interval'
				.end = Get end point... 1 '.interval'
				.duration = .end - .start
				if .duration > .maximumVoicingDuration
					.maximumVoicingDuration = .duration
					.mvdIntervalNumber = .interval
				endif
			endif
		endfor
	endif
	
	call get_feedback_text 'config.language$' PitchValues
	.pitchValues$ = get_feedback_text.text$
	.pitchValues$ = replace$(.pitchValues$, "MAXIMUMVOICINGDUR$", "'.maximumVoicingDuration:1's", 0)
	.pitchValues$ = replace$(.pitchValues$, "VOICEDFRACTIONS$", "'.voicedFractions:1%'", 0)
	.pitchValues$ = replace$(.pitchValues$, "JITTER$", "'.jitter:1%'", 0)
	.pitchValues$ = replace$(.pitchValues$, "SHIMMER$", "'.shimmer:1%'", 0)
	.pitchValues$ = replace$(.pitchValues$, "MEANPITCH$", "'.meanPitch:0'", 0)
	.pitchValues$ = replace$(.pitchValues$, "SDPITCH$", "'.sdPitch:1'", 0)
	.pitchValues$ = replace$(.pitchValues$, "MEDIANPITCH$", "'.medianPitch:0'", 0)
	.text$ = .pitchValues$
	
	# Calculated from van As, C.J. "Tracheolesophageal Speech", 2001, p88
	# Acoustic Signal Typing: Pitch
	call setPathParameter 'pathologicalParameters' Pitch '.sdPitch'
	
	.textAST$ = "";
	.astPitch = 0
	if .voicedFractions < 0.5
		.astPitch = 4
	elsif .sdPitch < (2.38 + 4.34) / 2
		.astPitch = 1
	elsif .sdPitch < (4.34+10.65) / 2
		.astPitch = 2
	else
		.astPitch = 3
	endif
	
	select pathologicalAutoType
	.rowIndex = Get row index... Median
	Set value... '.rowIndex' 1 -1
	.rowIndex = Get row index... Pitch
	if .rowIndex <= 0
		Insert row (index)... 1
		.rowIndex = 1
		Set row label (index)... 1 Pitch
	endif
	Set value... '.rowIndex' 1 '.astPitch'
	
	#.textAST$ = .textAST$+"<li>Pitch: '.astPitch'</li>'newline$'"
	
	# Calculated from van As, C.J. "Tracheolesophageal Speech", 2001, p88
	# Acoustic Signal Typing: Jitter
	call setPathParameter 'pathologicalParameters' Jitter '.jitter'

	.astJitter = 0
	if .voicedFractions < 0.5
		.astJitter = 4
	elsif .jitter < (0.029 + 0.077)/2
		.astJitter = 1
	elsif .jitter < (0.077 + 0.084)/2
		.astJitter = 2
	else
		.astJitter = 3
	endif

	select pathologicalAutoType
	.rowIndex = Get row index... Median
	Set value... '.rowIndex' 1 -1
	.rowIndex = Get row index... Jitter
	if .rowIndex <= 0
		Insert row (index)... 1
		.rowIndex = 1
		Set row label (index)... 1 Jitter
	endif
	Set value... '.rowIndex' 1 '.astJitter'

	#.textAST$ = .textAST$+"<li>Jitter: '.astJitter'</li>'newline$'"
	
	# Calculated from van As, C.J. "Tracheolesophageal Speech", 2001, p88
	# Acoustic Signal Typing: VoicedFraction
	call setPathParameter 'pathologicalParameters' VoicedFraction '.voicedFractions'

	.astVoicedFraction = 0
	if .voicedFractions < 0.5
		.astVoicedFraction = 4
	elsif .voicedFractions > (1 + 0.804)/2
		.astVoicedFraction = 1
	elsif .voicedFractions > (0.804+0.745)/2
		.astVoicedFraction = 2
	else
		.astVoicedFraction = 3
	endif
	
	select pathologicalAutoType
	.rowIndex = Get row index... Median
	Set value... '.rowIndex' 1 -1
	.rowIndex = Get row index... VoicedFraction
	if .rowIndex <= 0
		Insert row (index)... 1
		.rowIndex = 1
		Set row label (index)... 1 VoicedFraction
	endif
	Set value... '.rowIndex' 1 '.astVoicedFraction'
	call autoSetPathType
	
	#.textAST$ = .textAST$+"<li>Voice Fraction: '.astVoicedFraction'</li>'newline$'"

	#.shorttextAST$ = " (AST: P-'.astPitch', J-'.astJitter', V-'.astVoicedFraction')"

	#.text$ = "Pitch - Voiced: '.voicedFractions:1%'\% , Jitter: '.jitter:1%'\% , Shimmer: '.shimmer:1%'\% , Mean: '.meanPitch:0' Hz, SD: '.sdPitch:1' Hz, Median: '.medianPitch:0' Hz"
endproc

# Do not recalculate needlessly
procedure calculateHarmonicityValues
	.maxHarmonicity = 0
	.minHarmonicity = 0
	.meanHarmonicity = 0
	.sdHarmonicity = 0
	.shorttextAST$ = ""

	if te.harmonicity > 0
		select te.harmonicity
		.maxHarmonicity = Get maximum... 'selectedStartTime' 'selectedEndTime' Parabolic
		.minHarmonicity = Get minimum... 'selectedStartTime' 'selectedEndTime' Parabolic
		.meanHarmonicity = Get mean... 'selectedStartTime' 'selectedEndTime'
		.sdHarmonicity = Get standard deviation... 'selectedStartTime' 'selectedEndTime'
		
		# Calculate GNE on segment (if segment is larger than 60ms)
		if selectedEndTime - selectedStartTime > 0.06
			if .previousSelectedGNEStartTime != selectedStartTime or .previousSelectedGNEEndTime != selectedEndTime
				select te.openSound
				.tmpPartID = Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 false
				Rename... TmpPart
				.gneID = noprogress To Harmonicity (gne)... 500 4500 1000 80
				.gneValue = Get maximum
				select .tmpPartID
				plus .gneID
				Remove
				.previousSelectedGNEStartTime = selectedStartTime
				.previousSelectedGNEEndTime = selectedEndTime
			endif
		else
			.gneValue = 0
		endif
	endif
	
	call get_feedback_text 'config.language$' HarmonicityValues
	.pitchValues$ = get_feedback_text.text$
	.pitchValues$ = replace$(.pitchValues$, "MAXHARMONICITY$", "'.maxHarmonicity:1'", 0)
	.pitchValues$ = replace$(.pitchValues$, "MINHARMONICITY$", "'.minHarmonicity:1'", 0)
	.pitchValues$ = replace$(.pitchValues$, "MEANHARMONICITY$", "'.meanHarmonicity:1'", 0)
	.pitchValues$ = replace$(.pitchValues$, "SDHARMONICITY$", "'.sdHarmonicity:2'", 0)
	.pitchValues$ = replace$(.pitchValues$, "GNEVALUE$", "'.gneValue:3'", 0)
	.text$ = .pitchValues$


	.textAST$ = "";
	# Calculated from van As, C.J. "Tracheolesophageal Speech", 2001, p88
	# Acoustic Signal Typing: HNR
	call setPathParameter 'pathologicalParameters' HNR '.meanHarmonicity'

	.astHNR = 0
	if .meanHarmonicity > (10.14 + 4.25) / 2
		.astHNR = 1
	elsif .meanHarmonicity > (4.25 + 3.85) / 2
		.astHNR = 2
	elsif .meanHarmonicity > (3.85) / 2
		.astHNR = 3
	else
		.astHNR = 3
	endif
	#.textAST$ = .textAST$+"<li>HNR: '.astHNR'</li>'newline$'"

	select pathologicalAutoType
	.rowIndex = Get row index... Median
	Set value... '.rowIndex' 1 -1
	.rowIndex = Get row index... Harmonicity
	if .rowIndex <= 0
		Insert row (index)... 1
		.rowIndex = 1
		Set row label (index)... 1 Harmonicity
	endif
	Set value... '.rowIndex' 1 '.astHNR'
	
	# Calculated from van As, C.J. "Tracheolesophageal Speech", 2001, p88
	# Acoustic Signal Typing: GNE
	call setPathParameter 'pathologicalParameters' GNE '.gneValue'

	.astGNE = 0
	if .gneValue > (0.82 + 0.82) / 2
		.astGNE = 1
	elsif .gneValue > (0.77 + 0.82) / 2
		.astGNE = 2
	elsif .gneValue > (0.77 + 0.72) / 2
		.astGNE = 3
	else
		.astGNE = 4
	endif
	#.textAST$ = .textAST$+"<li>GNE: '.astGNE'</li>'newline$'"
	#.shorttextAST$ = " (AST: H-'.astHNR', G-'.astGNE')"

	select pathologicalAutoType
	.rowIndex = Get row index... Median
	Set value... '.rowIndex' 1 -1
	.rowIndex = Get row index... GNE
	if .rowIndex <= 0
		Insert row (index)... 1
		.rowIndex = 1
		Set row label (index)... 1 GNE
	endif
	Set value... '.rowIndex' 1 '.astGNE'
	call autoSetPathType
	
	#.text$ = "Harmonicity - Max.: '.maxHarmonicity:1' dB, Min.: '.minHarmonicity:1' dB, Mean: '.meanHarmonicity:1' dB, SD: '.sdHarmonicity:2' dB, GNE: '.gneValue:3'"
endproc

procedure calculateIntensityValues
	.maxIntensity = 0
	.maxTimeIntensity = 0
	.minIntensity = 0
	.meanIntensity = 0
	.sdIntensity = 0
	.shorttextAST$ = ""

	if intensityName$ <> ""
		select Intensity 'intensityName$'
		.maxIntensity = Get maximum... 'selectedStartTime' 'selectedEndTime' Parabolic
		.maxTimeIntensity = Get time of maximum... 'selectedStartTime' 'selectedEndTime' Parabolic
		
		.minIntensity = Get minimum... 'selectedStartTime' 'selectedEndTime' Parabolic
		.meanIntensity = Get mean... 'selectedStartTime' 'selectedEndTime' energy
		.sdIntensity = Get standard deviation... 'selectedStartTime' 'selectedEndTime'
	endif
	
	call get_feedback_text 'config.language$' IntensityValues
	.intensityValues$ = get_feedback_text.text$
	.intensityValues$ = replace$(.intensityValues$, "MAXINTENSITY$", "'.maxIntensity:1'", 0)
	.intensityValues$ = replace$(.intensityValues$, "MININTENSITY$", "'.minIntensity:1'", 0)
	.intensityValues$ = replace$(.intensityValues$, "MEANINTENSITY$", "'.meanIntensity:1'", 0)
	.intensityValues$ = replace$(.intensityValues$, "SDINTENSITY$", "'.sdIntensity:2'", 0)
	.text$ = .intensityValues$

	#.text$ = "Intensity - Max.: '.maxIntensity:1' dB, Min.: '.minIntensity:1' dB, Mean: '.meanIntensity:1' dB, SD: '.sdIntensity:2' dB"
endproc

procedure calculateLtasValues
	.maxFrequency = 0
	.minFrequency = 0
	.cog = 0
	.highPower = 0
	.lowPower = 0
	.shorttextAST$ = ""

	if ltasName$ <> ""
		select Ltas 'ltasName$'
		.maxFrequency = Get frequency of maximum... 0 'config.frequency' Parabolic
		.minFrequency = Get frequency of minimum... 0 'config.frequency' Parabolic
		.productFreq = 0
		.sumPower = 0
		.bed = 0
		
		.numBins = Get number of bins
		for .i to .numBins
			.freq = Get frequency from bin number... '.i'
			.power = Get value in bin... '.i'
			.energy = 10^(.power/10)
			.productFreq += .freq * .energy
			.sumPower += .energy
		endfor
		if .sumPower > 0
			.cog = .productFreq / .sumPower
		endif
		.startBin = Get bin number from frequency... 0
		.endBin = Get bin number from frequency... 500
		for .i from .startBin to .endBin
			.power = Get value in bin... '.i'
			.lowPower += 10 ^ (.power / 10)
		endfor
		.lowPower /= .endBin - .startBin + 1
		
		.startBin = Get bin number from frequency... 4000
		.endBin = Get bin number from frequency... 5000
		for .i from .startBin to .endBin
			.power = Get value in bin... '.i'
			.highPower += 10 ^ (.power / 10)
		endfor
		.highPower /= .endBin - .startBin + 1
		if .highPower > 0
			.bed = 10 * log10(.lowPower / .highPower)
		endif
	endif
	
	call get_feedback_text 'config.language$' LtasValues
	.ltasValues$ = get_feedback_text.text$
	.ltasValues$ = replace$(.ltasValues$, "MAXFREQUENCY$", "'.maxFrequency:0'", 0)
	.ltasValues$ = replace$(.ltasValues$, "MINFREQUENCY$", "'.minFrequency:0'", 0)
	.ltasValues$ = replace$(.ltasValues$, "BED$", "'.bed:1'", 0)
	.ltasValues$ = replace$(.ltasValues$, "COG$", "'.cog:0'", 0)
	.ltasValues$ = replace$(.ltasValues$, "SELECTEDSTARTTIME$", "'selectedStartTime:3'", 0)
	.ltasValues$ = replace$(.ltasValues$, "SELECTEDENDTIME$", "'selectedEndTime:3'", 0)
	.text$ = .ltasValues$

	.textAST$ = "";
	# Calculated from van As, C.J. "Tracheolesophageal Speech", 2001, p88
	# Acoustic Signal Typing: BED
	call setPathParameter 'pathologicalParameters' BED '.bed'

	.astBED = 0
	if .bed > (24.8 + 22.9) / 2
		.astBED = 1
	elsif .bed > (22.9 + 17.0) / 2
		.astBED = 2
	elsif .bed > (17.0 + 10.0) / 2
		.astBED = 3
	else
		.astBED = 4
	endif
	#.textAST$ = .textAST$+"<li>BED: '.astBED'</li>'newline$'"
	#.shorttextAST$ = " (AST: B-'.astBED')"
	
	select pathologicalAutoType
	.rowIndex = Get row index... Median
	Set value... '.rowIndex' 1 -1
	.rowIndex = Get row index... Median
	Set value... '.rowIndex' 1 -1
	.rowIndex = Get row index... BED
	if .rowIndex <= 0
		Insert row (index)... 1
		.rowIndex = 1
		Set row label (index)... 1 BED
	endif
	Set value... '.rowIndex' 1 '.astBED'
	call autoSetPathType
	
	#.text$ = "Ltas - Max.: '.maxFrequency:0' Hz, Min.: '.minFrequency:0' Hz, BED: '.bed:1' dB, CoG: '.cog:0' Hz  ['selectedStartTime:3', 'selectedEndTime:3'] sec"
endproc

procedure calculateSoundValues
	.text$ = ""
	.shorttextAST$ = ""
endproc

procedure calculatePitchTierValues
	call calculatePitchValues
	.text$ = calculatePitchValues.text$
	.shorttextAST$ = ""
endproc

procedure calculateTimeValues
	call get_feedback_text 'config.language$' TimeValues
	.timeValues$ = get_feedback_text.text$
	.timeValues$ = replace$(.timeValues$, "SELECTEDSTARTTIME$", "'selectedStartTime:3:0'", 0)
	.timeValues$ = replace$(.timeValues$, "SELECTEDENDTIME$", "'selectedEndTime:3:0'", 0)
	.selectedInterval = selectedEndTime - selectedStartTime
	.timeValues$ = replace$(.timeValues$, "SELECTEDINTERVAL$", "'.selectedInterval:3:0'", 0)
	
	.text$ = .timeValues$
	.shorttextAST$ = ""
endproc

procedure calculateSpectrogramValues
	.text$ = ""
	.shorttextAST$ = ""
	
	select te.formant
	.medianF1 = Get quantile... 1 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.medianB1 = Get quantile of bandwidth... 1 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.qualityF1 = .medianF1 / .medianB1
	.medianF2 = Get quantile... 2 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.medianB2 = Get quantile of bandwidth... 2 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.qualityF2 = .medianF2 / .medianB2
	.medianF3 = Get quantile... 3 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.medianB3 = Get quantile of bandwidth... 3 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.qualityF3 = .medianF3 / .medianB3
	.medianF4 = Get quantile... 4 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.medianB4 = Get quantile of bandwidth... 4 'selectedStartTime' 'selectedEndTime' Hertz 0.50
	.qualityF4 = .medianF4 / .medianB4
	
	call get_feedback_text 'config.language$' SpectrumValues
	.spectrumValues$ = get_feedback_text.text$
	.spectrumValues$ = replace$(.spectrumValues$, "QUALITYF1$", "'.qualityF1:0'", 0)
	.spectrumValues$ = replace$(.spectrumValues$, "QUALITYF2$", "'.qualityF2:0'", 0)
	.spectrumValues$ = replace$(.spectrumValues$, "QUALITYF3$", "'.qualityF3:0'", 0)
	.spectrumValues$ = replace$(.spectrumValues$, "QUALITYF4$", "'.qualityF4:0'", 0)
	.text$ = .spectrumValues$
endproc

