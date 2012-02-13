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

form Give table file
	sentence tablefile ../../../NKIcorpora/NKI98N96Vox/Speech/a/a_TLE.Table
	positive interval_length 0.250
endform
.intervalLength = interval_length

call getOpenFile 'tablefile$'
#call getOpenFile Select a speaker table

clearinfo
printline i'tab$'ID'tab$'start'tab$'end'tab$'MVD'tab$'VF'tab$'Pitch'tab$'Jitter'tab$'HNR'tab$'GNE'tab$'BED'tab$'AST

call get_speakerInfo 1
.numSpeakers = get_speakerInfo.numEntries
for .i to .numSpeakers
	call get_speakerInfo '.i'

	call loadSpeaker 'get_speakerInfo.id$'
	select te.openSound
	call DrawHarmonicityObject
	call calculateHarmonicityValues
	selectedStartTime = maxTimeHarmonicity - .intervalLength/2
	if selectedStartTime < 0
		selectedStartTime = 0
	endif
	selectedEndTime = selectedStartTime + .intervalLength
	if selectedEndTime > loadSpeaker.duration
		selectedEndTime = loadSpeaker.duration
		selectedStartTime = selectedEndTime - .intervalLength
	endif
	
	# Shift measuring interval to fit in voiced interval
	call DrawPitchObject
	call calculatePitchValues
	select 'voicingTextGrid'
	.interval = Get interval at time... 1 'maxTimeHarmonicity'
	.label$ = Get label of interval... 1 '.interval'
	if .label$ = "V"
		.intStartPoint = Get start point... 1 '.interval'
		.intEndPoint = Get end point... 1 '.interval'
		if .intEndPoint - .intStartPoint <= .intervalLength
			selectedStartTime = max(0, (.intStartPoint + .intEndPoint - .intervalLength)/2)
			selectedEndTime = selectedStartTime + .intervalLength
		elsif selectedStartTime < .intStartPoint
			selectedStartTime = .intStartPoint
			selectedEndTime = selectedStartTime + .intervalLength
		elsif selectedEndTime > .intEndPoint
			selectedEndTime = .intEndPoint
			selectedStartTime = selectedEndTime - .intervalLength
		endif
		if selectedStartTime < 0
			selectedStartTime = 0
			selectedEndTime = selectedStartTime + .intervalLength
		elsif selectedEndTime > loadSpeaker.duration
			selectedEndTime = loadSpeaker.duration
			selectedStartTime = selectedEndTime - .intervalLength
		endif
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
	.calcMVD = calculatePitchValues.maximumVoicingDuration
	.calcVF = calculatePitchValues.voicedFractions
	.calcPitch = calculatePitchValues.sdPitch
	.calcJitter = calculatePitchValues.jitter 	

	call DrawLtasObject
	call calculateLtasValues
	.calcBED = calculateLtasValues.bed
	
	call DrawHarmonicityObject
	call calculateHarmonicityValues
	.calcHNR = calculateHarmonicityValues.meanHarmonicity
	.calcGNE = calculateHarmonicityValues.gneValue

	# Print output
	print '.i''tab$''get_speakerInfo.id$'
	print 'tab$''selectedStartTime:3''tab$''selectedEndTime:3'
	print 'tab$''.calcMVD:3'
	print 'tab$''.calcVF:3'
	print 'tab$''.calcPitch:3'
	print 'tab$''.calcJitter:4'
	print 'tab$''.calcHNR:3'
	print 'tab$''.calcGNE:3'
	print 'tab$''.calcBED:3'
	print 'tab$''.ast:0'
	printline
	
endfor
