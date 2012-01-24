#!praat
# 
# Open a SpeakerData.Table file and run the AST parameters on each entry
# Print the values as a tsv table
#
# Load for non-interactive use with initialization
non_interactive_initialize = 1
include ../praat_module/TEanalysisexpanded.praat
# Supress drawing
noDrawingOrWriting = 1
mainPage.outputPraatObject$ = "Draw"

call getOpenFile Select a speaker table

clearinfo
printline i'tab$'ID'tab$'start'tab$'end'tab$'VF'tab$'Pitch'tab$'Jitter'tab$'HNR'tab$'GNE'tab$'AST

call get_speakerInfo 1
.numSpeakers = get_speakerInfo.numEntries
for .i to .numSpeakers
	call get_speakerInfo '.i'

	call loadSpeaker 'get_speakerInfo.id$'
	select te.openSound
	call DrawHarmonicityObject
	call calculateHarmonicityValues
	.intervalLength = 0.200
	selectedStartTime = maxTimeHarmonicity - .intervalLength/2
	if selectedStartTime < 0
		selectedStartTime = 0
	endif
	selectedEndTime = selectedStartTime + .intervalLength
	if selectedEndTime > loadSpeaker.duration
		selectedEndTime = loadSpeaker.duration
		selectedStartTime = selectedEndTime - .intervalLength
	endif
	currentStartTime = selectedStartTime
	currentEndTime = selectedEndTime

	# Get pathological type
	.ast = 0
	if index_regex(get_speakerInfo.text$, "Type ")
		if index_regex(get_speakerInfo.text$, "Type IV($|[^A-Z])")
			.ast = 4
		elsif index_regex(get_speakerInfo.text$, "Type III($|[^A-Z])")
			.ast = 3
		elsif index_regex(get_speakerInfo.text$, "Type II($|[^A-Z])")
			.ast = 2
		elsif index_regex(get_speakerInfo.text$, "Type I($|[^A-Z])")
			.ast = 1
		else
			.ast = 0
		endif
	endif
	# Calculate values
	call DrawPitchObject
	call calculatePitchValues
	.calcVF = calculatePitchValues.voicedFractions
	.calcPitch = calculatePitchValues.sdPitch
	.calcJitter = calculatePitchValues.jitter 	
	
	call calculateHarmonicityValues
	.calcHNR = calculateHarmonicityValues.meanHarmonicity
	.calcGNE = calculateHarmonicityValues.gneValue

	# Print output
	print '.i''tab$''get_speakerInfo.id$'
	print 'tab$''selectedStartTime:3''tab$''selectedEndTime:3'
	print 'tab$''.calcVF:3'
	print 'tab$''.calcPitch:3'
	print 'tab$''.calcJitter:3'
	print 'tab$''.calcHNR:3'
	print 'tab$''.calcGNE:3'
	print 'tab$''.ast:0'
	printline
	
endfor
