#!praat
# 
# Open a SpeakerData.Table file and run the AST parameters on each entry
# Print the values as a tsv table
#
# Load for non-interactive use with initialization
non_interactive_initialize = 1
include TEanalysisexpanded.praat
# Supress drawing
noDrawingOrWriting = 1
mainPage.outputPraatObject$ = "Draw"
te.useFullASTselection = 1
config.useCache = 1

form Give table file
	sentence tablefile Corina_Renee_consensus.Table
	real interval_length 0
endform
.intervalLength = interval_length

call getOpenFile 'tablefile$'
#call getOpenFile Select a speaker table
mainPage.draw$ = "Sound"
config.showFormants = 1

clearinfo
printline i'tab$'ID'tab$'start'tab$'end'tab$'Duration'tab$'MVD'tab$'QF3
...'tab$'VF'tab$'Pitch'tab$'Jitter'tab$'Shimmer'tab$'CRmax'tab$'HNR
...'tab$'HNRlow'tab$'HNRhigh'tab$'GNE'tab$'BED'tab$'AST'tab$'predAST

call get_speakerInfo 1
.numSpeakers = get_speakerInfo.numEntries
for .i to .numSpeakers
	call get_speakerInfo '.i'
	call loadSpeaker 'get_speakerInfo.id$'
	select te.openSound
	.total_duration = Get total duration
	.maximum = Get maximum... 0 0 None
	if .maximum <= 0
		goto END
	endif
	.ast = pathologicalType
	call predictASTvalue
	.calcMVD = predictASTvalue.mvd
	.calcVF = predictASTvalue.vf
	.calcPitch = predictASTvalue.pitch
	.calcJitter = predictASTvalue.jitter 	
	.calcShimmer = predictASTvalue.shimmer 	
	.calcCepsRahm = predictASTvalue.cepsrahm 	
	.calcBED = predictASTvalue.bed
	.calcHNR = predictASTvalue.hnr
	.calcHNRlow = predictASTvalue.hnrLow
	.calcHNRhigh = predictASTvalue.hnrHigh
	.calcGNE = predictASTvalue.gne
	.calcQF3 = predictASTvalue.qf3
	.predAST = predictASTvalue.ast

	# Print output
	print '.i''tab$''get_speakerInfo.id$'
	print 'tab$''selectedStartTime:3''tab$''selectedEndTime:3''tab$''.total_duration:1'
	print 'tab$''.calcMVD:3'
	print 'tab$''.calcQF3:1'
	print 'tab$''.calcVF:3'
	print 'tab$''.calcPitch:3'
	print 'tab$''.calcJitter:4'
	print 'tab$''.calcShimmer:4'
	print 'tab$''.calcCepsRahm:3'
	print 'tab$''.calcHNR:3'
	print 'tab$''.calcHNRlow:3'
	print 'tab$''.calcHNRhigh:3'
	print 'tab$''.calcGNE:3'
	print 'tab$''.calcBED:3'
	print 'tab$''.ast:0'
	print 'tab$''.predAST:2'
	printline
	
	label END
pause 
endfor
