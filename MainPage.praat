#
# TEVA 0.1
# 
# Praat script handling buttons page
#
#     TEVA: MainPage.praat loads the code needed for the 
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
	calculateHarmonicityValues.previousHarmonicity = -1
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
	demo Colour... '.color$'
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
	demo Colour... '.color$'
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
	demo Colour... '.color$'
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
	if mainPage.draw$ = "Sound"
		# Draw Sound
		call DrawSoundObject
	elsif mainPage.draw$ = "Pitch"
		# Draw Pitch
		call DrawPitchObject
	elsif mainPage.draw$ = "Harmonicity"
		# Draw Harmonicity
		call DrawHarmonicityObject
	elsif mainPage.draw$ = "GNE"
		# Draw GNE
		call DrawGNEObject
	elsif mainPage.draw$ = "PitchTier"
		# Draw PitchTier
		call DrawPitchTierObject
	elsif mainPage.draw$ = "Spectrogram"
		# Draw Spectrogram
		call DrawSpectrogramObject
	elsif mainPage.draw$ = "Ltas"
		# Draw Ltas
		call DrawLtasObject
	elsif mainPage.draw$ = "Intensity"
		# Draw Intensity
		call DrawIntensityObject
	elsif mainPage.draw$ = "Rating"
		# Draw Rating scales
		call DrawRatingObject
	endif
endproc

procedure print_signal .outFileName$
	.outFileName$ = replace_regex$(.outFileName$, "\.[a-z0-9A-Z]+$","",0)
	
	# Switch off Formant display
	.currentShowFormants = config.showFormants
	config.showFormants = 0
	
	# Set output format
	.outEPSExtension$ = "eps"
	.outEPSFileType$ = "EPS file"
	.outExtension$ = .outEPSExtension$
	.outFileType$ = .outEPSFileType$
	if config.saveFMT$ = "PDF"
		.outExtension$ = "pdf"
		.outFileType$ = "PDF file"
	elsif config.saveFMT$ = "PNG"
		.outExtension$ = "png"
		.outFileType$ = "300-dpi PNG file"
	elsif config.saveFMT$ = "EMF"
		.outExtension$ = "emf"
		.outFileType$ = "Windows metafile"
	endif
	
	# Print
	mainPage.outputPraatObject$ = "Print"
	Erase all
	
	# Set drawing (A4 with 0.5 inch margins)
	.plotWidth = 7
	.plotHeight = 10/5
	
	.plotyTop = 0.5
	.labelText$ = ""
	
	# Date and time
	call i8n_date
	.datetime$ = i8n_date.date$
	
	# Write title
	.titleText$ = speakerID$
	if .titleText$ = ""
		.titleText$ = te.currentFileName$
		.last_point = index_regex(te.currentFileName$, "([\\/:])([^\\/:]*)$")
		.titleText$ = right$(.titleText$, length(.titleText$) - .last_point)
		if .titleText$ = ""
			.titleText$ = .outFileName$		
			.last_point = index_regex(te.currentFileName$, "([\\/:])([^\\/:]*)$")
			.titleText$ = right$(.titleText$, length(.titleText$) - .last_point)
		endif
		.titleText$ = replace_regex$(.titleText$, "\.[^\.]*$", "", 0)
	endif
	call protect_praat_special_characters '.titleText$'
	.titleText$ = protect_praat_special_characters.text$
	
	.x = 50
	.y = 0
	do("Select outer viewport...", 0, 7.27, 0, 0.45)
	do("Axes...", 0, 100, 0, 1)
	# Print Date and Time of print
	.subtext$ = .datetime$
	do("Text special...", 108, "right", .y+1, "bottom", "Helvetica", 9, "0", .subtext$)
	
	do("Text special...", .x, "centre", .y, "bottom", "Helvetica", 14, "0", .titleText$)

	# Get predictions
	call predictASTvalue
	predictedPathType = predictASTvalue.ast

	# Get subtext
	.subtext$ = ""
	.typeASTText$ = "-"
	.typeCompASTText$ = "-"
	if pathologicalType != 0 or predictedPathType != 0
		call get_printsignal_text 'config.language$' AST
		.astText$ = get_printsignal_text.text$
		call get_printsignal_text 'config.language$' CompAST
		.astCompText$ = get_printsignal_text.text$
		.type = abs(pathologicalType)
		.typeASTText$ = "-"
		if .type > 0
			.typeASTText$ = "'.type'"
		endif
		.subtext$ = .subtext$ + .astText$ + ": " + .typeASTText$
		.typeCompText$ = "-"
		if predictedPathType > 0
			.typeCompText$ = "'predictedPathType:1'"
		endif
		.subtext$ = .subtext$ + ", " + .astCompText$ + ": " + .typeCompText$
	endif
	
	# Ratings
	call rating_String 'speakerID$'
	.subtext$ = .subtext$ + rating_String.subtext$
	
	# Print text
	call points_to_wc 11
	.y -= points_to_wc.wc/2
	do("Text special...", .x, "centre", .y, "half", "Helvetica", 11, "0",  .subtext$)	
	
	# Waveform
	call get_printsignal_text 'config.language$' Waveform
	.labelText$ = get_printsignal_text.text$
	.duration = selectedEndTime - selectedStartTime
	
	@PrintSoundObject(.plotWidth, .plotyTop + 0.1, .plotHeight, .labelText$ + " ('.duration:3's)")
	# Select 0.1 second from the center
	.start = (selectedEndTime + selectedStartTime)/2 - 0.05
	.end = (selectedEndTime + selectedStartTime)/2 + 0.05
	@draw_SelectionLines (.plotWidth, .plotyTop + 0.1, .plotHeight, .start, .end)

	# Waveform (selection)
	call get_printsignal_text 'config.language$' Waveform
	.labelText$ = get_printsignal_text.text$
	call get_printsignal_text 'config.language$' seconds
	.secondsText$ = get_printsignal_text.text$

	# Switch to 0.1 second
	.oldSelectedStartTime = selectedStartTime
	.oldSelectedEndTime = selectedEndTime
	selectedStartTime = .start
	selectedEndTime = .end
	.duration = selectedEndTime - selectedStartTime

	.plotyTop += .plotHeight
	@PrintSoundObject(.plotWidth, .plotyTop, .plotHeight, .labelText$ + " '.duration:1' " + .secondsText$)
	
	# Switch back to original selection
	selectedStartTime = .oldSelectedStartTime
	selectedEndTime = .oldSelectedEndTime
	
	# Spectrogram
	call get_printsignal_text 'config.language$' Spectrogram
	.labelText$ = get_printsignal_text.text$
	.plotyTop += .plotHeight
	@PrintSpectrogramObject (.plotWidth, .plotyTop, .plotHeight, .labelText$)
	@PrintVoicingBar (.plotWidth, .plotyTop, .plotHeight, .labelText$)

	# Pitch
	call get_printsignal_text 'config.language$' Pitch
	.labelText$ = get_printsignal_text.text$
	.plotyTop += .plotHeight
	@PrintPitchObject (.plotWidth, .plotyTop, .plotHeight, .labelText$)

	# Ltas
	call get_printsignal_text 'config.language$' Ltas
	.labelText$ = get_printsignal_text.text$
	.plotyTop += .plotHeight
	@PrintLtasObject (.plotWidth, .plotyTop, .plotHeight, .labelText$)

	# Write to file
	.plotyTop += .plotHeight
	do("Select outer viewport...", 0, 7.27, 0, 10.69)
	if config.saveFMT$ = "EPS" and .outExtension$ <> "eps"
		do("Save as '.outEPSFileType$'...", "'.outFileName$'.'.outEPSExtension$'")
	endif
	do("Save as '.outFileType$'...", "'.outFileName$'.'.outExtension$'")

	# Reset draw
	mainPage.outputPraatObject$ = "Draw"
	# Reset changed settings
	config.showFormants = .currentShowFormants
endproc

# Print selected waveform or total file
procedure PrintSoundObject (.plotWidth, .plotyTop, .plotHeight, .labelText$)
	if recordedSound$ <> ""
		select te.openSound
		.minimum = Get minimum... 0 0 None
		.maximum = Get maximum... 0 0 None
		if not (.minimum = undefined or .maximum = undefined)
			if .minimum = .maximum			
				.minimum -= 1
				.maximum += 1
			endif
			
			# Get label of X-axis
			call get_printsignal_text 'config.language$' time
			.xaxisLabel$ = get_printsignal_text.text$
			
			# Draw
			select te.openSound
			Helvetica
			Font size... 10
			do("Select outer viewport...", 0.5, .plotWidth, .plotyTop, .plotyTop+.plotHeight)
			do ("Draw...", selectedStartTime, selectedEndTime, 0, 0, "no", "Curve")
			do ("Draw inner box")
			@leftMarks (.minimum, .maximum, "")
			@bottomMarks (selectedStartTime, selectedEndTime, "yes", .xaxisLabel$)
			
			Helvetica
			Font size... 14
			do("Viewport text...", "Left", "Top", 0, .labelText$)
			Font size... 10
		endif
	endif
endproc

procedure PrintSpectrogramObject (.plotWidth, .plotyTop, .plotHeight, .labelText$)

	if recordedSound$ <> "" and te.spectrogram = 0
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Spectrogram")
			te.spectrogram = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Spectrogram
		else
			select te.openSound
			.currentSampleFrequency = Get sampling frequency
			.nyquistFrequency = .currentSampleFrequency / 2
			te.spectrogram = noprogress To Spectrogram... 0.1 '.nyquistFrequency' 0.001 10 Gaussian
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Spectrogram
			endif
		endif
		spectrogramName$ = selected$("Spectrogram")
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Formant")
			te.formant = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Formant
		else
			select te.openSound
			te.formant = noprogress To Formant (burg)... 0.02 4 4400 0.1 50
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Formant
			endif
		endif
		
		formantName$ = selected$("Formant")
	endif

	if te.spectrogram > 0 and not noDrawingOrWriting
		call calcMaxHarmonicity te.openSound
		maxHarmonicity = calcMaxHarmonicity.value
		.hnrValuesText$ = "HNR__max_: 'maxHarmonicity:2'dB"
	
		# Get label of X&Y-axes
		call get_printsignal_text 'config.language$' time
		.xaxisLabel$ = get_printsignal_text.text$
		call get_printsignal_text 'config.language$' Hz
		.yaxisLabel$ = get_printsignal_text.text$

		select te.spectrogram
	
		do("Select outer viewport...", 0.5, .plotWidth, .plotyTop, .plotyTop+.plotHeight)
		if .labelText$ = ""
			.labelText$ = "Spectrogram"
		endif
		Helvetica
		do("Paint...", selectedStartTime, selectedEndTime, 0, config.frequency, 80, "no", 70, 6, 0, "no")
		if config.showFormants > 0
			do("Colour...", "Maroon")
			select te.formant
			do("Speckle...", currentStartTime, currentEndTime, config.frequency, 25, "no")
			do("Colour...",  "Black")
		endif
		do ("Draw inner box")
		@leftMarks (0, config.frequency, .yaxisLabel$)
		@bottomMarks (selectedStartTime, selectedEndTime, "yes", .xaxisLabel$)
		Font size... 14
		do("Viewport text...", "Left", "Top", 0, .labelText$)
		Font size... 11
		do("Viewport text...", "Right", "Top", 0, newline$+.hnrValuesText$+" ")
		Font size... 10
	endif
endproc

procedure PrintVoicingBar (.plotWidth, .plotyTop, .plotHeight, .labelText$)
	if te.openSound > 0 and te.voicingTextGrid = 0
		call calculatePitchValues
	endif
	
	if te.voicingTextGrid > 0
		do("Select outer viewport...", 0.5, .plotWidth, .plotyTop, .plotyTop+.plotHeight)
		do("Axes...", selectedStartTime, selectedEndTime, 0, 1)
		select te.voicingTextGrid
		.numIntervals = Get number of intervals... 1
		for .interval to .numIntervals
			select te.voicingTextGrid
			.label$ = Get label of interval... 1 '.interval'
			if .label$ = "V"
				.start = Get start point... 1 '.interval'
				.end = Get end point... 1 '.interval'
				.duration = .end - .start
				# Interval is in window
				if .start < selectedEndTime and .end > selectedStartTime
				    do("Colour...", te.voicingcolor$)
				    do("Line width...", 1)
				    .botPoint = -0.03
				    .leftPoint = max(.start, selectedStartTime)
				    .rightPoint = min(.end, selectedEndTime)
					do("Draw line...", .leftPoint, .botPoint, .rightPoint, .botPoint)
				    do("Line width...", defaultLineWidth)
				    
				    # Print label
					call get_feedback_text 'config.language$' VoicingMarker
					.voicingText$ = get_feedback_text.text$
					.voiceMarkerPositionX = selectedStartTime -(selectedEndTime - selectedStartTime)/11
					.voiceMarkerPositionY = .botPoint - 0.02
					do("Text special...", .voiceMarkerPositionX, "Left", .voiceMarkerPositionY, "Top", "Helvetica", 11, "0", .voicingText$)
				    do("Colour...", "Black")
				    
				endif
			endif
			
		endfor
	endif
endproc

procedure PrintPitchObject (.plotWidth, .plotyTop, .plotHeight, .labelText$)

	if te.openSound > 0 and te.pitch = 0
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Pitch")
			te.pitch = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Pitch
		else
			call to_pitch te.openSound
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Pitch
			endif
		endif
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
		te.voicingTextGrid = To TextGrid (vuv)... 0.2 0.1
	endif
	
	if te.pitch > 0 and not noDrawingOrWriting
		# Get Pitch values
		call calculatePitchValues
		.pitchValuesText$ = calculatePitchValues.shortText$

		# Get label of X&Y-axes
		call get_printsignal_text 'config.language$' time
		.xaxisLabel$ = get_printsignal_text.text$
		call get_printsignal_text 'config.language$' Hz
		.yaxisLabel$ = get_printsignal_text.text$

		select te.pitch
		do("Select outer viewport...", 0.5, .plotWidth, .plotyTop, .plotyTop+.plotHeight)
		if .labelText$ = ""
			.labelText$ = "Pitch"
		endif
		Helvetica
		.lower = 20*(floor(minPitch/20))
		.upper = 20*(ceiling(maxPitch/20))
		do("Draw...", selectedStartTime, selectedEndTime, .lower, .upper, "no")
		do ("Draw inner box")
		@leftMarks (.lower, .upper, .yaxisLabel$)
		@bottomMarks (selectedStartTime, selectedEndTime, "yes", .xaxisLabel$)
		Font size... 14
		do("Viewport text...", "Left", "Top", 0, .labelText$)
		Font size... 11
		do("Viewport text...", "Right", "Top", 0, newline$+.pitchValuesText$+" ")
		Font size... 10
	endif
endproc

procedure PrintLtasObject (.plotWidth, .plotyTop, .plotHeight, .labelText$)

	if ltasName$ <> ""
		select Ltas 'ltasName$'
		Remove
		ltasName$ = ""
		te.Ltas = 0
	endif
	if recordedSound$ <> ""
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_'selectedStartTime:3'_'selectedEndTime:3'.Ltas")
			te.Ltas = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_'selectedStartTime:3'_'selectedEndTime:3'.Ltas
		else
			select te.openSound
			.tmpPartID = Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 false
			Rename... TmpPart
			.tmpSpecID = noprogress To Spectrum... yes
			te.Ltas = noprogress To Ltas (1-to-1)
			select .tmpPartID
			plus .tmpSpecID
			Remove
			select te.Ltas
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_'selectedStartTime:3'_'selectedEndTime:3'.Ltas
			endif
			
		endif
		ltasName$ = selected$("Ltas")
		.minimum = -20
		.maximum = Get maximum... 0 0 None
	endif
	
	# Get Ltas values
	call calculateLtasValues
	.ltasValuesText$ = calculateLtasValues.shortText$

	if ltasName$ <> "" and not noDrawingOrWriting
		# Get label of X&Y-axes
		call get_printsignal_text 'config.language$' Frequency
		.xaxisLabel$ = get_printsignal_text.text$
		call get_printsignal_text 'config.language$' SPL
		.yaxisLabel$ = get_printsignal_text.text$

		select te.Ltas
		do("Select outer viewport...", 0.5, .plotWidth, .plotyTop, .plotyTop+.plotHeight)
		if .labelText$ = ""
			.labelText$ = "Ltas"
		endif
		Helvetica
		.lower = 10*(floor(.minimum/10))
		.upper = 10*(ceiling(.maximum/10))
		do("Draw...", 0, config.frequency, .lower, .upper, "no", "Curve")
		do ("Draw inner box")
		@leftMarks (-20, .upper, .yaxisLabel$ )
		@bottomMarks (0, config.frequency, "yes", .xaxisLabel$)
		Font size... 14
		do("Viewport text...", "Left", "Top", 0, .labelText$)
		Font size... 11
		do("Viewport text...", "Right", "Top", 0, newline$+.ltasValuesText$+" ")
		Font size... 10
	endif
endproc

procedure draw_SelectionLines (.plotWidth, .plotyTop, .plotHeight, .start, .end)
	do("Select outer viewport...", 0.5, .plotWidth, .plotyTop, .plotyTop+.plotHeight)
	do("Axes...", selectedStartTime, selectedEndTime, 0, 1)
	do("Colour...", "Blue")
	do("Line width...", 3)
	do("Draw line...", .start, 0, .start, 1)
	do("Draw line...", .end, 0, .end, 1)
	
	do("Line width...", 1)
	do("Draw line...", .start, 0, (.start+selectedStartTime)/2, -0.5)
	do("Draw line...", .end, 0, (.end+selectedEndTime)/2, -0.5)

	
	do("Colour...", "Black")
	do("Line width...", 1)
endproc

procedure bottomMarks (.start, .end, .numbers$, .label$)
	.interval = .end - .start
	.scale = 10**(floor(log10(.interval))-1)/10
	if .interval/.scale > 30
		.scale *= 10
	endif
	if .interval/.scale > 20
		.scale *= 5
	endif
	if .interval/.scale > 15
		.scale *= 2
	endif
	
	Font size... 10
	do ("Marks bottom every...", 1, .scale, .numbers$, "yes", "no")
	do ("Marks top every...", 1, .scale, "no", "yes", "no")
	if .label$ <> ""
		Font size... 10
		do ("Text bottom...", "yes", .label$)
	endif
	Font size... 10
endproc

procedure leftMarks (.low, .high, .label$)
	.interval = .high - .low
	.scale = 10**(floor(log10(.interval)))/10
	if .interval/.scale > 25
		.scale *= 10
	endif
	if .interval/.scale > 15
		.scale *= 5
	endif
	if .interval/.scale > 8
		.scale *= 2
	endif
	
	Font size... 10
	do ("Marks left every...", 1, .scale, "yes", "yes", "no")
	do ("Marks right every...", 1, .scale, "no", "yes", "no")
	if .label$ <> ""
		Font size... 10
		do ("Text left...", "yes", .label$)
	endif
	Font size... 10
endproc

procedure i8n_date
	.date$ = date$()
	.dayOfWeek$ = left$(.date$, 3)
	.month$ = mid$(.date$, 5, 3)
	.year$ = right$(.date$, 4)
	.dayOfMonth$ = mid$(.date$, 9, 2)
	.time$ = mid$(.date$, 12, 8)
	.rest$ = right$(.date$, length(.date$)-7)
	# File stamp date
	
	# Get day of week
	call get_printsignal_text 'config.language$' '.dayOfWeek$'
	.i8n_dayOfWeek$ = get_printsignal_text.text$
	call get_printsignal_text 'config.language$' '.month$'
	.i8n_month$ = get_printsignal_text.text$
	call get_printsignal_text 'config.language$' num'.month$'
	.num_month$ = get_printsignal_text.text$
	.date$ = .i8n_dayOfWeek$ + " " + .i8n_month$ + .rest$
	# File stamp date
	.printDate$ = .year$+.num_month$+.dayOfMonth$+"_"+.time$
	.printDate$ = replace_regex$(.printDate$, "[:]", "-", 0)
	.printDate$ = replace_regex$(.printDate$, "[ ]", "_", 0)
endproc

# Read feedback table and get keyed text
procedure get_printsignal_text .language$ .key$
	if not endsWith(printsignalTableName$, "_'.language$'")
		if printsignalTableName$ <> ""
			select Table 'printsignalTableName$'
			Remove
		endif
		call loadTable 'printsignalTablePrefix$'_'.language$'
		printsignalTableName$ = selected$("Table")
	endif
	call findKey 'printsignalTableName$' '.key$'
	.row = findKey.row
	select Table 'printsignalTableName$'
	.text$ = Get value... '.row' Text
	# Expand variables, eg, 'praatVersion$'
	call expand_praat_variables '.text$'
	.text$ = expand_praat_variables.text$	
endproc


procedure set_draw_signal_button
	call Draw_button 'te.buttons$' Draw_'mainPage.draw$' 2
	if index(" Ltas Rating ", " 'mainPage.draw$' ") > 0 
		call Draw_button 'te.buttons$' Select 1
		call Draw_button 'te.buttons$' ToSelection 1
		call Draw_button 'te.buttons$' ZoomOut 1
		call Draw_button 'te.buttons$' ZoomIn 1
		call Draw_button 'te.buttons$' Next 1
		call Draw_button 'te.buttons$' Previous 1
	endif
	if config.muteOutput
		call Draw_button 'te.buttons$' Record 1
		call Draw_button 'te.buttons$' Play 1
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
		call help_loop 'te.buttons$' init_window
	else
		te.skipNextStep = 1
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
	call Draw_button '.table$' '.label$' config.muteOutput
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
	while clicked <> 5
		# The speaker Text
		.speakerID$ = "ID"
		.speakerIDDefault$ = speakerID$
		if .speakerIDDefault$ = ""
			call get_feedback_text 'config.language$' SpeakerID
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.speakerIDDefault$ = convert_praat_to_latin1.text$
		else
			call get_speakerInfo 'speakerID$'
			.currentRow = get_speakerInfo.row
			if .currentRow <= 0
				.currentRow = 1
			endif
			.speakerIDDefault$ = "['.currentRow'] '.speakerIDDefault$'"
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
		call get_feedback_text 'config.language$' SpeakerAudio
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.audioText$ = convert_praat_to_latin1.text$

		# The user text input window (beginPause .... endPause)
		beginPause(.helpText$)
			text (.speakerID$, .speakerIDDefault$)
			text (.speakerText$, .speakerDefault$)
			text (.speakerCommentInput$, .speakerCommentDef$)
		clicked = endPause ("'.audioText$'", "'.prevText$'", "'.currentText$'", "'.nextText$'", "'.continueText$'", 5, 1)
		if clicked = 3 or clicked = 5
			# The text of the field name equals the name of the variable! That is, an indirection
			.speakerID$ = replace_regex$(.speakerID$, ".+", "\l&\$", 0)
			.speakerText$ = replace_regex$(.speakerText$, ".+", "\l&\$", 0)
			.speakerCommentInput$ = replace_regex$(.speakerCommentInput$, ".+", "\l&\$", 0)
			.newSpeakerID$ = '.speakerID$'
			.newSpeakerInfo$ = '.speakerText$'
			.newSpeakerComments$ = '.speakerCommentInput$'
			if .newSpeakerInfo$ = .speakerDefault$ and .newSpeakerInfo$ <> speakerInfo$
				.newSpeakerInfo$ = ""
			endif
			if .newSpeakerComments$ = .speakerCommentDef$ and .newSpeakerComments$ <> speakerComments$
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
				if get_speakerInfo.row > 0
					.newSpeakerID$ = get_speakerInfo.id$
					te.currentFileName$ = get_speakerInfo.audio$
					call load_audio_file '.newSpeakerID$' 'te.currentFileName$'
					call autoSetPathType
				else
					speakerID$ = .newSpeakerID$
					speakerInfo$ = .newSpeakerInfo$
					speakerComments$ = .newSpeakerComments$
				endif
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
			call get_feedback_text 'config.language$' SpeakerAudio
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.openDialogue$ = convert_praat_to_latin1.text$
			.filename$ = chooseReadFile$ (.openDialogue$)
			if .filename$ <> "" and fileReadable(.filename$)
				te.currentFileName$ = .filename$
				call load_audio_file 'speakerID$' 'te.currentFileName$'
				call autoSetPathType
				te.currentFileName$ = .filename$
				call WriteSpeakerData
			endif
		elsif clicked = 2
			call get_previousSpeaker 'speakerID$'
			if get_previousSpeaker.reset > 0
				call unload_RecordingTask
			endif
			.newSpeakerID$ = get_previousSpeaker.id$
			te.currentFileName$ = get_previousSpeaker.audio$
			call load_audio_file '.newSpeakerID$' 'te.currentFileName$'
			call autoSetPathType
		elsif clicked = 4
			call get_nextSpeaker 'speakerID$'
			if get_nextSpeaker.reset > 0
				call unload_RecordingTask
			endif
			.newSpeakerID$ = get_nextSpeaker.id$
			te.currentFileName$ = get_nextSpeaker.audio$
			call load_audio_file '.newSpeakerID$' 'te.currentFileName$'
			call autoSetPathType
		endif
		if clicked = 3
			call ReadSpeakerData 'config.speakerData$'
			if config.speakerDataTable > 0
				select config.speakerDataTable
				.tmpDataTable = Copy... Speaker_Data
			else
				.tmpDataTable = Create Table with column names... Speaker_Data 1 ID Text Description Audio AST
			endif
			select .tmpDataTable
			View & Edit
			demoWaitForInput()
			# Table can not be edited in List, so discard it
			select .tmpDataTable
			Remove
		endif
	endwhile
	call Draw_button '.table$' '.label$' 0
endproc

procedure processMainPageNextItem .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "NextItem"

	# Check whether this is the last speaker in the list
	call get_speakerInfo 'speakerID$'
	.previousRow = get_speakerInfo.row
	
	call get_nextSpeaker 'speakerID$'
	.currentRow = get_nextSpeaker.row
	
	# If currentRow < previousRow, you start over. Show a message
	if .currentRow <= .previousRow
		# Do not bother with warning if there is only a single item
		if get_nextSpeaker.numRows > 1
			call get_feedback_text 'config.language$' Ready
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.readyText$ = convert_praat_to_latin1.text$
			call write_text_popup Helvetica 20 '.readyText$'
			demoWaitForInput()
		endif
		# Get rid of speaker table in running recording task
		if te.recordingTaskTable > 0
			call unload_RecordingTask
		endif
	endif
	
	# This was the first reference to a speaker, get first empty pos
	if speakerID$ = "" and config.speakerDataTable > 0
		select config.speakerDataTable
		.numRows = Get number of rows
		.numCols = Get number of columns
		if mainPage.draw$ = "Rating"
			.firstRow = 0
			for .c to .numCols
				select config.speakerDataTable
				.currentColLabel$ = Get column label... '.c'
				if startsWith(.currentColLabel$, "Rating.")
					.r = 1
					.f = 0
					while .r <= .numRows and .f = 0
						.currentValue$ = Get value... '.r' '.currentColLabel$'
						if index(.currentValue$, ";")
							.f = .r
						endif
						.r += 1
					endwhile
					if .f < .firstRow or .firstRow < 1
						.firstRow = .f
					endif
				endif
			endfor
			if .firstRow > 0 and .firstRow <=  .numRows
				.firstRow -= 1				
			endif
			if .firstRow > 0 and .firstRow <=  .numRows
				speakerID$ = Get value... '.firstRow' ID
			else
				speakerID$ = ""
			endif
		elsif te.useAnnotationInterface
			# Code to start speaker data tables at first empty position
			# Has to be handled by a Configuration settings
			.astCol = Get column index... AST
			.colLabel$ = Get column label... .numCols
			.ast_row = 0
			.last_row = 0
			.i = 1
			# Iterate over all 
			for .i to .numRows
				.lastValue$ = Get value... '.i' '.colLabel$'
				if length(.lastValue$) > 0 and index_regex(.lastValue$, "[^?\-\s]") > 0
					.last_row = .i
				endif
				.astValue$ = Get value... '.i' AST
				if length(.astValue$) > 0 and index_regex(.astValue$, "[^?\-\s]") > 0
					.ast_row = .i
				endif
			endfor
			if .ast_row > 0 and .ast_row <  .numRows
				speakerID$ = Get value... '.ast_row' ID
			elsif .last_row > 0 and .last_row <  .numRows
				speakerID$ = Get value... '.last_row' ID
			endif
		endif
		call get_nextSpeaker 'speakerID$'
	endif
	.newSpeakerID$ = get_nextSpeaker.id$
	.newFileName$ = get_nextSpeaker.audio$
	call reset_analysis
	speakerID$ = .newSpeakerID$
	te.currentFileName$ = .newFileName$
	if te.currentFileName$ <> "" and fileReadable(te.currentFileName$)
		call load_audio_file 'speakerID$' 'te.currentFileName$'
	else
		call set_new_speakerdata 'speakerID$'
		call init_window
	endif
	call autoSetPathType
	if config.speakerSerial$ = "Backw"
		call Draw_button '.table$' PreviousItem 0
	elsif config.speakerSerial$ = "Forw"
		call Draw_button '.table$' NextItem 0
	endif
endproc

procedure processMainPagePreviousItem .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "PreviousItem"

	# Check whether this is the first speaker in the list
	call get_speakerInfo 'speakerID$'
	.nextRow = get_speakerInfo.row
	
	call get_previousSpeaker 'speakerID$'
	.currentRow = get_previousSpeaker.row
	
	# If currentRow > previousRow, you start over. Show a message
	if .nextRow > 0 and .currentRow >= .nextRow
		# Do not bother with warning if there is only a single item
		if get_previousSpeaker.numRows > 1
			call get_feedback_text 'config.language$' Ready
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.readyText$ = convert_praat_to_latin1.text$
			call write_text_popup Helvetica 20 '.readyText$'
			demoWaitForInput()
		endif
		call unload_RecordingTask
	endif
	
	# This was the last reference to a speaker, get last empty pos
	if speakerID$ = "" and config.speakerDataTable > 0
		select config.speakerDataTable
		.numRows = Get number of rows
		.numCols = Get number of columns
		if mainPage.draw$ = "Rating"
			.lastRow = 0
			for .c to .numCols
				select config.speakerDataTable
				.currentColLabel$ = Get column label... '.c'
				if startsWith(.currentColLabel$, "Rating.")
					.r = 1
					while .r <= .numRows
						.currentValue$ = Get value... '.r' '.currentColLabel$'
						if index(.currentValue$, ";")
							.lastRow = .r
						endif
						.r += 1
					endwhile
				endif
			endfor
			if .lastRow >= 0 and .lastRow <=  .numRows
				.lastRow += 1				
			endif
			if .lastRow > 0 and .lastRow <=  .numRows
				speakerID$ = Get value... '.lastRow' ID
			else
				speakerID$ = ""
			endif
		else
			.astCol = Get column index... AST
			.colLabel$ = Get column label... .numCols
			.ast_row = 0
			.last_row = 0
			.i = 1
			# Iterate over all 
			for .i to .numRows
				.lastValue$ = Get value... '.i' '.colLabel$'
				if length(.lastValue$) > 0 and index_regex(.lastValue$, "[^?\-\s]") > 0
					.last_row = .i
				endif
				.astValue$ = Get value... '.i' AST
				if length(.astValue$) > 0 and index_regex(.astValue$, "[^?\-\s]") > 0
					.ast_row = .i
				endif
			endfor
			if .ast_row > 0 and .ast_row <  .numRows
				speakerID$ = Get value... '.ast_row' ID
			elsif .last_row > 0 and .last_row <  .numRows
				speakerID$ = Get value... '.last_row' ID
			endif
		endif
		call get_previousSpeaker 'speakerID$'
	endif
	.newSpeakerID$ = get_previousSpeaker.id$
	.newFileName$ = get_nextSpeaker.audio$
	call reset_analysis
	speakerID$ = .newSpeakerID$
	te.currentFileName$ = .newFileName$
	if te.currentFileName$ <> "" and fileReadable(te.currentFileName$)
		call load_audio_file 'speakerID$' 'te.currentFileName$'
	else
		call set_new_speakerdata 'speakerID$'
		call init_window
	endif
	call autoSetPathType
	if config.speakerSerial$ = "Backw"
		call Draw_button '.table$' PreviousItem 0
	elsif config.speakerSerial$ = "Forw"
		call Draw_button '.table$' NextItem 0
	endif
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
	call set_new_speakerdata -
	call post_processing_sound
	
	# Reset button
	call Draw_button '.table$' '.label$' 0

	# Get first item and Draw using the NextItem button
	if config.speakerDataTable <= 0 and config.speakerData$ <> "" and fileReadable(config.speakerData$)
		# New speaker table read
		call ReadSpeakerData 'config.speakerData$'
		call processMainPageNextItem 0 0 x
	else
		call WriteSpeakerData
		call init_window
	endif
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
	
	if not config.muteOutput
		if runningCommandMode = 0
			# If there is an active task, initialize recording
			if te.recordingTaskTable <= 0 and config.recordingTaskFile$ <> ""
				call setup_recordingTask
				if setup_recordingTask.skiprecording > 0
					goto SKIPRECORDING
				endif
			endif
	    	call record_sound
			call post_processing_sound
			# The old ratings should be wiped!!!!
			call set_new_speakerdata 'speakerID$'
		else
			# This is a global variable
			te.skipNextStep = 1
		endif
		# Reset button
		call Draw_button '.table$' '.label$' 0
		# Draw
		label SKIPRECORDING
		call init_window
	endif
endproc

procedure processMainPagePathologicalType .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "!PathologicalType"
	if index_regex(.pressed$, "[0-4,9]") > 0
		call setPathType '.pressed$'
		call init_window
	endif
endproc

# Process Sound Speech
procedure post_processing_sound
	# Analyze Pitch in Serial step mode or with config.autoSelect
	if (config.speakerSerial$ <> "None" or config.autoSelect) and index(" Ltas Rating ", " 'mainPage.draw$' ") <= 0
		# Supress drawing, but set up Pitch parameters
		.tmp = noDrawingOrWriting
		noDrawingOrWriting = 1
		call DrawPitchObject
		noDrawingOrWriting = .tmp
	endif
endproc

procedure processMainPageDraw .type$ .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Draw_'.type$'"
	mainPage.draw$ = .type$
	call init_window
endproc

procedure processMainPageToSelection .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "ToSelection"
	if index(" Ltas Rating ", " 'mainPage.draw$' ") > 0
		call Draw_button 'te.buttons$' '.label$' 1
		goto ENDOFTOSELECTION
	endif
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
		goto ENDOFTOSELECTION
	endif
	currentStartTime = selectedStartTime
	currentEndTime = selectedEndTime
	call Draw_button 'te.buttons$' '.label$' 0
	call init_window
	label ENDOFTOSELECTION
endproc

procedure processMainPageSelect .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "Select"
	
	if index(" Ltas Rating ", " 'mainPage.draw$' ") > 0
		call Draw_button 'te.buttons$' '.label$' 1
		goto ENDOFSELECT
	endif
	
	call get_feedback_text 'config.language$' Select1
	.feedback2$ = get_feedback_text.text$
	call reset_viewport
	call write_feedback_text Blue '.feedback2$'
	demoWaitForInput()
	.clickX = -1
	.clickY = -1
	.pressed$ = ""
	if demoClicked()
		.clickX = demoX()
		.clickY = demoY()
	elsif demoKeyPressed()
		.pressed$ = demoKey$()
	endif
	call processMainPageCANVAS '.clickX' '.clickY' '.pressed$'
	label ENDOFSELECT
endproc

procedure processMainPageCANVAS .clickX .clickY .pressed$
	.table$ = "MainPage"
	.label$ = "CANVAS"
    .xL = canvasXL + canvasLeftCorrection
    .xR = canvasXR + canvasRightCorrection
    .yL = canvasYL
    .yH = canvasYH
	.firstT = -1
	.secondT = -1
	
	# Handle stuff that should be done before the button is set
	call buttonClicked '.table$' '.clickX' '.clickY'
	if mainPage.draw$ = "Ltas"
		goto ESCAPEDISPLAYSELECT
	elsif mainPage.draw$ = "Rating"
		if te.ratingTable
			select te.ratingTable
			te.rating$ = selected$("Table")
			call buttonClicked 'te.rating$' '.clickX' '.clickY'
			if buttonClicked.label$ = "Help"
				call Draw_button 'te.rating$' 'buttonClicked.label$' 1
				if runningCommandMode = 0
					call help_loop 'te.rating$' init_window
				endif
				call Draw_button 'te.rating$' 'buttonClicked.label$' 0
			elsif buttonClicked.label$ = "!CANVAS"
				# Ignore
			else
				.labelRating$ = replace_regex$(buttonClicked.label$, "^[^a-zA-Z]+([A-Za-z])", "\l\1", 0)
				'.labelRating$' = buttonClicked.fractionX
				call set_RatingValues config.speakerDataTable Rating.'.labelRating$' 'buttonClicked.fractionX'
				call get_RatingValues 'config.speakerDataTable' 'te.ratingTable'

				.fractionYRating = buttonClicked.fractionY
				call Draw_button_internal 1 'te.rating$' 'buttonClicked.label$' 0
				call link_RatingValues 'te.ratingTable' 'config.speakerDataTable' 'buttonClicked.label$'
			endif
		endif
		goto ESCAPEDISPLAYSELECT
	endif
	
	# Set button 
	call Draw_button '.table$' Select 2
	if runningCommandMode = 1
		# Do nothing
		te.skipNextStep = 1
		goto ENDOFDISPLAYSELECT
	elsif demoKeyPressed() or buttonClicked.label$ = "Select"
		.firstT = -1
		.secondT = -1
		call init_window
		call Draw_button '.table$' Select 2
		goto ENDOFDISPLAYSELECT
	elsif currentStartTime <= 0 and currentEndTime <= 0
		goto ENDOFDISPLAYSELECT
	elsif .clickX < .xL or .clickX > .xR
		goto ESCAPEDISPLAYSELECT
	elsif .clickY < .yL or .clickX > .yH
		goto ESCAPEDISPLAYSELECT
	endif
	# Redraw window if there is an old selection
	if selectionIsDrawn or selectedStartTime > currentStartTime or selectedEndTime < currentEndTime
		selectedStartTime = currentStartTime
		selectedEndTime = currentEndTime
		# Clean up de screen
		# New selections are entered, do not redraw the old ones
		noDrawingSelection = 1
		call init_window
		noDrawingSelection = 0
		selectionIsDrawn = 0
	endif
	# Get feedback text
	call get_feedback_text 'config.language$' Select2
	.feedback2$ = get_feedback_text.text$
	call reset_viewport
	call write_feedback_text Blue '.feedback2$'
	
	# Set first border
	.selectedTime = currentStartTime + (currentEndTime - currentStartTime)*(.clickX - .xL)/(.xR - .xL)
	demo Colour... Blue
	demo Line width... 2
	demo Draw line... '.clickX' '.yH' '.clickX' '.yL'
	demo Text special... '.clickX' Centre '.yH' Bottom Helvetica 10 0 '.selectedTime:4'
	demoShow()
	demo Colour... Black
	demo Line width... 'defaultLineWidth'
	if .firstT < 0 and .secondT < 0
		.firstT = .selectedTime
	endif
	
	call Draw_button '.table$' Select 2
	select te.openSound
	.soundLength = Get total duration
	# Set second border
	while demoWaitForInput()
		.clickX = -1
		.clickY = -1
		if demoClicked()
			.clickX = demoX()
			.clickY = demoY()
			if demoClickedIn (.xL, .xR, .yL, .yH)
				.selectedTime = currentStartTime + (currentEndTime - currentStartTime)*(.clickX - .xL)/(.xR - .xL)
				demo Colour... Blue
				demo Line width... 2
				demo Draw line... '.clickX' '.yH' '.clickX' '.yL'
				demo Text special... '.clickX' Centre '.yH' Bottom Helvetica 10 0 '.selectedTime:4'
				demoShow()
				demo Colour... Black
				demo Line width... 'defaultLineWidth'
				selectionIsDrawn = 1
				if .firstT < 0 and .secondT < 0
					.firstT = .selectedTime
					call write_feedback_text Blue '.feedback2$'
				else
					.secondT = .selectedTime
					call wipeArea 'wipeFeedbackArea$'
					goto ENDOFDISPLAYSELECT
				endif
			else
		    	call buttonClicked 'te.buttons$' '.clickX' '.clickY'
		    	if buttonClicked.label$ = "Select"
					.firstT = -1
					.secondT = -1
					call init_window
					call Draw_button '.table$' Select 2
					goto ENDOFDISPLAYSELECT
				endif
			endif
		elsif demoKeyPressed()
			.pressed$ = demoKey$()
			if index_regex(.pressed$, "[-=_+]") > 0
				.windowSize = config.selectionWindow
				if index_regex(.pressed$, "[-_]") > 0
					.windowSize = 1
				endif
				# Remove line
				noDrawingSelection = 1
				call init_window
				noDrawingSelection = 0
				call Draw_button '.table$' Select 2
				.firstT -= .windowSize / 2
				if .firstT <= 0
					.firstT = 0
				endif
				.secondT = .firstT + .windowSize
				if .secondT > .soundLength
					.secondT = .soundLength
					.firstT = .secondT - .windowSize
				endif
				selectionIsDrawn = 1
				goto ENDOFDISPLAYSELECT
			else
				.firstT = -1
				.secondT = -1
				call init_window
				call Draw_button '.table$' Select 2
				
				goto ENDOFDISPLAYSELECT
			endif
		endif

	endwhile
	
	label ENDOFDISPLAYSELECT
	# Do things
	if .firstT >= 0 and .secondT >= 0
    	select te.openSound
		.soundLength = Get total duration
		selectedStartTime = min(.firstT, .secondT)
		selectedEndTime = max(.firstT, .secondT)
		if selectedStartTime < 0
			selectedStartTime = 0
		endif
		if selectedEndTime > .soundLength
			selectedEndTime = .soundLength
		endif
		call DrawCurrentSelection 0 1
		call Draw_button '.table$' Select 2
		call log_command MainPage SetSelection 'selectedStartTime' 'selectedEndTime' --
	endif
	call reset_viewport
	call Draw_button '.table$' Select 0
	
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
	if index(" Ltas Rating ", " 'mainPage.draw$' ") > 0
		call Draw_button 'te.buttons$' ZoomOut 1
		goto ZOOMOUTESCAPE
	endif
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
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
	if index(" Ltas Rating ", " 'mainPage.draw$' ") > 0
		call Draw_button 'te.buttons$' ZoomIn 1
		goto ZOOMINESCAPE
	endif
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
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
	if index(" Ltas Rating ", " 'mainPage.draw$' ") > 0
		call Draw_button 'te.buttons$' Next 1
		goto NEXTESCAPE
	endif
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
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
	if index(" Ltas Rating ", " 'mainPage.draw$' ") > 0
		call Draw_button 'te.buttons$' Previous 1
		goto PREVESCAPE
	endif
	if currentStartTime <= 0 and currentEndTime <= 0
    	call Draw_button '.table$' '.label$' 0
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
		call PrintSuperImposedPraatObject 1 '.minimum' '.maximum' '.printObjectCommand$'

	    call PrintMarksLeft .minimum .maximum
	    if index(.printObjectCommand$, " 0 'config.frequency' ") > 0
		    call PrintMarksBottom 0 'config.frequency'
	    else
		    call PrintMarksBottom 'currentStartTime' 'currentEndTime'
	    endif

	endif
endproc

procedure PrintSuperImposedPraatObject .drawMarks .minimum .maximum .printObjectCommand$
	if not noDrawingOrWriting
	    # convert Canvas to absolute coordinates
	    .xL = 0.7
	    .xR = 5.8
	    .yL = 0.47
	    .yH = 4.03
	    Select inner viewport... '.xL' '.xR' '.yL' '.yH'
	    Axes... 0 100 0 100
	    if .drawMarks and not (index(.printObjectCommand$, "yes") or index(.printObjectCommand$, "no"))
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

	    if (.selectXstart >= currentStartTime and .selectXstart <= currentEndTime) or (.selectXend >= currentStartTime and .selectXend <= currentEndTime)
		    Colour... Blue
		    Line width... 2
		    if .selectXstart >= currentStartTime and .selectXstart <= currentEndTime
			    Draw line... '.selectXstart' '.yH' '.selectXstart' '.yL'
			    Text special... '.selectXstart' Centre '.yH' Bottom Helvetica 10 0 'selectedStartTime:4'
		    endif
		    if .selectXend >= currentStartTime and .selectXend <= currentEndTime
			    Draw line... '.selectXend' '.yH' '.selectXend' '.yL'
			    Text special... '.selectXend' Centre '.yH' Bottom Helvetica 10 0 'selectedEndTime:4'
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
	    call DrawSuperImposedPraatObject 1 '.minimum' '.maximum' '.drawObjectCommand$'

	    call reset_viewport
	endif
endproc

procedure DrawSuperImposedPraatObject .drawMarks .minimum .maximum .drawObjectCommand$
	if not noDrawingOrWriting
	    # convert Canvas to absolute coordinates
	    .xL = canvasXL + viewportMargin
	    .xR = canvasXR - viewportMargin
	    .yL = canvasYL + viewportMargin
	    .yH = canvasYH - viewportMargin
	    demo Select inner viewport... '.xL' '.xR' '.yL' '.yH'
	    if .drawMarks and not (index(.drawObjectCommand$, "yes") or index(.drawObjectCommand$, "no"))
		    demo Draw rectangle...  0 100 0 100
	    endif
	    demo Axes... 0 100 0 100
		if not (.minimum = undefined or .maximum = undefined)
			if .minimum = .maximum			
				.minimum -= 1
				.maximum += 1
			endif
	    	demo '.drawObjectCommand$'
	    	if .drawMarks
				call DrawMarksLeft '.minimum' '.maximum'
			endif
	    	if mainPage.draw$ = "Ltas"
		    	if .drawMarks
			    	call DrawMarksBottom 0 'config.frequency'
				endif
	    	else
		    	if .drawMarks
					call DrawMarksBottom 'currentStartTime' 'currentEndTime'
				endif

				if te.voicingTextGrid > 0
					select te.voicingTextGrid
					.numIntervals = Get number of intervals... 1
					for .interval to .numIntervals
						.label$ = Get label of interval... 1 '.interval'
						if .label$ = "V"
							.start = Get start point... 1 '.interval'
							.end = Get end point... 1 '.interval'
							.duration = .end - .start
							# Interval is in window
							if .start < currentEndTime and .end > currentStartTime
							    demo Colour... 'te.voicingcolor$'
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
					call get_feedback_text 'config.language$' VoicingMarker
					.voicingText$ = get_feedback_text.text$
					.voiceMarkerPositionX = currentStartTime -(currentEndTime - currentStartTime)/30
					.voiceMarkerPositionY = .minimum - (.maximum - .minimum)/50
					demo Colour... 'te.voicingcolor$'
					demo Text special... '.voiceMarkerPositionX' Right '.voiceMarkerPositionY' Top Helvetica 11 0 '.voicingText$'
				    demoShow()
				    demo Colour... Black
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
	if not (noDrawingOrWriting or noDrawingSelection)
	    .xL = canvasXL + canvasLeftCorrection
	    .xR = canvasXR + canvasRightCorrection
	    .yL = canvasYL
	    .yH = canvasYH
	    # Mark current selection	
	    .selectXstart = -1
	    .selectXend = -1
	    if (selectedStartTime >= currentStartTime and selectedStartTime <= currentEndTime)
		    .selectXstart = .xL+(selectedStartTime-currentStartTime)/(currentEndTime - currentStartTime) * (.xR - .xL)
	    endif
	    if (selectedEndTime >= currentStartTime and selectedEndTime <= currentEndTime)
		    .selectXend = .xL+(selectedEndTime-currentStartTime)/(currentEndTime - currentStartTime) * (.xR - .xL)
	    endif
	    # Do not draw selection if it equals to the current window
	    if (selectedStartTime = currentStartTime and selectedEndTime = currentEndTime)
		    .selectXstart = -1
		    .selectXend = -1			
	    endif
	    
	    if .selectXstart > 0 or .selectXend > 0		    			
		    demo Colour... Blue
		    demo Line width... 2
		    call set_font_size 10
		    demo Helvetica
		    .startTextWidth = 0
		    .endTextWidth = 0
		    if .selectXstart > 0
			    demo Draw line... '.selectXstart' '.yH' '.selectXstart' '.yL'
			    demo Text special... '.selectXstart' Centre '.yH' Bottom Helvetica 10 0 'selectedStartTime:4'
			    .startTextWidth = demo Text width (wc)... 'selectedStartTime:4'
		    endif
		    if .selectXend > 0
			    demo Draw line... '.selectXend' '.yH' '.selectXend' '.yL'
			    demo Text special... '.selectXend' Centre '.yH' Bottom Helvetica 10 0 'selectedEndTime:4'
			    .endTextWidth = demo Text width (wc)... 'selectedEndTime:4'
		    endif
		    # Write intervalduration
		    .intervalDuration = selectedEndTime - selectedStartTime
		    .minPos = max(.selectXstart, .xL)
		    .maxPos = min(.selectXend, .xR)
		    .spaceAvailable = (.maxPos - .minPos) - (.startTextWidth+.endTextWidth)/2
		    .textPosition = (.minPos + .maxPos)/2
		    .intervalDurationText$ = "['.intervalDuration:4']"
		    .textWidth = demo Text width (wc)... '.intervalDurationText$'
		    while index_regex(.intervalDurationText$, "[1-9]") and .textWidth > .spaceAvailable
				.intervalDurationText$ = replace_regex$(.intervalDurationText$, "[\d\.]\]", "]", 0)
				.textWidth = demo Text width (wc)... '.intervalDurationText$'
		    endwhile
		    if index_regex(.intervalDurationText$, "[1-9]")
				demo Text special... '.textPosition' Centre '.yH' Bottom Helvetica 10 0 '.intervalDurationText$'
		    endif
		    
		    demoShow()
		    call set_font_size 'defaultFontSize'
			demo 'defaultFont$'
		    demo Colour... Black
		    demo Line width... 'defaultLineWidth'
		    selectionIsDrawn = 1
	    endif
	    call writeAnalysisValues 'mainPage.draw$'
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
	# There is a bug that hangs the Marks bottom for very small values
	if abs(.maximum - .minimum) > 0.000001
		.distance = 10^(ceiling(log10(abs(.maximum - .minimum)))-1)
		if .distance > abs(.maximum - .minimum)/2
			.distance /= 10
		endif
		if .distance <= 0
			.distance = abs('.maximum' - '.minimum')
		endif
		while .distance > 0 and abs(.maximum - .minimum) / 40 > .distance
			.distance *= 10
		endwhile
		if .distance <> undefined and abs(.maximum - .minimum) > .distance
			demo Marks bottom every... 1 '.distance' yes yes no
		endif
	endif
endproc

procedure DrawPitchObject
	if te.openSound > 0 and pitchName$ = ""
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Pitch")
			te.pitch = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Pitch
		else
			call to_pitch te.openSound

			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Pitch
			endif
		endif
		pitchName$ = selected$("Pitch")
		minPitch = Get minimum... 0 0 Hertz Parabolic
		minPitch = floor(minPitch)
		minPitch = 0
		maxPitch = Get maximum... 0 0 Hertz Parabolic
		if minPitch = undefined or maxPitch = undefined
			minPitch = 0
			maxPitch = 400
		endif
		maxPitch = ceiling(1.5*maxPitch)
		To PointProcess
		pointProcessName$ = selected$("PointProcess")
		te.voicingTextGrid = To TextGrid (vuv)... 0.2 0.1
	endif

	if pitchName$ <> ""
		select Pitch 'pitchName$'
		call 'mainPage.outputPraatObject$'PraatObject 'minPitch' 'maxPitch' Draw... 'currentStartTime' 'currentEndTime' 'minPitch' 'maxPitch' yes
		call 'mainPage.outputPraatObject$'CurrentSelection 'minPitch' 'maxPitch'
	endif
endproc

# Do not recalculate without need
procedure extractPartHarmonicity .fileID .start .end
	select .fileID
	.tempMatrix = To Matrix
	.tempSound = To Sound
	.tempSoundPart = Extract part... '.start' '.end' rectangular 1.0 true
	.tempMatrixPart = Down to Matrix
	.harmonicity = To Harmonicity
	select .tempMatrix
	plus .tempSound
	plus .tempSoundPart
	plus .tempMatrixPart
	Remove
	
	select .harmonicity
endproc

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
			# do not exagerate precision
			.cutStart = currentStartTime
			.cutEnd = currentEndTime
			.timeStep = 0.01
			
			# Check for cached analysis file
			if config.useCache > 0 and variableExists("currentDirectoryName$")
				createDirectory("'currentDirectoryName$''localCacheDir$'")
			endif
			if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Harmonicity")
				.tempHarm = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Harmonicity
				call extractPartHarmonicity '.tempHarm' '.cutStart' '.cutEnd'
				te.harmonicity = selected()
				select .tempHarm
				Remove
				select te.harmonicity
			else
				select te.openSound
				if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
					.cutStart = 0
					.cutEnd = Get total duration
				endif
				.tmpPartID = Extract part... '.cutStart' '.cutEnd' rectangular 1.0 true
				Rename... TmpPart
				# Settings from C.J. van As 2001 "Tracheoesophageal Speech" p83
				te.harmonicity = noprogress To Harmonicity (cc)... '.timeStep' 40 0 1.0
				# Arbitrarily put a floor of 0dB on the Harmonicity to Noise ratio
				Formula... if self < 0 then 0 else self fi
				select .tmpPartID
				Remove
				select te.harmonicity
				# Write file to cache
				if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
					Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Harmonicity
					
					.cutStart = currentStartTime
					.cutEnd = currentEndTime
					call extractPartHarmonicity 'te.harmonicity' '.cutStart' '.cutEnd'
					.newHarm = selected()
					select te.harmonicity
					Remove
					te.harmonicity = .newHarm
					select te.harmonicity
				endif
			endif
			harmonicityName$ = selected$("Harmonicity")
			previousHarmonicityStart = currentStartTime
			previousHarmonicityEnd = currentEndTime
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

		select te.harmonicity
		call 'mainPage.outputPraatObject$'PraatObject 'minHarmonicity' 'maxHarmonicity' Draw... 'currentStartTime' 'currentEndTime' 'minHarmonicity' 'maxHarmonicity'
		call 'mainPage.outputPraatObject$'CurrentSelection 'minHarmonicity' 'maxHarmonicity'
		
	endif
endproc

# Calculate the MaxHarmonicity time
procedure calcMaxHarmonicity .soundfile
	if .soundfile > 0
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_max.Harmonicity")
			.tmpHarmonicity = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_max.Harmonicity
		else
			select te.openSound
			# Settings adapted from C.J. van As 2001 "Tracheoesophageal Speech" p83
			.tmpHarmonicity = noprogress To Harmonicity (cc)... 0.1 40 0 4.5
			# Arbitrarily put a floor of 0dB on the Harmonicity to Noise ratio
			Formula... if self < 0 then 0 else self fi
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_max.Harmonicity
			endif
		endif
		# Get smoothed maximum harmonicity
		select .tmpHarmonicity
		.tmpMatrix = To Matrix
		select .tmpMatrix
		.tmpSound = To Sound (slice)... 1
		.tmpFiltered = Filter (pass Hann band)... 0 4 4
		.time = Get time of maximum... 0 0 Parabolic
		.value = Get maximum... 0 0 Parabolic
		# Remove temporary files
		select .tmpMatrix
		plus .tmpHarmonicity
		plus .tmpSound
		plus .tmpFiltered
		Remove
	endif
endproc

##################################################################
#
# Create a Sound file with the Harmonicity low value
# Simply the HNR from a low pass filtered sound file (not correct?)
# Different from
# van Gogh et al. (2005) Acoustical analysis of tracheoesophageal voice. 
# Speech Communication, 47.
procedure sound2Harm_low .startpoint .endpoint
	.timeStep = 0.01
	select te.openSound
	.duration = Get total duration
	if .endpoint = 0
		.endpoint = .duration
	endif
	# Check for cached analysis file
	if config.useCache > 0 and variableExists("currentDirectoryName$")
		createDirectory("'currentDirectoryName$''localCacheDir$'")
	endif
	if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_low.Harmonicity")
		.tempHarm = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_low.Harmonicity
		call extractPartHarmonicity '.tempHarm' '.startpoint' '.endpoint'
		te.harmLow = selected()
		select .tempHarm
		Remove
		select te.harmLow
	else
		select te.openSound
		if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
			.cutStart = 0
			.cutEnd = Get total duration
		else
			.cutStart = .startpoint
			.cutEnd = .endpoint
		endif
		.tmpPartSoundID = Extract part... '.cutStart' '.cutEnd' rectangular 1.0 true
		.tmpPartID = Filter (pass Hann band)... 0 700 100
		Rename... TmpPart
		select .tmpPartSoundID
		Remove
		select .tmpPartID
		# Settings from C.J. van As 2001 "Tracheoesophageal Speech" p83
		te.harmLow = noprogress To Harmonicity (cc)... '.timeStep' 40 0 1.0
		# Arbitrarily put a floor of 0dB on the Harmonicity to Noise ratio
		Formula... if self < 0 then 0 else self fi
		select .tmpPartID
		Remove
		select te.harmLow
		# Write file to cache
		if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
			Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_low.Harmonicity
			
			.cutStart = .startpoint
			.cutEnd = .endpoint
			call extractPartHarmonicity 'te.harmLow' '.cutStart' '.cutEnd'
			.newHarm = selected()
			select te.harmLow
			Remove
			te.harmLow = .newHarm
			select te.harmLow
		endif
	endif
	select te.harmLow
endproc

##################################################################
#
# Create a Sound file with the Harmonicity high value
# Simply the HNR from a high pass filtered sound file (not correct?)
# Different from
# van Gogh et al. (2005) Acoustical analysis of tracheoesophageal voice. 
# Speech Communication, 47.
procedure sound2Harm_high .startpoint .endpoint
	.timeStep = 0.01
	select te.openSound
	.duration = Get total duration
	if .endpoint = 0
		.endpoint = .duration
	endif
	# Check for cached analysis file
	if config.useCache > 0 and variableExists("currentDirectoryName$")
		createDirectory("'currentDirectoryName$''localCacheDir$'")
	endif
	if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_high.Harmonicity")
		.tempHarm = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_high.Harmonicity
		call extractPartHarmonicity '.tempHarm' '.startpoint' '.endpoint'
		te.harmHigh = selected()
		select .tempHarm
		Remove
		select te.harmHigh
	else
		select te.openSound
		if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
			.cutStart = 0
			.cutEnd = Get total duration
		else
			.cutStart = .startpoint
			.cutEnd = .endpoint
		endif
		.tmpPartSoundID = Extract part... '.cutStart' '.cutEnd' rectangular 1.0 true
		.tmpPartID = Filter (pass Hann band)... 700 2300 100
		Rename... TmpPart
		select .tmpPartSoundID
		Remove
		select .tmpPartID
		# Settings from C.J. van As 2001 "Tracheoesophageal Speech" p83
		te.harmHigh = noprogress To Harmonicity (cc)... '.timeStep' 40 0 1.0
		# Arbitrarily put a floor of 0dB on the Harmonicity to Noise ratio
		Formula... if self < 0 then 0 else self fi
		select .tmpPartID
		Remove
		select te.harmHigh
		# Write file to cache
		if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
			Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_high.Harmonicity
			
			.cutStart = .startpoint
			.cutEnd = .endpoint
			call extractPartHarmonicity 'te.harmHigh' '.cutStart' '.cutEnd'
			.newHarm = selected()
			select te.harmHigh
			Remove
			te.harmHigh = .newHarm
			select te.harmHigh
		endif
	endif
	select te.harmHigh
endproc

##################################################################
#
# Create a Sound file with the GNE values
procedure sound2GNEvalue .startpoint .endpoint
	# Window and analysis values from C.J. van As 2001 "Tracheoesophageal Speech" p83
	.windowSize = 0.250
	# Note link with sample frequency below!
	# Only .sampleGNE samples are calcualted for the GNE to reduce the response time
	.sampleGNE = 30
	.timeStep = 0.005
	while (.sampleGNE * .timeStep) < abs(.endpoint - .startpoint)
		.timeStep += 0.005
	endwhile
	select te.openSound
	.duration = Get total duration
	if .endpoint = 0
		.endpoint = .duration
	endif
	# Check for cached analysis file
	if config.useCache > 0 and variableExists("currentDirectoryName$")
		createDirectory("'currentDirectoryName$''localCacheDir$'")
	endif
	if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
		.begin = 0
		.end = .duration
	else
		.begin = .startpoint
		.end = .endpoint
	endif
	if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.GNE")
		.gneSoundID = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.GNE
	else
		.gneSoundID = Create Sound from formula... GNE 1 0 .duration 100 0
		.startSample = ceiling((.begin + .windowSize/2)/.timeStep)
		.endSample = floor((.end - .windowSize/2)/.timeStep)
		for .t from .startSample to .endSample
			.t1 = .t*.timeStep - .windowSize/2
			.t2 = .t1 + .timeStep + .windowSize
			select te.openSound
			.frameID = Extract part... '.t1' '.t2' rectangular 1.0 true
			.gneID = noprogress To Harmonicity (gne)... 500 4500 1000 80
			.gneValue = Get maximum
			select .frameID
			plus .gneID
			Remove
			select .gneSoundID
			Set value at sample number... 0 '.t' '.gneValue'
		endfor
		select .gneSoundID
		if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
			Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.GNE
		endif
	endif
	if .startpoint > 0 or .endpoint < .duration
		select .gneSoundID
		.newID = Extract part... '.startpoint' '.endpoint' rectangular 1.0 true
		select .gneSoundID
		Remove
		.gneSoundID = .newID
	endif
	select .gneSoundID
endproc

# Mostly useless as the GNE tends to increase for short intervals.
# Do not recalculate without need
procedure DrawGNEObject
	.windowSize = 0.120
	if gneName$ <> ""
		if currentStartTime != previousGNEstart or currentEndTime != previousGNEend
			select te.openSound
			Remove
			gneName$ = ""
		endif
	endif
	if recordedSound$ <> ""
		if gneName$ = "" or currentStartTime != previousGNEstart or currentEndTime != previousGNEend
			call sound2GNEvalue 'currentStartTime' 'currentEndTime'
			te.gneSound = selected()
			gneName$ = selected$("Sound")
			previousGNEstart = currentStartTime
			previousGNEend = currentEndTime
		endif
		minGNE = 0
		maxGNE = 1

		select te.gneSound
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
		select te.openSound
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
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Spectrogram")
			te.spectrogram = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Spectrogram
		else
			select te.openSound
			.currentSampleFrequency = Get sampling frequency
			.nyquistFrequency = .currentSampleFrequency / 2
			te.spectrogram = noprogress To Spectrogram... 0.1 '.nyquistFrequency' 0.001 10 Gaussian
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Spectrogram
			endif
		endif
		spectrogramName$ = selected$("Spectrogram")
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Formant")
			te.formant = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Formant
		else
			select te.openSound
			te.formant = noprogress To Formant (burg)... 0.02 4 4400 0.1 50
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Formant
			endif
		endif
		
		formantName$ = selected$("Formant")
	endif

	if te.spectrogram > 0 and not noDrawingOrWriting
		select te.spectrogram
		call 'mainPage.outputPraatObject$'PraatObject 0 'config.frequency' Paint... 'currentStartTime' 'currentEndTime' 0 'config.frequency' 80 yes 70 6 0 yes
		if config.showFormants > 0
			if mainPage.outputPraatObject$ = "Draw"
				demo Colour... Maroon
			else
				Colour... Maroon
			endif
			select te.formant
			call 'mainPage.outputPraatObject$'SuperImposedPraatObject 0 0 'config.frequency' Speckle... 'currentStartTime' 'currentEndTime' 'config.frequency' 25 no
			if mainPage.outputPraatObject$ = "Draw"
				demo Colour... Black
			else
				Colour... Black
			endif
		endif
		call 'mainPage.outputPraatObject$'CurrentSelection 0 'config.frequency'
		call writeAnalysisValues 'mainPage.draw$'
	endif
endproc

procedure DrawLtasObject
	if ltasName$ <> ""
		select Ltas 'ltasName$'
		Remove
		ltasName$ = ""
	endif
	if recordedSound$ <> ""
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_'selectedStartTime:3'_'selectedEndTime:3'.Ltas")
			te.Ltas = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_'selectedStartTime:3'_'selectedEndTime:3'.Ltas
		else
			select te.openSound
			.tmpPartID = Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 false
			Rename... TmpPart
			.tmpSpecID = noprogress To Spectrum... yes
			te.Ltas = noprogress To Ltas (1-to-1)
			select .tmpPartID
			plus .tmpSpecID
			Remove
			select te.Ltas
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'_'selectedStartTime:3'_'selectedEndTime:3'.Ltas
			endif
			
		endif
		ltasName$ = selected$("Ltas")
		.minimum = -20
		.maximum = Get maximum... 0 0 None
		call 'mainPage.outputPraatObject$'PraatObject '.minimum' '.maximum' Draw... 0 'config.frequency' '.minimum' '.maximum' yes Curve
		
		call writeAnalysisValues 'mainPage.draw$'
	endif
endproc

procedure DrawIntensityObject
	if recordedSound$ <> "" and intensityName$ = ""
		# Check for cached analysis file
		if config.useCache > 0 and variableExists("currentDirectoryName$")
			createDirectory("'currentDirectoryName$''localCacheDir$'")
		endif
		if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Intensity")
			te.intensity = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Intensity
		else
			select te.openSound
			te.intensity = noprogress To Intensity... 60 0 yes
			# Write file to cache
			if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
				Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Intensity
			endif
		endif
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

procedure DrawRatingObject
	if te.ratingTable <= 0
		call loadLanguageTable Rating'config.ratingForm$' 'config.language$'
		te.ratingTable = loadLanguageTable.tableID
		select te.ratingTable
		te.rating$ = selected$("Table")
		call relative2absolutePosition 'te.rating$'
	endif
	call get_RatingValues 'config.speakerDataTable' 'te.ratingTable'
	call Draw_all_buttons 'te.ratingTable'
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
	
	# Do not print "nothing"
	.currentID$ = ""
	if speakerID$ <> ""
		.currentID$ = replace_regex$(speakerID$, "^\W*([\w\- ]+).*$", "\1", 0)
		.currentID$ = replace_regex$(.currentID$, " ", "_", 0)
	else
		.currentID$ = "TEVA"
	endif
	.filename$ = ""
	if currentSoundName$ <> ""
		.outExtension$ = "eps"
		if config.saveFMT$ = "PDF"
			.outExtension$ = "pdf"
		elsif config.saveFMT$ = "PNG"
			.outExtension$ = "png"
		elsif config.saveFMT$ = "EMF"
			.outExtension$ = "emf"
		endif
		.filename$ = chooseWriteFile$ (.writeDialogue$, "'.currentID$'.'.outExtension$'")
		if .filename$ <> ""
			call print_signal '.filename$'
			
			# Save audio file
			if config.saveAll
				.audioFilename$ = replace_regex$(.filename$, "\.[^\.]+$", ".wav", 0)
				select te.openSound
				.tmpPartSoundID = Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 true
				Save as WAV file... '.audioFilename$'
				Remove
			endif
		endif
	endif
endproc

procedure calculatePitchValues
	.numberFrames = 0
	.voicedFrames = 0
	.meanPitch = 0
	.sdPitch = 0
	.maximumVoicingDuration = 0
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
		# Settings adapted from C.J. van As 2001 "Tracheoesophageal Speech" p83
		.jitter = Get jitter (local)... 'selectedStartTime' 'selectedEndTime' 0.0001 0.02 5
		select te.openSound
		plus PointProcess 'pitchName$'
		.shimmer = Get shimmer (local)... 'selectedStartTime' 'selectedEndTime' 0.0001 0.02 5 5
	endif
	if te.voicingTextGrid > 0
		select te.voicingTextGrid
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
	.pitchValues$ = replace$(.pitchValues$, "VOICEDFRACTIONS$", "'.voicedFractions:1%'\% ", 0)
	.pitchValues$ = replace$(.pitchValues$, "JITTER$", "'.jitter:1%'\% ", 0)
	.pitchValues$ = replace$(.pitchValues$, "SHIMMER$", "'.shimmer:1%'\% ", 0)
	.pitchValues$ = replace$(.pitchValues$, "MEANPITCH$", "'.meanPitch:0'", 0)
	.pitchValues$ = replace$(.pitchValues$, "SDPITCH$", "'.sdPitch:1'", 0)
	.pitchValues$ = replace$(.pitchValues$, "MEDIANPITCH$", "'.medianPitch:0'", 0)
	.text$ = replace$(.pitchValues$, "--undefined--", "--", 0)
	
	call get_feedback_text 'config.language$' ShortPitchValues
	.shortPitchValues$ = get_feedback_text.text$
	.shortPitchValues$ = replace$(.shortPitchValues$, "VOICEDFRACTIONS$", "'.voicedFractions:1%'\% ", 0)
	.shortPitchValues$ = replace$(.shortPitchValues$, "JITTER$", "'.jitter:1%'\% ", 0)
	.shortPitchValues$ = replace$(.shortPitchValues$, "SHIMMER$", "'.shimmer:1%'\% ", 0)
	.shortPitchValues$ = replace$(.shortPitchValues$, "MEANPITCH$", "'.meanPitch:0'", 0)
	.shortPitchValues$ = replace$(.shortPitchValues$, "SDPITCH$", "'.sdPitch:1'", 0)
	.shortText$ = replace$(.shortPitchValues$, "--undefined--", "--", 0)

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
	# Acoustic Signal Typing: Jitter Shimmer
	call setPathParameter 'pathologicalParameters' Jitter '.jitter'
	call setPathParameter 'pathologicalParameters' Shimmer '.shimmer'

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
	call setPathParameter 'pathologicalParameters' MVD '.maximumVoicingDuration'

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

procedure to_pitch .sound
	# Most of these do not work, van As and CC seem to be the best
	select .sound
	if config.pitchalgorithm$ = "VanAs"
		# Settings from C.J. van As 2001 "Tracheoesophageal Speech" p83
		te.pitch = noprogress To Pitch (cc)... 0 40 15 no  0.03 0.40 0.01 0.35 0.14 250
	elsif config.pitchalgorithm$ = "CC300"
		#  time step, Min pitch, Candidates, accurate, sil thr, voic thr., Oct cost, jump cost, VU cost, Max pitch
		te.pitch = noprogress To Pitch (cc)... 0 40 15 yes 0.03 0.40 0.045 0.35 0.14 300
	elsif config.pitchalgorithm$ = "CC600"
		#  time step, Min pitch, Candidates, accurate, sil thr, voic thr., Oct cost, jump cost, VU cost, Max pitch
		te.pitch = noprogress To Pitch (cc)... 0 40 15 yes 0.03 0.40 0.045 0.35 0.14 600
	elsif config.pitchalgorithm$ = "AC"
		te.pitch = noprogress To Pitch (ac)... 0 40 25 yes 0.03 0.40 0.1 0.5 0.2 250
	elsif config.pitchalgorithm$ = "SHS"
		te.pitch = noprogress To Pitch (shs)... 0.01 40 15 1250.0 15 0.84 250 48		
	elsif config.pitchalgorithm$ = "SPINET"
		te.pitch = noprogress To Pitch (SPINET)... 0.005 0.040 40 5000.0 250 250 20		
	else
		te.pitch = noprogress To Pitch (cc)... 0 40 15 no 0.03 0.40 0.01 0.35 0.14 250
	endif
	select te.pitch
endproc

procedure extractRahmonicPart .table .begin .end
	select .table
	.name$ = selected$("Table")
	.tmp = Copy... '.name$'_part
	if .begin != 0 or .end != 0
		.numRows = Get number of rows
		for .i to .numRows
			.row = .numRows +1 - .i
			.time = Get value... '.row' time
			if .time < .begin or .time > .end
				select .tmp
				Remove row... '.row'
			endif
		endfor
	endif
	select .tmp
endproc
procedure calculateCepstralRahmonic
	.windowsize = 0.025
	.pitchFloor = 3/.windowsize
	.timestep = 0.02
	.maxfreq = 5000
	.preEmphasis = 50
	
	.cutStart = selectedStartTime
	.cutEnd = selectedStartTime
	if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
		.cutStart = 0
		.cutEnd = 0
	endif
	if config.useCache >= 0 and fileReadable("'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Rahmonic")
		.tmpCepstralRahmonic = Read from file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Rahmonic
		call extractRahmonicPart '.tmpCepstralRahmonic' 'selectedStartTime' 'selectedEndTime'
		te.cepstralRahmonic = selected()
		select .tmpCepstralRahmonic
		Remove
		select te.cepstralRahmonic
	else
		select te.openSound
		.tmpPartSoundID = Extract part... '.cutStart' '.cutEnd' rectangular 1.0 true
		.cepstrogram = noprogress To PowerCepstrogram... .pitchFloor .timestep .maxfreq .preEmphasis
		te.cepstralRahmonic = noprogress To Table (peak prominence)... 30 300 0.05 Cubic 0.001 0 Straight Robust
		select .tmpPartSoundID
		plus .cepstrogram
		Remove
		select te.cepstralRahmonic
		if config.useCache >=0 and fileReadable("'currentDirectoryName$''localCacheDir$'")
			Save as binary file... 'currentDirectoryName$''localCacheDir$'/'currentSoundName$'.Rahmonic
			call extractRahmonicPart 'te.cepstralRahmonic' 'selectedStartTime' 'selectedEndTime'
			.tmp = selected()
			select te.cepstralRahmonic
			Remove
			te.cepstralRahmonic = .tmp
		endif
	endif
	select te.cepstralRahmonic
	.max = Get maximum... cpp
	.mean = Get mean... cpp
	.sd = Get standard deviation... cpp
	call setPathParameter 'pathologicalParameters' CepsRahm '.max'
endproc

# Do not recalculate needlessly
te.gneValue = 0
te.harmLowValue = 0
te.harmHighValue = 0
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
		if config.calcGNE and selectedEndTime - selectedStartTime > 0.06
			if .previousHarmonicity != te.harmonicity or .previousSelectedGNEStartTime != selectedStartTime or .previousSelectedGNEEndTime != selectedEndTime
				call sound2GNEvalue 'selectedStartTime' 'selectedEndTime'
				.gneID = selected()
				te.gneValue = Get maximum... 0 0 Sinc70
				select .gneID
				Remove
				
				.previousSelectedGNEStartTime = selectedStartTime
				.previousSelectedGNEEndTime = selectedEndTime
				.previousHarmonicity = te.harmonicity
			endif
		else
			te.gneValue = 0
		endif
		if te.calcLowHighHNR
			# Calculate Harmonicity value < 700Hz
			call sound2Harm_low 'selectedStartTime' 'selectedEndTime'
			.harmLowID = selected()
			te.harmLowValue = Get maximum... 0 0 Parabolic
			select .harmLowID
			Remove
			# Calculate 700 < Harmonicity value < 2300Hz
			call sound2Harm_high 'selectedStartTime' 'selectedEndTime'
			.harmHighID = selected()
			te.harmHighValue = Get maximum... 0 0 Parabolic
			select .harmHighID
			Remove
		endif
	else
		te.gneValue = 0
		te.harmLowValue = 0
		te.harmHighValue = 0
	endif
	
	call get_feedback_text 'config.language$' HarmonicityValues
	.hnrValues$ = get_feedback_text.text$
	.hnrValues$ = replace$(.hnrValues$, "MAXHARMONICITY$", "'.maxHarmonicity:1'", 0)
	.hnrValues$ = replace$(.hnrValues$, "MINHARMONICITY$", "'.minHarmonicity:1'", 0)
	.hnrValues$ = replace$(.hnrValues$, "MEANHARMONICITY$", "'.meanHarmonicity:1'", 0)
	.hnrValues$ = replace$(.hnrValues$, "SDHARMONICITY$", "'.sdHarmonicity:2'", 0)
	if config.calcGNE
		.hnrValues$ = replace$(.hnrValues$, "GNEVALUE$", "'te.gneValue:3'", 0)
	else
		.hnrValues$ = replace$(.hnrValues$, "GNEVALUE$", "-", 0)
	endif
	.text$ = .hnrValues$

	call get_feedback_text 'config.language$' ShortHarmonicityValues
	.shortHnrValues$ = get_feedback_text.text$
	.shortHnrValues$ = replace$(.shortHnrValues$, "MAXHARMONICITY$", "'.maxHarmonicity:1'", 0)
	.shortHnrValues$ = replace$(.shortHnrValues$, "MINHARMONICITY$", "'.minHarmonicity:1'", 0)
	.shortHnrValues$ = replace$(.shortHnrValues$, "MEANHARMONICITY$", "'.meanHarmonicity:1'", 0)
	.shortHnrValues$ = replace$(.shortHnrValues$, "SDHARMONICITY$", "'.sdHarmonicity:2'", 0)
	if config.calcGNE
		.shortHnrValues$ = replace$(.shortHnrValues$, "GNEVALUE$", "'te.gneValue:3'", 0)
	else
		.shortHnrValues$ = replace$(.shortHnrValues$, "GNEVALUE$", "-", 0)
	endif
	.shortText$ = .shortHnrValues$


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
	call setPathParameter 'pathologicalParameters' GNE 'te.gneValue'
	# Different from
	# van Gogh et al. (2005) Acoustical analysis of tracheoesophageal voice. 
	# Speech Communication, 47.
	call setPathParameter 'pathologicalParameters' HNRlow 'te.harmLowValue'
	call setPathParameter 'pathologicalParameters' HNRhigh 'te.harmHighValue'

	.astGNE = 0
	if te.gneValue > (0.82 + 0.82) / 2
		.astGNE = 1
	elsif te.gneValue > (0.77 + 0.82) / 2
		.astGNE = 2
	elsif te.gneValue > (0.77 + 0.72) / 2
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
	
	#.text$ = "Harmonicity - Max.: '.maxHarmonicity:1' dB, Min.: '.minHarmonicity:1' dB, Mean: '.meanHarmonicity:1' dB, SD: '.sdHarmonicity:2' dB, GNE: 'te.gneValue:3'"
endproc

procedure calculateRatingValues
	.shorttextAST$ = ""
	.textAST$ = "";
	.text$ = "";
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

	call get_feedback_text 'config.language$' ShortLtasValues
	.shortLtasValues$ = get_feedback_text.text$
	.shortLtasValues$ = replace$(.shortLtasValues$, "MAXFREQUENCY$", "'.maxFrequency:0'", 0)
	.shortLtasValues$ = replace$(.shortLtasValues$, "BED$", "'.bed:1'", 0)
	.shortLtasValues$ = replace$(.shortLtasValues$, "COG$", "'.cog:0'", 0)
	.shortText$ = .shortLtasValues$

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
	
	if te.formant > 0
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
		call setPathParameter 'pathologicalParameters' QF1 '.qualityF1'
		call setPathParameter 'pathologicalParameters' QF2 '.qualityF2'
		call setPathParameter 'pathologicalParameters' QF3 '.qualityF3'
		call setPathParameter 'pathologicalParameters' QF4 '.qualityF4'
	endif
endproc

# Predict AST and VQ from "learned" formulas

procedure predictVQ_LM .vf .hnr .pitch
	.vq = 0
	.i_vq = 0
	if .vf > 0
		.i_vq = 1.457596 * .vf - 0.042732 * .hnr - 0.008651 * .pitch + 2.015532
		.vq = (.i_vq - 1) * 250 + 125
		if .vq < 0
			.vq = 0
		elsif .vq > 1000
			.vq = 1000
		endif
	endif
endproc

# Recursive Partitioning
procedure predictAST_RPart .vf .mvd .hnr .hnrLow  .hnrHigh .shimmer .jitter .crmax .gne .bed .qf3
	.ast = 0
	if .vf > 0.0001
		# With Pitch
		if .vf >= 0.508
			if .vf >= 0.998
				.ast = 1.353
			else
				if .mvd >= 2.731
					.ast = 1.885
				else
					.ast = 2.357
				endif
			endif
		else
			if .vf >= 0.0715
				.ast = 3.176
			else
				.ast = 3.8
			endif
		endif		
	else
		.ast = 4
	endif
endproc

procedure predictVQvalue
	.drawingSetting = noDrawingOrWriting
	noDrawingOrWriting = 1
	# Get current values
	# AST ~ VF + HNR + Pitch
	# Use:
	# lm
	# AST ~ VF + HNR + Pitch

	# MVD + VF + Pitch + Jitter + Shimmer
	call DrawPitchObject
	call calculatePitchValues
	call getPathParameter 'pathologicalParameters' MVD
	.mvd = getPathParameter.value
	call getPathParameter 'pathologicalParameters' VoicedFraction
	.vf = getPathParameter.value
	call getPathParameter 'pathologicalParameters' Pitch
	.pitch = getPathParameter.value
	call getPathParameter 'pathologicalParameters' Jitter
	.jitter = getPathParameter.value
	call getPathParameter 'pathologicalParameters' Shimmer
	.shimmer = getPathParameter.value
	
	# HNR, HNRlow/high etc
	.hnr = 0
	call DrawHarmonicityObject
	call calculateHarmonicityValues
	call getPathParameter 'pathologicalParameters' HNR
	.hnr = getPathParameter.value
	
	# The Formula
	call predictVQ_LM .vf .hnr .pitch
	.vq = predictVQ_LM.vq
	
	noDrawingOrWriting = .drawingSetting
	
endproc

procedure predictASTvalue
	.drawingSetting = noDrawingOrWriting
	noDrawingOrWriting = 1
	# Get current values
	# AST ~ MVD + QF3 + VF + Pitch + Jitter + Shimmer+ HNR + GNE + BED
	# Use:
	# RPart
	# AST ~ VF + MVD
	.useValues = 0

	# MVD + VF + Pitch + Jitter + Shimmer
	call DrawPitchObject
	call calculatePitchValues
	call getPathParameter 'pathologicalParameters' MVD
	.mvd = getPathParameter.value
	call getPathParameter 'pathologicalParameters' VoicedFraction
	.vf = getPathParameter.value
	call getPathParameter 'pathologicalParameters' Pitch
	.pitch = getPathParameter.value
	call getPathParameter 'pathologicalParameters' Jitter
	.jitter = getPathParameter.value
	call getPathParameter 'pathologicalParameters' Shimmer
	.shimmer = getPathParameter.value
	
	# Cepstral Rahmonic
	.crmax = 0
	if .useValues
		call calculateCepstralRahmonic
		call getPathParameter 'pathologicalParameters' CepsRahm
		.crmax = getPathParameter.value
	endif
	
	
	# QF1-3
	.qf1 = 0
	.qf2 = 0
	.qf3 = 0
	if .useValues
		call DrawSpectrogramObject
		call calculateSpectrogramValues
		call getPathParameter 'pathologicalParameters' QF1
		.qf1 = getPathParameter.value
		call getPathParameter 'pathologicalParameters' QF2
		.qf2 = getPathParameter.value
		call getPathParameter 'pathologicalParameters' QF3
		.qf3 = getPathParameter.value
	endif
	
	# HNR + GNE
	.hnr = 0
	.hnrLow = 0
	.hnrHigh = 0
	.gne = 0	
	if .useValues
		call DrawHarmonicityObject
		te.calcLowHighHNR = 1
		call calculateHarmonicityValues
		te.calcLowHighHNR = 0
		call getPathParameter 'pathologicalParameters' HNR
		.hnr = getPathParameter.value
		call getPathParameter 'pathologicalParameters' HNRlow
		.hnrLow = getPathParameter.value
		call getPathParameter 'pathologicalParameters' HNRhigh
		.hnrHigh = getPathParameter.value
		call getPathParameter 'pathologicalParameters' GNE
		.gne = getPathParameter.value
	endif
		
	# BED
	.bed = 0
	if .useValues
		call DrawLtasObject
		call calculateLtasValues
		call getPathParameter 'pathologicalParameters' BED
		.bed = getPathParameter.value
	endif
	
	# If VF = 0, pitch derived parameters do not make sense
	if .vf = 0
		.pitch = undefined
		.jitter = undefined
		.shimmer = undefined
		.hnr = undefined
		.hnrLow = undefined
		.hnrHigh = undefined
		.gne = undefined
		.crmax = undefined
	endif
	
	# The Formula
	.astLM = -1
	.astRPart = -1
	# call predictLM .vf .mvd .hnr .hnrLow  .hnrHigh .shimmer .jitter .crmax .gne .bed .qf3
	# .astLM = predictLM.ast
	call predictAST_RPart .vf .mvd .hnr .hnrLow  .hnrHigh .shimmer .jitter .crmax .gne .bed .qf3
	.astRPart = predictAST_RPart.ast
	
	.ast = .astRPart
	noDrawingOrWriting = .drawingSetting
	
endproc

# Select a window based on maxTimeHaronicity
procedure selectMaxTimeHarmonicity	
	# Has maxTimeHaronicity been calculated?
	if maxTimeHarmonicity <= 0
		call calcMaxHarmonicity te.openSound
		maxTimeHarmonicity = calcMaxHarmonicity.time
	endif
	
	# Set selection window around the maxTimeHarmonicity
	if maxTimeHarmonicity > config.selectionWindow / 2
		selectedStartTime = maxTimeHarmonicity - config.selectionWindow / 2
	else
		selectedStartTime = 0
	endif
	selectedEndTime = selectedStartTime + config.selectionWindow
	if selectedEndTime > currentEndTime
		selectedEndTime = currentEndTime
		selectedStartTime = selectedEndTime - config.selectionWindow
	endif
endproc

# Get best selection to predict AST. This will set a new selection
procedure argMinASTselection
	# Initialization
	.originalStartTime = selectedStartTime
	.originalEndTime = selectedEndTime
	.intervalLength = config.selectionWindow
	.deltaTime = .intervalLength / 10
	.bestStartTime = selectedStartTime
	.bestEndTime = selectedEndTime
	.currentASTMinimum = 10**10
	
	# Set up the first interval (Start at end)
	selectedEndTime = currentEndTime
	selectedStartTime = selectedEndTime - .intervalLength
	if selectedStartTime < currentStartTime
		selectedStartTime = currentStartTime
	endif
	.bestStartTime = selectedStartTime
	.bestEndTime = selectedEndTime
	call predictASTvalue
	.currentASTMinimum = predictASTvalue.ast
	.ast = .currentASTMinimum
	selectedStartTime = currentStartTime
	selectedEndTime = selectedStartTime + .intervalLength	
	
	# Step through sound
	while selectedEndTime <= currentEndTime
		call predictASTvalue
		if .currentASTMinimum > predictASTvalue.ast
			.currentASTMinimum = predictASTvalue.ast
			.bestStartTime = selectedStartTime
			.bestEndTime = selectedEndTime
		endif
		selectedStartTime += .deltaTime
		selectedEndTime = selectedStartTime + .intervalLength	
	endwhile
	
	# Set up best values
	selectedStartTime = .bestStartTime
	selectedEndTime = .bestEndTime
	.ast = .currentASTMinimum
	predictedPathType = round(.ast)
endproc

# Procedures involved in the Rating screen
procedure get_RatingValues .speakerDataTable .ratingTable
	if .speakerDataTable > 0 and .ratingTable > 0
		select .ratingTable
		.numRatingRows = Get number of rows
		for .ratingRow to .numRatingRows
			select .ratingTable
			.ratingKey$ = Get value... .ratingRow Label
			if startsWith(.ratingKey$, ">")
				.variableName$ = replace_regex$(.ratingKey$, "^[^a-zA-Z]+([A-Za-z])", "\l\1", 0)
				call get_speakerInfo 'speakerID$'
				.row = get_speakerInfo.row
				select .speakerDataTable
				.column = Get column index... Rating.'.variableName$'
				'.variableName$' = -1
				if .row > 0
					if .column > 0
						# Clean up earlier values
						'.variableName$' = -1
						'.variableName$'ArrayLength = 0
						'.variableName$'Array[1] = -1
						.valueTxt$ = Get value... .row Rating.'.variableName$'
						.value = Get value... .row Rating.'.variableName$'
						if not .value = undefined
							'.variableName$' = (.value - 1)/999
						endif
						# Ranges
						if index(.valueTxt$, ";")
							'.variableName$'ArrayLength = 0
							while index_regex(.valueTxt$, "[0-9]") > 0
								'.variableName$'ArrayLength += 1
								.value = extractNumber(.valueTxt$, "")
								'.variableName$'Array['.variableName$'ArrayLength] = (.value - 1)/999
								if index(.valueTxt$, ";")
									.valueTxt$ = right$(.valueTxt$, (length(.valueTxt$) - index(.valueTxt$, ";")))
								else
									.valueTxt$ = ""
								endif
							endwhile
						endif
					else
						select .speakerDataTable
						Append column... Rating.'.variableName$'
					endif
				endif
			endif
		endfor
	endif
endproc

procedure set_RatingValues .speakerDataTable .variable$ .value$
	if .speakerDataTable > 0
		call get_speakerInfo 'speakerID$'
		.row = get_speakerInfo.row
		select .speakerDataTable
		.numRows = Get number of rows
		if .row <= 0 or .row > .numRows
			.row = 1
		endif
		.tableValue = ('.value$'*999) + 1
		# Check if column exists
		.col = Get column index: .variable$
		if .col <= 0
			Append column: .variable$
		endif
		Set numeric value... .row '.variable$' '.tableValue:0'
		
		call WriteSpeakerData
		
	endif
endproc

# Rating scales can be "linked", or rather "shackled".
# If columns "Link" and "Value" exist in a Rating table, they are read 
# for each button clicked. Other buttons with the same "Link" entry
# as the button clicked will be set to the numeric "Value" given for 
# that button.
# Example (white-space is tab):
# >Hypertonicity	5	80	51	55	Black	DrawNull	Tonicity	1
# >Hypotonicity	5	80	41	45	Black	DrawNull	Tonicity	1
#
# The above example results in Hypotonicity being set to a fraction of 1
# of the scale, i.e., the rightmost value, whenever
# Hypertonicity is clicked. If the second line had ended in "0",
# Hypotonicity would be set to zero when Hypertonicity was clicked,
# but clicking Hypotonicity would have set Hypertonicity to its maximal
# value, e.g., 1000 if that is the value of full scale.
# 
procedure link_RatingValues .ratingTable .speakerTable .buttonLabel$
		if .ratingTable
			select .ratingTable
			.rating$ = selected$("Table")
			.numRows = Get number of rows
			# Set linked rating values
			.linkCol = Get column index... Link
			.rownum = Search column... Label '.buttonLabel$'
			if .linkCol > 0 and .rownum > 0
				.linkValue$ = Get value... '.rownum' Link
				if .linkValue$ <> "" and index_regex(.linkValue$, "[a-zA-Z0-9]") > 0
					for .r to .numRows
						select .ratingTable
						.value$ = Get value... '.r' Link
						if .r <> .rownum and .value$ = .linkValue$
							.newValueText$ = Get value... '.r' Value
							.newValue = 0
							if index_regex(.newValueText$, "[0-9]")
								.newValue = extractNumber(.newValueText$, "")
							endif 
							.variableLabel$ = Get value... '.r' Label
							.variable$ = replace_regex$(.variableLabel$, "^\>(.)", "\l\1", 0)
							.labelRating$ = replace_regex$(.variable$, "^[^a-zA-Z]+([A-Za-z])", "\l\1", 0)
							'.labelRating$' = .newValue
							call set_RatingValues '.speakerTable' Rating.'.variable$' '.newValue'
							call get_RatingValues '.speakerTable' '.ratingTable'
							call Draw_button_internal 1 '.rating$' '.variableLabel$' 0
						endif
					endfor
				endif 
			endif
		endif
endproc
