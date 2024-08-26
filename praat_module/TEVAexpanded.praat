
build_SHA$ = "479BC911BD 2024-08-26T09:49:39Z"
#
# TEVA 1.1
# 
# Master Praat script
#
#     TEVA: main.praat is the master GUI of TEVA
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

te.recordingMode = 0
if te.recordingMode
	demoAppName$ = "RecTEVA"
else
	demoAppName$ = "TEVA"
endif

# Define variable that might be reset in Initialise*.praat
if not variableExists("build_SHA$")
	build_SHA$ = "-"
endif

# The standard Main Page layout
buttonsFileName$ = "MainPage"

# These are simply "useful" defaults
if build_SHA$ = "-"
	localTableDir$ = "Data"
else
	localTableDir$ = ""
endif
buttonsTableName$ = "MainPage"
configTableName$ = "Config"
feedbackTablePrefix$ = "Feedback"
feedbackTableName$ = ""
printsignalTablePrefix$ = "PrintSignal"
printsignalTableName$ = ""
te.buttons$ = ""
te.config$ = ""
recordedSound$ = ""
alertText$ = ""
config.input$ = "Microphone"
config.ratingForm$ = "Vowel"
config.vasScaleTicks = 0
te.recordingTimeStamp$ = ""
te.currentFileName$ = ""
te.saveAudio = 0
te.openSound = 0
te.originalRecording = 0
te.source = 0
te.spectrogram = 0
te.harmonicity = 0
te.gneSound = 0
te.pitch = 0
te.formant = 0
te.ratingTable = -1
te.rating$ = ""
te.useFullASTselection = 1
te.useAnnotationInterface = 0
te.defaultLanguage$ = "EN"
config.rememberPreferences = 1
config.randomizeSpeakerData = 0
config.recordingTaskFile$ = ""
config.recordingTarget$ = ""
config.recordingScreen$ = ""
te.recordingTaskTable = 0
te.restartRecordingTask = 0
te.waitRecordingTask = 1

# Pop-Up window and other colors
popUp.bordercolor$ = "{0.5,0.5,1}"
popUp.backgroundcolor$ = "{0.9,0.9,1}"
popUp.warncolor$ = "{1,0.9,0.9}"
popUp.gocolor$ = "{0.9,1,0.9}"

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
te.recordingSampleFrequency = 44100
te.defaultSampleFreq = 22050
config.frequency = 1000
config.showFormants = 0
config.speakerSerial$ = "None"
config.saveAll = 0
config.autoSelect = 0
config.calcGNE = 0
te.calcLowHighHNR = 0
config.selectionWindow = 2.0
config.muteOutput = 0

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
defaultFontColor$ = "Black"
defaultLineWidth = 1
recordingLightX = 0
recordingLightY = 100
printerName$ = "BHK301"
printerPresets$ = "Standard"

##########################################################
# 
# Setup for alternative Recording layout for the Main Page
# 
##########################################################
if te.recordingMode
	buttonsFileName$ = "RecPage"
	config.speakerSerial$ = "Forw"
	config.recordingTaskFile$ = "[#a as in %%hat%<newline>##ee# as in %%heed%<newline>##oo# as in %%hood%]"
	config.recordingTarget$ = "'homeDirectory$'/Desktop"
endif

##########################################################
# 
# This is the actual code run at startup
# 
##########################################################
# This has to be initialized very early because of loading of automatic experiments
mainPage.outputPraatObject$ = "Draw"

# Load supporting scripts
# Include tables in script format (always needed)
# CreateTables.praat
# 
# Automatically created code!
# Any changes will be lost when this file is regenerated.
# Adapt the original Tables instead of this code.
# To regenerate the original Tables, run a Praat script
# with the following code:
# 
#: include tables2scripts.praat
#: call Create<TableName>
#: Write to table file... <TableName>.Table
# 
# Where <TableName> is the name of the table.
# Move the Table file to the desired location (eg, Data/)
# 
# Tables and this code are licensed under the GNU GPL version 2
# or later.
# 

procCreateBackground$ = "Background"
procedure CreateBackground
	Create Table with column names... Background 11
	... font size align colour text
	# Fill table values
	# Row 1
	Set string value... 1 font Helvetica
	Set string value... 1 size 96
	Set string value... 1 align centre
	Set string value... 1 colour {0.9,0.9,0.9}
	Set string value... 1 text  
	# Row 2
	Set string value... 2 font !demo command
	Set string value... 2 size 0
	Set string value... 2 align -
	Set string value... 2 colour {0.9,0.7,0.7}
	Set string value... 2 text Line width... 5
	# Row 3
	Set string value... 3 font !demo command
	Set string value... 3 size 0
	Set string value... 3 align -
	Set string value... 3 colour {0.9,0.7,0.7}
	Set string value... 3 text Draw line... 10 [[{YTEXT$} + 1.4*{DY$}]] 75 [[{YTEXT$} + 1.4*{DY$}]]
	# Row 4
	Set string value... 4 font !demo command
	Set string value... 4 size 0
	Set string value... 4 align -
	Set string value... 4 colour {0.9,0.9,0.9}
	Set string value... 4 text Line width... 1
	# Row 5
	Set string value... 5 font Helvetica
	Set string value... 5 size 96
	Set string value... 5 align centre
	Set string value... 5 colour {0.9,0.9,0.9}
	Set string value... 5 text NKI       
	# Row 6
	Set string value... 6 font Helvetica
	Set string value... 6 size 96
	Set string value... 6 align centre
	Set string value... 6 colour {0.9,0.9,0.9}
	Set string value... 6 text TE-VOICE ANALYSIS       
	# Row 7
	Set string value... 7 font Helvetica
	Set string value... 7 size 84
	Set string value... 7 align centre
	Set string value... 7 colour {0.9,0.9,0.9}
	Set string value... 7 text TOOL       
	# Row 8
	Set string value... 8 font !demo command
	Set string value... 8 size 0
	Set string value... 8 align -
	Set string value... 8 colour {0.9,0.7,0.7}
	Set string value... 8 text Line width... 5
	# Row 9
	Set string value... 9 font !demo command
	Set string value... 9 size 0
	Set string value... 9 align -
	Set string value... 9 colour {0.9,0.7,0.7}
	Set string value... 9 text Draw line... 10 [[{YTEXT$} + 1.0*{DY$}]] 75 [[{YTEXT$} + 1.0*{DY$}]]
	# Row 10
	Set string value... 10 font !demo command
	Set string value... 10 size 0
	Set string value... 10 align -
	Set string value... 10 colour {0.9,0.9,0.9}
	Set string value... 10 text Line width... 1
	# Row 11
	Set string value... 11 font Helvetica
	Set string value... 11 size 96
	Set string value... 11 align centre
	Set string value... 11 colour {0.9,0.9,0.9}
	Set string value... 11 text  
endproc

procCreateConfig$ = "Config"
procedure CreateConfig
	Create Table with column names... Config 74
	... Label LeftX RightX LowY HighY Color Draw
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 LeftX 0
	Set string value... 4 RightX 0
	Set string value... 4 LowY 0
	Set string value... 4 HighY 0
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	# Row 5
	Set string value... 5 Label Help
	Set string value... 5 LeftX 90
	Set string value... 5 RightX +10
	Set string value... 5 LowY 90
	Set string value... 5 HighY +10
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawHelp
	# Row 6
	Set string value... 6 Label Return
	Set string value... 6 LeftX 90
	Set string value... 6 RightX +10
	Set string value... 6 LowY 77.5
	Set string value... 6 HighY +10
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawReturn
	# Row 7
	Set string value... 7 Label Language_EN
	Set string value... 7 LeftX 0
	Set string value... 7 RightX 15
	Set string value... 7 LowY 95
	Set string value... 7 HighY +5
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	# Row 8
	Set string value... 8 Label Language_JA
	Set string value... 8 LeftX 0
	Set string value... 8 RightX 15
	Set string value... 8 LowY ^-6
	Set string value... 8 HighY +5
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	# Row 9
	Set string value... 9 Label Language_DE
	Set string value... 9 LeftX 0
	Set string value... 9 RightX 15
	Set string value... 9 LowY ^-6
	Set string value... 9 HighY +5
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	# Row 10
	Set string value... 10 Label Language_NL
	Set string value... 10 LeftX 0
	Set string value... 10 RightX 15
	Set string value... 10 LowY ^-6
	Set string value... 10 HighY +5
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	# Row 11
	Set string value... 11 Label !Language_ES
	Set string value... 11 LeftX 0
	Set string value... 11 RightX 15
	Set string value... 11 LowY 71
	Set string value... 11 HighY +5
	Set string value... 11 Color Black
	Set string value... 11 Draw DrawNull
	# Row 12
	Set string value... 12 Label $MaxFrequency
	Set string value... 12 LeftX 20
	Set string value... 12 RightX +10
	Set string value... 12 LowY 96
	Set string value... 12 HighY +4
	Set string value... 12 Color Black
	Set string value... 12 Draw DrawNull
	# Row 13
	Set string value... 13 Label Frequency_10k
	Set string value... 13 LeftX 20
	Set string value... 13 RightX +10
	Set string value... 13 LowY 91
	Set string value... 13 HighY +5
	Set string value... 13 Color Black
	Set string value... 13 Draw DrawNull
	# Row 14
	Set string value... 14 Label Frequency_8k
	Set string value... 14 LeftX 20
	Set string value... 14 RightX +10
	Set string value... 14 LowY 85
	Set string value... 14 HighY +5
	Set string value... 14 Color Black
	Set string value... 14 Draw DrawNull
	# Row 15
	Set string value... 15 Label Frequency_5k
	Set string value... 15 LeftX 20
	Set string value... 15 RightX +10
	Set string value... 15 LowY 79
	Set string value... 15 HighY +5
	Set string value... 15 Color Black
	Set string value... 15 Draw DrawNull
	# Row 16
	Set string value... 16 Label Frequency_3k
	Set string value... 16 LeftX 20
	Set string value... 16 RightX +10
	Set string value... 16 LowY 73
	Set string value... 16 HighY +5
	Set string value... 16 Color Black
	Set string value... 16 Draw DrawNull
	# Row 17
	Set string value... 17 Label Frequency_2k
	Set string value... 17 LeftX 20
	Set string value... 17 RightX +10
	Set string value... 17 LowY 67
	Set string value... 17 HighY +5
	Set string value... 17 Color Black
	Set string value... 17 Draw DrawNull
	# Row 18
	Set string value... 18 Label Frequency_1k
	Set string value... 18 LeftX 20
	Set string value... 18 RightX +10
	Set string value... 18 LowY 61
	Set string value... 18 HighY +5
	Set string value... 18 Color Black
	Set string value... 18 Draw DrawNull
	# Row 19
	Set string value... 19 Label $Pitch
	Set string value... 19 LeftX 20
	Set string value... 19 RightX +10
	Set string value... 19 LowY 52
	Set string value... 19 HighY 57
	Set string value... 19 Color Black
	Set string value... 19 Draw DrawNull
	# Row 20
	Set string value... 20 Label Pitchalgorithm_CC300
	Set string value... 20 LeftX 20
	Set string value... 20 RightX +10
	Set string value... 20 LowY 47
	Set string value... 20 HighY 52
	Set string value... 20 Color Black
	Set string value... 20 Draw DrawNull
	# Row 21
	Set string value... 21 Label Pitchalgorithm_CC600
	Set string value... 21 LeftX 20
	Set string value... 21 RightX +10
	Set string value... 21 LowY 41
	Set string value... 21 HighY 46
	Set string value... 21 Color Black
	Set string value... 21 Draw DrawNull
	# Row 22
	Set string value... 22 Label Pitchalgorithm_VanAs
	Set string value... 22 LeftX 20
	Set string value... 22 RightX +10
	Set string value... 22 LowY 35
	Set string value... 22 HighY 40
	Set string value... 22 Color Black
	Set string value... 22 Draw DrawNull
	# Row 23
	Set string value... 23 Label $SourceText
	Set string value... 23 LeftX 20
	Set string value... 23 RightX +10
	Set string value... 23 LowY ^-10
	Set string value... 23 HighY +5
	Set string value... 23 Color Black
	Set string value... 23 Draw DrawNull
	# Row 24
	Set string value... 24 Label Source_Original
	Set string value... 24 LeftX 20
	Set string value... 24 RightX +10
	Set string value... 24 LowY ^-5
	Set string value... 24 HighY +5
	Set string value... 24 Color Black
	Set string value... 24 Draw DrawNull
	# Row 25
	Set string value... 25 Label Source_Change
	Set string value... 25 LeftX 20
	Set string value... 25 RightX +10
	Set string value... 25 LowY ^-6
	Set string value... 25 HighY +5
	Set string value... 25 Color Black
	Set string value... 25 Draw DrawNull
	# Row 26
	Set string value... 26 Label !SourceFile
	Set string value... 26 LeftX 0
	Set string value... 26 RightX 0
	Set string value... 26 LowY 0
	Set string value... 26 HighY 0
	Set string value... 26 Color Black
	Set string value... 26 Draw DrawNull
	# Row 27
	Set string value... 27 Label $AudioCollection
	Set string value... 27 LeftX 33
	Set string value... 27 RightX +14
	Set string value... 27 LowY 96
	Set string value... 27 HighY +5
	Set string value... 27 Color Black
	Set string value... 27 Draw DrawNull
	# Row 28
	Set string value... 28 Label SaveAudio
	Set string value... 28 LeftX 35
	Set string value... 28 RightX +10
	Set string value... 28 LowY ^-5
	Set string value... 28 HighY +5
	Set string value... 28 Color Black
	Set string value... 28 Draw DrawNull
	# Row 29
	Set string value... 29 Label RecordingTime
	Set string value... 29 LeftX 35
	Set string value... 29 RightX +10
	Set string value... 29 LowY ^-6
	Set string value... 29 HighY +5
	Set string value... 29 Color Black
	Set string value... 29 Draw DrawNull
	# Row 30
	Set string value... 30 Label !RecordingTaskFile
	Set string value... 30 LeftX 0
	Set string value... 30 RightX 0
	Set string value... 30 LowY 0
	Set string value... 30 HighY 0
	Set string value... 30 Color Black
	Set string value... 30 Draw DrawNull
	# Row 31
	Set string value... 31 Label !RecordingTarget
	Set string value... 31 LeftX 0
	Set string value... 31 RightX 0
	Set string value... 31 LowY 0
	Set string value... 31 HighY 0
	Set string value... 31 Color Black
	Set string value... 31 Draw DrawNull
	# Row 32
	Set string value... 32 Label !RecordingScreen
	Set string value... 32 LeftX 0
	Set string value... 32 RightX 0
	Set string value... 32 LowY 0
	Set string value... 32 HighY 0
	Set string value... 32 Color Black
	Set string value... 32 Draw DrawNull
	# Row 33
	Set string value... 33 Label $AutomaticTasks
	Set string value... 33 LeftX 35
	Set string value... 33 RightX +10
	Set string value... 33 LowY 74
	Set string value... 33 HighY +4
	Set string value... 33 Color Black
	Set string value... 33 Draw DrawNull
	# Row 34
	Set string value... 34 Label ShowFormants
	Set string value... 34 LeftX 35
	Set string value... 34 RightX +10
	Set string value... 34 LowY ^-5
	Set string value... 34 HighY +5
	Set string value... 34 Color {0.65,0.60,0.45}
	Set string value... 34 Draw DrawNull
	# Row 35
	Set string value... 35 Label AutoSelect
	Set string value... 35 LeftX 35
	Set string value... 35 RightX +10
	Set string value... 35 LowY ^-6
	Set string value... 35 HighY +5
	Set string value... 35 Color {0.65,0.60,0.45}
	Set string value... 35 Draw DrawNull
	# Row 36
	Set string value... 36 Label CalcGNE
	Set string value... 36 LeftX 35
	Set string value... 36 RightX +10
	Set string value... 36 LowY ^-6
	Set string value... 36 HighY +5
	Set string value... 36 Color {0.65,0.60,0.45}
	Set string value... 36 Draw DrawNull
	# Row 37
	Set string value... 37 Label $VoicePrint
	Set string value... 37 LeftX 35
	Set string value... 37 RightX +10
	Set string value... 37 LowY 46
	Set string value... 37 HighY +4
	Set string value... 37 Color Black
	Set string value... 37 Draw DrawNull
	# Row 38
	Set string value... 38 Label SaveFMT_EPS
	Set string value... 38 LeftX 35
	Set string value... 38 RightX +10
	Set string value... 38 LowY ^-5
	Set string value... 38 HighY +5
	Set string value... 38 Color Black
	Set string value... 38 Draw DrawNull
	# Row 39
	Set string value... 39 Label SaveFMT_PNG
	Set string value... 39 LeftX 35
	Set string value... 39 RightX +10
	Set string value... 39 LowY ^-6
	Set string value... 39 HighY +5
	Set string value... 39 Color Black
	Set string value... 39 Draw DrawNull
	# Row 40
	Set string value... 40 Label SaveFMT_PDF
	Set string value... 40 LeftX 35
	Set string value... 40 RightX +10
	Set string value... 40 LowY ^-6
	Set string value... 40 HighY +5
	Set string value... 40 Color Black
	Set string value... 40 Draw DrawNull
	# Row 41
	Set string value... 41 Label SaveAll
	Set string value... 41 LeftX 35
	Set string value... 41 RightX +10
	Set string value... 41 LowY ^-8
	Set string value... 41 HighY +5
	Set string value... 41 Color {0.6,0.55,0.4}
	Set string value... 41 Draw DrawNull
	# Row 42
	Set string value... 42 Label $SpeakerSelect
	Set string value... 42 LeftX 50
	Set string value... 42 RightX +10
	Set string value... 42 LowY 96
	Set string value... 42 HighY +4
	Set string value... 42 Color Black
	Set string value... 42 Draw DrawNull
	# Row 43
	Set string value... 43 Label SpeakerSerial_None
	Set string value... 43 LeftX 50
	Set string value... 43 RightX +10
	Set string value... 43 LowY ^-5
	Set string value... 43 HighY +5
	Set string value... 43 Color Black
	Set string value... 43 Draw DrawNull
	# Row 44
	Set string value... 44 Label SpeakerSerial_Forw
	Set string value... 44 LeftX 50
	Set string value... 44 RightX +10
	Set string value... 44 LowY ^-6
	Set string value... 44 HighY +5
	Set string value... 44 Color Black
	Set string value... 44 Draw DrawNull
	# Row 45
	Set string value... 45 Label SpeakerSerial_Backw
	Set string value... 45 LeftX 50
	Set string value... 45 RightX +10
	Set string value... 45 LowY ^-6
	Set string value... 45 HighY +5
	Set string value... 45 Color Black
	Set string value... 45 Draw DrawNull
	# Row 46
	Set string value... 46 Label !SelectionWindow
	Set string value... 46 LeftX 0
	Set string value... 46 RightX 0
	Set string value... 46 LowY 0
	Set string value... 46 HighY 0
	Set string value... 46 Color Black
	Set string value... 46 Draw DrawNull
	# Row 47
	Set string value... 47 Label $Speaker
	Set string value... 47 LeftX 50
	Set string value... 47 RightX +10
	Set string value... 47 LowY 68
	Set string value... 47 HighY +4
	Set string value... 47 Color Black
	Set string value... 47 Draw DrawNull
	# Row 48
	Set string value... 48 Label SpeakerData
	Set string value... 48 LeftX 50
	Set string value... 48 RightX +10
	Set string value... 48 LowY ^-5
	Set string value... 48 HighY +5
	Set string value... 48 Color Black
	Set string value... 48 Draw DrawNull
	# Row 49
	Set string value... 49 Label SpeakerDirectory
	Set string value... 49 LeftX 50
	Set string value... 49 RightX +10
	Set string value... 49 LowY ^-6
	Set string value... 49 HighY +5
	Set string value... 49 Color Black
	Set string value... 49 Draw DrawNull
	# Row 50
	Set string value... 50 Label SaveSpeaker
	Set string value... 50 LeftX 50
	Set string value... 50 RightX +10
	Set string value... 50 LowY ^-6
	Set string value... 50 HighY +5
	Set string value... 50 Color Black
	Set string value... 50 Draw DrawNull
	# Row 51
	Set string value... 51 Label CloseSpeaker
	Set string value... 51 LeftX 50
	Set string value... 51 RightX +10
	Set string value... 51 LowY ^-6
	Set string value... 51 HighY +5
	Set string value... 51 Color Black
	Set string value... 51 Draw DrawNull
	# Row 52
	Set string value... 52 Label SpeakerMerge
	Set string value... 52 LeftX 50
	Set string value... 52 RightX +10
	Set string value... 52 LowY ^-6
	Set string value... 52 HighY +5
	Set string value... 52 Color Black
	Set string value... 52 Draw DrawNull
	# Row 53
	Set string value... 53 Label SpeakerSort
	Set string value... 53 LeftX 50
	Set string value... 53 RightX +10
	Set string value... 53 LowY ^-6
	Set string value... 53 HighY +5
	Set string value... 53 Color Black
	Set string value... 53 Draw DrawNull
	# Row 54
	Set string value... 54 Label SpeakerRandomize
	Set string value... 54 LeftX 50
	Set string value... 54 RightX +10
	Set string value... 54 LowY ^-6
	Set string value... 54 HighY +5
	Set string value... 54 Color Black
	Set string value... 54 Draw DrawNull
	# Row 55
	Set string value... 55 Label SpeakerRevert
	Set string value... 55 LeftX 50
	Set string value... 55 RightX +10
	Set string value... 55 LowY ^-6
	Set string value... 55 HighY +5
	Set string value... 55 Color Black
	Set string value... 55 Draw DrawNull
	# Row 56
	Set string value... 56 Label ShowBackground
	Set string value... 56 LeftX 70
	Set string value... 56 RightX +15
	Set string value... 56 LowY 95
	Set string value... 56 HighY +5
	Set string value... 56 Color {0.65,0.60,0.45}
	Set string value... 56 Draw DrawNull
	# Row 57
	Set string value... 57 Label Input_Microphone
	Set string value... 57 LeftX 70
	Set string value... 57 RightX +15
	Set string value... 57 LowY 87
	Set string value... 57 HighY +5
	Set string value... 57 Color Black
	Set string value... 57 Draw DrawNull
	# Row 58
	Set string value... 58 Label Input_Line
	Set string value... 58 LeftX 70
	Set string value... 58 RightX +15
	Set string value... 58 LowY 81
	Set string value... 58 HighY +5
	Set string value... 58 Color Black
	Set string value... 58 Draw DrawNull
	# Row 59
	Set string value... 59 Label MuteOutput
	Set string value... 59 LeftX 70
	Set string value... 59 RightX +15
	Set string value... 59 LowY 74
	Set string value... 59 HighY +5
	Set string value... 59 Color {0.65,0.60,0.45}
	Set string value... 59 Draw DrawNull
	# Row 60
	Set string value... 60 Label Test
	Set string value... 60 LeftX 70
	Set string value... 60 RightX +15
	Set string value... 60 LowY 67
	Set string value... 60 HighY +5
	Set string value... 60 Color Black
	Set string value... 60 Draw DrawTest
	# Row 61
	Set string value... 61 Label $Rating
	Set string value... 61 LeftX 70
	Set string value... 61 RightX +15
	Set string value... 61 LowY 59
	Set string value... 61 HighY +5
	Set string value... 61 Color Black
	Set string value... 61 Draw DrawNull
	# Row 62
	Set string value... 62 Label RatingForm_Vowel
	Set string value... 62 LeftX 70
	Set string value... 62 RightX +15
	Set string value... 62 LowY 54
	Set string value... 62 HighY +5
	Set string value... 62 Color Black
	Set string value... 62 Draw DrawNull
	# Row 63
	Set string value... 63 Label RatingForm_Text
	Set string value... 63 LeftX 70
	Set string value... 63 RightX +15
	Set string value... 63 LowY 48
	Set string value... 63 HighY +5
	Set string value... 63 Color Black
	Set string value... 63 Draw DrawNull
	# Row 64
	Set string value... 64 Label RatingForm_INFVo
	Set string value... 64 LeftX 70
	Set string value... 64 RightX +15
	Set string value... 64 LowY 42
	Set string value... 64 HighY +5
	Set string value... 64 Color Black
	Set string value... 64 Draw DrawNull
	# Row 65
	Set string value... 65 Label RatingForm_GRBAS
	Set string value... 65 LeftX 70
	Set string value... 65 RightX +15
	Set string value... 65 LowY 36
	Set string value... 65 HighY +5
	Set string value... 65 Color Black
	Set string value... 65 Draw DrawNull
	# Row 66
	Set string value... 66 Label RatingForm_TEpair
	Set string value... 66 LeftX 70
	Set string value... 66 RightX +15
	Set string value... 66 LowY 30
	Set string value... 66 HighY +5
	Set string value... 66 Color Black
	Set string value... 66 Draw DrawNull
	# Row 67
	Set string value... 67 Label VasScaleTicks
	Set string value... 67 LeftX 70
	Set string value... 67 RightX +15
	Set string value... 67 LowY 23
	Set string value... 67 HighY +5
	Set string value... 67 Color {0.65,0.60,0.45}
	Set string value... 67 Draw DrawNull
	# Row 68
	Set string value... 68 Label Instruction
	Set string value... 68 LeftX 90
	Set string value... 68 RightX +10
	Set string value... 68 LowY 65
	Set string value... 68 HighY +10
	Set string value... 68 Color Black
	Set string value... 68 Draw DrawInstruction
	# Row 69
	Set string value... 69 Label Manual
	Set string value... 69 LeftX 90
	Set string value... 69 RightX +10
	Set string value... 69 LowY 52.5
	Set string value... 69 HighY +10
	Set string value... 69 Color Black
	Set string value... 69 Draw DrawManual
	# Row 70
	Set string value... 70 Label Credits
	Set string value... 70 LeftX 90
	Set string value... 70 RightX +10
	Set string value... 70 LowY 40
	Set string value... 70 HighY +10
	Set string value... 70 Color Black
	Set string value... 70 Draw DrawCredits
	# Row 71
	Set string value... 71 Label Refresh
	Set string value... 71 LeftX 0
	Set string value... 71 RightX 0
	Set string value... 71 LowY 0
	Set string value... 71 HighY 0
	Set string value... 71 Color Black
	Set string value... 71 Draw DrawNull
	# Row 72
	Set string value... 72 Label !Logging
	Set string value... 72 LeftX 90
	Set string value... 72 RightX +10
	Set string value... 72 LowY 0
	Set string value... 72 HighY 5
	Set string value... 72 Color Blue
	Set string value... 72 Draw DrawLogging
	# Row 73
	Set string value... 73 Label !OpenLog
	Set string value... 73 LeftX 78
	Set string value... 73 RightX 88
	Set string value... 73 LowY 0
	Set string value... 73 HighY 5
	Set string value... 73 Color Blue
	Set string value... 73 Draw DrawNull
	# Row 74
	Set string value... 74 Label !Run
	Set string value... 74 LeftX 66
	Set string value... 74 RightX 76
	Set string value... 74 LowY 0
	Set string value... 74 HighY 5
	Set string value... 74 Color Blue
	Set string value... 74 Draw DrawNull
endproc

procCreateConfig_DE$ = "Config_DE"
procedure CreateConfig_DE
	Create Table with column names... Config_DE 69
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Autor
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son, \U"bersetzung: Irene Jacobi
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text Lizenz
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: Einstellungen \a"ndern
	Set string value... 4 Key !
	Set string value... 4 Helptext DemoVersion: Einstellungen \a"ndern
	# Row 5
	Set string value... 5 Label Return
	Set string value... 5 Text Zur\u"ck
	Set string value... 5 Key Z
	Set string value... 5 Helptext Zur\u"ck zur Hauptseite
	# Row 6
	Set string value... 6 Label Language_DE
	Set string value... 6 Text Deutsch
	Set string value... 6 Key D
	Set string value... 6 Helptext Deutsche Version
	# Row 7
	Set string value... 7 Label ShowBackground
	Set string value... 7 Text Hintergrund
	Set string value... 7 Key g
	Set string value... 7 Helptext Zeige Hintergrund
	# Row 8
	Set string value... 8 Label Input_Microphone
	Set string value... 8 Text Mikrofon
	Set string value... 8 Key M
	Set string value... 8 Helptext Aufnahme \u"ber den Mikrofoneingang
	# Row 9
	Set string value... 9 Label Input_Line
	Set string value... 9 Text Line input |
	Set string value... 9 Key |\+
	Set string value... 9 Helptext Aufnahme \u"ber "Line input"
	# Row 10
	Set string value... 10 Label Instruction
	Set string value... 10 Text Pathologie
	Set string value... 10 Key P
	Set string value... 10 Helptext Beschreibung pathologischer Typen
	# Row 11
	Set string value... 11 Label Manual
	Set string value... 11 Text Handbuch
	Set string value... 11 Key u
	Set string value... 11 Helptext Handbuch zum Programm
	# Row 12
	Set string value... 12 Label Credits
	Set string value... 12 Text \u"ber
	Set string value... 12 Key bi
	Set string value... 12 Helptext Informationen zur NKI TE-VOICE ANALYSIS tool
	# Row 13
	Set string value... 13 Label Refresh
	Set string value... 13 Text Aktualisieren
	Set string value... 13 Key  
	Set string value... 13 Helptext Der aktuelle Bildschirm wird abgebildet. Mit der Leertaste kann der Bildschirm aktualisiert werden.
	# Row 14
	Set string value... 14 Label Help
	Set string value... 14 Text Hilfe
	Set string value... 14 Key ?/
	Set string value... 14 Helptext Dr\u"cken Sie auf den Knopf \u"ber den Sie Informationen m\o"chten. Dr\u"cken Sie danach auf "Hilfe".
	# Row 15
	Set string value... 15 Label MuteOutput
	Set string value... 15 Text Stumm [x]
	Set string value... 15 Key x
	Set string value... 15 Helptext Stummschalten, keine wiedergabe
	# Row 16
	Set string value... 16 Label Test
	Set string value... 16 Text Aufnahme testen
	Set string value... 16 Key A
	Set string value... 16 Helptext Testen Sie die Aufnahmeeinstellungen
	# Row 17
	Set string value... 17 Label $MaxFrequency
	Set string value... 17 Text Frequenz
	Set string value... 17 Key !
	Set string value... 17 Helptext H\o"chstfrequenz im Spektrogramm
	# Row 18
	Set string value... 18 Label Frequency_10k
	Set string value... 18 Text 10kHz
	Set string value... 18 Key 10
	Set string value... 18 Helptext Wiedergabe bis 10 kHz
	# Row 19
	Set string value... 19 Label Frequency_8k
	Set string value... 19 Text 8kHz
	Set string value... 19 Key 8
	Set string value... 19 Helptext Wiedergabe bis 8 kHz
	# Row 20
	Set string value... 20 Label Frequency_5k
	Set string value... 20 Text 5kHz
	Set string value... 20 Key 5
	Set string value... 20 Helptext Wiedergabe bis 5 kHz
	# Row 21
	Set string value... 21 Label Frequency_3k
	Set string value... 21 Text 3kHz
	Set string value... 21 Key 3
	Set string value... 21 Helptext Wiedergabe bis 3 kHz
	# Row 22
	Set string value... 22 Label Frequency_2k
	Set string value... 22 Text 2kHz
	Set string value... 22 Key 2
	Set string value... 22 Helptext Wiedergabe bis 2 kHz
	# Row 23
	Set string value... 23 Label Frequency_1k
	Set string value... 23 Text 1kHz
	Set string value... 23 Key 1
	Set string value... 23 Helptext Wiedergabe bis 1 kHz
	# Row 24
	Set string value... 24 Label $Pitch
	Set string value... 24 Text Tonh\o"he
	Set string value... 24 Key !
	Set string value... 24 Helptext Einstellung der Tonh\o"hemessung
	# Row 25
	Set string value... 25 Label Pitchalgorithm_VanAs
	Set string value... 25 Text Kompatibel
	Set string value... 25 Key !
	Set string value... 25 Helptext Einstellungen von C.J. van As 2001 "Tracheoesophageal Speech" p83
	# Row 26
	Set string value... 26 Label Pitchalgorithm_CC300
	Set string value... 26 Text Tief
	Set string value... 26 Key !
	Set string value... 26 Helptext Reduzierte Oktavenspr\u"nge, f\u"r normale und tiefe Stimmen (<300 Hz)
	# Row 27
	Set string value... 27 Label Pitchalgorithm_CC600
	Set string value... 27 Text Hoch
	Set string value... 27 Key !
	Set string value... 27 Helptext Reduzierte Oktavenspr\u"nge, f\u"r hohe Stimmen (<600 Hz)
	# Row 28
	Set string value... 28 Label $SourceText
	Set string value... 28 Text Stimme
	Set string value... 28 Key !
	Set string value... 28 Helptext Change speech sound source characteristics
	# Row 29
	Set string value... 29 Label Source_Original
	Set string value... 29 Text Original
	Set string value... 29 Key !
	Set string value... 29 Helptext Geh zur\u"k zu der Originalaufnahme
	# Row 30
	Set string value... 30 Label Source_Change
	Set string value... 30 Text Neu
	Set string value... 30 Key !
	Set string value... 30 Helptext Ersetze die Quelle der Sprache und synthetisiere die Sprache erneut
	# Row 31
	Set string value... 31 Label !SourceFile
	Set string value... 31 Text SourceFile
	Set string value... 31 Key !
	Set string value... 31 Helptext Die datei mit der Aufname der erw\u"nschte Quelle
	# Row 32
	Set string value... 32 Label $Speaker
	Set string value... 32 Text Sprecher
	Set string value... 32 Key !
	Set string value... 32 Helptext Tabelle mit den Sprecherdaten
	# Row 33
	Set string value... 33 Label SpeakerData
	Set string value... 33 Text Daten
	Set string value... 33 Key t
	Set string value... 33 Helptext Lese Tabelle mit den Sprecherdaten
	# Row 34
	Set string value... 34 Label SpeakerDirectory
	Set string value... 34 Text Mappe
	Set string value... 34 Key t
	Set string value... 34 Helptext Construiere eine Tabelle mit alle Aufnahmen in einer Mappe
	# Row 35
	Set string value... 35 Label SaveSpeaker
	Set string value... 35 Text Speichern
	Set string value... 35 Key S
	Set string value... 35 Helptext Speichere aktuelle Tabelle mit den Sprecherdaten
	# Row 36
	Set string value... 36 Label CloseSpeaker
	Set string value... 36 Text Schlie\ssen
	Set string value... 36 Key l
	Set string value... 36 Helptext Schlie\sse die aktuelle Tabelle und \o"fne eine lehre Tabelle f\u"r die Sprecherdaten
	# Row 37
	Set string value... 37 Label SpeakerMerge
	Set string value... 37 Text Kombiniere
	Set string value... 37 Key K
	Set string value... 37 Helptext Kombiniere tabelle mit Sprecherdaten
	# Row 38
	Set string value... 38 Label SpeakerRevert
	Set string value... 38 Text Gespeichert
	Set string value... 38 Key c
	Set string value... 38 Helptext Gespeicherte Version der Sprecherdaten wiederherstellen
	# Row 39
	Set string value... 39 Label $VoicePrint
	Set string value... 39 Text Voiceprint
	Set string value... 39 Key !
	Set string value... 39 Helptext Einstellungen VoicePrint Bild
	# Row 40
	Set string value... 40 Label SaveFMT_PDF
	Set string value... 40 Text PDF
	Set string value... 40 Key !
	Set string value... 40 Helptext VoicePrint als PDF Datei aufbewahren
	# Row 41
	Set string value... 41 Label SaveFMT_EPS
	Set string value... 41 Text EPS
	Set string value... 41 Key !
	Set string value... 41 Helptext VoicePrint als EPS Datei aufbewahren
	# Row 42
	Set string value... 42 Label SaveFMT_PNG
	Set string value... 42 Text PNG
	Set string value... 42 Key !
	Set string value... 42 Helptext VoicePrint als PNG Datei aufbewahren
	# Row 43
	Set string value... 43 Label SaveAll
	Set string value... 43 Text Mit Audio
	Set string value... 43 Key !
	Set string value... 43 Helptext Aufnahme zusammen mit %%Voiceprint% aufbewahren (selber Name)
	# Row 44
	Set string value... 44 Label $SpeakerSelect
	Set string value... 44 Text Verarbeitung
	Set string value... 44 Key !
	Set string value... 44 Helptext Selection und Verarbeitung von Aufnahmen
	# Row 45
	Set string value... 45 Label SpeakerSerial_None
	Set string value... 45 Text Einzeln
	Set string value... 45 Key v
	Set string value... 45 Helptext Verarbeite alle Aufnahmen einzeln
	# Row 46
	Set string value... 46 Label SpeakerSerial_Forw
	Set string value... 46 Text Seriell >
	Set string value... 46 Key .>
	Set string value... 46 Helptext Verarbeite alle Aufnahmen hintereinander (Sprecher Taste liest n\a"chste Aufnahme)
	# Row 47
	Set string value... 47 Label SpeakerSerial_Backw
	Set string value... 47 Text < Seriell
	Set string value... 47 Key ,<
	Set string value... 47 Helptext Verarbeite alle Aufnahmen r\u"ckw\a"rt (Sprecher Taste liest vorherige Aufnahme)
	# Row 48
	Set string value... 48 Label !SelectionWindow
	Set string value... 48 Text SelectionWindow
	Set string value... 48 Key !
	Set string value... 48 Helptext Urspr\u"ngliche Breite des Auswahl-Fenster (Voreinstellungen Serieller modus)
	# Row 49
	Set string value... 49 Label $AudioCollection
	Set string value... 49 Text Aufbewahren
	Set string value... 49 Key !
	Set string value... 49 Helptext Aufnahme un aufbewahren von audio
	# Row 50
	Set string value... 50 Label SaveAudio
	Set string value... 50 Text Audio
	Set string value... 50 Key !
	Set string value... 50 Helptext Audiovenster in einer Datei schreiben
	# Row 51
	Set string value... 51 Label RecordingTime
	Set string value... 51 Text Aufnahme
	Set string value... 51 Key e
	Set string value... 51 Helptext Aufnahmezeit in Secunden und  Datei mit Aufnahmeaufgaben
	# Row 52
	Set string value... 52 Label !RecordingTaskFile
	Set string value... 52 Text RecordingTaskFile
	Set string value... 52 Key !
	Set string value... 52 Helptext Die Datei mit den Aufnahmeaufgaben
	# Row 53
	Set string value... 53 Label !RecordingTarget
	Set string value... 53 Text RecordingTarget
	Set string value... 53 Key !
	Set string value... 53 Helptext Die Mappe mit den Aufnahmen
	# Row 54
	Set string value... 54 Label !RecordingScreen
	Set string value... 54 Text RecordingScreen
	Set string value... 54 Key !
	Set string value... 54 Helptext Ben\u"tze das Aufnahmevenster
	# Row 55
	Set string value... 55 Label $AutomaticTasks
	Set string value... 55 Text Ausf\u"hren
	Set string value... 55 Key !
	Set string value... 55 Helptext Ausf\u"hrung von zeitintensiven Aufgaben
	# Row 56
	Set string value... 56 Label ShowFormants
	Set string value... 56 Text Formante
	Set string value... 56 Key F
	Set string value... 56 Helptext Zeige Formante im Spektrogramm
	# Row 57
	Set string value... 57 Label AutoSelect
	Set string value... 57 Text AutoSelect
	Set string value... 57 Key 
	Set string value... 57 Helptext W\a"hlen Sie das beste Intervall automatisch
	# Row 58
	Set string value... 58 Label CalcGNE
	Set string value... 58 Text GNE
	Set string value... 58 Key 
	Set string value... 58 Helptext Berechne den GNE Wert
	# Row 59
	Set string value... 59 Label SpeakerSort
	Set string value... 59 Text Sortiere
	Set string value... 59 Key o
	Set string value... 59 Helptext Sortiere die Liste mit Aufnahmen
	# Row 60
	Set string value... 60 Label SpeakerRandomize
	Set string value... 60 Text Shuffle
	Set string value... 60 Key h
	Set string value... 60 Helptext Randomisiere die Liste mit Aufnahmen
	# Row 61
	Set string value... 61 Label $Rating
	Set string value... 61 Text Beurteilung
	Set string value... 61 Key 
	Set string value... 61 Helptext Menschliche Beurteilung de Sprache
	# Row 62
	Set string value... 62 Label RatingForm_Vowel
	Set string value... 62 Text Vokallaut
	Set string value... 62 Key 
	Set string value... 62 Helptext Beurteilungsformular f\u"r Vokallaute
	# Row 63
	Set string value... 63 Label RatingForm_Text
	Set string value... 63 Text Text
	Set string value... 63 Key 
	Set string value... 63 Helptext Tekst Beurteilungsformular f\u"r W\o"rter und S\a"tze
	# Row 64
	Set string value... 64 Label RatingForm_INFVo
	Set string value... 64 Text IINFVo
	Set string value... 64 Key 
	Set string value... 64 Helptext IINFVo Beurteilungsformular (Impression, Intelligibility, Noise, Fluency, Voice)
	# Row 65
	Set string value... 65 Label RatingForm_GRBAS
	Set string value... 65 Text GRBAS
	Set string value... 65 Key 
	Set string value... 65 Helptext GRBAS Beurteilungsformular (Grade, Roughness, Breathiness, Asthenia, Strain)
	# Row 66
	Set string value... 66 Label VasScaleTicks
	Set string value... 66 Text Markierung
	Set string value... 66 Key 
	Set string value... 66 Helptext Zeige Skalenmarkierungen in beurteilungsformular
	# Row 67
	Set string value... 67 Label !Logging
	Set string value... 67 Text Log an
	Set string value... 67 Key L
	Set string value... 67 Helptext Starte das Protokollieren aller Aufnahmen (Logbuch)
	# Row 68
	Set string value... 68 Label !OpenLog
	Set string value... 68 Text W\a"hlen
	Set string value... 68 Key W
	Set string value... 68 Helptext Selectiere Verzeichnis f\u"r die Logbuchdatei
	# Row 69
	Set string value... 69 Label !Run
	Set string value... 69 Text Ausf\u"hren
	Set string value... 69 Key n
	Set string value... 69 Helptext Befehlsdatei oder Logbuchdatei ausf\u"hren
endproc

procCreateConfig_EN$ = "Config_EN"
procedure CreateConfig_EN
	Create Table with column names... Config_EN 70
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: Change settings
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS tool: Change settings
	# Row 5
	Set string value... 5 Label Return
	Set string value... 5 Text Return
	Set string value... 5 Key R
	Set string value... 5 Helptext Go back to %%Main% page
	# Row 6
	Set string value... 6 Label Language_EN
	Set string value... 6 Text English
	Set string value... 6 Key E
	Set string value... 6 Helptext English language version
	# Row 7
	Set string value... 7 Label ShowBackground
	Set string value... 7 Text Background
	Set string value... 7 Key B
	Set string value... 7 Helptext Show background
	# Row 8
	Set string value... 8 Label Input_Microphone
	Set string value... 8 Text Microphone
	Set string value... 8 Key h
	Set string value... 8 Helptext Use the build-in microphone for recording
	# Row 9
	Set string value... 9 Label Input_Line
	Set string value... 9 Text Line input |
	Set string value... 9 Key |\+
	Set string value... 9 Helptext Use the line-input for recording
	# Row 10
	Set string value... 10 Label Instruction
	Set string value... 10 Text Pathology
	Set string value... 10 Key P
	Set string value... 10 Helptext Information about pathological types
	# Row 11
	Set string value... 11 Label Manual
	Set string value... 11 Text Manual
	Set string value... 11 Key M
	Set string value... 11 Helptext Manual of the application
	# Row 12
	Set string value... 12 Label Credits
	Set string value... 12 Text About
	Set string value... 12 Key iA
	Set string value... 12 Helptext Information about NKI TE-VOICE ANALYSIS tool
	# Row 13
	Set string value... 13 Label Refresh
	Set string value... 13 Text Refresh
	Set string value... 13 Key  
	Set string value... 13 Helptext Redraw the current screen, the space-bar always refreshes screen
	# Row 14
	Set string value... 14 Label Help
	Set string value... 14 Text Help
	Set string value... 14 Key ?/
	Set string value... 14 Helptext Press the button you want information on, "Help" to continue
	# Row 15
	Set string value... 15 Label MuteOutput
	Set string value... 15 Text Mute [x]
	Set string value... 15 Key x
	Set string value... 15 Helptext Mute output sound
	# Row 16
	Set string value... 16 Label Test
	Set string value... 16 Text Test recording
	Set string value... 16 Key T
	Set string value... 16 Helptext Test recording level
	# Row 17
	Set string value... 17 Label $MaxFrequency
	Set string value... 17 Text Frequency
	Set string value... 17 Key !
	Set string value... 17 Helptext Highest frequency shown
	# Row 18
	Set string value... 18 Label Frequency_10k
	Set string value... 18 Text 10kHz
	Set string value... 18 Key 10
	Set string value... 18 Helptext Display up to 10 kHz
	# Row 19
	Set string value... 19 Label Frequency_8k
	Set string value... 19 Text 8kHz
	Set string value... 19 Key 8
	Set string value... 19 Helptext Display up to 8 kHz
	# Row 20
	Set string value... 20 Label Frequency_5k
	Set string value... 20 Text 5kHz
	Set string value... 20 Key 5
	Set string value... 20 Helptext Display up to 5 kHz
	# Row 21
	Set string value... 21 Label Frequency_3k
	Set string value... 21 Text 3kHz
	Set string value... 21 Key 3
	Set string value... 21 Helptext Display up to 3 kHz
	# Row 22
	Set string value... 22 Label Frequency_2k
	Set string value... 22 Text 2kHz
	Set string value... 22 Key 2
	Set string value... 22 Helptext Display up to 2 kHz
	# Row 23
	Set string value... 23 Label Frequency_1k
	Set string value... 23 Text 1kHz
	Set string value... 23 Key 1
	Set string value... 23 Helptext Display up to 1 kHz
	# Row 24
	Set string value... 24 Label $Pitch
	Set string value... 24 Text Pitch
	Set string value... 24 Key !
	Set string value... 24 Helptext Set pitch extraction algorithm
	# Row 25
	Set string value... 25 Label Pitchalgorithm_VanAs
	Set string value... 25 Text Compatible
	Set string value... 25 Key !
	Set string value... 25 Helptext Settings from C.J. van As 2001 "Tracheoesophageal Speech" p83
	# Row 26
	Set string value... 26 Label Pitchalgorithm_CC300
	Set string value... 26 Text Low
	Set string value... 26 Key !
	Set string value... 26 Helptext Reduced octave jumps, for normal and low pitches (<300 Hz)
	# Row 27
	Set string value... 27 Label Pitchalgorithm_CC600
	Set string value... 27 Text High
	Set string value... 27 Key !
	Set string value... 27 Helptext Reduced octave jumps, for high pitches (<600 Hz)
	# Row 28
	Set string value... 28 Label $SourceText
	Set string value... 28 Text Voice
	Set string value... 28 Key !
	Set string value... 28 Helptext Change speech sound source characteristics
	# Row 29
	Set string value... 29 Label Source_Original
	Set string value... 29 Text Original
	Set string value... 29 Key !
	Set string value... 29 Helptext Reset to original recording
	# Row 30
	Set string value... 30 Label Source_Change
	Set string value... 30 Text Change
	Set string value... 30 Key !
	Set string value... 30 Helptext Replace the source of the speech and resynthesize
	# Row 31
	Set string value... 31 Label !SourceFile
	Set string value... 31 Text SourceFile
	Set string value... 31 Key !
	Set string value... 31 Helptext The file with the selected source recording
	# Row 32
	Set string value... 32 Label $Speaker
	Set string value... 32 Text Speakers
	Set string value... 32 Key !
	Set string value... 32 Helptext Table with speaker data
	# Row 33
	Set string value... 33 Label SpeakerData
	Set string value... 33 Text Data
	Set string value... 33 Key D
	Set string value... 33 Helptext Read table with speaker data
	# Row 34
	Set string value... 34 Label SpeakerDirectory
	Set string value... 34 Text Directory
	Set string value... 34 Key y
	Set string value... 34 Helptext Create a table from all recordings in a directory
	# Row 35
	Set string value... 35 Label SaveSpeaker
	Set string value... 35 Text Save
	Set string value... 35 Key v
	Set string value... 35 Helptext Write current table with speaker data
	# Row 36
	Set string value... 36 Label CloseSpeaker
	Set string value... 36 Text Close
	Set string value... 36 Key o
	Set string value... 36 Helptext Close current table and open a new, empty table
	# Row 37
	Set string value... 37 Label SpeakerMerge
	Set string value... 37 Text Merge
	Set string value... 37 Key g
	Set string value... 37 Helptext Merge new table with current speaker data
	# Row 38
	Set string value... 38 Label SpeakerRevert
	Set string value... 38 Text Revert
	Set string value... 38 Key c
	Set string value... 38 Helptext Revert speaker data to saved version
	# Row 39
	Set string value... 39 Label $VoicePrint
	Set string value... 39 Text Voiceprint
	Set string value... 39 Key !
	Set string value... 39 Helptext Settings of VoicePrint image
	# Row 40
	Set string value... 40 Label SaveFMT_PDF
	Set string value... 40 Text PDF
	Set string value... 40 Key !
	Set string value... 40 Helptext Save VoicePrint as PDF file
	# Row 41
	Set string value... 41 Label SaveFMT_PNG
	Set string value... 41 Text PNG
	Set string value... 41 Key !
	Set string value... 41 Helptext Save VoicePrint as PNG file
	# Row 42
	Set string value... 42 Label SaveFMT_EPS
	Set string value... 42 Text EPS
	Set string value... 42 Key !
	Set string value... 42 Helptext Save VoicePrint as EPS file
	# Row 43
	Set string value... 43 Label SaveAll
	Set string value... 43 Text With audio
	Set string value... 43 Key !
	Set string value... 43 Helptext Save recordings together with %%Voiceprint% (same name, but with WAV extension)
	# Row 44
	Set string value... 44 Label $SpeakerSelect
	Set string value... 44 Text Selection
	Set string value... 44 Key !
	Set string value... 44 Helptext Selection of recordings
	# Row 45
	Set string value... 45 Label SpeakerSerial_None
	Set string value... 45 Text Individual
	Set string value... 45 Key i
	Set string value... 45 Helptext Select individual recordings
	# Row 46
	Set string value... 46 Label SpeakerSerial_Forw
	Set string value... 46 Text Serial >
	Set string value... 46 Key .>
	Set string value... 46 Helptext Step through all recordings in sequence (Speaker button reads next recording)
	# Row 47
	Set string value... 47 Label SpeakerSerial_Backw
	Set string value... 47 Text < Serial
	Set string value... 47 Key ,<
	Set string value... 47 Helptext Step through all recordings in reverse order (Speaker button reads previous recording)
	# Row 48
	Set string value... 48 Label !SelectionWindow
	Set string value... 48 Text SelectionWindow
	Set string value... 48 Key !
	Set string value... 48 Helptext Initial width of the selection window (Preferences Serial mode)
	# Row 49
	Set string value... 49 Label $AudioCollection
	Set string value... 49 Text Archive
	Set string value... 49 Key !
	Set string value... 49 Helptext Recording and collection of audio
	# Row 50
	Set string value... 50 Label SaveAudio
	Set string value... 50 Text Audio
	Set string value... 50 Key !
	Set string value... 50 Helptext Save current audio selection to file
	# Row 51
	Set string value... 51 Label RecordingTime
	Set string value... 51 Text Recording
	Set string value... 51 Key c
	Set string value... 51 Helptext Time of recording in seconds and recording tasks
	# Row 52
	Set string value... 52 Label !RecordingTaskFile
	Set string value... 52 Text RecordingTaskFile
	Set string value... 52 Key !
	Set string value... 52 Helptext File with recording tasks
	# Row 53
	Set string value... 53 Label !RecordingTarget
	Set string value... 53 Text RecordingTarget
	Set string value... 53 Key !
	Set string value... 53 Helptext Directory with the recordings
	# Row 54
	Set string value... 54 Label !RecordingScreen
	Set string value... 54 Text RecordingScreen
	Set string value... 54 Key !
	Set string value... 54 Helptext Use the recording page
	# Row 55
	Set string value... 55 Label $AutomaticTasks
	Set string value... 55 Text Execute
	Set string value... 55 Key !
	Set string value... 55 Helptext Execution of time consuming tasks
	# Row 56
	Set string value... 56 Label ShowFormants
	Set string value... 56 Text Formants
	Set string value... 56 Key F
	Set string value... 56 Helptext Draw formants in spectrogram
	# Row 57
	Set string value... 57 Label AutoSelect
	Set string value... 57 Text AutoSelect
	Set string value... 57 Key 
	Set string value... 57 Helptext Select the "best" interval automatically
	# Row 58
	Set string value... 58 Label CalcGNE
	Set string value... 58 Text GNE
	Set string value... 58 Key 
	Set string value... 58 Helptext Calculate the GNE value 
	# Row 59
	Set string value... 59 Label SpeakerSort
	Set string value... 59 Text Sort V
	Set string value... 59 Key V
	Set string value... 59 Helptext Sort the list of recordings
	# Row 60
	Set string value... 60 Label SpeakerRandomize
	Set string value... 60 Text Shuffle
	Set string value... 60 Key u
	Set string value... 60 Helptext Randomize the list of recordings
	# Row 61
	Set string value... 61 Label $Rating
	Set string value... 61 Text Rating
	Set string value... 61 Key 
	Set string value... 61 Helptext Human evaluation of speech
	# Row 62
	Set string value... 62 Label RatingForm_Vowel
	Set string value... 62 Text Vowels
	Set string value... 62 Key 
	Set string value... 62 Helptext Evaluation form (VAS) for vowels
	# Row 63
	Set string value... 63 Label RatingForm_Text
	Set string value... 63 Text Text
	Set string value... 63 Key 
	Set string value... 63 Helptext Text evaluation form (VAS) for words and running speech
	# Row 64
	Set string value... 64 Label RatingForm_INFVo
	Set string value... 64 Text IINFVo
	Set string value... 64 Key 
	Set string value... 64 Helptext IINFVo evaluation form (VAS, for Impression, Intelligibility, Noise, Fluency, Voice)
	# Row 65
	Set string value... 65 Label RatingForm_GRBAS
	Set string value... 65 Text GRBAS
	Set string value... 65 Key 
	Set string value... 65 Helptext GRBAS evaluation form (Grade, Roughness, Breathiness, Asthenia, Strain)
	# Row 66
	Set string value... 66 Label RatingForm_TEpair
	Set string value... 66 Text TE pair
	Set string value... 66 Key 
	Set string value... 66 Helptext Pair evaluation form
	# Row 67
	Set string value... 67 Label VasScaleTicks
	Set string value... 67 Text Markers
	Set string value... 67 Key 
	Set string value... 67 Helptext Display scale markers for evaluations forms
	# Row 68
	Set string value... 68 Label !Logging
	Set string value... 68 Text Log on
	Set string value... 68 Key L
	Set string value... 68 Helptext Start logging sounds
	# Row 69
	Set string value... 69 Label !OpenLog
	Set string value... 69 Text Select
	Set string value... 69 Key S
	Set string value... 69 Helptext Select directory to store the logging file
	# Row 70
	Set string value... 70 Label !Run
	Set string value... 70 Text !Run
	Set string value... 70 Key n
	Set string value... 70 Helptext !Run command file (replay Log file)
endproc

procCreateConfig_ES$ = "Config_ES"
procedure CreateConfig_ES
	Create Table with column names... Config_ES 69
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son \& Nieves Broquetas
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS Herramienta: Cambiar la configuracion
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS Herramienta: Cambiar la configuacion
	# Row 5
	Set string value... 5 Label Return
	Set string value... 5 Text Volver
	Set string value... 5 Key V
	Set string value... 5 Helptext Volver a  %%principal% pagina
	# Row 6
	Set string value... 6 Label !Language_ES
	Set string value... 6 Text Espa\n~ol
	Set string value... 6 Key s
	Set string value... 6 Helptext Version Idioma Espa\n~ol
	# Row 7
	Set string value... 7 Label ShowBackground
	Set string value... 7 Text Anterior
	Set string value... 7 Key A
	Set string value... 7 Helptext Mostrar anterior
	# Row 8
	Set string value... 8 Label Input_Microphone
	Set string value... 8 Text Microfono
	Set string value... 8 Key o
	Set string value... 8 Helptext Utilice el microfono configurado para la gabacion
	# Row 9
	Set string value... 9 Label Input_Line
	Set string value... 9 Text Entrada Linea |
	Set string value... 9 Key |\+
	Set string value... 9 Helptext Utilice la entrada de la linea para la grabacion
	# Row 10
	Set string value... 10 Label Instruction
	Set string value... 10 Text Patologia
	Set string value... 10 Key P
	Set string value... 10 Helptext Informacion acerca de los tipos de patologia
	# Row 11
	Set string value... 11 Label Manual
	Set string value... 11 Text Manual
	Set string value... 11 Key M
	Set string value... 11 Helptext Manual de la aplicaci\o'n
	# Row 12
	Set string value... 12 Label Credits
	Set string value... 12 Text Acerca
	Set string value... 12 Key i
	Set string value... 12 Helptext Informacion acerca de la herramienta NKI TE-VOICE ANALYSIS
	# Row 13
	Set string value... 13 Label Refresh
	Set string value... 13 Text Refresh
	Set string value... 13 Key  
	Set string value... 13 Helptext Redraw the current screen, the space-bar always refreshes screen
	# Row 14
	Set string value... 14 Label Help
	Set string value... 14 Text Ayuda
	Set string value... 14 Key ?/
	Set string value... 14 Helptext Presione el boton para acceder a informacion, "Ayuda" para continuar
	# Row 15
	Set string value... 15 Label MuteOutput
	Set string value... 15 Text Silencio [x]
	Set string value... 15 Key x
	Set string value... 15 Helptext Salida silencio sonido
	# Row 16
	Set string value... 16 Label Test
	Set string value... 16 Text Prueba grabacion
	Set string value... 16 Key r
	Set string value... 16 Helptext Prueba de nivel de grabacion
	# Row 17
	Set string value... 17 Label $MaxFrequency
	Set string value... 17 Text Frequencia
	Set string value... 17 Key !
	Set string value... 17 Helptext Frecuencias m\a's altas mostradas
	# Row 18
	Set string value... 18 Label Frequency_10k
	Set string value... 18 Text 10kHz
	Set string value... 18 Key 0
	Set string value... 18 Helptext Pantalla hasta 10 kHz
	# Row 19
	Set string value... 19 Label Frequency_8k
	Set string value... 19 Text 8kHz
	Set string value... 19 Key 8
	Set string value... 19 Helptext Pantalla hasta 8 kHz
	# Row 20
	Set string value... 20 Label Frequency_5k
	Set string value... 20 Text 5kHz
	Set string value... 20 Key 5
	Set string value... 20 Helptext Pantalla hasta 5 kHz
	# Row 21
	Set string value... 21 Label Frequency_3k
	Set string value... 21 Text 3kHz
	Set string value... 21 Key 3
	Set string value... 21 Helptext Pantalla hasta 3 kHz
	# Row 22
	Set string value... 22 Label Frequency_2k
	Set string value... 22 Text 2kHz
	Set string value... 22 Key 2
	Set string value... 22 Helptext Pantalla hasta 2 kHz
	# Row 23
	Set string value... 23 Label Frequency_1k
	Set string value... 23 Text 1kHz
	Set string value... 23 Key 1
	Set string value... 23 Helptext Pantalla hasta 1 kHz
	# Row 24
	Set string value... 24 Label $Pitch
	Set string value... 24 Text Pitch
	Set string value... 24 Key !
	Set string value... 24 Helptext Set pitch extraction algorithm
	# Row 25
	Set string value... 25 Label Pitchalgorithm_VanAs
	Set string value... 25 Text Compatible
	Set string value... 25 Key !
	Set string value... 25 Helptext Settings from C.J. van As 2001 "Tracheoesophageal Speech" p83
	# Row 26
	Set string value... 26 Label Pitchalgorithm_CC300
	Set string value... 26 Text Low
	Set string value... 26 Key !
	Set string value... 26 Helptext Reduced octave jumps, for normal and low pitches (<300 Hz)
	# Row 27
	Set string value... 27 Label Pitchalgorithm_CC600
	Set string value... 27 Text High
	Set string value... 27 Key !
	Set string value... 27 Helptext Reduced octave jumps, for high pitches (<600 Hz)
	# Row 28
	Set string value... 28 Label $SourceText
	Set string value... 28 Text Voice
	Set string value... 28 Key !
	Set string value... 28 Helptext Change speech sound source characteristics
	# Row 29
	Set string value... 29 Label Source_Original
	Set string value... 29 Text Original
	Set string value... 29 Key !
	Set string value... 29 Helptext Reset to original recording
	# Row 30
	Set string value... 30 Label Source_Change
	Set string value... 30 Text Change
	Set string value... 30 Key !
	Set string value... 30 Helptext Replace the source of the speech and resynthesize
	# Row 31
	Set string value... 31 Label !SourceFile
	Set string value... 31 Text SourceFile
	Set string value... 31 Key !
	Set string value... 31 Helptext The file with the selected source recording
	# Row 32
	Set string value... 32 Label $Speaker
	Set string value... 32 Text Hablantes
	Set string value... 32 Key !
	Set string value... 32 Helptext Tabla con los datos del hablante
	# Row 33
	Set string value... 33 Label SpeakerData
	Set string value... 33 Text Datos
	Set string value... 33 Key D
	Set string value... 33 Helptext Tabla leida con los datos del hablante
	# Row 34
	Set string value... 34 Label SpeakerDirectory
	Set string value... 34 Text Directorio
	Set string value... 34 Key t
	Set string value... 34 Helptext Crear una tabla de todos los grabaciones en un directorio
	# Row 35
	Set string value... 35 Label SaveSpeaker
	Set string value... 35 Text Guardar
	Set string value... 35 Key G
	Set string value... 35 Helptext Escribir en la tabla los datos del hablante
	# Row 36
	Set string value... 36 Label CloseSpeaker
	Set string value... 36 Text Cerrar
	Set string value... 36 Key C
	Set string value... 36 Helptext Cerrar tabla actual y abrir una nueva y vac\i'a
	# Row 37
	Set string value... 37 Label SpeakerMerge
	Set string value... 37 Text Mezclar
	Set string value... 37 Key z
	Set string value... 37 Helptext Mezclar nueva tabla con datos actuales del hablante
	# Row 38
	Set string value... 38 Label SpeakerRevert
	Set string value... 38 Text Volver habl
	Set string value... 38 Key h
	Set string value... 38 Helptext Volver a los datos del hablante para guardar la versi\o'n
	# Row 39
	Set string value... 39 Label $VoicePrint
	Set string value... 39 Text Voiceprint
	Set string value... 39 Key !
	Set string value... 39 Helptext Settings of VoicePrint image
	# Row 40
	Set string value... 40 Label SaveFMT_PDF
	Set string value... 40 Text PDF
	Set string value... 40 Key !
	Set string value... 40 Helptext Save VoicePrint as PDF file
	# Row 41
	Set string value... 41 Label SaveFMT_EPS
	Set string value... 41 Text EPS
	Set string value... 41 Key !
	Set string value... 41 Helptext Save VoicePrint as EPS file
	# Row 42
	Set string value... 42 Label SaveFMT_PNG
	Set string value... 42 Text PNG
	Set string value... 42 Key !
	Set string value... 42 Helptext Save VoicePrint as PNG file
	# Row 43
	Set string value... 43 Label SaveAll
	Set string value... 43 Text With audio
	Set string value... 43 Key !
	Set string value... 43 Helptext Save recordings together with %%Voiceprint% (same name, but with WAV extension)
	# Row 44
	Set string value... 44 Label $AudioCollection
	Set string value... 44 Text Archive
	Set string value... 44 Key !
	Set string value... 44 Helptext Recording and collection of audio
	# Row 45
	Set string value... 45 Label SaveAudio
	Set string value... 45 Text Audio
	Set string value... 45 Key !
	Set string value... 45 Helptext Save current audio selection to file
	# Row 46
	Set string value... 46 Label RecordingTime
	Set string value... 46 Text Grabaci\o'n
	Set string value... 46 Key b
	Set string value... 46 Helptext Tiempo de gravaci\o'n en segundos and recording tasks
	# Row 47
	Set string value... 47 Label $SpeakerSelect
	Set string value... 47 Text Selection
	Set string value... 47 Key !
	Set string value... 47 Helptext Selection of recordings
	# Row 48
	Set string value... 48 Label SpeakerSerial_None
	Set string value... 48 Text Individual
	Set string value... 48 Key l
	Set string value... 48 Helptext Select individual recordings
	# Row 49
	Set string value... 49 Label SpeakerSerial_Forw
	Set string value... 49 Text Series >
	Set string value... 49 Key .>
	Set string value... 49 Helptext Acceder a todas las gabaciones en secuencia (Boton del Hablante lee nueva grabacion)
	# Row 50
	Set string value... 50 Label SpeakerSerial_Backw
	Set string value... 50 Text < Series
	Set string value... 50 Key ,<
	Set string value... 50 Helptext Acceder a todas las gabaciones en secuencia (Boton del Hablante lee el grabacion anterior)
	# Row 51
	Set string value... 51 Label !SelectionWindow
	Set string value... 51 Text Seleccionar ventana
	Set string value... 51 Key !
	Set string value... 51 Helptext Extensi\o'n inicial de la ventana seleccionada (Preferencias Serial mode)
	# Row 52
	Set string value... 52 Label $AutomaticTasks
	Set string value... 52 Text Execute
	Set string value... 52 Key !
	Set string value... 52 Helptext Execution of time consuming tasks
	# Row 53
	Set string value... 53 Label AutoSelect
	Set string value... 53 Text Autom\a'tico
	Set string value... 53 Key u
	Set string value... 53 Helptext Seleccionar el "mejor" intervalo autom\a'ticamente
	# Row 54
	Set string value... 54 Label CalcGNE
	Set string value... 54 Text GNE
	Set string value... 54 Key 
	Set string value... 54 Helptext Calculate the GNE value 
	# Row 55
	Set string value... 55 Label ShowFormants
	Set string value... 55 Text Formantes
	Set string value... 55 Key F
	Set string value... 55 Helptext Dibujo de formantes en el espectograma
	# Row 56
	Set string value... 56 Label SpeakerSort
	Set string value... 56 Text Tipo V
	Set string value... 56 Key V
	Set string value... 56 Helptext Clasificar la lista de grabaciones
	# Row 57
	Set string value... 57 Label SpeakerRandomize
	Set string value... 57 Text Arrastrar
	Set string value... 57 Key !
	Set string value... 57 Helptext Aleatorizar lista de grabaciones
	# Row 58
	Set string value... 58 Label !RecordingTaskFile
	Set string value... 58 Text RecordingTaskFile
	Set string value... 58 Key !
	Set string value... 58 Helptext File with recording tasks
	# Row 59
	Set string value... 59 Label !RecordingTarget
	Set string value... 59 Text RecordingTarget
	Set string value... 59 Key !
	Set string value... 59 Helptext Directory with the recordings
	# Row 60
	Set string value... 60 Label !RecordingScreen
	Set string value... 60 Text RecordingScreen
	Set string value... 60 Key !
	Set string value... 60 Helptext Use the recording page
	# Row 61
	Set string value... 61 Label $Rating
	Set string value... 61 Text Valoraci\o'n
	Set string value... 61 Key 
	Set string value... 61 Helptext Valoraci\o'n humana del habla
	# Row 62
	Set string value... 62 Label RatingForm_Vowel
	Set string value... 62 Text Vocales
	Set string value... 62 Key 
	Set string value... 62 Helptext Formulario de evaluaci\o'n (VAS) de vocales
	# Row 63
	Set string value... 63 Label RatingForm_Text
	Set string value... 63 Text Text
	Set string value... 63 Key 
	Set string value... 63 Helptext Text evaluation form (VAS) for words and running speech
	# Row 64
	Set string value... 64 Label RatingForm_INFVo
	Set string value... 64 Text IINFVo
	Set string value... 64 Key 
	Set string value... 64 Helptext IINFVo evaluation form (VAS, for Impression, Intelligibility, Noise, Fluency, Voice)
	# Row 65
	Set string value... 65 Label RatingForm_GRBAS
	Set string value... 65 Text GRBAS
	Set string value... 65 Key 
	Set string value... 65 Helptext GRBAS evaluation form (Grade, Roughness, Breathiness, Asthenia, Strain)
	# Row 66
	Set string value... 66 Label VasScaleTicks
	Set string value... 66 Text Registros
	Set string value... 66 Key !
	Set string value... 66 Helptext Visualizar registros de escalas para formularios de evaluaci\o'n
	# Row 67
	Set string value... 67 Label !Logging
	Set string value... 67 Text Entrar
	Set string value... 67 Key !
	Set string value... 67 Helptext Iniciar regitro de sonidos
	# Row 68
	Set string value... 68 Label !OpenLog
	Set string value... 68 Text Seleccionar
	Set string value... 68 Key !
	Set string value... 68 Helptext Seleccionar directorio para guardar los archivos de registro
	# Row 69
	Set string value... 69 Label !Run
	Set string value... 69 Text Arrancar
	Set string value... 69 Key !
	Set string value... 69 Helptext Arrancar orden de archivo (repetir archivo de registro)
endproc

procCreateConfig_JA$ = "Config_JA"
procedure CreateConfig_JA
	Create Table with column names... Config_JA 69
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text 著者
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son, translation: Akiko Kanezaki
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text 著作権
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \& the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text ライセンス
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: 設定を変える
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS tool: Change settings
	# Row 5
	Set string value... 5 Label Return
	Set string value... 5 Text リターン
	Set string value... 5 Key R
	Set string value... 5 Helptext %%Main% メインページへ戻る
	# Row 6
	Set string value... 6 Label Language_JA
	Set string value... 6 Text 日本語
	Set string value... 6 Key E
	Set string value... 6 Helptext 日本語版
	# Row 7
	Set string value... 7 Label ShowBackground
	Set string value... 7 Text 背景
	Set string value... 7 Key B
	Set string value... 7 Helptext 背景を表示
	# Row 8
	Set string value... 8 Label Input_Microphone
	Set string value... 8 Text マイク
	Set string value... 8 Key h
	Set string value... 8 Helptext 内蔵型マイクを録音に使用する
	# Row 9
	Set string value... 9 Label Input_Line
	Set string value... 9 Text インプットライン 
	Set string value... 9 Key |\+
	Set string value... 9 Helptext インプットラインを録音に使用する
	# Row 10
	Set string value... 10 Label Instruction
	Set string value... 10 Text 病理
	Set string value... 10 Key P
	Set string value... 10 Helptext 病理タイプについての情報
	# Row 11
	Set string value... 11 Label Manual
	Set string value... 11 Text マニュアル
	Set string value... 11 Key M
	Set string value... 11 Helptext アプリケーションマニュアル
	# Row 12
	Set string value... 12 Label Credits
	Set string value... 12 Text TEVAについて
	Set string value... 12 Key iA
	Set string value... 12 Helptext オランダがんセンター音声分析ツールについて
	# Row 13
	Set string value... 13 Label Refresh
	Set string value... 13 Text リフレッシュ
	Set string value... 13 Key 
	Set string value... 13 Helptext 現在のスクリーンを再描画します,スペースバーは常に画面をリフレッシュします
	# Row 14
	Set string value... 14 Label Help
	Set string value... 14 Text ヘルプ
	Set string value... 14 Key ?/
	Set string value... 14 Helptext 知りたい情報があればヘルプボタンを押して下さい
	# Row 15
	Set string value... 15 Label MuteOutput
	Set string value... 15 Text 消音 [x]
	Set string value... 15 Key x
	Set string value... 15 Helptext 音声を消す
	# Row 16
	Set string value... 16 Label Test
	Set string value... 16 Text テスト録音
	Set string value... 16 Key T
	Set string value... 16 Helptext テスト録音レベル
	# Row 17
	Set string value... 17 Label $MaxFrequency
	Set string value... 17 Text 周波数
	Set string value... 17 Key !
	Set string value... 17 Helptext 最大周波数を表示する
	# Row 18
	Set string value... 18 Label Frequency_10k
	Set string value... 18 Text 10kHz
	Set string value... 18 Key 10
	Set string value... 18 Helptext 10 kHzまでを表示する
	# Row 19
	Set string value... 19 Label Frequency_8k
	Set string value... 19 Text 8kHz
	Set string value... 19 Key 8
	Set string value... 19 Helptext 8 kHzまでを表示する
	# Row 20
	Set string value... 20 Label Frequency_5k
	Set string value... 20 Text 5kHz
	Set string value... 20 Key 5
	Set string value... 20 Helptext 5 kHzまでを表示する
	# Row 21
	Set string value... 21 Label Frequency_3k
	Set string value... 21 Text 3kHz
	Set string value... 21 Key 3
	Set string value... 21 Helptext 3 kHzまでを表示する
	# Row 22
	Set string value... 22 Label Frequency_2k
	Set string value... 22 Text 2kHz
	Set string value... 22 Key 2
	Set string value... 22 Helptext 2 kHzまでを表示する
	# Row 23
	Set string value... 23 Label Frequency_1k
	Set string value... 23 Text 1kHz
	Set string value... 23 Key 1
	Set string value... 23 Helptext 1 kHzまでを表示する
	# Row 24
	Set string value... 24 Label $Pitch
	Set string value... 24 Text ピッチ
	Set string value... 24 Key !
	Set string value... 24 Helptext ピッチからアルゴリズムを抽出する
	# Row 25
	Set string value... 25 Label Pitchalgorithm_VanAs
	Set string value... 25 Text 互換性あり
	Set string value... 25 Key !
	Set string value... 25 Helptext C.J. van As 2001 "Tracheoesophageal Speech" p83からの設定
	# Row 26
	Set string value... 26 Label Pitchalgorithm_CC300
	Set string value... 26 Text 低い
	Set string value... 26 Key !
	Set string value... 26 Helptext ノーマルと低いピッチの為にオクターブの飛躍を減らす (<300 Hz)
	# Row 27
	Set string value... 27 Label Pitchalgorithm_CC600
	Set string value... 27 Text 高い
	Set string value... 27 Key !
	Set string value... 27 Helptext 高いピッチの為にオクターブの飛躍を減らす (<600 Hz)
	# Row 28
	Set string value... 28 Label $SourceText
	Set string value... 28 Text Voice
	Set string value... 28 Key !
	Set string value... 28 Helptext Change speech sound source characteristics
	# Row 29
	Set string value... 29 Label Source_Original
	Set string value... 29 Text Original
	Set string value... 29 Key !
	Set string value... 29 Helptext Reset to original recording
	# Row 30
	Set string value... 30 Label Source_Change
	Set string value... 30 Text Change
	Set string value... 30 Key !
	Set string value... 30 Helptext Replace the source of the speech and resynthesize
	# Row 31
	Set string value... 31 Label !SourceFile
	Set string value... 31 Text SourceFile
	Set string value... 31 Key !
	Set string value... 31 Helptext The file with the selected source recording
	# Row 32
	Set string value... 32 Label $Speaker
	Set string value... 32 Text 話者
	Set string value... 32 Key !
	Set string value... 32 Helptext 話者データ一覧
	# Row 33
	Set string value... 33 Label SpeakerData
	Set string value... 33 Text データ
	Set string value... 33 Key D
	Set string value... 33 Helptext 話者データを読む
	# Row 34
	Set string value... 34 Label SpeakerDirectory
	Set string value... 34 Text ディレクトリ
	Set string value... 34 Key y
	Set string value... 34 Helptext ディレクトリ中の全てのデータから新しい表を作成する
	# Row 35
	Set string value... 35 Label SaveSpeaker
	Set string value... 35 Text 保存
	Set string value... 35 Key v
	Set string value... 35 Helptext 現在の表に話者データを書き込む
	# Row 36
	Set string value... 36 Label CloseSpeaker
	Set string value... 36 Text 閉じる
	Set string value... 36 Key o
	Set string value... 36 Helptext 現在の表を閉じて新規を開く
	# Row 37
	Set string value... 37 Label SpeakerMerge
	Set string value... 37 Text 併合する
	Set string value... 37 Key g
	Set string value... 37 Helptext 現在の話者データと新しい表を併合する
	# Row 38
	Set string value... 38 Label SpeakerRevert
	Set string value... 38 Text 戻る
	Set string value... 38 Key c
	Set string value... 38 Helptext 話者のデータを保存された状態に戻す
	# Row 39
	Set string value... 39 Label $VoicePrint
	Set string value... 39 Text 声紋
	Set string value... 39 Key !
	Set string value... 39 Helptext 声紋の画像設定
	# Row 40
	Set string value... 40 Label SaveFMT_PDF
	Set string value... 40 Text PDF
	Set string value... 40 Key !
	Set string value... 40 Helptext PDFファイルで声紋を保存する
	# Row 41
	Set string value... 41 Label SaveFMT_PNG
	Set string value... 41 Text PNG
	Set string value... 41 Key !
	Set string value... 41 Helptext PNGファイルで声紋を保存する
	# Row 42
	Set string value... 42 Label SaveFMT_EPS
	Set string value... 42 Text EPS
	Set string value... 42 Key !
	Set string value... 42 Helptext EPSファイルで声紋を保存する
	# Row 43
	Set string value... 43 Label SaveAll
	Set string value... 43 Text オーディオと
	Set string value... 43 Key !
	Set string value... 43 Helptext 録音を%%声紋%と一緒に保存する (同じ名前, WAV拡張で)
	# Row 44
	Set string value... 44 Label $SpeakerSelect
	Set string value... 44 Text 選択
	Set string value... 44 Key !
	Set string value... 44 Helptext 録音の選択
	# Row 45
	Set string value... 45 Label SpeakerSerial_None
	Set string value... 45 Text 個別
	Set string value... 45 Key i
	Set string value... 45 Helptext 個別の録音を選択する
	# Row 46
	Set string value... 46 Label SpeakerSerial_Forw
	Set string value... 46 Text 連続 >
	Set string value... 46 Key .>
	Set string value... 46 Helptext 順に全ての録音をステップスルー (スピーカーボタンで次の録音へ)
	# Row 47
	Set string value... 47 Label SpeakerSerial_Backw
	Set string value... 47 Text < 連続
	Set string value... 47 Key ,<
	Set string value... 47 Helptext 逆順で全ての録音をステップスルー (スピーカーボタンで前の録音へ)
	# Row 48
	Set string value... 48 Label !SelectionWindow
	Set string value... 48 Text 画面選択
	Set string value... 48 Key !
	Set string value... 48 Helptext 初期画面設定の選択(環境設定シリアルモード)
	# Row 49
	Set string value... 49 Label $AudioCollection
	Set string value... 49 Text アーカイブ
	Set string value... 49 Key !
	Set string value... 49 Helptext オーディオの録音とコレクション
	# Row 50
	Set string value... 50 Label SaveAudio
	Set string value... 50 Text オーディオ
	Set string value... 50 Key !
	Set string value... 50 Helptext 現在選択されているオーディオをファイルに保存
	# Row 51
	Set string value... 51 Label RecordingTime
	Set string value... 51 Text 録音
	Set string value... 51 Key c
	Set string value... 51 Helptext 録音時間の秒数と録音タスク
	# Row 52
	Set string value... 52 Label !RecordingTaskFile
	Set string value... 52 Text タスクファイルの録音
	Set string value... 52 Key !
	Set string value... 52 Helptext ファイルと録音タスク
	# Row 53
	Set string value... 53 Label !RecordingTarget
	Set string value... 53 Text 録音ターゲット
	Set string value... 53 Key !
	Set string value... 53 Helptext ディレクトリと録音
	# Row 54
	Set string value... 54 Label !RecordingScreen
	Set string value... 54 Text RecordingScreen
	Set string value... 54 Key !
	Set string value... 54 Helptext Use the recording page
	# Row 55
	Set string value... 55 Label $AutomaticTasks
	Set string value... 55 Text 実行
	Set string value... 55 Key !
	Set string value... 55 Helptext 時間のかかるタスクの実行
	# Row 56
	Set string value... 56 Label ShowFormants
	Set string value... 56 Text フォルマント
	Set string value... 56 Key F
	Set string value... 56 Helptext スペクトログラムのフォルマントを描出する
	# Row 57
	Set string value... 57 Label AutoSelect
	Set string value... 57 Text 自動選択
	Set string value... 57 Key 
	Set string value... 57 Helptext 自動で「最適な」間隔を選択する
	# Row 58
	Set string value... 58 Label CalcGNE
	Set string value... 58 Text GNE
	Set string value... 58 Key 
	Set string value... 58 Helptext GNE値を計算する
	# Row 59
	Set string value... 59 Label SpeakerSort
	Set string value... 59 Text Sort V
	Set string value... 59 Key V
	Set string value... 59 Helptext 録音リストをソートする
	# Row 60
	Set string value... 60 Label SpeakerRandomize
	Set string value... 60 Text シャッフル
	Set string value... 60 Key u
	Set string value... 60 Helptext 録音リストをランダム化する
	# Row 61
	Set string value... 61 Label $Rating
	Set string value... 61 Text 評価
	Set string value... 61 Key 
	Set string value... 61 Helptext 音声のヒューマン評価
	# Row 62
	Set string value... 62 Label RatingForm_Vowel
	Set string value... 62 Text 母音
	Set string value... 62 Key 
	Set string value... 62 Helptext 母音からの評価(VAS) 
	# Row 63
	Set string value... 63 Label RatingForm_Text
	Set string value... 63 Text テキスト
	Set string value... 63 Key 
	Set string value... 63 Helptext 単語や実行中の音声のテキスト評価フォーム（VAS)
	# Row 64
	Set string value... 64 Label RatingForm_INFVo
	Set string value... 64 Text IINFVo
	Set string value... 64 Key 
	Set string value... 64 Helptext IINFVo評価フォーム (印象, 明瞭度, 雑音, 流暢さ, 声質によるVAS)
	# Row 65
	Set string value... 65 Label RatingForm_GRBAS
	Set string value... 65 Text GRBAS
	Set string value... 65 Key 
	Set string value... 65 Helptext GRBAS 評価フォーム(嗄声の全般的な程度, 粗造性, 気息性, 無力性, 努力性による評価)
	# Row 66
	Set string value... 66 Label VasScaleTicks
	Set string value... 66 Text マーカー
	Set string value... 66 Key 
	Set string value... 66 Helptext 評価フォームのディスプレイ尺度マーカー
	# Row 67
	Set string value... 67 Label !Logging
	Set string value... 67 Text ログオン
	Set string value... 67 Key L
	Set string value... 67 Helptext 音のログオンを開始する
	# Row 68
	Set string value... 68 Label !OpenLog
	Set string value... 68 Text 選択
	Set string value... 68 Key S
	Set string value... 68 Helptext ディレクトリを選択してログファイルを保存する
	# Row 69
	Set string value... 69 Label !Run
	Set string value... 69 Text !実行
	Set string value... 69 Key n
	Set string value... 69 Helptext !コマンドファイル実行 (ログファイルをリプレイ)
endproc

procCreateConfig_NL$ = "Config_NL"
procedure CreateConfig_NL
	Create Table with column names... Config_NL 70
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: Instellingen aanpassen
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS tool: Instellingen aanpassen
	# Row 5
	Set string value... 5 Label Return
	Set string value... 5 Text Terug
	Set string value... 5 Key T
	Set string value... 5 Helptext Ga terug naar de oefen pagina
	# Row 6
	Set string value... 6 Label Language_NL
	Set string value... 6 Text Nederlands
	Set string value... 6 Key N
	Set string value... 6 Helptext Gebruik Nederlands
	# Row 7
	Set string value... 7 Label ShowBackground
	Set string value... 7 Text Achtergrond
	Set string value... 7 Key A
	Set string value... 7 Helptext Toon achtergrond
	# Row 8
	Set string value... 8 Label Input_Microphone
	Set string value... 8 Text Microfoon
	Set string value... 8 Key f
	Set string value... 8 Helptext Gebruik de ingebouwde microfoon voor spraakopnamen
	# Row 9
	Set string value... 9 Label Input_Line
	Set string value... 9 Text Lijn ingang |
	Set string value... 9 Key |\+
	Set string value... 9 Helptext Gebruik de lijn-ingang voor de spraakopnamen
	# Row 10
	Set string value... 10 Label Instruction
	Set string value... 10 Text Pathologie
	Set string value... 10 Key P
	Set string value... 10 Helptext Informatie over pathologische types
	# Row 11
	Set string value... 11 Label Manual
	Set string value... 11 Text Handleiding
	Set string value... 11 Key H
	Set string value... 11 Helptext Handleiding van de applicatie
	# Row 12
	Set string value... 12 Label Credits
	Set string value... 12 Text Over
	Set string value... 12 Key iC
	Set string value... 12 Helptext Informatie over NKI TE-VOICE ANALYSIS tool
	# Row 13
	Set string value... 13 Label Refresh
	Set string value... 13 Text Ververs
	Set string value... 13 Key  
	Set string value... 13 Helptext Ververs de huidige pagina, de spatiebalk ververst altijd de pagina
	# Row 14
	Set string value... 14 Label Help
	Set string value... 14 Text Help
	Set string value... 14 Key ?/
	Set string value... 14 Helptext klik op de knop waar u informatie over wilt hebben, "Help" als u verder wilt
	# Row 15
	Set string value... 15 Label MuteOutput
	Set string value... 15 Text Mute [x]
	Set string value... 15 Key x
	Set string value... 15 Helptext Geen geluidsweergave
	# Row 16
	Set string value... 16 Label Test
	Set string value... 16 Text Test opname
	Set string value... 16 Key o
	Set string value... 16 Helptext Test opname niveau
	# Row 17
	Set string value... 17 Label $MaxFrequency
	Set string value... 17 Text Frequentie
	Set string value... 17 Key !
	Set string value... 17 Helptext Hoogste frequentie
	# Row 18
	Set string value... 18 Label Frequency_10k
	Set string value... 18 Text 10kHz
	Set string value... 18 Key 10
	Set string value... 18 Helptext Ga tot 10 kHz
	# Row 19
	Set string value... 19 Label Frequency_8k
	Set string value... 19 Text 8kHz
	Set string value... 19 Key 8
	Set string value... 19 Helptext Ga tot 8 kHz
	# Row 20
	Set string value... 20 Label Frequency_5k
	Set string value... 20 Text 5kHz
	Set string value... 20 Key 5
	Set string value... 20 Helptext Ga tot 5 kHz
	# Row 21
	Set string value... 21 Label Frequency_3k
	Set string value... 21 Text 3kHz
	Set string value... 21 Key 3
	Set string value... 21 Helptext Ga tot 3 kHz
	# Row 22
	Set string value... 22 Label Frequency_2k
	Set string value... 22 Text 2kHz
	Set string value... 22 Key 2
	Set string value... 22 Helptext Ga tot 2 kHz
	# Row 23
	Set string value... 23 Label Frequency_1k
	Set string value... 23 Text 1kHz
	Set string value... 23 Key 1
	Set string value... 23 Helptext Ga tot 1 kHz
	# Row 24
	Set string value... 24 Label $Pitch
	Set string value... 24 Text Toonhoogte
	Set string value... 24 Key !
	Set string value... 24 Helptext Stel de bepaling de toonhoogtemeting in
	# Row 25
	Set string value... 25 Label Pitchalgorithm_VanAs
	Set string value... 25 Text Compatibel
	Set string value... 25 Key !
	Set string value... 25 Helptext Instellingen volgens C.J. van As 2001 "Tracheoesophageal Speech" p83
	# Row 26
	Set string value... 26 Label Pitchalgorithm_CC300
	Set string value... 26 Text Laag
	Set string value... 26 Key !
	Set string value... 26 Helptext Verminderde oktaafsprongen, voor normale en lage stemmen (<300 Hz)
	# Row 27
	Set string value... 27 Label Pitchalgorithm_CC600
	Set string value... 27 Text Hoog
	Set string value... 27 Key !
	Set string value... 27 Helptext Verminderde oktaafsprongen, voor hoge stemmen (<600 Hz)
	# Row 28
	Set string value... 28 Label $SourceText
	Set string value... 28 Text Stem
	Set string value... 28 Key !
	Set string value... 28 Helptext Change speech sound source characteristics
	# Row 29
	Set string value... 29 Label Source_Original
	Set string value... 29 Text Origineel
	Set string value... 29 Key !
	Set string value... 29 Helptext Terugzetten naar originele opname
	# Row 30
	Set string value... 30 Label Source_Change
	Set string value... 30 Text Nieuw
	Set string value... 30 Key !
	Set string value... 30 Helptext Vervang de bron van de spraak en synthetiseer het geluid opnieuw
	# Row 31
	Set string value... 31 Label !SourceFile
	Set string value... 31 Text SourceFile
	Set string value... 31 Key !
	Set string value... 31 Helptext Het bestand met een opname van de gewenste bron
	# Row 32
	Set string value... 32 Label $Speaker
	Set string value... 32 Text Sprekers
	Set string value... 32 Key !
	Set string value... 32 Helptext Tabel met spreker gegevens
	# Row 33
	Set string value... 33 Label SpeakerData
	Set string value... 33 Text Data
	Set string value... 33 Key D
	Set string value... 33 Helptext Lees tabel met sprekergegevens
	# Row 34
	Set string value... 34 Label SpeakerDirectory
	Set string value... 34 Text Map+
	Set string value... 34 Key +
	Set string value... 34 Helptext Maak een tabel met alle opnamen uit een map
	# Row 35
	Set string value... 35 Label SaveSpeaker
	Set string value... 35 Text Bewaar
	Set string value... 35 Key B
	Set string value... 35 Helptext Bewaar huidige tabel met sprekergegevens
	# Row 36
	Set string value... 36 Label CloseSpeaker
	Set string value... 36 Text Sluit
	Set string value... 36 Key S
	Set string value... 36 Helptext Sluit huidige tabel en open een nieuwe, lege tabel
	# Row 37
	Set string value... 37 Label SpeakerMerge
	Set string value... 37 Text Merge
	Set string value... 37 Key M
	Set string value... 37 Helptext Combineer nieuwe tabel met huidige sprekergegevens
	# Row 38
	Set string value... 38 Label SpeakerRevert
	Set string value... 38 Text Herstel
	Set string value... 38 Key #
	Set string value... 38 Helptext Herstel naar opgeslagen sprekergegevens
	# Row 39
	Set string value... 39 Label $VoicePrint
	Set string value... 39 Text Voiceprint
	Set string value... 39 Key !
	Set string value... 39 Helptext Instellingen van de VoicePrint afbeelding
	# Row 40
	Set string value... 40 Label SaveFMT_PDF
	Set string value... 40 Text PDF
	Set string value... 40 Key !
	Set string value... 40 Helptext Bewaar VoicePrint als PDF bestand
	# Row 41
	Set string value... 41 Label SaveFMT_EPS
	Set string value... 41 Text EPS
	Set string value... 41 Key !
	Set string value... 41 Helptext Bewaar VoicePrint als EPS bestand
	# Row 42
	Set string value... 42 Label SaveFMT_PNG
	Set string value... 42 Text PNG
	Set string value... 42 Key !
	Set string value... 42 Helptext Bewaar VoicePrint als PNG bestand
	# Row 43
	Set string value... 43 Label SaveAll
	Set string value... 43 Text Met audio
	Set string value... 43 Key !
	Set string value... 43 Helptext Bewaar geluidsbestand samen met %%Voiceprint% (zelfde naam, maar met WAV extensie)
	# Row 44
	Set string value... 44 Label $SpeakerSelect
	Set string value... 44 Text Verwerking
	Set string value... 44 Key !
	Set string value... 44 Helptext Selectie en verwerking van opnamen
	# Row 45
	Set string value... 45 Label SpeakerSerial_None
	Set string value... 45 Text Individueel
	Set string value... 45 Key r
	Set string value... 45 Helptext Selecteer individuele opnamen
	# Row 46
	Set string value... 46 Label SpeakerSerial_Forw
	Set string value... 46 Text Serieel >
	Set string value... 46 Key .>
	Set string value... 46 Helptext Verwerk alle opnamen in volgorde (Spreker knop leest volgende opname)
	# Row 47
	Set string value... 47 Label SpeakerSerial_Backw
	Set string value... 47 Text < Serieel
	Set string value... 47 Key ,<
	Set string value... 47 Helptext Verwerk alle opnamen in omgekeerde volgorde (Spreker knop leest vorige opname)
	# Row 48
	Set string value... 48 Label !SelectionWindow
	Set string value... 48 Text SelectionWindow
	Set string value... 48 Key !
	Set string value... 48 Helptext Beginlengte van het selectie venster (Voorkeursinstelling Serieel mode)
	# Row 49
	Set string value... 49 Label $AudioCollection
	Set string value... 49 Text Bewaren
	Set string value... 49 Key !
	Set string value... 49 Helptext Opnemen en bewaren van audio
	# Row 50
	Set string value... 50 Label SaveAudio
	Set string value... 50 Text Audio
	Set string value... 50 Key !
	Set string value... 50 Helptext Bewaar huidige selectie van geluid naar bestand
	# Row 51
	Set string value... 51 Label RecordingTime
	Set string value... 51 Text Opname
	Set string value... 51 Key ]}
	Set string value... 51 Helptext Opnametijd in seconden en bestanden voor voorleestaken
	# Row 52
	Set string value... 52 Label !RecordingTaskFile
	Set string value... 52 Text RecordingTaskFile
	Set string value... 52 Key !
	Set string value... 52 Helptext Bestand met de opnametaken
	# Row 53
	Set string value... 53 Label !RecordingTarget
	Set string value... 53 Text RecordingTarget
	Set string value... 53 Key !
	Set string value... 53 Helptext Map met de opnamen
	# Row 54
	Set string value... 54 Label !RecordingScreen
	Set string value... 54 Text RecordingScreen
	Set string value... 54 Key !
	Set string value... 54 Helptext Gebruikt de speciale opnamepagina
	# Row 55
	Set string value... 55 Label $AutomaticTasks
	Set string value... 55 Text Uitvoeren
	Set string value... 55 Key !
	Set string value... 55 Helptext Uitvoering van tijdrovende taken
	# Row 56
	Set string value... 56 Label ShowFormants
	Set string value... 56 Text Formanten
	Set string value... 56 Key F
	Set string value... 56 Helptext Teken formanten in spectrogram
	# Row 57
	Set string value... 57 Label AutoSelect
	Set string value... 57 Text AutoSelect
	Set string value... 57 Key 
	Set string value... 57 Helptext Selecteer automatisch het "beste" interval
	# Row 58
	Set string value... 58 Label CalcGNE
	Set string value... 58 Text GNE
	Set string value... 58 Key 
	Set string value... 58 Helptext Bereken de GNE waarde 
	# Row 59
	Set string value... 59 Label SpeakerSort
	Set string value... 59 Text Sorteer V
	Set string value... 59 Key V
	Set string value... 59 Helptext Sorteer de lijst met opnamen
	# Row 60
	Set string value... 60 Label SpeakerRandomize
	Set string value... 60 Text Shuffle
	Set string value... 60 Key e
	Set string value... 60 Helptext Randomiseer de lijst met opnamen
	# Row 61
	Set string value... 61 Label $Rating
	Set string value... 61 Text Beoordeling
	Set string value... 61 Key 
	Set string value... 61 Helptext Menselijke beoordeling van spraak
	# Row 62
	Set string value... 62 Label RatingForm_Vowel
	Set string value... 62 Text Klinkers
	Set string value... 62 Key 
	Set string value... 62 Helptext Beoordelingsformulier voor klinkers
	# Row 63
	Set string value... 63 Label RatingForm_Text
	Set string value... 63 Text Text
	Set string value... 63 Key 
	Set string value... 63 Helptext Tekst beoordelingsformulier voor woorden en lopende spraak
	# Row 64
	Set string value... 64 Label RatingForm_INFVo
	Set string value... 64 Text IINFVo
	Set string value... 64 Key 
	Set string value... 64 Helptext IINFVo beoordelingsformulier (Impression, Intelligibility, Noise, Fluency, Voice)
	# Row 65
	Set string value... 65 Label RatingForm_GRBAS
	Set string value... 65 Text GRBAS
	Set string value... 65 Key 
	Set string value... 65 Helptext GRBAS beoordelingsformulier (Grade, Roughness, Breathiness, Asthenia, Strain)
	# Row 66
	Set string value... 66 Label RatingForm_TEpair
	Set string value... 66 Text TE paar
	Set string value... 66 Key 
	Set string value... 66 Helptext Paar evaluatie
	# Row 67
	Set string value... 67 Label VasScaleTicks
	Set string value... 67 Text Schaal
	Set string value... 67 Key 
	Set string value... 67 Helptext Schaal markeringen in beoordelingsformulier
	# Row 68
	Set string value... 68 Label !Logging
	Set string value... 68 Text Log aan
	Set string value... 68 Key L
	Set string value... 68 Helptext Start logging spraak
	# Row 69
	Set string value... 69 Label !OpenLog
	Set string value... 69 Text Kies
	Set string value... 69 Key K
	Set string value... 69 Helptext Kies map voor logboek
	# Row 70
	Set string value... 70 Label !Run
	Set string value... 70 Text Uitvoeren
	Set string value... 70 Key U
	Set string value... 70 Helptext Voer commandobestand uit (of logboekbestand)
endproc

procCreateCredits_DE$ = "Credits_DE"
procedure CreateCredits_DE
	Create Table with column names... Credits_DE 31
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Helvetica
	Set string value... 1 size 12
	Set string value... 1 text  
	# Row 2
	Set string value... 2 font Helvetica
	Set string value... 2 size 16
	Set string value... 2 text NKI TE-VOICE ANALYSIS tool Version 1.1
	# Row 3
	Set string value... 3 font Helvetica
	Set string value... 3 size 12
	Set string value... 3 text  
	# Row 4
	Set string value... 4 font Helvetica
	Set string value... 4 size 12
	Set string value... 4 text Netherlands Cancer Institute Anwendung f\u"r Tracheoesophageale Stimmanalyse
	# Row 5
	Set string value... 5 font Helvetica
	Set string value... 5 size 12
	Set string value... 5 text F\u"r weitere Informationen, besuchen sie bitte unsere Webseiten: http://www.provoxweb.info/acoustic-analyses.html
	# Row 6
	Set string value... 6 font Helvetica
	Set string value... 6 size 12
	Set string value... 6 text und http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI\_ TEVA/
	# Row 7
	Set string value... 7 font Helvetica
	Set string value... 7 size 12
	Set string value... 7 text Entwickeld mit Praat 'praatVersion$' (http://www.praat.org)
	# Row 8
	Set string value... 8 font Helvetica
	Set string value... 8 size 12
	Set string value... 8 text  
	# Row 9
	Set string value... 9 font Helvetica
	Set string value... 9 size 12
	Set string value... 9 text Erstellt und Copyrights \co 2010-'dateYear$' von Rob van Son und das NKI - R.J.J.H.vanSon@gmail.com
	# Row 10
	Set string value... 10 font Helvetica
	Set string value... 10 size 12
	Set string value... 10 text  
	# Row 11
	Set string value... 11 font Helvetica
	Set string value... 11 size 12
	Set string value... 11 text Diese Anwendung wurde erm\o"glicht durch ein uneingeschr\a"nktes Forschungsstipendium von
	# Row 12
	Set string value... 12 font Helvetica
	Set string value... 12 size 12
	Set string value... 12 text ATOS MEDICAL AB: P.O. BOX 183 SE-242 22 H\O"RBY SWEDEN
	# Row 13
	Set string value... 13 font Helvetica
	Set string value... 13 size 12
	Set string value... 13 text  
	# Row 14
	Set string value... 14 font Helvetica
	Set string value... 14 size 12
	Set string value... 14 text Japanische \U"bersetzung: Akiko Kanezaki und Chiharu Kamei
	# Row 15
	Set string value... 15 font Helvetica
	Set string value... 15 size 12
	Set string value... 15 text Deutsche \U"bersetzung: Irene Jacobi und Rob van Son
	# Row 16
	Set string value... 16 font Helvetica
	Set string value... 16 size 12
	Set string value... 16 text  
	# Row 17
	Set string value... 17 font Courier
	Set string value... 17 size 12
	Set string value... 17 text Dieses Programm ist freie Software. Sie k\o"nnen es unter den Bedingungen
	# Row 18
	Set string value... 18 font Courier
	Set string value... 18 size 12
	Set string value... 18 text der GNU General Public License, wie von der Free Software Foundation
	# Row 19
	Set string value... 19 font Courier
	Set string value... 19 size 12
	Set string value... 19 text ver\o"ffentlicht, weitergeben und/oder modifizieren, entweder gem\a"\ss
	# Row 20
	Set string value... 20 font Courier
	Set string value... 20 size 12
	Set string value... 20 text Version2 der Lizenz oder (nach Ihrer Option) jeder sp\a"teren Version.
	# Row 21
	Set string value... 21 font Courier
	Set string value... 21 size 12
	Set string value... 21 text 
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text Die Ver\o"ffentlichung dieses Programms erfolgt in der Hoffnung, da\ss es
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text Ihnen von Nutzen sein wird, aber OHNE IRGENDEINE GARANTIE, sogar ohne
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text die implizite Garantie der MARKTREIFE oder der VERWENDBARKEIT F\U"R EINEN
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text BESTIMMTEN ZWECK. Details finden Sie in der GNU General Public License.
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text 
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text Sie sollten ein Exemplar der GNU General Public License zusammen mit
	# Row 28
	Set string value... 28 font Courier
	Set string value... 28 size 12
	Set string value... 28 text diesem Programm erhalten haben. Falls nicht, siehe
	# Row 29
	Set string value... 29 font Courier
	Set string value... 29 size 12
	Set string value... 29 text <http://www.gnu.org/licenses/>.
	# Row 30
	Set string value... 30 font Courier
	Set string value... 30 size 12
	Set string value... 30 text  
	# Row 31
	Set string value... 31 font Helvetica
	Set string value... 31 size 8
	Set string value... 31 text %%V: 'build_SHA$'%
endproc

procCreateCredits_EN$ = "Credits_EN"
procedure CreateCredits_EN
	Create Table with column names... Credits_EN 30
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Helvetica
	Set string value... 1 size 12
	Set string value... 1 text  
	# Row 2
	Set string value... 2 font Helvetica
	Set string value... 2 size 16
	Set string value... 2 text NKI TE-VOICE ANALYSIS tool version 1.1
	# Row 3
	Set string value... 3 font Helvetica
	Set string value... 3 size 12
	Set string value... 3 text  
	# Row 4
	Set string value... 4 font Helvetica
	Set string value... 4 size 12
	Set string value... 4 text Netherlands Cancer Institute tool for Tracheoesophageal Voice Analysis
	# Row 5
	Set string value... 5 font Helvetica
	Set string value... 5 size 12
	Set string value... 5 text For more information, visit our websites: http://www.provoxweb.info/acoustic-analyses.html
	# Row 6
	Set string value... 6 font Helvetica
	Set string value... 6 size 12
	Set string value... 6 text and http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI\_ TEVA/
	# Row 7
	Set string value... 7 font Helvetica
	Set string value... 7 size 12
	Set string value... 7 text Based on Praat 'praatVersion$' (http://www.praat.org)
	# Row 8
	Set string value... 8 font Helvetica
	Set string value... 8 size 12
	Set string value... 8 text  
	# Row 9
	Set string value... 9 font Helvetica
	Set string value... 9 size 12
	Set string value... 9 text Created and Copyrights \co 2010-'dateYear$' by Rob van Son and the NKI - R.J.J.H.vanSon@gmail.com
	# Row 10
	Set string value... 10 font Helvetica
	Set string value... 10 size 12
	Set string value... 10 text  
	# Row 11
	Set string value... 11 font Helvetica
	Set string value... 11 size 12
	Set string value... 11 text This application was made possible by an unrestricted research grant from
	# Row 12
	Set string value... 12 font Helvetica
	Set string value... 12 size 12
	Set string value... 12 text ATOS MEDICAL AB: P.O. BOX 183 SE-242 22 H\O"RBY SWEDEN
	# Row 13
	Set string value... 13 font Helvetica
	Set string value... 13 size 12
	Set string value... 13 text  
	# Row 14
	Set string value... 14 font Helvetica
	Set string value... 14 size 12
	Set string value... 14 text Japanese translation: Akiko Kanezaki and Chiharu Kamei
	# Row 15
	Set string value... 15 font Helvetica
	Set string value... 15 size 12
	Set string value... 15 text German translation: Irene Jacobi and Rob van Son
	# Row 16
	Set string value... 16 font Helvetica
	Set string value... 16 size 12
	Set string value... 16 text  
	# Row 17
	Set string value... 17 font Courier
	Set string value... 17 size 12
	Set string value... 17 text This program is free software: you can redistribute it and/or modify
	# Row 18
	Set string value... 18 font Courier
	Set string value... 18 size 12
	Set string value... 18 text it under the terms of the GNU General Public License as published by
	# Row 19
	Set string value... 19 font Courier
	Set string value... 19 size 12
	Set string value... 19 text the Free Software Foundation, either version 2 of the License, or
	# Row 20
	Set string value... 20 font Courier
	Set string value... 20 size 12
	Set string value... 20 text (at your option) any later version.
	# Row 21
	Set string value... 21 font Courier
	Set string value... 21 size 12
	Set string value... 21 text  
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text This program is distributed in the hope that it will be useful,
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text but WITHOUT ANY WARRANTY; without even the implied warranty of
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text GNU General Public License for more details.
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text  
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text You should have received a copy of the GNU General Public License
	# Row 28
	Set string value... 28 font Courier
	Set string value... 28 size 12
	Set string value... 28 text along with this program.  If not, see <http://www.gnu.org/licenses/>.
	# Row 29
	Set string value... 29 font Courier
	Set string value... 29 size 12
	Set string value... 29 text  
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 8
	Set string value... 30 text %%V: 'build_SHA$'%
endproc

procCreateCredits_ES$ = "Credits_ES"
procedure CreateCredits_ES
	Create Table with column names... Credits_ES 30
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Helvetica
	Set string value... 1 size 12
	Set string value... 1 text  
	# Row 2
	Set string value... 2 font Helvetica
	Set string value... 2 size 16
	Set string value... 2 text NKI TE-VOICE ANALYSIS tool version 1.1
	# Row 3
	Set string value... 3 font Helvetica
	Set string value... 3 size 12
	Set string value... 3 text  
	# Row 4
	Set string value... 4 font Helvetica
	Set string value... 4 size 12
	Set string value... 4 text Netherlands Cancer Institute tool for Tracheoesophageal Voice Analysis
	# Row 5
	Set string value... 5 font Helvetica
	Set string value... 5 size 12
	Set string value... 5 text For more information, visit our websites: http://www.provoxweb.info/acoustic-analyses.html
	# Row 6
	Set string value... 6 font Helvetica
	Set string value... 6 size 12
	Set string value... 6 text and http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI\_ TEVA/
	# Row 7
	Set string value... 7 font Helvetica
	Set string value... 7 size 12
	Set string value... 7 text Based on Praat 'praatVersion$' (http://www.praat.org)
	# Row 8
	Set string value... 8 font Helvetica
	Set string value... 8 size 12
	Set string value... 8 text  
	# Row 9
	Set string value... 9 font Helvetica
	Set string value... 9 size 12
	Set string value... 9 text Created and Copyrights \co 2010-'dateYear$' by Rob van Son and the NKI - R.J.J.H.vanSon@gmail.com
	# Row 10
	Set string value... 10 font Helvetica
	Set string value... 10 size 12
	Set string value... 10 text  
	# Row 11
	Set string value... 11 font Helvetica
	Set string value... 11 size 12
	Set string value... 11 text This application was made possible by an unrestricted research grant from
	# Row 12
	Set string value... 12 font Helvetica
	Set string value... 12 size 12
	Set string value... 12 text ATOS MEDICAL AB: P.O. BOX 183 SE-242 22 H\O"RBY SWEDEN
	# Row 13
	Set string value... 13 font Helvetica
	Set string value... 13 size 12
	Set string value... 13 text  
	# Row 14
	Set string value... 14 font Helvetica
	Set string value... 14 size 12
	Set string value... 14 text Japanese translation: Akiko Kanezaki and Chiharu Kamei
	# Row 15
	Set string value... 15 font Helvetica
	Set string value... 15 size 12
	Set string value... 15 text German translation: Irene Jacobi and Rob van Son
	# Row 16
	Set string value... 16 font Helvetica
	Set string value... 16 size 12
	Set string value... 16 text  
	# Row 17
	Set string value... 17 font Courier
	Set string value... 17 size 12
	Set string value... 17 text This program is free software: you can redistribute it and/or modify
	# Row 18
	Set string value... 18 font Courier
	Set string value... 18 size 12
	Set string value... 18 text it under the terms of the GNU General Public License as published by
	# Row 19
	Set string value... 19 font Courier
	Set string value... 19 size 12
	Set string value... 19 text the Free Software Foundation, either version 2 of the License, or
	# Row 20
	Set string value... 20 font Courier
	Set string value... 20 size 12
	Set string value... 20 text (at your option) any later version.
	# Row 21
	Set string value... 21 font Courier
	Set string value... 21 size 12
	Set string value... 21 text  
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text This program is distributed in the hope that it will be useful,
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text but WITHOUT ANY WARRANTY; without even the implied warranty of
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text GNU General Public License for more details.
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text  
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text You should have received a copy of the GNU General Public License
	# Row 28
	Set string value... 28 font Courier
	Set string value... 28 size 12
	Set string value... 28 text along with this program.  If not, see <http://www.gnu.org/licenses/>.
	# Row 29
	Set string value... 29 font Courier
	Set string value... 29 size 12
	Set string value... 29 text  
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 8
	Set string value... 30 text %%V: 'build_SHA$'%
endproc

procCreateCredits_JA$ = "Credits_JA"
procedure CreateCredits_JA
	Create Table with column names... Credits_JA 32
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Helvetica
	Set string value... 1 size 12
	Set string value... 1 text  
	# Row 2
	Set string value... 2 font Helvetica
	Set string value... 2 size 16
	Set string value... 2 text NKI TE-VOICE ANALYSIS tool version 1.1
	# Row 3
	Set string value... 3 font Helvetica
	Set string value... 3 size 12
	Set string value... 3 text  
	# Row 4
	Set string value... 4 font Helvetica
	Set string value... 4 size 12
	Set string value... 4 text Netherlands Cancer Institute tool for Tracheoesophageal Voice Analysis
	# Row 5
	Set string value... 5 font Helvetica
	Set string value... 5 size 12
	Set string value... 5 text For more information, visit our websites: http://www.provoxweb.info/acoustic-analyses.html
	# Row 6
	Set string value... 6 font Helvetica
	Set string value... 6 size 12
	Set string value... 6 text and http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI\_ TEVA/
	# Row 7
	Set string value... 7 font Helvetica
	Set string value... 7 size 12
	Set string value... 7 text Based on Praat 'praatVersion$' (http://www.praat.org)
	# Row 8
	Set string value... 8 font Helvetica
	Set string value... 8 size 12
	Set string value... 8 text  
	# Row 9
	Set string value... 9 font Helvetica
	Set string value... 9 size 12
	Set string value... 9 text Created and Copyrights \co 2010-'dateYear$' by Rob van Son and the NKI - R.J.J.H.vanSon@gmail.com
	# Row 10
	Set string value... 10 font Helvetica
	Set string value... 10 size 12
	Set string value... 10 text  
	# Row 11
	Set string value... 11 font Helvetica
	Set string value... 11 size 12
	Set string value... 11 text This application was made possible by an unrestricted research grant from
	# Row 12
	Set string value... 12 font Helvetica
	Set string value... 12 size 12
	Set string value... 12 text ATOS MEDICAL AB: P.O. BOX 183 SE-242 22 H\O"RBY SWEDEN
	# Row 13
	Set string value... 13 font Helvetica
	Set string value... 13 size 12
	Set string value... 13 text  
	# Row 14
	Set string value... 14 font Helvetica
	Set string value... 14 size 12
	Set string value... 14 text Japanese translation: Akiko Kanezaki and Chiharu Kamei
	# Row 15
	Set string value... 15 font Helvetica
	Set string value... 15 size 12
	Set string value... 15 text German translation: Irene Jacobi and Rob van Son
	# Row 16
	Set string value... 16 font Helvetica
	Set string value... 16 size 12
	Set string value... 16 text  
	# Row 17
	Set string value... 17 font Courier
	Set string value... 17 size 12
	Set string value... 17 text このプログラムはフリーソフトウェアです。あなたはこれを、フリーソフトウェ
	# Row 18
	Set string value... 18 font Courier
	Set string value... 18 size 12
	Set string value... 18 text ア財団によって発行された GNU 一般公衆利用許諾契約書(バージョン2か、希
	# Row 19
	Set string value... 19 font Courier
	Set string value... 19 size 12
	Set string value... 19 text 望によってはそれ以降のバージョンのうちどれか)の定める条件の下で再頒布
	# Row 20
	Set string value... 20 font Courier
	Set string value... 20 size 12
	Set string value... 20 text または改変することができます。
	# Row 21
	Set string value... 21 font Courier
	Set string value... 21 size 12
	Set string value... 21 text 
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text このプログラムは有用であることを願って頒布されますが、*全くの無保証* 
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text です。商業可能性の保証や特定の目的への適合性は、言外に示されたものも含
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text め全く存在しません。詳しくはGNU 一般公衆利用許諾契約書をご覧ください。
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text  
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text あなたはこのプログラムと共に、GNU 一般公衆利用許諾契約書の複製物を一部
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text 受け取ったはずです。もし受け取っていなければ、フリーソフトウェア財団ま
	# Row 28
	Set string value... 28 font Courier
	Set string value... 28 size 12
	Set string value... 28 text で請求してください(宛先は the Free Software Foundation, Inc., 59
	# Row 29
	Set string value... 29 font Courier
	Set string value... 29 size 12
	Set string value... 29 text Temple Place, Suite 330, Boston, MA 02111-1307 USA 
	# Row 30
	Set string value... 30 font Courier
	Set string value... 30 size 12
	Set string value... 30 text <http://www.gnu.org/licenses/>)。
	# Row 31
	Set string value... 31 font Courier
	Set string value... 31 size 12
	Set string value... 31 text  
	# Row 32
	Set string value... 32 font Helvetica
	Set string value... 32 size 8
	Set string value... 32 text %%V: 'build_SHA$'%
endproc

procCreateCredits_NL$ = "Credits_NL"
procedure CreateCredits_NL
	Create Table with column names... Credits_NL 30
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Helvetica
	Set string value... 1 size 12
	Set string value... 1 text  
	# Row 2
	Set string value... 2 font Helvetica
	Set string value... 2 size 16
	Set string value... 2 text NKI TE-VOICE ANALYSIS tool versie 1.1
	# Row 3
	Set string value... 3 font Helvetica
	Set string value... 3 size 12
	Set string value... 3 text  
	# Row 4
	Set string value... 4 font Helvetica
	Set string value... 4 size 12
	Set string value... 4 text Nederlands Kanker Instituut aplicatie voor Tracheoesophageale Stemanalyse
	# Row 5
	Set string value... 5 font Helvetica
	Set string value... 5 size 12
	Set string value... 5 text Voor meer informatie, bezoek onze websites: http://www.provoxweb.info/acoustic-analyses.html
	# Row 6
	Set string value... 6 font Helvetica
	Set string value... 6 size 12
	Set string value... 6 text en http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI\_ TEVA/
	# Row 7
	Set string value... 7 font Helvetica
	Set string value... 7 size 12
	Set string value... 7 text Gebaseerd op Praat 'praatVersion$' (http://www.praat.org)
	# Row 8
	Set string value... 8 font Helvetica
	Set string value... 8 size 12
	Set string value... 8 text  
	# Row 9
	Set string value... 9 font Helvetica
	Set string value... 9 size 12
	Set string value... 9 text Productie en auteursrechten \co 2010-'dateYear$' Rob van Son en het NKI - R.J.J.H.vanSon@gmail.com
	# Row 10
	Set string value... 10 font Helvetica
	Set string value... 10 size 12
	Set string value... 10 text  
	# Row 11
	Set string value... 11 font Helvetica
	Set string value... 11 size 12
	Set string value... 11 text Deze applicatie is mogelijk gemaakt door een vrije onderzoeksbeurs van
	# Row 12
	Set string value... 12 font Helvetica
	Set string value... 12 size 12
	Set string value... 12 text ATOS MEDICAL AB: P.O. BOX 183 SE-242 22 H\O"RBY SWEDEN
	# Row 13
	Set string value... 13 font Helvetica
	Set string value... 13 size 12
	Set string value... 13 text  
	# Row 14
	Set string value... 14 font Helvetica
	Set string value... 14 size 12
	Set string value... 14 text Japanse vertaling: Akiko Kanezaki en Chiharu Kamei
	# Row 15
	Set string value... 15 font Helvetica
	Set string value... 15 size 12
	Set string value... 15 text Duitse vertaling: Irene Jacobi en Rob van Son
	# Row 16
	Set string value... 16 font Helvetica
	Set string value... 16 size 12
	Set string value... 16 text  
	# Row 17
	Set string value... 17 font Courier
	Set string value... 17 size 12
	Set string value... 17 text Dit programma is vrije software: je mag het herdistribueren 
	# Row 18
	Set string value... 18 font Courier
	Set string value... 18 size 12
	Set string value... 18 text en/of wijzigen onder de voorwaarden van de GNU Algemene
	# Row 19
	Set string value... 19 font Courier
	Set string value... 19 size 12
	Set string value... 19 text Publieke Licentie zoals gepubliceerd door de Free Software Foundation,
	# Row 20
	Set string value... 20 font Courier
	Set string value... 20 size 12
	Set string value... 20 text onder versie 2 van de Licentie of (naar jouw keuze)
	# Row 21
	Set string value... 21 font Courier
	Set string value... 21 size 12
	Set string value... 21 text elke latere versie.
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text Dit programma is gedistribueerd in de hoop dat het nuttig zal
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text zijn maar ZONDER ENIGE GARANTIE; zelfs zonder de impliciete garanties
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text die GEBRUIKELIJK ZIJN IN DE HANDEL of voor BRUIKBAARHEID VOOR EEN
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text SPECIFIEK DOEL. Zie de GNU Algemene Publieke Licentie voor meer details.
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text Je hoort een kopie van de GNU Algemene Publieke Licentie te hebben
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text ontvangen samen met dit programma. Als dat niet het geval is, zie
	# Row 28
	Set string value... 28 font Courier
	Set string value... 28 size 12
	Set string value... 28 text <http://www.gnu.org/licenses/>.
	# Row 29
	Set string value... 29 font Courier
	Set string value... 29 size 12
	Set string value... 29 text  
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 8
	Set string value... 30 text %%V: 'build_SHA$'%
endproc

procCreateFeedback_DE$ = "Feedback_DE"
procedure CreateFeedback_DE
	Create Table with column names... Feedback_DE 33
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Autor R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text Lizens GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Select1
	Set string value... 4 Text Selectiere eine neue Startzeit (oder dr\u"cke den Selectieren Knopf oder Taste um weiter zo gehen)
	# Row 5
	Set string value... 5 Key Select2
	Set string value... 5 Text Selectiere eine neue Endzeit, #- oder #+ f\u"r 1 oder 2 sec Fenster (stop mit %%Selectieren% oder jedige andere Taste)
	# Row 6
	Set string value... 6 Key SpectrumValues
	Set string value... 6 Text Formante - QF_1: QUALITYF1$ , QF_2: QUALITYF2$ , QF_3: QUALITYF3$ , QF_4: QUALITYF4$ [Median(F_i)/Median(B_i)]
	# Row 7
	Set string value... 7 Key PitchValues
	Set string value... 7 Text Tonh\o"he - MVD: MAXIMUMVOICINGDUR$ , Voiced: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz, Median: MEDIANPITCH$ Hz
	# Row 8
	Set string value... 8 Key ShortPitchValues
	Set string value... 8 Text VF: VOICEDFRACTIONS$ , Jitter: JITTER$ , Schimmer: SHIMMER$ , Mittel: MEANPITCH$ Hz, SD: SDPITCH$ Hz
	# Row 9
	Set string value... 9 Key HarmonicityValues
	Set string value... 9 Text Harmonizit\a"t - Max.: MAXHARMONICITY$ dB, Min.: MINHARMONICITY$ dB, Mean: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 10
	Set string value... 10 Key ShortHarmonicityValues
	Set string value... 10 Text HNR: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 11
	Set string value... 11 Key IntensityValues
	Set string value... 11 Text Intensit\a"t - Max.: MAXINTENSITY$ dB, Min.: MININTENSITY$ dB, Mean: MEANINTENSITY$ dB, SD: SDINTENSITY$ dB
	# Row 12
	Set string value... 12 Key LtasValues
	Set string value... 12 Text Ltas - Max.: MAXFREQUENCY$ Hz, Min.: MINFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz  [SELECTEDSTARTTIME$; SELECTEDENDTIME$] S
	# Row 13
	Set string value... 13 Key ShortLtasValues
	Set string value... 13 Text Ltas Max.: MAXFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz
	# Row 14
	Set string value... 14 Key TimeValues
	Set string value... 14 Text Zeitinterval: SELECTEDSTARTTIME$ - SELECTEDENDTIME$ S (SELECTEDINTERVAL$ S)
	# Row 15
	Set string value... 15 Key Recording
	Set string value... 15 Text Aufname
	# Row 16
	Set string value... 16 Key RecordingTask
	Set string value... 16 Text Aufgaben
	# Row 17
	Set string value... 17 Key RecordingClear
	Set string value... 17 Text löschen
	# Row 18
	Set string value... 18 Key RecordingTarget
	Set string value... 18 Text Mappe
	# Row 19
	Set string value... 19 Key Cancel
	Set string value... 19 Text Zurück
	# Row 20
	Set string value... 20 Key Continue
	Set string value... 20 Text Weiter
	# Row 21
	Set string value... 21 Key Unsaved
	Set string value... 21 Text Nicht gespeicherte \A"nderungen
	# Row 22
	Set string value... 22 Key BrokenTable
	Set string value... 22 Text Nicht verwendbare Tabelle
	# Row 23
	Set string value... 23 Key Next
	Set string value... 23 Text >
	# Row 24
	Set string value... 24 Key Previous
	Set string value... 24 Text <
	# Row 25
	Set string value... 25 Key Current
	Set string value... 25 Text =
	# Row 26
	Set string value... 26 Key Speaker
	Set string value... 26 Text Sprecher ID
	# Row 27
	Set string value... 27 Key SpeakerID
	Set string value... 27 Text Aufnahme ID oder Zeilennummer
	# Row 28
	Set string value... 28 Key SpeakerText
	Set string value... 28 Text Sprecher daten
	# Row 29
	Set string value... 29 Key SpeakerDefault
	Set string value... 29 Text Sprecher ID, Namen, Geschlecht, und/oder Alter
	# Row 30
	Set string value... 30 Key SpeakerComments
	Set string value... 30 Text Kommentare
	# Row 31
	Set string value... 31 Key SpeakerAudio
	Set string value... 31 Text Audio
	# Row 32
	Set string value... 32 Key VoicingMarker
	Set string value... 32 Text Stimme
	# Row 33
	Set string value... 33 Key Ready
	Set string value... 33 Text Ende der Liste
endproc

procCreateFeedback_EN$ = "Feedback_EN"
procedure CreateFeedback_EN
	Create Table with column names... Feedback_EN 33
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Author R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Select1
	Set string value... 4 Text Select new start time (or press Select or a key to continue)
	# Row 5
	Set string value... 5 Key Select2
	Set string value... 5 Text Select new end time, #- or #+ for a 1 or 2 sec window (cancel with %%Select% or another key)
	# Row 6
	Set string value... 6 Key SpectrumValues
	Set string value... 6 Text Formants - QF_1: QUALITYF1$ , QF_2: QUALITYF2$ , QF_3: QUALITYF3$ , QF_4: QUALITYF4$ [Median(F_i)/Median(B_i)]
	# Row 7
	Set string value... 7 Key PitchValues
	Set string value... 7 Text Pitch - MVD: MAXIMUMVOICINGDUR$ , Voiced: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz, Median: MEDIANPITCH$ Hz
	# Row 8
	Set string value... 8 Key ShortPitchValues
	Set string value... 8 Text VF: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz
	# Row 9
	Set string value... 9 Key HarmonicityValues
	Set string value... 9 Text Harmonicity - Max.: MAXHARMONICITY$ dB, Min.: MINHARMONICITY$ dB, Mean: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 10
	Set string value... 10 Key ShortHarmonicityValues
	Set string value... 10 Text HNR: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 11
	Set string value... 11 Key IntensityValues
	Set string value... 11 Text Intensity - Max.: MAXINTENSITY$ dB, Min.: MININTENSITY$ dB, Mean: MEANINTENSITY$ dB, SD: SDINTENSITY$ dB
	# Row 12
	Set string value... 12 Key LtasValues
	Set string value... 12 Text Ltas - Max.: MAXFREQUENCY$ Hz, Min.: MINFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz  [SELECTEDSTARTTIME$; SELECTEDENDTIME$] S
	# Row 13
	Set string value... 13 Key ShortLtasValues
	Set string value... 13 Text Ltas Max.: MAXFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz
	# Row 14
	Set string value... 14 Key TimeValues
	Set string value... 14 Text Time interval: SELECTEDSTARTTIME$ - SELECTEDENDTIME$ S (SELECTEDINTERVAL$ S)
	# Row 15
	Set string value... 15 Key Recording
	Set string value... 15 Text Recording
	# Row 16
	Set string value... 16 Key RecordingTask
	Set string value... 16 Text Task
	# Row 17
	Set string value... 17 Key RecordingClear
	Set string value... 17 Text Clear
	# Row 18
	Set string value... 18 Key RecordingTarget
	Set string value... 18 Text Store
	# Row 19
	Set string value... 19 Key Cancel
	Set string value... 19 Text Cancel
	# Row 20
	Set string value... 20 Key Continue
	Set string value... 20 Text Continue
	# Row 21
	Set string value... 21 Key Unsaved
	Set string value... 21 Text Unsaved changes
	# Row 22
	Set string value... 22 Key BrokenTable
	Set string value... 22 Text Incomplete or corrupted table
	# Row 23
	Set string value... 23 Key Next
	Set string value... 23 Text >
	# Row 24
	Set string value... 24 Key Previous
	Set string value... 24 Text <
	# Row 25
	Set string value... 25 Key Current
	Set string value... 25 Text =
	# Row 26
	Set string value... 26 Key Speaker
	Set string value... 26 Text Speaker ID
	# Row 27
	Set string value... 27 Key SpeakerID
	Set string value... 27 Text Recording ID or row number
	# Row 28
	Set string value... 28 Key SpeakerText
	Set string value... 28 Text Speaker info
	# Row 29
	Set string value... 29 Key SpeakerDefault
	Set string value... 29 Text Speaker ID, name, sex, and/or age
	# Row 30
	Set string value... 30 Key SpeakerComments
	Set string value... 30 Text Comments
	# Row 31
	Set string value... 31 Key SpeakerAudio
	Set string value... 31 Text Audio
	# Row 32
	Set string value... 32 Key VoicingMarker
	Set string value... 32 Text Voice
	# Row 33
	Set string value... 33 Key Ready
	Set string value... 33 Text End of list
endproc

procCreateFeedback_ES$ = "Feedback_ES"
procedure CreateFeedback_ES
	Create Table with column names... Feedback_ES 33
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Author R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Select1
	Set string value... 4 Text Select new start time (or press Select or a key to continue)
	# Row 5
	Set string value... 5 Key Select2
	Set string value... 5 Text Select new end time, #- or #+ for a 1 or 2 sec window (cancel with %%Select% or another key)
	# Row 6
	Set string value... 6 Key SpectrumValues
	Set string value... 6 Text Formants - QF_1: QUALITYF1$ , QF_2: QUALITYF2$ , QF_3: QUALITYF3$ , QF_4: QUALITYF4$ [Median(F_i)/Median(B_i)]
	# Row 7
	Set string value... 7 Key PitchValues
	Set string value... 7 Text Pitch - MVD: MAXIMUMVOICINGDUR$ , Voiced: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz, Median: MEDIANPITCH$ Hz
	# Row 8
	Set string value... 8 Key ShortPitchValues
	Set string value... 8 Text VF: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz
	# Row 9
	Set string value... 9 Key HarmonicityValues
	Set string value... 9 Text Harmonicity - Max.: MAXHARMONICITY$ dB, Min.: MINHARMONICITY$ dB, Mean: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 10
	Set string value... 10 Key ShortHarmonicityValues
	Set string value... 10 Text HNR: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 11
	Set string value... 11 Key IntensityValues
	Set string value... 11 Text Intensity - Max.: MAXINTENSITY$ dB, Min.: MININTENSITY$ dB, Mean: MEANINTENSITY$ dB, SD: SDINTENSITY$ dB
	# Row 12
	Set string value... 12 Key LtasValues
	Set string value... 12 Text Ltas - Max.: MAXFREQUENCY$ Hz, Min.: MINFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz  [SELECTEDSTARTTIME$; SELECTEDENDTIME$] S
	# Row 13
	Set string value... 13 Key ShortLtasValues
	Set string value... 13 Text Ltas Max.: MAXFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz
	# Row 14
	Set string value... 14 Key TimeValues
	Set string value... 14 Text Time interval: SELECTEDSTARTTIME$ - SELECTEDENDTIME$ S (SELECTEDINTERVAL$ S)
	# Row 15
	Set string value... 15 Key Recording
	Set string value... 15 Text Recording
	# Row 16
	Set string value... 16 Key RecordingTask
	Set string value... 16 Text Task
	# Row 17
	Set string value... 17 Key RecordingClear
	Set string value... 17 Text Clear
	# Row 18
	Set string value... 18 Key RecordingTarget
	Set string value... 18 Text Store
	# Row 19
	Set string value... 19 Key Cancel
	Set string value... 19 Text Cancel
	# Row 20
	Set string value... 20 Key Continue
	Set string value... 20 Text Continue
	# Row 21
	Set string value... 21 Key Unsaved
	Set string value... 21 Text Unsaved changes
	# Row 22
	Set string value... 22 Key BrokenTable
	Set string value... 22 Text Incomplete or corrupted table
	# Row 23
	Set string value... 23 Key Next
	Set string value... 23 Text >
	# Row 24
	Set string value... 24 Key Previous
	Set string value... 24 Text <
	# Row 25
	Set string value... 25 Key Current
	Set string value... 25 Text =
	# Row 26
	Set string value... 26 Key Speaker
	Set string value... 26 Text Speaker ID
	# Row 27
	Set string value... 27 Key SpeakerID
	Set string value... 27 Text Recording ID or row number
	# Row 28
	Set string value... 28 Key SpeakerText
	Set string value... 28 Text Speaker info
	# Row 29
	Set string value... 29 Key SpeakerDefault
	Set string value... 29 Text Speaker ID, name, sex, and/or age
	# Row 30
	Set string value... 30 Key SpeakerComments
	Set string value... 30 Text Comments
	# Row 31
	Set string value... 31 Key SpeakerAudio
	Set string value... 31 Text Audio
	# Row 32
	Set string value... 32 Key VoicingMarker
	Set string value... 32 Text Voice
	# Row 33
	Set string value... 33 Key Ready
	Set string value... 33 Text End of list
endproc

procCreateFeedback_JA$ = "Feedback_JA"
procedure CreateFeedback_JA
	Create Table with column names... Feedback_JA 33
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text 著者R.J.J.H. van Son, translation: Akiko Kanezaki
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text 著作権 \co 2010-2012 R.J.J.H. van Son \& the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text ライセンス GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Select1
	Set string value... 4 Text 新しい開始時間の選択 (もしくはSelectボタンを押して続ける)
	# Row 5
	Set string value... 5 Key Select2
	Set string value... 5 Text 新しい終了時間の選択, #- or #+ for a 1 or 2 sec window (キャンセルをする場合は%%Select%もしくは他のボタンを押す)
	# Row 6
	Set string value... 6 Key SpectrumValues
	Set string value... 6 Text フォルマント - QF_1: QUALITYF1$ , QF_2: QUALITYF2$ , QF_3: QUALITYF3$ , QF_4: QUALITYF4$ [Median(F_i)/Median(B_i)]
	# Row 7
	Set string value... 7 Key PitchValues
	Set string value... 7 Text ピッチ - MVD: 最長発声持続時間MAXIMUMVOICINGDUR$ , Voiced有声音: 有声音の一部分VOICEDFRACTIONS$ , Jitter: ジッターJITTER$ , Shimmer: シマ―SHIMMER$ , Mean平均: ピッチ平均MEANPITCH$ Hz, SD: SDPITCH$ Hz, Median: MEDIANPITCH$ Hz
	# Row 8
	Set string value... 8 Key ShortPitchValues
	Set string value... 8 Text VF: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz
	# Row 9
	Set string value... 9 Key HarmonicityValues
	Set string value... 9 Text 調和音 - Max.: 最大調和音MAXHARMONICITY$ dB, Min.: 最小調和音MINHARMONICITY$ dB, Mean: 平均調和音MEANHARMONICITY$ dB, SD: 調和音標準偏差SDHARMONICITY$ dB, GNE: $
	# Row 10
	Set string value... 10 Key ShortHarmonicityValues
	Set string value... 10 Text HNR: 平均調和音MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 11
	Set string value... 11 Key IntensityValues
	Set string value... 11 Text 強度 - Max.: 最大強度MAXINTENSITY$ dB, Min.: 最小強度MININTENSITY$ dB, Mean: 平均強度MEANINTENSITY$ dB, SD: 強度標準偏差SDINTENSITY$ dB
	# Row 12
	Set string value... 12 Key LtasValues
	Set string value... 12 Text 長期持続平均スペクトラム - Max.: 最大周波数MAXFREQUENCY$ Hz, Min.: 最小周波数MINFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz [SELECTEDSTARTTIME$; SELECTEDENDTIME$] S
	# Row 13
	Set string value... 13 Key ShortLtasValues
	Set string value... 13 Text 長期持続平均スぺクラム最大Ltas Max.: 最大周波数MAXFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz
	# Row 14
	Set string value... 14 Key TimeValues
	Set string value... 14 Text 間隔Time interval: 開始時間の選択SELECTEDSTARTTIME$ - 終了時間の選択SELECTEDENDTIME$ S (SELECTEDINTERVAL$ S)
	# Row 15
	Set string value... 15 Key Recording
	Set string value... 15 Text 録音
	# Row 16
	Set string value... 16 Key RecordingTask
	Set string value... 16 Text タスク
	# Row 17
	Set string value... 17 Key RecordingClear
	Set string value... 17 Text 消去
	# Row 18
	Set string value... 18 Key RecordingTarget
	Set string value... 18 Text 保存
	# Row 19
	Set string value... 19 Key Cancel
	Set string value... 19 Text キャンセル
	# Row 20
	Set string value... 20 Key Continue
	Set string value... 20 Text 続ける
	# Row 21
	Set string value... 21 Key Unsaved
	Set string value... 21 Text 変更を保存しない
	# Row 22
	Set string value... 22 Key BrokenTable
	Set string value... 22 Text 不完全または破損した表
	# Row 23
	Set string value... 23 Key Next
	Set string value... 23 Text >
	# Row 24
	Set string value... 24 Key Previous
	Set string value... 24 Text <
	# Row 25
	Set string value... 25 Key Current
	Set string value... 25 Text 現在
	# Row 26
	Set string value... 26 Key Speaker
	Set string value... 26 Text 被験者
	# Row 27
	Set string value... 27 Key SpeakerID
	Set string value... 27 Text 被験者IDまたは整列した数字
	# Row 28
	Set string value... 28 Key SpeakerText
	Set string value... 28 Text 被験者情報
	# Row 29
	Set string value... 29 Key SpeakerDefault
	Set string value... 29 Text 被験者ID、氏名、性別／年齢
	# Row 30
	Set string value... 30 Key SpeakerComments
	Set string value... 30 Text コメント
	# Row 31
	Set string value... 31 Key SpeakerAudio
	Set string value... 31 Text オーディオ
	# Row 32
	Set string value... 32 Key VoicingMarker
	Set string value... 32 Text 声
	# Row 33
	Set string value... 33 Key Ready
	Set string value... 33 Text リストの終了
endproc

procCreateFeedback_NL$ = "Feedback_NL"
procedure CreateFeedback_NL
	Create Table with column names... Feedback_NL 33
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Auteur R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Select1
	Set string value... 4 Text Selecteer nieuwe begintijd (of druk op Selecteer of een toets om verder te gaan)
	# Row 5
	Set string value... 5 Key Select2
	Set string value... 5 Text Selecteer nieuwe eindtijd, #- of #+ voor 1 of 2 sec venster (stop met %%Selecteer% of een andere toets)
	# Row 6
	Set string value... 6 Key SpectrumValues
	Set string value... 6 Text Formanten - QF_1: QUALITYF1$ , QF_2: QUALITYF2$ , QF_3: QUALITYF3$ , QF_4: QUALITYF4$ [Median(F_i)/Median(B_i)]
	# Row 7
	Set string value... 7 Key PitchValues
	Set string value... 7 Text Pitch - MVD: MAXIMUMVOICINGDUR$ , Voiced: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz, Median: MEDIANPITCH$ Hz
	# Row 8
	Set string value... 8 Key ShortPitchValues
	Set string value... 8 Text VF: VOICEDFRACTIONS$ , Jitter: JITTER$ , Shimmer: SHIMMER$ , Mean: MEANPITCH$ Hz, SD: SDPITCH$ Hz
	# Row 9
	Set string value... 9 Key HarmonicityValues
	Set string value... 9 Text Harmonicity - Max.: MAXHARMONICITY$ dB, Min.: MINHARMONICITY$ dB, Mean: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 10
	Set string value... 10 Key ShortHarmonicityValues
	Set string value... 10 Text HNR: MEANHARMONICITY$ dB, SD: SDHARMONICITY$ dB, GNE: GNEVALUE$
	# Row 11
	Set string value... 11 Key IntensityValues
	Set string value... 11 Text Intensity - Max.: MAXINTENSITY$ dB, Min.: MININTENSITY$ dB, Mean: MEANINTENSITY$ dB, SD: SDINTENSITY$ dB
	# Row 12
	Set string value... 12 Key LtasValues
	Set string value... 12 Text Ltas - Max.: MAXFREQUENCY$ Hz, Min.: MINFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz  [SELECTEDSTARTTIME$; SELECTEDENDTIME$] S
	# Row 13
	Set string value... 13 Key ShortLtasValues
	Set string value... 13 Text Ltas Max.: MAXFREQUENCY$ Hz, BED: BED$ dB, CoG: COG$ Hz
	# Row 14
	Set string value... 14 Key TimeValues
	Set string value... 14 Text Time interval: SELECTEDSTARTTIME$ - SELECTEDENDTIME$ S (SELECTEDINTERVAL$ S)
	# Row 15
	Set string value... 15 Key Recording
	Set string value... 15 Text Opname
	# Row 16
	Set string value... 16 Key RecordingTask
	Set string value... 16 Text Taak
	# Row 17
	Set string value... 17 Key RecordingClear
	Set string value... 17 Text Wis
	# Row 18
	Set string value... 18 Key RecordingTarget
	Set string value... 18 Text Map
	# Row 19
	Set string value... 19 Key Cancel
	Set string value... 19 Text Terug
	# Row 20
	Set string value... 20 Key Continue
	Set string value... 20 Text Verder
	# Row 21
	Set string value... 21 Key Unsaved
	Set string value... 21 Text Niet bewaarde veranderingen
	# Row 22
	Set string value... 22 Key BrokenTable
	Set string value... 22 Text Incomplete of beschadigde tabel
	# Row 23
	Set string value... 23 Key Next
	Set string value... 23 Text >
	# Row 24
	Set string value... 24 Key Previous
	Set string value... 24 Text <
	# Row 25
	Set string value... 25 Key Current
	Set string value... 25 Text =
	# Row 26
	Set string value... 26 Key Speaker
	Set string value... 26 Text Spreker ID
	# Row 27
	Set string value... 27 Key SpeakerID
	Set string value... 27 Text Opname ID of regelnummer
	# Row 28
	Set string value... 28 Key SpeakerText
	Set string value... 28 Text Spreker info
	# Row 29
	Set string value... 29 Key SpeakerDefault
	Set string value... 29 Text Spreker ID, naam, geslacht en/of leeftijd
	# Row 30
	Set string value... 30 Key SpeakerComments
	Set string value... 30 Text Opmerkingen
	# Row 31
	Set string value... 31 Key SpeakerAudio
	Set string value... 31 Text Audio
	# Row 32
	Set string value... 32 Key VoicingMarker
	Set string value... 32 Text Stem
	# Row 33
	Set string value... 33 Key Ready
	Set string value... 33 Text Einde van de lijst
endproc

procCreateInstruction_DE$ = "Instruction_DE"
procedure CreateInstruction_DE
	Create Table with column names... Instruction_DE 37
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Times
	Set string value... 1 size 16
	Set string value... 1 text Acoustic Signal Types
	# Row 2
	Set string value... 2 font Times
	Set string value... 2 size 10
	Set string value... 2 text (Pathology types will be displayed in the main window, press a number key to set the type)
	# Row 3
	Set string value... 3 font Times
	Set string value... 3 size 12
	Set string value... 3 text   
	# Row 4
	Set string value... 4 font Times
	Set string value... 4 size 14
	Set string value... 4 text %%Type I - Stable \&  Harmonic% \s{(press 1)}
	# Row 5
	Set string value... 5 font Times
	Set string value... 5 size 12
	Set string value... 5 text - Stable signal for longer than two seconds, and
	# Row 6
	Set string value... 6 font Times
	Set string value... 6 size 12
	Set string value... 6 text - Clear harmonics up to at least 1000 Hz
	# Row 7
	Set string value... 7 font Times
	Set string value... 7 size 12
	Set string value... 7 text  
	# Row 8
	Set string value... 8 font Times
	Set string value... 8 size 14
	Set string value... 8 text %%Type II - Stable \&  At least one harmonic% \s{(press 2)}
	# Row 9
	Set string value... 9 font Times
	Set string value... 9 size 12
	Set string value... 9 text - Stable signal for longer than two seconds, and
	# Row 10
	Set string value... 10 font Times
	Set string value... 10 size 12
	Set string value... 10 text - At least one stable harmonic at the fundamental frequency for longer than two seconds
	# Row 11
	Set string value... 11 font Times
	Set string value... 11 size 12
	Set string value... 11 text  
	# Row 12
	Set string value... 12 font Times
	Set string value... 12 size 14
	Set string value... 12 text %%Type III - Unstable or Partly harmonic% \s{(press 3)}
	# Row 13
	Set string value... 13 font Times
	Set string value... 13 size 12
	Set string value... 13 text - No stable signal for longer than two seconds, or
	# Row 14
	Set string value... 14 font Times
	Set string value... 14 size 12
	Set string value... 14 text - Harmonics in only part of the sample (for longer than 1 second)
	# Row 15
	Set string value... 15 font Times
	Set string value... 15 size 12
	Set string value... 15 text  
	# Row 16
	Set string value... 16 font Times
	Set string value... 16 size 14
	Set string value... 16 text %%Type IV - Barely harmonic% \s{(press 4)}
	# Row 17
	Set string value... 17 font Times
	Set string value... 17 size 12
	Set string value... 17 text - No or only short-term detectable harmonics (for shorter than 1 second)
	# Row 18
	Set string value... 18 font Times
	Set string value... 18 size 12
	Set string value... 18 text   
	# Row 19
	Set string value... 19 font Times
	Set string value... 19 size 12
	Set string value... 19 text %%Table of the relation between the four types of acoustic signal typing%
	# Row 20
	Set string value... 20 font Times
	Set string value... 20 size 12
	Set string value... 20 text %%and the perceptual judgment of overall voice quality for 39 speakers%
	# Row 21
	Set string value... 21 font Times
	Set string value... 21 size 12
	Set string value... 21 text %%(converted to percentages).%
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text |  Perceptual judgment of overall voice quality |
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text |         Good     Reasonable  Poor             |
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text | Type I    70\%       40\%          0\%              |  
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text | Type II   45\%       45\%         10\%              |
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text | Type III  20\%       35\%         45\%              |
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text | Type IV    0\%       25\%         75\%              |
	# Row 28
	Set string value... 28 font Times
	Set string value... 28 size 12
	Set string value... 28 text   
	# Row 29
	Set string value... 29 font Helvetica
	Set string value... 29 size 10
	Set string value... 29 text References:
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 10
	Set string value... 30 text \bu Van As, C.J. (##2001#), %%Tracheoesophageal Speech. A Multidimensional Assessment of Voice Quality%, 
	# Row 31
	Set string value... 31 font Helvetica
	Set string value... 31 size 10
	Set string value... 31 text Ph.D.-thesis, University of Amsterdam, 209 pag.
	# Row 32
	Set string value... 32 font Helvetica
	Set string value... 32 size 10
	Set string value... 32 text \bu van As-Brooks, C.J., Koopmans-van Beinum, F.J., Pols, L.C.W., and Hilgers, F.J.M. (##2006#),
	# Row 33
	Set string value... 33 font Helvetica
	Set string value... 33 size 10
	Set string value... 33 text %%Acoustic Signal Typing for Evaluation of Voice Quality in Tracheoesophageal Speech%
	# Row 34
	Set string value... 34 font Helvetica
	Set string value... 34 size 10
	Set string value... 34 text Journal of Voice, Volume ##20# (3), p355-368
	# Row 35
	Set string value... 35 font Helvetica
	Set string value... 35 size 10
	Set string value... 35 text \bu Van As, C.J. (##2008#), %%Acoustic analyses of postlaryngectomy voice and their perceptual relevance%
	# Row 36
	Set string value... 36 font Helvetica
	Set string value... 36 size 10
	Set string value... 36 text Invitational Round Table "Evidence-based Voice and Speech Rehabilitation in Head and Neck Cancer", p8-14
	# Row 37
	Set string value... 37 font Helvetica
	Set string value... 37 size 10
	Set string value... 37 text <http://dare.uva.nl/document/130984>
endproc

procCreateInstruction_EN$ = "Instruction_EN"
procedure CreateInstruction_EN
	Create Table with column names... Instruction_EN 37
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Times
	Set string value... 1 size 16
	Set string value... 1 text Acoustic Signal Types
	# Row 2
	Set string value... 2 font Times
	Set string value... 2 size 10
	Set string value... 2 text (Pathology types will be displayed in the main window, press a number key to set the type)
	# Row 3
	Set string value... 3 font Times
	Set string value... 3 size 12
	Set string value... 3 text   
	# Row 4
	Set string value... 4 font Times
	Set string value... 4 size 14
	Set string value... 4 text %%Type I - Stable \&  Harmonic% \s{(press 1)}
	# Row 5
	Set string value... 5 font Times
	Set string value... 5 size 12
	Set string value... 5 text - Stable signal for longer than two seconds, and
	# Row 6
	Set string value... 6 font Times
	Set string value... 6 size 12
	Set string value... 6 text - Clear harmonics up to at least 1000 Hz
	# Row 7
	Set string value... 7 font Times
	Set string value... 7 size 12
	Set string value... 7 text  
	# Row 8
	Set string value... 8 font Times
	Set string value... 8 size 14
	Set string value... 8 text %%Type II - Stable \&  At least one harmonic% \s{(press 2)}
	# Row 9
	Set string value... 9 font Times
	Set string value... 9 size 12
	Set string value... 9 text - Stable signal for longer than two seconds, and
	# Row 10
	Set string value... 10 font Times
	Set string value... 10 size 12
	Set string value... 10 text - At least one stable harmonic at the fundamental frequency for longer than two seconds
	# Row 11
	Set string value... 11 font Times
	Set string value... 11 size 12
	Set string value... 11 text  
	# Row 12
	Set string value... 12 font Times
	Set string value... 12 size 14
	Set string value... 12 text %%Type III - Unstable or Partly harmonic% \s{(press 3)}
	# Row 13
	Set string value... 13 font Times
	Set string value... 13 size 12
	Set string value... 13 text - No stable signal for longer than two seconds, or
	# Row 14
	Set string value... 14 font Times
	Set string value... 14 size 12
	Set string value... 14 text - Harmonics in only part of the sample (for longer than 1 second)
	# Row 15
	Set string value... 15 font Times
	Set string value... 15 size 12
	Set string value... 15 text  
	# Row 16
	Set string value... 16 font Times
	Set string value... 16 size 14
	Set string value... 16 text %%Type IV - Barely harmonic% \s{(press 4)}
	# Row 17
	Set string value... 17 font Times
	Set string value... 17 size 12
	Set string value... 17 text - No or only short-term detectable harmonics (for shorter than 1 second)
	# Row 18
	Set string value... 18 font Times
	Set string value... 18 size 12
	Set string value... 18 text   
	# Row 19
	Set string value... 19 font Times
	Set string value... 19 size 12
	Set string value... 19 text %%Table of the relation between the four types of acoustic signal typing%
	# Row 20
	Set string value... 20 font Times
	Set string value... 20 size 12
	Set string value... 20 text %%and the perceptual judgment of overall voice quality for 39 speakers%
	# Row 21
	Set string value... 21 font Times
	Set string value... 21 size 12
	Set string value... 21 text %%(converted to percentages).%
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text |  Perceptual judgment of overall voice quality |
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text |         Good     Reasonable  Poor             |
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text | Type I    70\%       40\%          0\%              |  
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text | Type II   45\%       45\%         10\%              |
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text | Type III  20\%       35\%         45\%              |
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text | Type IV    0\%       25\%         75\%              |
	# Row 28
	Set string value... 28 font Times
	Set string value... 28 size 12
	Set string value... 28 text   
	# Row 29
	Set string value... 29 font Helvetica
	Set string value... 29 size 10
	Set string value... 29 text References:
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 10
	Set string value... 30 text \bu Van As, C.J. (##2001#), %%Tracheoesophageal Speech. A Multidimensional Assessment of Voice Quality%, 
	# Row 31
	Set string value... 31 font Helvetica
	Set string value... 31 size 10
	Set string value... 31 text Ph.D.-thesis, University of Amsterdam, 209 pag.
	# Row 32
	Set string value... 32 font Helvetica
	Set string value... 32 size 10
	Set string value... 32 text \bu van As-Brooks, C.J., Koopmans-van Beinum, F.J., Pols, L.C.W., and Hilgers, F.J.M. (##2006#),
	# Row 33
	Set string value... 33 font Helvetica
	Set string value... 33 size 10
	Set string value... 33 text %%Acoustic Signal Typing for Evaluation of Voice Quality in Tracheoesophageal Speech%
	# Row 34
	Set string value... 34 font Helvetica
	Set string value... 34 size 10
	Set string value... 34 text Journal of Voice, Volume ##20# (3), p355-368
	# Row 35
	Set string value... 35 font Helvetica
	Set string value... 35 size 10
	Set string value... 35 text \bu Van As, C.J. (##2008#), %%Acoustic analyses of postlaryngectomy voice and their perceptual relevance%
	# Row 36
	Set string value... 36 font Helvetica
	Set string value... 36 size 10
	Set string value... 36 text Invitational Round Table "Evidence-based Voice and Speech Rehabilitation in Head and Neck Cancer", p8-14
	# Row 37
	Set string value... 37 font Helvetica
	Set string value... 37 size 10
	Set string value... 37 text <http://dare.uva.nl/document/130984>
endproc

procCreateInstruction_ES$ = "Instruction_ES"
procedure CreateInstruction_ES
	Create Table with column names... Instruction_ES 37
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Times
	Set string value... 1 size 16
	Set string value... 1 text Acoustic Signal Types
	# Row 2
	Set string value... 2 font Times
	Set string value... 2 size 10
	Set string value... 2 text (Pathology types will be displayed in the main window, press a number key to set the type)
	# Row 3
	Set string value... 3 font Times
	Set string value... 3 size 12
	Set string value... 3 text   
	# Row 4
	Set string value... 4 font Times
	Set string value... 4 size 14
	Set string value... 4 text %%Type I - Stable \&  Harmonic% \s{(press 1)}
	# Row 5
	Set string value... 5 font Times
	Set string value... 5 size 12
	Set string value... 5 text - Stable signal for longer than two seconds, and
	# Row 6
	Set string value... 6 font Times
	Set string value... 6 size 12
	Set string value... 6 text - Clear harmonics up to at least 1000 Hz
	# Row 7
	Set string value... 7 font Times
	Set string value... 7 size 12
	Set string value... 7 text  
	# Row 8
	Set string value... 8 font Times
	Set string value... 8 size 14
	Set string value... 8 text %%Type II - Stable \&  At least one harmonic% \s{(press 2)}
	# Row 9
	Set string value... 9 font Times
	Set string value... 9 size 12
	Set string value... 9 text - Stable signal for longer than two seconds, and
	# Row 10
	Set string value... 10 font Times
	Set string value... 10 size 12
	Set string value... 10 text - At least one stable harmonic at the fundamental frequency for longer than two seconds
	# Row 11
	Set string value... 11 font Times
	Set string value... 11 size 12
	Set string value... 11 text  
	# Row 12
	Set string value... 12 font Times
	Set string value... 12 size 14
	Set string value... 12 text %%Type III - Unstable or Partly harmonic% \s{(press 3)}
	# Row 13
	Set string value... 13 font Times
	Set string value... 13 size 12
	Set string value... 13 text - No stable signal for longer than two seconds, or
	# Row 14
	Set string value... 14 font Times
	Set string value... 14 size 12
	Set string value... 14 text - Harmonics in only part of the sample (for longer than 1 second)
	# Row 15
	Set string value... 15 font Times
	Set string value... 15 size 12
	Set string value... 15 text  
	# Row 16
	Set string value... 16 font Times
	Set string value... 16 size 14
	Set string value... 16 text %%Type IV - Barely harmonic% \s{(press 4)}
	# Row 17
	Set string value... 17 font Times
	Set string value... 17 size 12
	Set string value... 17 text - No or only short-term detectable harmonics (for shorter than 1 second)
	# Row 18
	Set string value... 18 font Times
	Set string value... 18 size 12
	Set string value... 18 text   
	# Row 19
	Set string value... 19 font Times
	Set string value... 19 size 12
	Set string value... 19 text %%Table of the relation between the four types of acoustic signal typing%
	# Row 20
	Set string value... 20 font Times
	Set string value... 20 size 12
	Set string value... 20 text %%and the perceptual judgment of overall voice quality for 39 speakers%
	# Row 21
	Set string value... 21 font Times
	Set string value... 21 size 12
	Set string value... 21 text %%(converted to percentages).%
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text |  Perceptual judgment of overall voice quality |
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text |         Good     Reasonable  Poor             |
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text | Type I    70\%       40\%          0\%              |  
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text | Type II   45\%       45\%         10\%              |
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text | Type III  20\%       35\%         45\%              |
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text | Type IV    0\%       25\%         75\%              |
	# Row 28
	Set string value... 28 font Times
	Set string value... 28 size 12
	Set string value... 28 text   
	# Row 29
	Set string value... 29 font Helvetica
	Set string value... 29 size 10
	Set string value... 29 text References:
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 10
	Set string value... 30 text \bu Van As, C.J. (##2001#), %%Tracheoesophageal Speech. A Multidimensional Assessment of Voice Quality%, 
	# Row 31
	Set string value... 31 font Helvetica
	Set string value... 31 size 10
	Set string value... 31 text Ph.D.-thesis, University of Amsterdam, 209 pag.
	# Row 32
	Set string value... 32 font Helvetica
	Set string value... 32 size 10
	Set string value... 32 text \bu van As-Brooks, C.J., Koopmans-van Beinum, F.J., Pols, L.C.W., and Hilgers, F.J.M. (##2006#),
	# Row 33
	Set string value... 33 font Helvetica
	Set string value... 33 size 10
	Set string value... 33 text %%Acoustic Signal Typing for Evaluation of Voice Quality in Tracheoesophageal Speech%
	# Row 34
	Set string value... 34 font Helvetica
	Set string value... 34 size 10
	Set string value... 34 text Journal of Voice, Volume ##20# (3), p355-368
	# Row 35
	Set string value... 35 font Helvetica
	Set string value... 35 size 10
	Set string value... 35 text \bu Van As, C.J. (##2008#), %%Acoustic analyses of postlaryngectomy voice and their perceptual relevance%
	# Row 36
	Set string value... 36 font Helvetica
	Set string value... 36 size 10
	Set string value... 36 text Invitational Round Table "Evidence-based Voice and Speech Rehabilitation in Head and Neck Cancer", p8-14
	# Row 37
	Set string value... 37 font Helvetica
	Set string value... 37 size 10
	Set string value... 37 text <http://dare.uva.nl/document/130984>
endproc

procCreateInstruction_JA$ = "Instruction_JA"
procedure CreateInstruction_JA
	Create Table with column names... Instruction_JA 37
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Times
	Set string value... 1 size 16
	Set string value... 1 text Acoustic Signal Types
	# Row 2
	Set string value... 2 font Times
	Set string value... 2 size 10
	Set string value... 2 text (Pathology types will be displayed in the main window, press a number key to set the type)
	# Row 3
	Set string value... 3 font Times
	Set string value... 3 size 12
	Set string value... 3 text   
	# Row 4
	Set string value... 4 font Times
	Set string value... 4 size 14
	Set string value... 4 text %%Type I - Stable \&  Harmonic% \s{(press 1)}
	# Row 5
	Set string value... 5 font Times
	Set string value... 5 size 12
	Set string value... 5 text - Stable signal for longer than two seconds, and
	# Row 6
	Set string value... 6 font Times
	Set string value... 6 size 12
	Set string value... 6 text - Clear harmonics up to at least 1000 Hz
	# Row 7
	Set string value... 7 font Times
	Set string value... 7 size 12
	Set string value... 7 text  
	# Row 8
	Set string value... 8 font Times
	Set string value... 8 size 14
	Set string value... 8 text %%Type II - Stable \&  At least one harmonic% \s{(press 2)}
	# Row 9
	Set string value... 9 font Times
	Set string value... 9 size 12
	Set string value... 9 text - Stable signal for longer than two seconds, and
	# Row 10
	Set string value... 10 font Times
	Set string value... 10 size 12
	Set string value... 10 text - At least one stable harmonic at the fundamental frequency for longer than two seconds
	# Row 11
	Set string value... 11 font Times
	Set string value... 11 size 12
	Set string value... 11 text  
	# Row 12
	Set string value... 12 font Times
	Set string value... 12 size 14
	Set string value... 12 text %%Type III - Unstable or Partly harmonic% \s{(press 3)}
	# Row 13
	Set string value... 13 font Times
	Set string value... 13 size 12
	Set string value... 13 text - No stable signal for longer than two seconds, or
	# Row 14
	Set string value... 14 font Times
	Set string value... 14 size 12
	Set string value... 14 text - Harmonics in only part of the sample (for longer than 1 second)
	# Row 15
	Set string value... 15 font Times
	Set string value... 15 size 12
	Set string value... 15 text  
	# Row 16
	Set string value... 16 font Times
	Set string value... 16 size 14
	Set string value... 16 text %%Type IV - Barely harmonic% \s{(press 4)}
	# Row 17
	Set string value... 17 font Times
	Set string value... 17 size 12
	Set string value... 17 text - No or only short-term detectable harmonics (for shorter than 1 second)
	# Row 18
	Set string value... 18 font Times
	Set string value... 18 size 12
	Set string value... 18 text   
	# Row 19
	Set string value... 19 font Times
	Set string value... 19 size 12
	Set string value... 19 text %%Table of the relation between the four types of acoustic signal typing%
	# Row 20
	Set string value... 20 font Times
	Set string value... 20 size 12
	Set string value... 20 text %%and the perceptual judgment of overall voice quality for 39 speakers%
	# Row 21
	Set string value... 21 font Times
	Set string value... 21 size 12
	Set string value... 21 text %%(converted to percentages).%
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text |  Perceptual judgment of overall voice quality |
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text |         Good     Reasonable  Poor             |
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text | Type I    70\%       40\%          0\%              |  
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text | Type II   45\%       45\%         10\%              |
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text | Type III  20\%       35\%         45\%              |
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text | Type IV    0\%       25\%         75\%              |
	# Row 28
	Set string value... 28 font Times
	Set string value... 28 size 12
	Set string value... 28 text   
	# Row 29
	Set string value... 29 font Helvetica
	Set string value... 29 size 10
	Set string value... 29 text References:
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 10
	Set string value... 30 text \bu Van As, C.J. (##2001#), %%Tracheoesophageal Speech. A Multidimensional Assessment of Voice Quality%, 
	# Row 31
	Set string value... 31 font Helvetica
	Set string value... 31 size 10
	Set string value... 31 text Ph.D.-thesis, University of Amsterdam, 209 pag.
	# Row 32
	Set string value... 32 font Helvetica
	Set string value... 32 size 10
	Set string value... 32 text \bu van As-Brooks, C.J., Koopmans-van Beinum, F.J., Pols, L.C.W., and Hilgers, F.J.M. (##2006#),
	# Row 33
	Set string value... 33 font Helvetica
	Set string value... 33 size 10
	Set string value... 33 text %%Acoustic Signal Typing for Evaluation of Voice Quality in Tracheoesophageal Speech%
	# Row 34
	Set string value... 34 font Helvetica
	Set string value... 34 size 10
	Set string value... 34 text Journal of Voice, Volume ##20# (3), p355-368
	# Row 35
	Set string value... 35 font Helvetica
	Set string value... 35 size 10
	Set string value... 35 text \bu Van As, C.J. (##2008#), %%Acoustic analyses of postlaryngectomy voice and their perceptual relevance%
	# Row 36
	Set string value... 36 font Helvetica
	Set string value... 36 size 10
	Set string value... 36 text Invitational Round Table "Evidence-based Voice and Speech Rehabilitation in Head and Neck Cancer", p8-14
	# Row 37
	Set string value... 37 font Helvetica
	Set string value... 37 size 10
	Set string value... 37 text <http://dare.uva.nl/document/130984>
endproc

procCreateInstruction_NL$ = "Instruction_NL"
procedure CreateInstruction_NL
	Create Table with column names... Instruction_NL 37
	... font size text
	# Fill table values
	# Row 1
	Set string value... 1 font Times
	Set string value... 1 size 16
	Set string value... 1 text Acoustic Signal Types
	# Row 2
	Set string value... 2 font Times
	Set string value... 2 size 10
	Set string value... 2 text (Pathology types will be displayed in the main window, press a number key to set the type)
	# Row 3
	Set string value... 3 font Times
	Set string value... 3 size 12
	Set string value... 3 text   
	# Row 4
	Set string value... 4 font Times
	Set string value... 4 size 14
	Set string value... 4 text %%Type I - Stable \&  Harmonic% \s{(press 1)}
	# Row 5
	Set string value... 5 font Times
	Set string value... 5 size 12
	Set string value... 5 text - Stable signal for longer than two seconds, and
	# Row 6
	Set string value... 6 font Times
	Set string value... 6 size 12
	Set string value... 6 text - Clear harmonics up to at least 1000 Hz
	# Row 7
	Set string value... 7 font Times
	Set string value... 7 size 12
	Set string value... 7 text  
	# Row 8
	Set string value... 8 font Times
	Set string value... 8 size 14
	Set string value... 8 text %%Type II - Stable \&  At least one harmonic% \s{(press 2)}
	# Row 9
	Set string value... 9 font Times
	Set string value... 9 size 12
	Set string value... 9 text - Stable signal for longer than two seconds, and
	# Row 10
	Set string value... 10 font Times
	Set string value... 10 size 12
	Set string value... 10 text - At least one stable harmonic at the fundamental frequency for longer than two seconds
	# Row 11
	Set string value... 11 font Times
	Set string value... 11 size 12
	Set string value... 11 text  
	# Row 12
	Set string value... 12 font Times
	Set string value... 12 size 14
	Set string value... 12 text %%Type III - Unstable or Partly harmonic% \s{(press 3)}
	# Row 13
	Set string value... 13 font Times
	Set string value... 13 size 12
	Set string value... 13 text - No stable signal for longer than two seconds, or
	# Row 14
	Set string value... 14 font Times
	Set string value... 14 size 12
	Set string value... 14 text - Harmonics in only part of the sample (for longer than 1 second)
	# Row 15
	Set string value... 15 font Times
	Set string value... 15 size 12
	Set string value... 15 text  
	# Row 16
	Set string value... 16 font Times
	Set string value... 16 size 14
	Set string value... 16 text %%Type IV - Barely harmonic% \s{(press 4)}
	# Row 17
	Set string value... 17 font Times
	Set string value... 17 size 12
	Set string value... 17 text - No or only short-term detectable harmonics (for shorter than 1 second)
	# Row 18
	Set string value... 18 font Times
	Set string value... 18 size 12
	Set string value... 18 text   
	# Row 19
	Set string value... 19 font Times
	Set string value... 19 size 12
	Set string value... 19 text %%Table of the relation between the four types of acoustic signal typing%
	# Row 20
	Set string value... 20 font Times
	Set string value... 20 size 12
	Set string value... 20 text %%and the perceptual judgment of overall voice quality for 39 speakers%
	# Row 21
	Set string value... 21 font Times
	Set string value... 21 size 12
	Set string value... 21 text %%(converted to percentages).%
	# Row 22
	Set string value... 22 font Courier
	Set string value... 22 size 12
	Set string value... 22 text |  Perceptual judgment of overall voice quality |
	# Row 23
	Set string value... 23 font Courier
	Set string value... 23 size 12
	Set string value... 23 text |         Good     Reasonable  Poor             |
	# Row 24
	Set string value... 24 font Courier
	Set string value... 24 size 12
	Set string value... 24 text | Type I    70\%       40\%          0\%              |  
	# Row 25
	Set string value... 25 font Courier
	Set string value... 25 size 12
	Set string value... 25 text | Type II   45\%       45\%         10\%              |
	# Row 26
	Set string value... 26 font Courier
	Set string value... 26 size 12
	Set string value... 26 text | Type III  20\%       35\%         45\%              |
	# Row 27
	Set string value... 27 font Courier
	Set string value... 27 size 12
	Set string value... 27 text | Type IV    0\%       25\%         75\%              |
	# Row 28
	Set string value... 28 font Times
	Set string value... 28 size 12
	Set string value... 28 text   
	# Row 29
	Set string value... 29 font Helvetica
	Set string value... 29 size 10
	Set string value... 29 text References:
	# Row 30
	Set string value... 30 font Helvetica
	Set string value... 30 size 10
	Set string value... 30 text \bu Van As, C.J. (##2001#), %%Tracheoesophageal Speech. A Multidimensional Assessment of Voice Quality%, 
	# Row 31
	Set string value... 31 font Helvetica
	Set string value... 31 size 10
	Set string value... 31 text Ph.D.-thesis, University of Amsterdam, 209 pag.
	# Row 32
	Set string value... 32 font Helvetica
	Set string value... 32 size 10
	Set string value... 32 text \bu van As-Brooks, C.J., Koopmans-van Beinum, F.J., Pols, L.C.W., and Hilgers, F.J.M. (##2006#),
	# Row 33
	Set string value... 33 font Helvetica
	Set string value... 33 size 10
	Set string value... 33 text %%Acoustic Signal Typing for Evaluation of Voice Quality in Tracheoesophageal Speech%
	# Row 34
	Set string value... 34 font Helvetica
	Set string value... 34 size 10
	Set string value... 34 text Journal of Voice, Volume ##20# (3), p355-368
	# Row 35
	Set string value... 35 font Helvetica
	Set string value... 35 size 10
	Set string value... 35 text \bu Van As, C.J. (##2008#), %%Acoustic analyses of postlaryngectomy voice and their perceptual relevance%
	# Row 36
	Set string value... 36 font Helvetica
	Set string value... 36 size 10
	Set string value... 36 text Invitational Round Table "Evidence-based Voice and Speech Rehabilitation in Head and Neck Cancer", p8-14
	# Row 37
	Set string value... 37 font Helvetica
	Set string value... 37 size 10
	Set string value... 37 text <http://dare.uva.nl/document/130984>
endproc

procCreateMainPage$ = "MainPage"
procedure CreateMainPage
	Create Table with column names... MainPage 30
	... Label LeftX RightX LowY HighY Color Draw
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 LeftX 0
	Set string value... 4 RightX 0
	Set string value... 4 LowY 0
	Set string value... 4 HighY 0
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 85
	Set string value... 5 LowY 25
	Set string value... 5 HighY 95
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 LeftX 20
	Set string value... 6 RightX 80
	Set string value... 6 LowY 90
	Set string value... 6 HighY 120
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 LeftX 0
	Set string value... 7 RightX 5
	Set string value... 7 LowY 0
	Set string value... 7 HighY 10
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 LeftX 0
	Set string value... 8 RightX 5
	Set string value... 8 LowY 0
	Set string value... 8 HighY 10
	Set string value... 8 Color Blue
	Set string value... 8 Draw DrawNext
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 LeftX 0
	Set string value... 9 RightX 5
	Set string value... 9 LowY 0
	Set string value... 9 HighY 10
	Set string value... 9 Color Blue
	Set string value... 9 Draw DrawPrevious
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 LeftX 7
	Set string value... 10 RightX 17
	Set string value... 10 LowY 0
	Set string value... 10 HighY 10
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 LeftX 19
	Set string value... 11 RightX 29
	Set string value... 11 LowY 0
	Set string value... 11 HighY 10
	Set string value... 11 Color Red
	Set string value... 11 Draw DrawRecord
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 LeftX 31
	Set string value... 12 RightX 41
	Set string value... 12 LowY 0
	Set string value... 12 HighY 10
	Set string value... 12 Color Red
	Set string value... 12 Draw DrawPlay
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 LeftX 90
	Set string value... 13 RightX 100
	Set string value... 13 LowY 90
	Set string value... 13 HighY 100
	Set string value... 13 Color Red
	Set string value... 13 Draw DrawQuit
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 LeftX 90
	Set string value... 14 RightX 100
	Set string value... 14 LowY 78
	Set string value... 14 HighY 88
	Set string value... 14 Color Black
	Set string value... 14 Draw DrawConfig
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 LeftX 90
	Set string value... 15 RightX 100
	Set string value... 15 LowY 66
	Set string value... 15 HighY 76
	Set string value... 15 Color Black
	Set string value... 15 Draw DrawRefresh
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 LeftX 90
	Set string value... 16 RightX 100
	Set string value... 16 LowY 54
	Set string value... 16 HighY 64
	Set string value... 16 Color Black
	Set string value... 16 Draw DrawHelp
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 LeftX 90
	Set string value... 17 RightX 100
	Set string value... 17 LowY 47
	Set string value... 17 HighY 52
	Set string value... 17 Color Black
	Set string value... 17 Draw DrawSave
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 LeftX 90
	Set string value... 18 RightX 100
	Set string value... 18 LowY 41
	Set string value... 18 HighY 46
	Set string value... 18 Color Black
	Set string value... 18 Draw DrawNull
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 LeftX 90
	Set string value... 19 RightX 100
	Set string value... 19 LowY 35
	Set string value... 19 HighY 40
	Set string value... 19 Color Black
	Set string value... 19 Draw DrawNull
	# Row 20
	Set string value... 20 Label Draw_Spectrogram
	Set string value... 20 LeftX 90
	Set string value... 20 RightX 100
	Set string value... 20 LowY 29
	Set string value... 20 HighY 34
	Set string value... 20 Color Black
	Set string value... 20 Draw DrawNull
	# Row 21
	Set string value... 21 Label Draw_Ltas
	Set string value... 21 LeftX 90
	Set string value... 21 RightX 100
	Set string value... 21 LowY 23
	Set string value... 21 HighY 28
	Set string value... 21 Color Black
	Set string value... 21 Draw DrawNull
	# Row 22
	Set string value... 22 Label Draw_Intensity
	Set string value... 22 LeftX 90
	Set string value... 22 RightX 100
	Set string value... 22 LowY 17
	Set string value... 22 HighY 22
	Set string value... 22 Color Black
	Set string value... 22 Draw DrawNull
	# Row 23
	Set string value... 23 Label Draw_Harmonicity
	Set string value... 23 LeftX 90
	Set string value... 23 RightX 100
	Set string value... 23 LowY 11
	Set string value... 23 HighY 16
	Set string value... 23 Color Black
	Set string value... 23 Draw DrawNull
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 LeftX 90
	Set string value... 24 RightX 100
	Set string value... 24 LowY 5
	Set string value... 24 HighY 10
	Set string value... 24 Color Black
	Set string value... 24 Draw DrawNull
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 LeftX 60
	Set string value... 25 RightX 70
	Set string value... 25 LowY 7
	Set string value... 25 HighY 12
	Set string value... 25 Color Black
	Set string value... 25 Draw DrawNull
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 LeftX 60
	Set string value... 26 RightX 70
	Set string value... 26 LowY 0
	Set string value... 26 HighY 5
	Set string value... 26 Color Black
	Set string value... 26 Draw DrawNull
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 LeftX 75
	Set string value... 27 RightX 85
	Set string value... 27 LowY 7
	Set string value... 27 HighY 12
	Set string value... 27 Color Black
	Set string value... 27 Draw DrawNull
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 LeftX 45
	Set string value... 28 RightX 55
	Set string value... 28 LowY 7
	Set string value... 28 HighY 12
	Set string value... 28 Color Black
	Set string value... 28 Draw DrawNull
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 LeftX 45
	Set string value... 29 RightX 55
	Set string value... 29 LowY 0
	Set string value... 29 HighY 5
	Set string value... 29 Color Black
	Set string value... 29 Draw DrawPrevious
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 LeftX 75
	Set string value... 30 RightX 85
	Set string value... 30 LowY 0
	Set string value... 30 HighY 5
	Set string value... 30 Color Black
	Set string value... 30 Draw DrawNext
endproc

procCreateMainPage_DE$ = "MainPage_DE"
procedure CreateMainPage_DE
	Create Table with column names... MainPage_DE 30
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Autor
	Set string value... 1 Key §
	Set string value... 1 Helptext R.J.J.H. van Son, \U"bersetzung: Irene Jacobi
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key §
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text Lizenz
	Set string value... 3 Key §
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text DemoVersion: Hauptseite
	Set string value... 4 Key §
	Set string value... 4 Helptext DemoVersion: Hauptseite
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 Text Fenster
	Set string value... 5 Key §
	Set string value... 5 Helptext Zeichenbereich
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 Text - Signal Typos:
	Set string value... 6 Key 012349
	Set string value... 6 Helptext Pathologischer Signal Typos (AST) in \U"berschrift I-IV, Taste 1-4, 0 l\o"scht
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 Text !90!Sprecher
	Set string value... 7 Key p
	Set string value... 7 Helptext Eingabe Sprecher daten
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 Text Spr
	Set string value... 8 Key x|\\
	Set string value... 8 Helptext N\a"chste Aufname w\a"hrend seriele Eingabe
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 Text Spr
	Set string value... 9 Key x|\\
	Set string value... 9 Helptext Vorherige Aufnahme w\a"hrend seriele Eingabe
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 Text \O"ffnen
	Set string value... 10 Key f
	Set string value... 10 Helptext Laden einer Audio-Datei
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 Text Aufnahme
	Set string value... 11 Key A
	Set string value... 11 Helptext Machen Sie eine Sprachaufnahme. Sie haben 4 Sekunden bevor die Aufnahme beginnt; achten Sie auf das rote Licht.
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 Text Wiedergabe
	Set string value... 12 Key W
	Set string value... 12 Helptext Abspielen der Aufnahme
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 Text Ende
	Set string value... 13 Key E
	Set string value... 13 Helptext Das Programm beenden
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 Text Einstellungen
	Set string value... 14 Key g
	Set string value... 14 Helptext Zur Seite "Einstellungen"
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 Text Aktualisieren
	Set string value... 15 Key u
	Set string value... 15 Helptext Der aktuelle Bildschirm wird abgebildet. Mit der Leertaste kann der Bildschirm aktualisiert werden.
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text Hilfe
	Set string value... 16 Key ?/
	Set string value... 16 Helptext Dr\u"cken Sie auf den Knopf \u"ber den Sie Informationen m\o"chten. Dr\u"cken Sie danach auf "Hilfe".
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 Text Drucken \#
	Set string value... 17 Key #
	Set string value... 17 Helptext Speichern der Daten zum abdrucken
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 Text Audio
	Set string value... 18 Key d
	Set string value... 18 Helptext Abbildung des Audiosignals
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 Text Tonh\o"he
	Set string value... 19 Key T
	Set string value... 19 Helptext Abbildung der Tonh\o"he
	# Row 20
	Set string value... 20 Label Draw_Harmonicity
	Set string value... 20 Text Harmonizit\a"t
	Set string value... 20 Key H
	Set string value... 20 Helptext Abbildung des Harmonicity-to-Noise Verh\a"ltnis
	# Row 21
	Set string value... 21 Label Draw_Spectrogram
	Set string value... 21 Text Spektrogramm
	Set string value... 21 Key S
	Set string value... 21 Helptext Abbildung des Schmalband-Spektrogramms (100 ms) mit Formante
	# Row 22
	Set string value... 22 Label Draw_Ltas
	Set string value... 22 Text Ltas
	Set string value... 22 Key L
	Set string value... 22 Helptext Abbildung des gemittelten Langzeitspektrums
	# Row 23
	Set string value... 23 Label Draw_Intensity
	Set string value... 23 Text Intensit\a"t
	Set string value... 23 Key I
	Set string value... 23 Helptext Abbildung der Intensit\a"t
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 Text Wertung
	Set string value... 24 Key #
	Set string value... 24 Helptext Bewerten Sie die Sprache 
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 Text Selektieren
	Set string value... 25 Key r
	Set string value... 25 Helptext Selektieren von Start- und Endzeiten
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 Text Zur Selektion
	Set string value... 26 Key Z
	Set string value... 26 Helptext Gehe zum selektierten Abschnitt
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 Text Zoom out +
	Set string value... 27 Key o+=
	Set string value... 27 Helptext Verdoppelung der Fenstergr\o"sse / Verkleinern
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 Text Zoom in -
	Set string value... 28 Key m\-_
	Set string value... 28 Helptext Halbierung der Fenstergr\o"sse / Vergr\o"ssern
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 Text < Zur\u"ck
	Set string value... 29 Key \<\,
	Set string value... 29 Helptext zum vorigen Abschnitt
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 Text Voraus >
	Set string value... 30 Key \>\.
	Set string value... 30 Helptext zum n\a"chsten Abschnitt
endproc

procCreateMainPage_EN$ = "MainPage_EN"
procedure CreateMainPage_EN
	Create Table with column names... MainPage_EN 30
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: Main page
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS tool: Main page
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 Text Display
	Set string value... 5 Key ¤
	Set string value... 5 Helptext Display area
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 Text - Signal Type:
	Set string value... 6 Key 012349
	Set string value... 6 Helptext Pathological Signal Type (AST) in window title I-IV, type 1-4, 0 erases
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 Text !90!Speaker
	Set string value... 7 Key k
	Set string value... 7 Helptext Input speaker data
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 Text Spk
	Set string value... 8 Key x|\\
	Set string value... 8 Helptext Next recording in %serial mode
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 Text Spk
	Set string value... 9 Key x|\\
	Set string value... 9 Helptext Previous recording in %serial mode
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 Text Open
	Set string value... 10 Key O
	Set string value... 10 Helptext Open sound file
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 Text Record
	Set string value... 11 Key R
	Set string value... 11 Helptext Record your speech. You have 4 seconds, watch the recording "light"
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 Text Play
	Set string value... 12 Key P
	Set string value... 12 Helptext Play back of your recorded pronunciation
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 Text Quit
	Set string value... 13 Key Q
	Set string value... 13 Helptext Quit TEVA
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 Text Settings
	Set string value... 14 Key S
	Set string value... 14 Helptext Go to %%Configuration% page
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 Text Refresh
	Set string value... 15 Key h
	Set string value... 15 Helptext Redraw the current screen, the space-bar always refreshes screen
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text Help
	Set string value... 16 Key ?/
	Set string value... 16 Helptext Press the button you want information on, "Help" to continue
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 Text Print \# 
	Set string value... 17 Key #
	Set string value... 17 Helptext Save a report in printer format
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 Text Sound
	Set string value... 18 Key S
	Set string value... 18 Helptext Draw the Sound
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 Text Pitch
	Set string value... 19 Key t
	Set string value... 19 Helptext Draw Pitch
	# Row 20
	Set string value... 20 Label Draw_Harmonicity
	Set string value... 20 Text Harmonicity
	Set string value... 20 Key H
	Set string value... 20 Helptext Draw the Harmonicity to Noise ratio
	# Row 21
	Set string value... 21 Label Draw_Spectrogram
	Set string value... 21 Text Spectrogram
	Set string value... 21 Key L
	Set string value... 21 Helptext Narrow band spectrogram (100 ms) with formants superimposed
	# Row 22
	Set string value... 22 Label Draw_Ltas
	Set string value... 22 Text Ltas
	Set string value... 22 Key L
	Set string value... 22 Helptext Long time average spectrum
	# Row 23
	Set string value... 23 Label Draw_Intensity
	Set string value... 23 Text Intensity
	Set string value... 23 Key I
	Set string value... 23 Helptext Draw Intensity
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 Text Rating
	Set string value... 24 Key #
	Set string value... 24 Helptext Rate the speech on scales 
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 Text Select
	Set string value... 25 Key e
	Set string value... 25 Helptext Select new start and endtime
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 Text To selection
	Set string value... 26 Key c
	Set string value... 26 Helptext Go to selected start and endtime
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 Text Zoom out -
	Set string value... 27 Key u\-_
	Set string value... 27 Helptext Double the current time window
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 Text Zoom in +
	Set string value... 28 Key n+=
	Set string value... 28 Helptext Halve the current time window
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 Text < Previous
	Set string value... 29 Key \<\,
	Set string value... 29 Helptext Previous interval, or shift current time window to the left
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 Text Next >
	Set string value... 30 Key \>\.
	Set string value... 30 Helptext Next interval, or shift the current time window to the right
endproc

procCreateMainPage_ES$ = "MainPage_ES"
procedure CreateMainPage_ES
	Create Table with column names... MainPage_ES 30
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son \& Nieves Broquetas
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS Herramienta: Página principal
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS Herramienta: Página principal
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 Text Display
	Set string value... 5 Key ¤
	Set string value... 5 Helptext Display area
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 Text - Pathological Type:
	Set string value... 6 Key 012349
	Set string value... 6 Helptext Pathological Signal Type (AST) in window title I-IV, type 1-4, 0 erases
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 Text !90!Speaker
	Set string value... 7 Key k
	Set string value... 7 Helptext Input speaker data
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 Text Spk
	Set string value... 8 Key x|\\
	Set string value... 8 Helptext Next recording in %serial mode
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 Text Spk
	Set string value... 9 Key x|\\
	Set string value... 9 Helptext Previous recording in %serial mode
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 Text Open
	Set string value... 10 Key O
	Set string value... 10 Helptext Open sound file
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 Text Record
	Set string value... 11 Key R
	Set string value... 11 Helptext Record your speech. You have 4 seconds, watch the recording "light"
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 Text Play
	Set string value... 12 Key P
	Set string value... 12 Helptext Play back of your recorded pronunciation
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 Text Quit
	Set string value... 13 Key Q
	Set string value... 13 Helptext Quit TEVA
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 Text Settings
	Set string value... 14 Key S
	Set string value... 14 Helptext Go to %%Configuration% page
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 Text Refresh
	Set string value... 15 Key h
	Set string value... 15 Helptext Redraw the current screen, the space-bar always refreshes screen
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text Help
	Set string value... 16 Key ?/
	Set string value... 16 Helptext Press the button you want information on, "Help" to continue
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 Text Print \# 
	Set string value... 17 Key #
	Set string value... 17 Helptext Save a report in printer format
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 Text Sound
	Set string value... 18 Key S
	Set string value... 18 Helptext Draw the Sound
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 Text Pitch
	Set string value... 19 Key t
	Set string value... 19 Helptext Draw Pitch
	# Row 20
	Set string value... 20 Label Draw_Harmonicity
	Set string value... 20 Text Harmonicity
	Set string value... 20 Key H
	Set string value... 20 Helptext Draw the Harmonicity to Noise ratio
	# Row 21
	Set string value... 21 Label Draw_Spectrogram
	Set string value... 21 Text Spectrogram
	Set string value... 21 Key L
	Set string value... 21 Helptext Narrow band spectrogram (100 ms) with formants superimposed
	# Row 22
	Set string value... 22 Label Draw_Ltas
	Set string value... 22 Text Ltas
	Set string value... 22 Key L
	Set string value... 22 Helptext Long time average spectrum
	# Row 23
	Set string value... 23 Label Draw_Intensity
	Set string value... 23 Text Intensity
	Set string value... 23 Key I
	Set string value... 23 Helptext Draw Intensity
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 Text Rating
	Set string value... 24 Key #
	Set string value... 24 Helptext Rate the speech on scales 
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 Text Select
	Set string value... 25 Key e
	Set string value... 25 Helptext Select new start and endtime
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 Text To selection
	Set string value... 26 Key c
	Set string value... 26 Helptext Go to selected start and endtime
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 Text Zoom out -
	Set string value... 27 Key u\-_
	Set string value... 27 Helptext Double the current time window
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 Text Zoom in +
	Set string value... 28 Key n+=
	Set string value... 28 Helptext Halve the current time window
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 Text < Previous
	Set string value... 29 Key \<\,
	Set string value... 29 Helptext Previous interval, or shift current time window to the left
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 Text Next >
	Set string value... 30 Key \>\.
	Set string value... 30 Helptext Next interval, or shift the current time window to the right
endproc

procCreateMainPage_JA$ = "MainPage_JA"
procedure CreateMainPage_JA
	Create Table with column names... MainPage_JA 30
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text 著者
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son, translation: Akiko Kanezaki
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text 著作権
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \& the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text ライセンス
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: メインページ
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS tool: メインページ
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 Text ディスプレイ
	Set string value... 5 Key ¬§
	Set string value... 5 Helptext ディスプレイ範囲
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 Text シグナルタイプ
	Set string value... 6 Key 12349
	Set string value... 6 Helptext 病理シグナルタイプ (AST) ウィンドウタイトル I-IV, タイプ 1-4, 0 消去
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 Text !90!話者 
	Set string value... 7 Key k
	Set string value... 7 Helptext 話者データ入力
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 Text 被験者
	Set string value... 8 Key x|\\
	Set string value... 8 Helptext 次の録音 %serial mode
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 Text 被験者
	Set string value... 9 Key x|\\
	Set string value... 9 Helptext 前の録音 %serial mode
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 Text 開く
	Set string value... 10 Key O
	Set string value... 10 Helptext 音声データファイルを開く
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 Text 録音
	Set string value... 11 Key R
	Set string value... 11 Helptext 録音できます. 4秒間録音可能です, 録音 "ライト"を見て下さい。
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 Text 再生
	Set string value... 12 Key P
	Set string value... 12 Helptext 録音した音声を再生
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 Text 中断
	Set string value... 13 Key Q
	Set string value... 13 Helptext TEVAを中断する
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 Text 設定
	Set string value... 14 Key S
	Set string value... 14 Helptext  %%Configuration% ページへ
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 Text リフレッシュ
	Set string value... 15 Key h
	Set string value... 15 Helptext 現在のスクリーンを再描画します,スペースバーは常に画面をリフレッシュします
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text ヘルプ
	Set string value... 16 Key ?/
	Set string value... 16 Helptext 知りたい情報があればヘルプボタンを押して下さい
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 Text 印刷 #
	Set string value... 17 Key #
	Set string value... 17 Helptext プリンタ形式でレポートを保存する
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 Text 音声
	Set string value... 18 Key S
	Set string value... 18 Helptext 音声を描画する
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 Text ピッチ
	Set string value... 19 Key t
	Set string value... 19 Helptext ピッチを描画する
	# Row 20
	Set string value... 20 Label Draw_Harmonicity
	Set string value... 20 Text 調和音
	Set string value... 20 Key H
	Set string value... 20 Helptext 調和雑音比を描画する
	# Row 21
	Set string value... 21 Label Draw_Spectrogram
	Set string value... 21 Text スペクトログラム
	Set string value... 21 Key L
	Set string value... 21 Helptext ナローバンドスペクトログラム（100ms）とフォルマントを合わせる
	# Row 22
	Set string value... 22 Label Draw_Ltas
	Set string value... 22 Text Ltas
	Set string value... 22 Key L
	Set string value... 22 Helptext 長時間平均スペクトル
	# Row 23
	Set string value... 23 Label Draw_Intensity
	Set string value... 23 Text 強さ
	Set string value... 23 Key I
	Set string value... 23 Helptext 強度を描画する
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 Text 評価
	Set string value... 24 Key #
	Set string value... 24 Helptext スピーチを評価する
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 Text 選択
	Set string value... 25 Key e
	Set string value... 25 Helptext 新しい開始時間と終了時間を選ぶ
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 Text 選択
	Set string value... 26 Key c
	Set string value... 26 Helptext 選択した時間窓のみ表示する
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 Text ズームアウト -
	Set string value... 27 Key u\-_
	Set string value... 27 Helptext 二画面表示
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 Text ズームイン +
	Set string value... 28 Key n+=
	Set string value... 28 Helptext 二分割画面
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 Text < 前
	Set string value... 29 Key \<\,
	Set string value... 29 Helptext 前のインターバルもしくは現在の画面を左へ移動する
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 Text 次 >
	Set string value... 30 Key \>\.
	Set string value... 30 Helptext 次のインターバルもしくは現在の画面を右へ移動する
endproc

procCreateMainPage_NL$ = "MainPage_NL"
procedure CreateMainPage_NL
	Create Table with column names... MainPage_NL 30
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Auteur
	Set string value... 1 Key §
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key §
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text Licentie
	Set string value... 3 Key §
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: Hoofdpagina 
	Set string value... 4 Key §
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS tool: Hoofdpagina
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 Text Venster
	Set string value... 5 Key §
	Set string value... 5 Helptext Tekenvenster
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 Text - Pathologisch type:
	Set string value... 6 Key 012349
	Set string value... 6 Helptext Pathologisch signaal type (AST) in venstertitel I-IV, toets 1-4, 0 wist
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 Text !90!Spreker
	Set string value... 7 Key r
	Set string value... 7 Helptext Invoer spreker gegevens
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 Text Spr
	Set string value... 8 Key x|\\
	Set string value... 8 Helptext Volgende opname bij %%seri\e"le% verwerking
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 Text Spr
	Set string value... 9 Key x|\\
	Set string value... 9 Helptext Vorige opname bij %%seri\e"le% verwerking
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 Text Open
	Set string value... 10 Key p
	Set string value... 10 Helptext Open geluids bestand
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 Text Opnemen
	Set string value... 11 Key O
	Set string value... 11 Helptext Neem spraak op. U hebt 4 seconden, let op het rode "lampje"
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 Text Afspelen
	Set string value... 12 Key A
	Set string value... 12 Helptext Speel je opgenomen uitspraak af
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 Text Stop
	Set string value... 13 Key S
	Set string value... 13 Helptext Stop NKI TE-VOICE ANALYSIS tool
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 Text Instellingen
	Set string value... 14 Key I
	Set string value... 14 Helptext Ga naar de pagina met instellingen
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 Text Ververs
	Set string value... 15 Key r
	Set string value... 15 Helptext Ververs de huidige pagina, de spatiebalk ververst altijd de pagina
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text Help
	Set string value... 16 Key ?/
	Set string value... 16 Helptext Druk op de knop waar u informatie over wilt hebben, "Help" als u verder wilt
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 Text Print \# 
	Set string value... 17 Key #
	Set string value... 17 Helptext Bewaar rapport in een formaat voor printen
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 Text Geluid
	Set string value... 18 Key G
	Set string value... 18 Helptext Teken de geluidsfile
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 Text Toon
	Set string value... 19 Key T
	Set string value... 19 Helptext Teken de toonhoogte
	# Row 20
	Set string value... 20 Label Draw_Harmonicity
	Set string value... 20 Text Harmoniciteit
	Set string value... 20 Key H
	Set string value... 20 Helptext Teken de Harmonicity to Noise ratio
	# Row 21
	Set string value... 21 Label Draw_Spectrogram
	Set string value... 21 Text Spectrogram
	Set string value... 21 Key L
	Set string value... 21 Helptext Smalband spectrogram (100 ms) met formanten
	# Row 22
	Set string value... 22 Label Draw_Ltas
	Set string value... 22 Text Ltas
	Set string value... 22 Key L
	Set string value... 22 Helptext Long time average spectrum
	# Row 23
	Set string value... 23 Label Draw_Intensity
	Set string value... 23 Text Intensiteit
	Set string value... 23 Key I
	Set string value... 23 Helptext Teken de intensiteit
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 Text Beoordeel
	Set string value... 24 Key #
	Set string value... 24 Helptext Geef schaaloordelen van de spraak 
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 Text Selecteer
	Set string value... 25 Key e
	Set string value... 25 Helptext Selecteer nieuwe start en eindtijd
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 Text Naar selectie
	Set string value... 26 Key c
	Set string value... 26 Helptext Ga naar geselecteerde start and eindtijd
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 Text Zoom uit -
	Set string value... 27 Key u\-_
	Set string value... 27 Helptext Verdubbel het huidige tijdsvenster
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 Text Zoom in +
	Set string value... 28 Key n+=
	Set string value... 28 Helptext Halveer het huidige tijdsvenster
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 Text < Vorige
	Set string value... 29 Key \<\,
	Set string value... 29 Helptext Vorige interval
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 Text Volgende >
	Set string value... 30 Key \>\.
	Set string value... 30 Helptext Volgende interval
endproc

procCreatePrintSignal_DE$ = "PrintSignal_DE"
procedure CreatePrintSignal_DE
	Create Table with column names... PrintSignal_DE 62
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Auteur R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2014 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Waveform
	Set string value... 4 Text Wellenform
	# Row 5
	Set string value... 5 Key Spectrogram
	Set string value... 5 Text Spektrogramm
	# Row 6
	Set string value... 6 Key Ltas
	Set string value... 6 Text Ltas
	# Row 7
	Set string value... 7 Key Pitch
	Set string value... 7 Text Tonh\o"he
	# Row 8
	Set string value... 8 Key seconds
	Set string value... 8 Text Sekunden
	# Row 9
	Set string value... 9 Key time
	Set string value... 9 Text Zeit -> s
	# Row 10
	Set string value... 10 Key Frequency
	Set string value... 10 Text Frequenz -> Hz
	# Row 11
	Set string value... 11 Key Hz
	Set string value... 11 Text Hz
	# Row 12
	Set string value... 12 Key SPL
	Set string value... 12 Text SPL dB/Hz
	# Row 13
	Set string value... 13 Key AST
	Set string value... 13 Text AST
	# Row 14
	Set string value... 14 Key CompAST
	Set string value... 14 Text berechn.
	# Row 15
	Set string value... 15 Key Rating.quality
	Set string value... 15 Text VQ
	# Row 16
	Set string value... 16 Key CompVQ
	Set string value... 16 Text cmp
	# Row 17
	Set string value... 17 Key Rating.fluency
	Set string value... 17 Text Fl
	# Row 18
	Set string value... 18 Key Rating.voice
	Set string value... 18 Text Vo
	# Row 19
	Set string value... 19 Key Rating.impression
	Set string value... 19 Text Imp
	# Row 20
	Set string value... 20 Key Rating.noise
	Set string value... 20 Text N
	# Row 21
	Set string value... 21 Key Rating.continuity
	Set string value... 21 Text Cont
	# Row 22
	Set string value... 22 Key Rating.intelligibility
	Set string value... 22 Text Int
	# Row 23
	Set string value... 23 Key Rating.grade
	Set string value... 23 Text G
	# Row 24
	Set string value... 24 Key Rating.roughness
	Set string value... 24 Text R
	# Row 25
	Set string value... 25 Key Rating.breathiness
	Set string value... 25 Text B
	# Row 26
	Set string value... 26 Key Rating.asthenia
	Set string value... 26 Text A
	# Row 27
	Set string value... 27 Key Rating.strain
	Set string value... 27 Text S
	# Row 28
	Set string value... 28 Key Jitter
	Set string value... 28 Text Jitter
	# Row 29
	Set string value... 29 Key Shimmer
	Set string value... 29 Text Shimmer
	# Row 30
	Set string value... 30 Key Mean
	Set string value... 30 Text Mean
	# Row 31
	Set string value... 31 Key SD
	Set string value... 31 Text SD
	# Row 32
	Set string value... 32 Key Mon
	Set string value... 32 Text Mo
	# Row 33
	Set string value... 33 Key Tue
	Set string value... 33 Text Di
	# Row 34
	Set string value... 34 Key Wed
	Set string value... 34 Text Mi
	# Row 35
	Set string value... 35 Key Thu
	Set string value... 35 Text Do
	# Row 36
	Set string value... 36 Key Fri
	Set string value... 36 Text Fr
	# Row 37
	Set string value... 37 Key Sat
	Set string value... 37 Text Sa
	# Row 38
	Set string value... 38 Key Sun
	Set string value... 38 Text So
	# Row 39
	Set string value... 39 Key Jan
	Set string value... 39 Text Jan
	# Row 40
	Set string value... 40 Key Feb
	Set string value... 40 Text Feb
	# Row 41
	Set string value... 41 Key Mar
	Set string value... 41 Text M\a"r
	# Row 42
	Set string value... 42 Key Apr
	Set string value... 42 Text Apr
	# Row 43
	Set string value... 43 Key May
	Set string value... 43 Text May
	# Row 44
	Set string value... 44 Key Jun
	Set string value... 44 Text Jun
	# Row 45
	Set string value... 45 Key Jul
	Set string value... 45 Text Jul
	# Row 46
	Set string value... 46 Key Aug
	Set string value... 46 Text Aug
	# Row 47
	Set string value... 47 Key Sep
	Set string value... 47 Text Sep
	# Row 48
	Set string value... 48 Key Oct
	Set string value... 48 Text Okt
	# Row 49
	Set string value... 49 Key Nov
	Set string value... 49 Text Nov
	# Row 50
	Set string value... 50 Key Dec
	Set string value... 50 Text Dec
	# Row 51
	Set string value... 51 Key numJan
	Set string value... 51 Text 01
	# Row 52
	Set string value... 52 Key numFeb
	Set string value... 52 Text 02
	# Row 53
	Set string value... 53 Key numMar
	Set string value... 53 Text 03
	# Row 54
	Set string value... 54 Key numApr
	Set string value... 54 Text 04
	# Row 55
	Set string value... 55 Key numMay
	Set string value... 55 Text 05
	# Row 56
	Set string value... 56 Key numJun
	Set string value... 56 Text 06
	# Row 57
	Set string value... 57 Key numJul
	Set string value... 57 Text 07
	# Row 58
	Set string value... 58 Key numAug
	Set string value... 58 Text 08
	# Row 59
	Set string value... 59 Key numSep
	Set string value... 59 Text 09
	# Row 60
	Set string value... 60 Key numOct
	Set string value... 60 Text 10
	# Row 61
	Set string value... 61 Key numNov
	Set string value... 61 Text 11
	# Row 62
	Set string value... 62 Key numDec
	Set string value... 62 Text 12
endproc

procCreatePrintSignal_EN$ = "PrintSignal_EN"
procedure CreatePrintSignal_EN
	Create Table with column names... PrintSignal_EN 62
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Auteur R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2014 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Waveform
	Set string value... 4 Text Waveform
	# Row 5
	Set string value... 5 Key Spectrogram
	Set string value... 5 Text Spectrogram
	# Row 6
	Set string value... 6 Key Ltas
	Set string value... 6 Text Ltas
	# Row 7
	Set string value... 7 Key Pitch
	Set string value... 7 Text Pitch
	# Row 8
	Set string value... 8 Key seconds
	Set string value... 8 Text seconds
	# Row 9
	Set string value... 9 Key time
	Set string value... 9 Text time -> s
	# Row 10
	Set string value... 10 Key Frequency
	Set string value... 10 Text Frequency -> Hz
	# Row 11
	Set string value... 11 Key Hz
	Set string value... 11 Text Hz
	# Row 12
	Set string value... 12 Key SPL
	Set string value... 12 Text SPL dB/Hz
	# Row 13
	Set string value... 13 Key AST
	Set string value... 13 Text AST
	# Row 14
	Set string value... 14 Key CompAST
	Set string value... 14 Text cmp
	# Row 15
	Set string value... 15 Key Rating.quality
	Set string value... 15 Text VQ
	# Row 16
	Set string value... 16 Key Rating.impression
	Set string value... 16 Text Imp
	# Row 17
	Set string value... 17 Key Rating.noise
	Set string value... 17 Text N
	# Row 18
	Set string value... 18 Key Rating.fluency
	Set string value... 18 Text Fl
	# Row 19
	Set string value... 19 Key Rating.voice
	Set string value... 19 Text Vo
	# Row 20
	Set string value... 20 Key Rating.continuity
	Set string value... 20 Text Cont
	# Row 21
	Set string value... 21 Key Rating.intelligibility
	Set string value... 21 Text Int
	# Row 22
	Set string value... 22 Key Rating.grade
	Set string value... 22 Text G
	# Row 23
	Set string value... 23 Key Rating.roughness
	Set string value... 23 Text R
	# Row 24
	Set string value... 24 Key Rating.breathiness
	Set string value... 24 Text B
	# Row 25
	Set string value... 25 Key Rating.asthenia
	Set string value... 25 Text A
	# Row 26
	Set string value... 26 Key Rating.strain
	Set string value... 26 Text S
	# Row 27
	Set string value... 27 Key CompVQ
	Set string value... 27 Text cmp
	# Row 28
	Set string value... 28 Key Jitter
	Set string value... 28 Text Jitter
	# Row 29
	Set string value... 29 Key Shimmer
	Set string value... 29 Text Shimmer
	# Row 30
	Set string value... 30 Key Mean
	Set string value... 30 Text Mean
	# Row 31
	Set string value... 31 Key SD
	Set string value... 31 Text SD
	# Row 32
	Set string value... 32 Key Mon
	Set string value... 32 Text Mon
	# Row 33
	Set string value... 33 Key Tue
	Set string value... 33 Text Tue
	# Row 34
	Set string value... 34 Key Wed
	Set string value... 34 Text Wed
	# Row 35
	Set string value... 35 Key Thu
	Set string value... 35 Text Thu
	# Row 36
	Set string value... 36 Key Fri
	Set string value... 36 Text Fri
	# Row 37
	Set string value... 37 Key Sat
	Set string value... 37 Text Sat
	# Row 38
	Set string value... 38 Key Sun
	Set string value... 38 Text Sun
	# Row 39
	Set string value... 39 Key Jan
	Set string value... 39 Text Jan
	# Row 40
	Set string value... 40 Key Feb
	Set string value... 40 Text Feb
	# Row 41
	Set string value... 41 Key Mar
	Set string value... 41 Text Mar
	# Row 42
	Set string value... 42 Key Apr
	Set string value... 42 Text Apr
	# Row 43
	Set string value... 43 Key May
	Set string value... 43 Text May
	# Row 44
	Set string value... 44 Key Jun
	Set string value... 44 Text Jun
	# Row 45
	Set string value... 45 Key Jul
	Set string value... 45 Text Jul
	# Row 46
	Set string value... 46 Key Aug
	Set string value... 46 Text Aug
	# Row 47
	Set string value... 47 Key Sep
	Set string value... 47 Text Sep
	# Row 48
	Set string value... 48 Key Oct
	Set string value... 48 Text Oct
	# Row 49
	Set string value... 49 Key Nov
	Set string value... 49 Text Nov
	# Row 50
	Set string value... 50 Key Dec
	Set string value... 50 Text Dec
	# Row 51
	Set string value... 51 Key numJan
	Set string value... 51 Text 01
	# Row 52
	Set string value... 52 Key numFeb
	Set string value... 52 Text 02
	# Row 53
	Set string value... 53 Key numMar
	Set string value... 53 Text 03
	# Row 54
	Set string value... 54 Key numApr
	Set string value... 54 Text 04
	# Row 55
	Set string value... 55 Key numMay
	Set string value... 55 Text 05
	# Row 56
	Set string value... 56 Key numJun
	Set string value... 56 Text 06
	# Row 57
	Set string value... 57 Key numJul
	Set string value... 57 Text 07
	# Row 58
	Set string value... 58 Key numAug
	Set string value... 58 Text 08
	# Row 59
	Set string value... 59 Key numSep
	Set string value... 59 Text 09
	# Row 60
	Set string value... 60 Key numOct
	Set string value... 60 Text 10
	# Row 61
	Set string value... 61 Key numNov
	Set string value... 61 Text 11
	# Row 62
	Set string value... 62 Key numDec
	Set string value... 62 Text 12
endproc

procCreatePrintSignal_ES$ = "PrintSignal_ES"
procedure CreatePrintSignal_ES
	Create Table with column names... PrintSignal_ES 62
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Auteur R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2014 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Waveform
	Set string value... 4 Text Waveform
	# Row 5
	Set string value... 5 Key Spectrogram
	Set string value... 5 Text Spectrogram
	# Row 6
	Set string value... 6 Key Ltas
	Set string value... 6 Text Ltas
	# Row 7
	Set string value... 7 Key Pitch
	Set string value... 7 Text Pitch
	# Row 8
	Set string value... 8 Key seconds
	Set string value... 8 Text seconds
	# Row 9
	Set string value... 9 Key time
	Set string value... 9 Text time -> s
	# Row 10
	Set string value... 10 Key Frequency
	Set string value... 10 Text Frequency -> Hz
	# Row 11
	Set string value... 11 Key Hz
	Set string value... 11 Text Hz
	# Row 12
	Set string value... 12 Key SPL
	Set string value... 12 Text SPL dB/Hz
	# Row 13
	Set string value... 13 Key AST
	Set string value... 13 Text AST
	# Row 14
	Set string value... 14 Key CompAST
	Set string value... 14 Text cmp
	# Row 15
	Set string value... 15 Key Rating.quality
	Set string value... 15 Text VQ
	# Row 16
	Set string value... 16 Key CompVQ
	Set string value... 16 Text cmp
	# Row 17
	Set string value... 17 Key Rating.fluency
	Set string value... 17 Text Fl
	# Row 18
	Set string value... 18 Key Rating.voice
	Set string value... 18 Text Vo
	# Row 19
	Set string value... 19 Key Rating.impression
	Set string value... 19 Text Imp
	# Row 20
	Set string value... 20 Key Rating.noise
	Set string value... 20 Text N
	# Row 21
	Set string value... 21 Key Rating.continuity
	Set string value... 21 Text Cont
	# Row 22
	Set string value... 22 Key Rating.intelligibility
	Set string value... 22 Text Int
	# Row 23
	Set string value... 23 Key Rating.grade
	Set string value... 23 Text G
	# Row 24
	Set string value... 24 Key Rating.roughness
	Set string value... 24 Text R
	# Row 25
	Set string value... 25 Key Rating.breathiness
	Set string value... 25 Text B
	# Row 26
	Set string value... 26 Key Rating.asthenia
	Set string value... 26 Text A
	# Row 27
	Set string value... 27 Key Rating.strain
	Set string value... 27 Text S
	# Row 28
	Set string value... 28 Key Jitter
	Set string value... 28 Text Jitter
	# Row 29
	Set string value... 29 Key Shimmer
	Set string value... 29 Text Shimmer
	# Row 30
	Set string value... 30 Key Mean
	Set string value... 30 Text Mean
	# Row 31
	Set string value... 31 Key SD
	Set string value... 31 Text SD
	# Row 32
	Set string value... 32 Key Mon
	Set string value... 32 Text Mon
	# Row 33
	Set string value... 33 Key Tue
	Set string value... 33 Text Tue
	# Row 34
	Set string value... 34 Key Wed
	Set string value... 34 Text Wed
	# Row 35
	Set string value... 35 Key Thu
	Set string value... 35 Text Thu
	# Row 36
	Set string value... 36 Key Fri
	Set string value... 36 Text Fri
	# Row 37
	Set string value... 37 Key Sat
	Set string value... 37 Text Sat
	# Row 38
	Set string value... 38 Key Sun
	Set string value... 38 Text Sun
	# Row 39
	Set string value... 39 Key Jan
	Set string value... 39 Text Jan
	# Row 40
	Set string value... 40 Key Feb
	Set string value... 40 Text Feb
	# Row 41
	Set string value... 41 Key Mar
	Set string value... 41 Text Mar
	# Row 42
	Set string value... 42 Key Apr
	Set string value... 42 Text Apr
	# Row 43
	Set string value... 43 Key May
	Set string value... 43 Text May
	# Row 44
	Set string value... 44 Key Jun
	Set string value... 44 Text Jun
	# Row 45
	Set string value... 45 Key Jul
	Set string value... 45 Text Jul
	# Row 46
	Set string value... 46 Key Aug
	Set string value... 46 Text Aug
	# Row 47
	Set string value... 47 Key Sep
	Set string value... 47 Text Sep
	# Row 48
	Set string value... 48 Key Oct
	Set string value... 48 Text Oct
	# Row 49
	Set string value... 49 Key Nov
	Set string value... 49 Text Nov
	# Row 50
	Set string value... 50 Key Dec
	Set string value... 50 Text Dec
	# Row 51
	Set string value... 51 Key numJan
	Set string value... 51 Text 01
	# Row 52
	Set string value... 52 Key numFeb
	Set string value... 52 Text 02
	# Row 53
	Set string value... 53 Key numMar
	Set string value... 53 Text 03
	# Row 54
	Set string value... 54 Key numApr
	Set string value... 54 Text 04
	# Row 55
	Set string value... 55 Key numMay
	Set string value... 55 Text 05
	# Row 56
	Set string value... 56 Key numJun
	Set string value... 56 Text 06
	# Row 57
	Set string value... 57 Key numJul
	Set string value... 57 Text 07
	# Row 58
	Set string value... 58 Key numAug
	Set string value... 58 Text 08
	# Row 59
	Set string value... 59 Key numSep
	Set string value... 59 Text 09
	# Row 60
	Set string value... 60 Key numOct
	Set string value... 60 Text 10
	# Row 61
	Set string value... 61 Key numNov
	Set string value... 61 Text 11
	# Row 62
	Set string value... 62 Key numDec
	Set string value... 62 Text 12
endproc

procCreatePrintSignal_JA$ = "PrintSignal_JA"
procedure CreatePrintSignal_JA
	Create Table with column names... PrintSignal_JA 62
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Auteur R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2014 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Waveform
	Set string value... 4 Text Waveform
	# Row 5
	Set string value... 5 Key Spectrogram
	Set string value... 5 Text Spectrogram
	# Row 6
	Set string value... 6 Key Ltas
	Set string value... 6 Text Ltas
	# Row 7
	Set string value... 7 Key Pitch
	Set string value... 7 Text Pitch
	# Row 8
	Set string value... 8 Key seconds
	Set string value... 8 Text seconds
	# Row 9
	Set string value... 9 Key time
	Set string value... 9 Text time -> s
	# Row 10
	Set string value... 10 Key Frequency
	Set string value... 10 Text Frequency -> Hz
	# Row 11
	Set string value... 11 Key Hz
	Set string value... 11 Text Hz
	# Row 12
	Set string value... 12 Key SPL
	Set string value... 12 Text SPL dB/Hz
	# Row 13
	Set string value... 13 Key AST
	Set string value... 13 Text AST
	# Row 14
	Set string value... 14 Key CompAST
	Set string value... 14 Text cmp
	# Row 15
	Set string value... 15 Key Rating.quality
	Set string value... 15 Text VQ
	# Row 16
	Set string value... 16 Key Rating.impression
	Set string value... 16 Text Imp
	# Row 17
	Set string value... 17 Key Rating.noise
	Set string value... 17 Text N
	# Row 18
	Set string value... 18 Key Rating.fluency
	Set string value... 18 Text Fl
	# Row 19
	Set string value... 19 Key Rating.voice
	Set string value... 19 Text Vo
	# Row 20
	Set string value... 20 Key Rating.continuity
	Set string value... 20 Text Cont
	# Row 21
	Set string value... 21 Key Rating.intelligibility
	Set string value... 21 Text Int
	# Row 22
	Set string value... 22 Key Rating.grade
	Set string value... 22 Text G
	# Row 23
	Set string value... 23 Key Rating.roughness
	Set string value... 23 Text R
	# Row 24
	Set string value... 24 Key Rating.breathiness
	Set string value... 24 Text B
	# Row 25
	Set string value... 25 Key Rating.asthenia
	Set string value... 25 Text A
	# Row 26
	Set string value... 26 Key Rating.strain
	Set string value... 26 Text S
	# Row 27
	Set string value... 27 Key CompVQ
	Set string value... 27 Text cmp
	# Row 28
	Set string value... 28 Key Jitter
	Set string value... 28 Text Jitter
	# Row 29
	Set string value... 29 Key Shimmer
	Set string value... 29 Text Shimmer
	# Row 30
	Set string value... 30 Key Mean
	Set string value... 30 Text Mean
	# Row 31
	Set string value... 31 Key SD
	Set string value... 31 Text SD
	# Row 32
	Set string value... 32 Key Mon
	Set string value... 32 Text Mon
	# Row 33
	Set string value... 33 Key Tue
	Set string value... 33 Text Tue
	# Row 34
	Set string value... 34 Key Wed
	Set string value... 34 Text Wed
	# Row 35
	Set string value... 35 Key Thu
	Set string value... 35 Text Thu
	# Row 36
	Set string value... 36 Key Fri
	Set string value... 36 Text Fri
	# Row 37
	Set string value... 37 Key Sat
	Set string value... 37 Text Sat
	# Row 38
	Set string value... 38 Key Sun
	Set string value... 38 Text Sun
	# Row 39
	Set string value... 39 Key Jan
	Set string value... 39 Text Jan
	# Row 40
	Set string value... 40 Key Feb
	Set string value... 40 Text Feb
	# Row 41
	Set string value... 41 Key Mar
	Set string value... 41 Text Mar
	# Row 42
	Set string value... 42 Key Apr
	Set string value... 42 Text Apr
	# Row 43
	Set string value... 43 Key May
	Set string value... 43 Text May
	# Row 44
	Set string value... 44 Key Jun
	Set string value... 44 Text Jun
	# Row 45
	Set string value... 45 Key Jul
	Set string value... 45 Text Jul
	# Row 46
	Set string value... 46 Key Aug
	Set string value... 46 Text Aug
	# Row 47
	Set string value... 47 Key Sep
	Set string value... 47 Text Sep
	# Row 48
	Set string value... 48 Key Oct
	Set string value... 48 Text Oct
	# Row 49
	Set string value... 49 Key Nov
	Set string value... 49 Text Nov
	# Row 50
	Set string value... 50 Key Dec
	Set string value... 50 Text Dec
	# Row 51
	Set string value... 51 Key numJan
	Set string value... 51 Text 01
	# Row 52
	Set string value... 52 Key numFeb
	Set string value... 52 Text 02
	# Row 53
	Set string value... 53 Key numMar
	Set string value... 53 Text 03
	# Row 54
	Set string value... 54 Key numApr
	Set string value... 54 Text 04
	# Row 55
	Set string value... 55 Key numMay
	Set string value... 55 Text 05
	# Row 56
	Set string value... 56 Key numJun
	Set string value... 56 Text 06
	# Row 57
	Set string value... 57 Key numJul
	Set string value... 57 Text 07
	# Row 58
	Set string value... 58 Key numAug
	Set string value... 58 Text 08
	# Row 59
	Set string value... 59 Key numSep
	Set string value... 59 Text 09
	# Row 60
	Set string value... 60 Key numOct
	Set string value... 60 Text 10
	# Row 61
	Set string value... 61 Key numNov
	Set string value... 61 Text 11
	# Row 62
	Set string value... 62 Key numDec
	Set string value... 62 Text 12
endproc

procCreatePrintSignal_NL$ = "PrintSignal_NL"
procedure CreatePrintSignal_NL
	Create Table with column names... PrintSignal_NL 62
	... Key Text
	# Fill table values
	# Row 1
	Set string value... 1 Key !Author
	Set string value... 1 Text Auteur R.J.J.H. van Son
	# Row 2
	Set string value... 2 Key !Copyright
	Set string value... 2 Text Copyright \co 2014 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Key !License
	Set string value... 3 Text License GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Key Waveform
	Set string value... 4 Text Golfvorm
	# Row 5
	Set string value... 5 Key Spectrogram
	Set string value... 5 Text Spectrogram
	# Row 6
	Set string value... 6 Key Ltas
	Set string value... 6 Text Ltas
	# Row 7
	Set string value... 7 Key Pitch
	Set string value... 7 Text Toonhoogte
	# Row 8
	Set string value... 8 Key seconds
	Set string value... 8 Text seconden
	# Row 9
	Set string value... 9 Key time
	Set string value... 9 Text tijd -> s
	# Row 10
	Set string value... 10 Key Frequency
	Set string value... 10 Text Frekwentie -> Hz
	# Row 11
	Set string value... 11 Key Hz
	Set string value... 11 Text Hz
	# Row 12
	Set string value... 12 Key SPL
	Set string value... 12 Text SPL dB/Hz
	# Row 13
	Set string value... 13 Key AST
	Set string value... 13 Text AST
	# Row 14
	Set string value... 14 Key CompAST
	Set string value... 14 Text cmp
	# Row 15
	Set string value... 15 Key Rating.quality
	Set string value... 15 Text VQ
	# Row 16
	Set string value... 16 Key CompVQ
	Set string value... 16 Text cmp
	# Row 17
	Set string value... 17 Key Rating.impression
	Set string value... 17 Text Imp
	# Row 18
	Set string value... 18 Key Rating.fluency
	Set string value... 18 Text Fl
	# Row 19
	Set string value... 19 Key Rating.voice
	Set string value... 19 Text Vo
	# Row 20
	Set string value... 20 Key Rating.noise
	Set string value... 20 Text N
	# Row 21
	Set string value... 21 Key Rating.continuity
	Set string value... 21 Text Cont
	# Row 22
	Set string value... 22 Key Rating.intelligibility
	Set string value... 22 Text Int
	# Row 23
	Set string value... 23 Key Rating.grade
	Set string value... 23 Text G
	# Row 24
	Set string value... 24 Key Rating.roughness
	Set string value... 24 Text R
	# Row 25
	Set string value... 25 Key Rating.breathiness
	Set string value... 25 Text B
	# Row 26
	Set string value... 26 Key Rating.asthenia
	Set string value... 26 Text A
	# Row 27
	Set string value... 27 Key Rating.strain
	Set string value... 27 Text S
	# Row 28
	Set string value... 28 Key Jitter
	Set string value... 28 Text Jitter
	# Row 29
	Set string value... 29 Key Shimmer
	Set string value... 29 Text Shimmer
	# Row 30
	Set string value... 30 Key Mean
	Set string value... 30 Text Mean
	# Row 31
	Set string value... 31 Key SD
	Set string value... 31 Text SD
	# Row 32
	Set string value... 32 Key Mon
	Set string value... 32 Text Ma
	# Row 33
	Set string value... 33 Key Tue
	Set string value... 33 Text Di
	# Row 34
	Set string value... 34 Key Wed
	Set string value... 34 Text Wo
	# Row 35
	Set string value... 35 Key Thu
	Set string value... 35 Text Do
	# Row 36
	Set string value... 36 Key Fri
	Set string value... 36 Text Vr
	# Row 37
	Set string value... 37 Key Sat
	Set string value... 37 Text Za
	# Row 38
	Set string value... 38 Key Sun
	Set string value... 38 Text Zo
	# Row 39
	Set string value... 39 Key Jan
	Set string value... 39 Text Jan
	# Row 40
	Set string value... 40 Key Feb
	Set string value... 40 Text Feb
	# Row 41
	Set string value... 41 Key Mar
	Set string value... 41 Text Maa
	# Row 42
	Set string value... 42 Key Apr
	Set string value... 42 Text Apr
	# Row 43
	Set string value... 43 Key May
	Set string value... 43 Text Mei
	# Row 44
	Set string value... 44 Key Jun
	Set string value... 44 Text Jun
	# Row 45
	Set string value... 45 Key Jul
	Set string value... 45 Text Jul
	# Row 46
	Set string value... 46 Key Aug
	Set string value... 46 Text Aug
	# Row 47
	Set string value... 47 Key Sep
	Set string value... 47 Text Sep
	# Row 48
	Set string value... 48 Key Oct
	Set string value... 48 Text Okt
	# Row 49
	Set string value... 49 Key Nov
	Set string value... 49 Text Nov
	# Row 50
	Set string value... 50 Key Dec
	Set string value... 50 Text Dec
	# Row 51
	Set string value... 51 Key numJan
	Set string value... 51 Text 01
	# Row 52
	Set string value... 52 Key numFeb
	Set string value... 52 Text 02
	# Row 53
	Set string value... 53 Key numMar
	Set string value... 53 Text 03
	# Row 54
	Set string value... 54 Key numApr
	Set string value... 54 Text 04
	# Row 55
	Set string value... 55 Key numMay
	Set string value... 55 Text 05
	# Row 56
	Set string value... 56 Key numJun
	Set string value... 56 Text 06
	# Row 57
	Set string value... 57 Key numJul
	Set string value... 57 Text 07
	# Row 58
	Set string value... 58 Key numAug
	Set string value... 58 Text 08
	# Row 59
	Set string value... 59 Key numSep
	Set string value... 59 Text 09
	# Row 60
	Set string value... 60 Key numOct
	Set string value... 60 Text 10
	# Row 61
	Set string value... 61 Key numNov
	Set string value... 61 Text 11
	# Row 62
	Set string value... 62 Key numDec
	Set string value... 62 Text 12
endproc

procCreateRatingA$ = "RatingA"
procedure CreateRatingA
	Create Table with column names... RatingA 12
	... Label LeftX RightX LowY HighY Color Draw Link Value
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	Set string value... 1 Link -
	Set string value... 1 Value 
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	Set string value... 2 Link -
	Set string value... 2 Value 
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	Set string value... 3 Link -
	Set string value... 3 Value 
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 25
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	Set string value... 4 Link -
	Set string value... 4 Value 
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 80
	Set string value... 5 LowY 90
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	Set string value... 5 Link -
	Set string value... 5 Value 
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 LeftX 5
	Set string value... 6 RightX 80
	Set string value... 6 LowY 81
	Set string value... 6 HighY +4
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	Set string value... 6 Link -
	Set string value... 6 Value 
	# Row 7
	Set string value... 7 Label >Fluency
	Set string value... 7 LeftX 5
	Set string value... 7 RightX 80
	Set string value... 7 LowY 71
	Set string value... 7 HighY +4
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	Set string value... 7 Link -
	Set string value... 7 Value 
	# Row 8
	Set string value... 8 Label >Continuity
	Set string value... 8 LeftX 5
	Set string value... 8 RightX 80
	Set string value... 8 LowY 61
	Set string value... 8 HighY +4
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	Set string value... 8 Link -
	Set string value... 8 Value 
	# Row 9
	Set string value... 9 Label >Hypertonicity
	Set string value... 9 LeftX 5
	Set string value... 9 RightX 80
	Set string value... 9 LowY 51
	Set string value... 9 HighY +4
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	Set string value... 9 Link Tonicity
	Set string value... 9 Value 1
	# Row 10
	Set string value... 10 Label >Hypotonicity
	Set string value... 10 LeftX 5
	Set string value... 10 RightX 80
	Set string value... 10 LowY 41
	Set string value... 10 HighY +4
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	Set string value... 10 Link Tonicity
	Set string value... 10 Value 1
	# Row 11
	Set string value... 11 Label >Noise
	Set string value... 11 LeftX 5
	Set string value... 11 RightX 80
	Set string value... 11 LowY 31
	Set string value... 11 HighY +4
	Set string value... 11 Color Black
	Set string value... 11 Draw DrawNull
	Set string value... 11 Link -
	Set string value... 11 Value 
	# Row 12
	Set string value... 12 Label Help
	Set string value... 12 LeftX 70
	Set string value... 12 RightX 85
	Set string value... 12 LowY 25
	Set string value... 12 HighY +5
	Set string value... 12 Color Black
	Set string value... 12 Draw DrawNull
	Set string value... 12 Link -
	Set string value... 12 Value 
endproc

procCreateRatingA_DE$ = "RatingA_DE"
procedure CreateRatingA_DE
	Create Table with column names... RatingA_DE 12
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Zeichenbereich
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Fluency
	Set string value... 7 Text Fluency
	Set string value... 7 Key   Non-fluent;Fluent 
	Set string value... 7 Helptext Refers to the fluency of the speech, i.e., is speech steady or unsteady
	# Row 8
	Set string value... 8 Label >Continuity
	Set string value... 8 Text Phonation continuity (\% voiced)
	Set string value... 8 Key   0\% ;100\% 
	Set string value... 8 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 9
	Set string value... 9 Label >Hypertonicity
	Set string value... 9 Text %%Hyper%tonicity
	Set string value... 9 Key %%Hyper%tonic;Not hyper
	Set string value... 9 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hyper%tonic (left) - Normal (right) on this scale
	# Row 10
	Set string value... 10 Label >Hypotonicity
	Set string value... 10 Text %%Hypo%tonicity
	Set string value... 10 Key %%Hypo%tonic;Not hypo
	Set string value... 10 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hypo%tonic (left) - Normal (right) on this scale
	# Row 11
	Set string value... 11 Label >Noise
	Set string value... 11 Text Noise
	Set string value... 11 Key Noise;No noise
	Set string value... 11 Helptext Noise: The amount of audible noise during speech
	# Row 12
	Set string value... 12 Label Help
	Set string value... 12 Text Scale Hilfe
	Set string value... 12 Key #
	Set string value... 12 Helptext Dr\u"cken Sie auf die Scale \u"ber den Sie Informationen m\o"chten. Dr\u"cken Sie danach auf "Hilfe".
endproc

procCreateRatingA_EN$ = "RatingA_EN"
procedure CreateRatingA_EN
	Create Table with column names... RatingA_EN 12
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Fluency
	Set string value... 7 Text Fluency
	Set string value... 7 Key   Non-fluent;Fluent 
	Set string value... 7 Helptext Refers to the fluency of the speech, i.e., is speech steady or unsteady
	# Row 8
	Set string value... 8 Label >Continuity
	Set string value... 8 Text Phonation continuity (\% voiced)
	Set string value... 8 Key   0\% ;100\% 
	Set string value... 8 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 9
	Set string value... 9 Label >Hypertonicity
	Set string value... 9 Text %%Hyper%tonicity
	Set string value... 9 Key %%Hyper%tonic;Not hyper
	Set string value... 9 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hyper%tonic (left) - Normal (right) on this scale
	# Row 10
	Set string value... 10 Label >Hypotonicity
	Set string value... 10 Text %%Hypo%tonicity
	Set string value... 10 Key %%Hypo%tonic;Not hypo
	Set string value... 10 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hypo%tonic (left) - Normal (right) on this scale
	# Row 11
	Set string value... 11 Label >Noise
	Set string value... 11 Text Noise
	Set string value... 11 Key Noise;No noise
	Set string value... 11 Helptext Noise: The amount of audible noise during speech
	# Row 12
	Set string value... 12 Label Help
	Set string value... 12 Text Scale Help
	Set string value... 12 Key #
	Set string value... 12 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingA_ES$ = "RatingA_ES"
procedure CreateRatingA_ES
	Create Table with column names... RatingA_ES 12
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Fluency
	Set string value... 7 Text Fluency
	Set string value... 7 Key   Non-fluent;Fluent 
	Set string value... 7 Helptext Refers to the fluency of the speech, i.e., is speech steady or unsteady
	# Row 8
	Set string value... 8 Label >Continuity
	Set string value... 8 Text Phonation continuity (\% voiced)
	Set string value... 8 Key   0\% ;100\% 
	Set string value... 8 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 9
	Set string value... 9 Label >Hypertonicity
	Set string value... 9 Text %%Hyper%tonicity
	Set string value... 9 Key %%Hyper%tonic;Not hyper
	Set string value... 9 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hyper%tonic (left) - Normal (right) on this scale
	# Row 10
	Set string value... 10 Label >Hypotonicity
	Set string value... 10 Text %%Hypo%tonicity
	Set string value... 10 Key %%Hypo%tonic;Not hypo
	Set string value... 10 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hypo%tonic (left) - Normal (right) on this scale
	# Row 11
	Set string value... 11 Label >Noise
	Set string value... 11 Text Noise
	Set string value... 11 Key Noise;No noise
	Set string value... 11 Helptext Noise: The amount of audible noise during speech
	# Row 12
	Set string value... 12 Label Help
	Set string value... 12 Text Scale Help
	Set string value... 12 Key #
	Set string value... 12 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingA_NL$ = "RatingA_NL"
procedure CreateRatingA_NL
	Create Table with column names... RatingA_NL 12
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Tekenvenster
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Fluency
	Set string value... 7 Text Fluency
	Set string value... 7 Key   Non-fluent;Fluent 
	Set string value... 7 Helptext Refers to the fluency of the speech, i.e., is speech steady or unsteady
	# Row 8
	Set string value... 8 Label >Continuity
	Set string value... 8 Text Phonation continuity (\% voiced)
	Set string value... 8 Key   0\% ;100\% 
	Set string value... 8 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 9
	Set string value... 9 Label >Hypertonicity
	Set string value... 9 Text %%Hyper%tonicity
	Set string value... 9 Key %%Hyper%tonic;Not hyper
	Set string value... 9 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hyper%tonic (left) - Normal (right) on this scale
	# Row 10
	Set string value... 10 Label >Hypotonicity
	Set string value... 10 Text %%Hypo%tonicity
	Set string value... 10 Key %%Hypo%tonic;Not hypo
	Set string value... 10 Helptext Hypertonic vs Hypotonic: Scale is split into two with %%Hypo%tonic (left) - Normal (right) on this scale
	# Row 11
	Set string value... 11 Label >Noise
	Set string value... 11 Text Noise
	Set string value... 11 Key Noise;No noise
	Set string value... 11 Helptext Noise: The amount of audible noise during speech
	# Row 12
	Set string value... 12 Label Help
	Set string value... 12 Text Schaal Help
	Set string value... 12 Key #
	Set string value... 12 Helptext Klik op de schaal waar u informatie over wilt hebben, "Help" als u verder wilt
endproc

procCreateRatingGRBAS$ = "RatingGRBAS"
procedure CreateRatingGRBAS
	Create Table with column names... RatingGRBAS 11
	... Label LeftX RightX LowY HighY Color Draw
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 25
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 80
	Set string value... 5 LowY 90
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	# Row 6
	Set string value... 6 Label >Grade
	Set string value... 6 LeftX 5
	Set string value... 6 RightX 80
	Set string value... 6 LowY 81
	Set string value... 6 HighY +4
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	# Row 7
	Set string value... 7 Label >Roughness
	Set string value... 7 LeftX 5
	Set string value... 7 RightX 80
	Set string value... 7 LowY 71
	Set string value... 7 HighY +4
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	# Row 8
	Set string value... 8 Label >Breathiness
	Set string value... 8 LeftX 5
	Set string value... 8 RightX 80
	Set string value... 8 LowY 61
	Set string value... 8 HighY +4
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	# Row 9
	Set string value... 9 Label >Asthenia
	Set string value... 9 LeftX 5
	Set string value... 9 RightX 80
	Set string value... 9 LowY 51
	Set string value... 9 HighY +4
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	# Row 10
	Set string value... 10 Label >Strain
	Set string value... 10 LeftX 5
	Set string value... 10 RightX 80
	Set string value... 10 LowY 41
	Set string value... 10 HighY +4
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	# Row 11
	Set string value... 11 Label Help
	Set string value... 11 LeftX 70
	Set string value... 11 RightX 85
	Set string value... 11 LowY 20
	Set string value... 11 HighY +5
	Set string value... 11 Color Black
	Set string value... 11 Draw DrawNull
endproc

procCreateRatingGRBASPlus$ = "RatingGRBASPlus"
procedure CreateRatingGRBASPlus
	Create Table with column names... RatingGRBASPlus 16
	... Label LeftX RightX LowY HighY Color Draw
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 20
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 80
	Set string value... 5 LowY 93
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	# Row 6
	Set string value... 6 Label >Intelligibility
	Set string value... 6 LeftX 5
	Set string value... 6 RightX 80
	Set string value... 6 LowY 87
	Set string value... 6 HighY +3
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	# Row 7
	Set string value... 7 Label >Articulation
	Set string value... 7 LeftX 5
	Set string value... 7 RightX 80
	Set string value... 7 LowY 81
	Set string value... 7 HighY +3
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	# Row 8
	Set string value... 8 Label >Grade
	Set string value... 8 LeftX 5
	Set string value... 8 RightX 80
	Set string value... 8 LowY 74
	Set string value... 8 HighY +3
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	# Row 9
	Set string value... 9 Label >Roughness
	Set string value... 9 LeftX 5
	Set string value... 9 RightX 80
	Set string value... 9 LowY 68
	Set string value... 9 HighY +3
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	# Row 10
	Set string value... 10 Label >Breathiness
	Set string value... 10 LeftX 5
	Set string value... 10 RightX 80
	Set string value... 10 LowY 62
	Set string value... 10 HighY +3
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	# Row 11
	Set string value... 11 Label >Asthenia
	Set string value... 11 LeftX 5
	Set string value... 11 RightX 80
	Set string value... 11 LowY 56
	Set string value... 11 HighY +3
	Set string value... 11 Color Black
	Set string value... 11 Draw DrawNull
	# Row 12
	Set string value... 12 Label >Strain
	Set string value... 12 LeftX 5
	Set string value... 12 RightX 80
	Set string value... 12 LowY 50
	Set string value... 12 HighY +3
	Set string value... 12 Color Black
	Set string value... 12 Draw DrawNull
	# Row 13
	Set string value... 13 Label >Nasality
	Set string value... 13 LeftX 5
	Set string value... 13 RightX 80
	Set string value... 13 LowY 43
	Set string value... 13 HighY +3
	Set string value... 13 Color Black
	Set string value... 13 Draw DrawNull
	# Row 14
	Set string value... 14 Label >Prosody
	Set string value... 14 LeftX 5
	Set string value... 14 RightX 80
	Set string value... 14 LowY 37
	Set string value... 14 HighY +3
	Set string value... 14 Color Black
	Set string value... 14 Draw DrawNull
	# Row 15
	Set string value... 15 Label >Accent
	Set string value... 15 LeftX 5
	Set string value... 15 RightX 80
	Set string value... 15 LowY 31
	Set string value... 15 HighY +3
	Set string value... 15 Color Black
	Set string value... 15 Draw DrawNull
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 LeftX 70
	Set string value... 16 RightX 85
	Set string value... 16 LowY 25
	Set string value... 16 HighY +4
	Set string value... 16 Color Black
	Set string value... 16 Draw DrawNull
endproc

procCreateRatingGRBASPlus_EN$ = "RatingGRBASPlus_EN"
procedure CreateRatingGRBASPlus_EN
	Create Table with column names... RatingGRBASPlus_EN 16
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Intelligibility
	Set string value... 6 Text Intelligibility
	Set string value... 6 Key Poor;Good
	Set string value... 6 Helptext The impression of intelligibility
	# Row 7
	Set string value... 7 Label >Articulation
	Set string value... 7 Text Articulation
	Set string value... 7 Key Imprecise;Good
	Set string value... 7 Helptext Articulation is precise or imprecise
	# Row 8
	Set string value... 8 Label >Grade
	Set string value... 8 Text Grade
	Set string value... 8 Key Poor;Good
	Set string value... 8 Helptext GRADE: The degree of hoarseness, amount of noise in the produced sound
	# Row 9
	Set string value... 9 Label >Roughness
	Set string value... 9 Text Roughness
	Set string value... 9 Key Poor;Good
	Set string value... 9 Helptext ROUGHNESS: The grade of roughness, in relation to the irregular fluctuation of the fundamental frequency
	# Row 10
	Set string value... 10 Label >Breathiness
	Set string value... 10 Text Breathiness
	Set string value... 10 Key Poor;Good
	Set string value... 10 Helptext BREATHINESS: Grade of breathiness, the fraction of the non-modulated turbulence noise in the produced sound
	# Row 11
	Set string value... 11 Label >Asthenia
	Set string value... 11 Text Asthenia
	Set string value... 11 Key   Poor;Good
	Set string value... 11 Helptext ASTHENIA: The overall weakness of voice
	# Row 12
	Set string value... 12 Label >Strain
	Set string value... 12 Text Strain
	Set string value... 12 Key Poor;Good
	Set string value... 12 Helptext STRAIN: Strained quality, (tenseness of voice, overall muscular tension)
	# Row 13
	Set string value... 13 Label >Nasality
	Set string value... 13 Text Nasality
	Set string value... 13 Key Poor;Good
	Set string value... 13 Helptext Nasality: Nasal segments are pronounced nasal, non-nasel sounds are not nasalized
	# Row 14
	Set string value... 14 Label >Prosody
	Set string value... 14 Text Prosody
	Set string value... 14 Key Monotonous;Normal
	Set string value... 14 Helptext The speaker speaks in a monotoneous voice or a normal prosody
	# Row 15
	Set string value... 15 Label >Accent
	Set string value... 15 Text Accent
	Set string value... 15 Key Strong;None
	Set string value... 15 Helptext Accent: The speaker speaks with a strong accent or dialect
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text Scale Help
	Set string value... 16 Key #
	Set string value... 16 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingGRBASPlus_NL$ = "RatingGRBASPlus_NL"
procedure CreateRatingGRBASPlus_NL
	Create Table with column names... RatingGRBASPlus_NL 16
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Kies een gradering op de lijn tussen links (slecht) en rechts (goed/normaal) beoordeling van de spraak of stem
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Intelligibility
	Set string value... 6 Text Spraak verstaanbaarheid
	Set string value... 6 Key Slecht;Goed
	Set string value... 6 Helptext SPRAAKVERSTAAN: De mate waarin spraak in een ruimte wordt verstaan. 
	# Row 7
	Set string value... 7 Label >Articulation
	Set string value... 7 Text Articulatie
	Set string value... 7 Key Onnauwkeurig;Nauwkeurig
	Set string value... 7 Helptext ARTICULATIE: De nauwkeurigheid van de articulatie. 
	# Row 8
	Set string value... 8 Label >Grade
	Set string value... 8 Text Algemene stemkwaliteit
	Set string value... 8 Key Slecht;Goed
	Set string value... 8 Helptext STEMKWALITEIT: De algemene indruk van het stemgeluid/kwaliteit van de stem.
	# Row 9
	Set string value... 9 Label >Roughness
	Set string value... 9 Text Schorheid
	Set string value... 9 Key Slecht;Goed
	Set string value... 9 Helptext SCHORHEID: Rauwheid, ruwheid, krakerigheid, indruk van onregelmatigheid in de glottispulsen
	# Row 10
	Set string value... 10 Label >Breathiness
	Set string value... 10 Text Heesheid
	Set string value... 10 Key Slecht;Goed
	Set string value... 10 Helptext HEESHEID: Hoorbare turbulente luchtruis inclusief afone momenten en aangeblazen steminzetten
	# Row 11
	Set string value... 11 Label >Asthenia
	Set string value... 11 Text Astheniciteit
	Set string value... 11 Key Slecht;Goed
	Set string value... 11 Helptext ASTHENICITEIT: Stemzwakte, hypotone / hypokinetische / adynamische stemgeving
	# Row 12
	Set string value... 12 Label >Strain
	Set string value... 12 Text Geknepenheid
	Set string value... 12 Key Slecht;Goed
	Set string value... 12 Helptext GEKNEPENHEID/INSPANNING: Geforceerde, geperste of geknepen stemgeving
	# Row 13
	Set string value... 13 Label >Nasality
	Set string value... 13 Text Nasaliteit
	Set string value... 13 Key Slecht;Goed
	Set string value... 13 Helptext NASALITEIT: Neusspraak. Nasale klanken zijn nasaal en niet nasale zijn niet genasaliseerd.
	# Row 14
	Set string value... 14 Label >Prosody
	Set string value... 14 Text Prosodie
	Set string value... 14 Key Vlak;Gevariëerd
	Set string value... 14 Helptext PROSODIE: Het ritme, de klemtoon en de intonatie van de stem
	# Row 15
	Set string value... 15 Label >Accent
	Set string value... 15 Text Accent
	Set string value... 15 Key Sterk;Geen
	Set string value... 15 Helptext ACCENT/DIALECT: De spreker spreekt met een sterk/geen accent of dialect.
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text Schaal Help
	Set string value... 16 Key #
	Set string value... 16 Helptext Druk op de schaal waar u informatie over wilt hebben, Help als u verder wilt
endproc

procCreateRatingGRBAS_EN$ = "RatingGRBAS_EN"
procedure CreateRatingGRBAS_EN
	Create Table with column names... RatingGRBAS_EN 11
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Grade
	Set string value... 6 Text Grade
	Set string value... 6 Key 0;1
	Set string value... 6 Helptext GRADE: The degree of hoarseness, amount of noise in the produced sound
	# Row 7
	Set string value... 7 Label >Roughness
	Set string value... 7 Text Roughness
	Set string value... 7 Key 0;1
	Set string value... 7 Helptext ROUGHNESS: The grade of roughness, in relation to the irregular fluctuation of the fundamental frequency
	# Row 8
	Set string value... 8 Label >Breathiness
	Set string value... 8 Text Breathiness
	Set string value... 8 Key 0;1
	Set string value... 8 Helptext BREATHINESS: Grade of breathiness, the fraction of the non-modulated turbulence noise in the produced sound
	# Row 9
	Set string value... 9 Label >Asthenia
	Set string value... 9 Text Asthenia
	Set string value... 9 Key   0;1
	Set string value... 9 Helptext ASTHENIA: The overall weakness of voice
	# Row 10
	Set string value... 10 Label >Strain
	Set string value... 10 Text Strain
	Set string value... 10 Key 0;1
	Set string value... 10 Helptext STRAIN: Strained quality, (tenseness of voice, overall muscular tension)
	# Row 11
	Set string value... 11 Label Help
	Set string value... 11 Text Scale Help
	Set string value... 11 Key #
	Set string value... 11 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingINFVo$ = "RatingINFVo"
procedure CreateRatingINFVo
	Create Table with column names... RatingINFVo 11
	... Label LeftX RightX LowY HighY Color Draw
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 25
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 80
	Set string value... 5 LowY 90
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	# Row 6
	Set string value... 6 Label >Impression
	Set string value... 6 LeftX 5
	Set string value... 6 RightX +75
	Set string value... 6 LowY 81
	Set string value... 6 HighY +4
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	# Row 7
	Set string value... 7 Label >Intelligibility
	Set string value... 7 LeftX 5
	Set string value... 7 RightX +75
	Set string value... 7 LowY 71
	Set string value... 7 HighY +4
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	# Row 8
	Set string value... 8 Label >Fluency
	Set string value... 8 LeftX 5
	Set string value... 8 RightX +75
	Set string value... 8 LowY 61
	Set string value... 8 HighY +4
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	# Row 9
	Set string value... 9 Label >Voice
	Set string value... 9 LeftX 5
	Set string value... 9 RightX +75
	Set string value... 9 LowY 51
	Set string value... 9 HighY +4
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	# Row 10
	Set string value... 10 Label >Noise
	Set string value... 10 LeftX 5
	Set string value... 10 RightX +75
	Set string value... 10 LowY 41
	Set string value... 10 HighY +4
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	# Row 11
	Set string value... 11 Label Help
	Set string value... 11 LeftX 70
	Set string value... 11 RightX +15
	Set string value... 11 LowY 25
	Set string value... 11 HighY +5
	Set string value... 11 Color Black
	Set string value... 11 Draw DrawNull
endproc

procCreateRatingINFVo_DE$ = "RatingINFVo_DE"
procedure CreateRatingINFVo_DE
	Create Table with column names... RatingINFVo_DE 11
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Impression
	Set string value... 6 Text Impression of Voice (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 7
	Set string value... 7 Label >Intelligibility
	Set string value... 7 Text Intelligibility
	Set string value... 7 Key Poor;Good
	Set string value... 7 Helptext The impression of intelligibility
	# Row 8
	Set string value... 8 Label >Fluency
	Set string value... 8 Text Speech fluency
	Set string value... 8 Key Disfluent;Fluent 
	Set string value... 8 Helptext The perceived smoothness of the sound production
	# Row 9
	Set string value... 9 Label >Voice
	Set string value... 9 Text Voice
	Set string value... 9 Key   Unsteady;Steady 
	Set string value... 9 Helptext Stability of voice production, are voiced phonemes voiced and unvoiced phonemes unvoiced 
	# Row 10
	Set string value... 10 Label >Noise
	Set string value... 10 Text Noise
	Set string value... 10 Key Noise;No noise
	Set string value... 10 Helptext The amount of annoyance caused by the audibility of uncontrolled noises produced during speech
	# Row 11
	Set string value... 11 Label Help
	Set string value... 11 Text Scale Help
	Set string value... 11 Key #
	Set string value... 11 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingINFVo_EN$ = "RatingINFVo_EN"
procedure CreateRatingINFVo_EN
	Create Table with column names... RatingINFVo_EN 11
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Impression
	Set string value... 6 Text Impression of Voice (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 7
	Set string value... 7 Label >Intelligibility
	Set string value... 7 Text Intelligibility
	Set string value... 7 Key Poor;Good
	Set string value... 7 Helptext The impression of intelligibility
	# Row 8
	Set string value... 8 Label >Fluency
	Set string value... 8 Text Speech fluency
	Set string value... 8 Key Disfluent;Fluent 
	Set string value... 8 Helptext The perceived smoothness of the sound production
	# Row 9
	Set string value... 9 Label >Voice
	Set string value... 9 Text Voice
	Set string value... 9 Key   Unsteady;Steady 
	Set string value... 9 Helptext Stability of voice production, are voiced phonemes voiced and unvoiced phonemes unvoiced 
	# Row 10
	Set string value... 10 Label >Noise
	Set string value... 10 Text Noise
	Set string value... 10 Key Noise;No noise
	Set string value... 10 Helptext The amount of annoyance caused by the audibility of uncontrolled noises produced during speech
	# Row 11
	Set string value... 11 Label Help
	Set string value... 11 Text Scale Help
	Set string value... 11 Key #
	Set string value... 11 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingINFVo_ES$ = "RatingINFVo_ES"
procedure CreateRatingINFVo_ES
	Create Table with column names... RatingINFVo_ES 11
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Impression
	Set string value... 6 Text Impression of Voice (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 7
	Set string value... 7 Label >Intelligibility
	Set string value... 7 Text Intelligibility
	Set string value... 7 Key Poor;Good
	Set string value... 7 Helptext The impression of intelligibility
	# Row 8
	Set string value... 8 Label >Fluency
	Set string value... 8 Text Speech fluency
	Set string value... 8 Key Disfluent;Fluent 
	Set string value... 8 Helptext The perceived smoothness of the sound production
	# Row 9
	Set string value... 9 Label >Voice
	Set string value... 9 Text Voice
	Set string value... 9 Key   Unsteady;Steady 
	Set string value... 9 Helptext Stability of voice production, are voiced phonemes voiced and unvoiced phonemes unvoiced 
	# Row 10
	Set string value... 10 Label >Noise
	Set string value... 10 Text Noise
	Set string value... 10 Key Noise;No noise
	Set string value... 10 Helptext The amount of annoyance caused by the audibility of uncontrolled noises produced during speech
	# Row 11
	Set string value... 11 Label Help
	Set string value... 11 Text Scale Help
	Set string value... 11 Key #
	Set string value... 11 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingINFVo_NL$ = "RatingINFVo_NL"
procedure CreateRatingINFVo_NL
	Create Table with column names... RatingINFVo_NL 11
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Impression
	Set string value... 6 Text Impression of Voice (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 7
	Set string value... 7 Label >Intelligibility
	Set string value... 7 Text Intelligibility
	Set string value... 7 Key Poor;Good
	Set string value... 7 Helptext The impression of intelligibility
	# Row 8
	Set string value... 8 Label >Fluency
	Set string value... 8 Text Speech fluency
	Set string value... 8 Key Disfluent;Fluent 
	Set string value... 8 Helptext The perceived smoothness of the sound production
	# Row 9
	Set string value... 9 Label >Voice
	Set string value... 9 Text Voice
	Set string value... 9 Key   Unsteady;Steady 
	Set string value... 9 Helptext Stability of voice production, are voiced phonemes voiced and unvoiced phonemes unvoiced 
	# Row 10
	Set string value... 10 Label >Noise
	Set string value... 10 Text Noise
	Set string value... 10 Key Noise;No noise
	Set string value... 10 Helptext The amount of annoyance caused by the audibility of uncontrolled noises produced during speech
	# Row 11
	Set string value... 11 Label Help
	Set string value... 11 Text Scale Help
	Set string value... 11 Key #
	Set string value... 11 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingNKIAVL_NL$ = "RatingNKIAVL_NL"
procedure CreateRatingNKIAVL_NL
	Create Table with column names... RatingNKIAVL_NL 8
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Impression
	Set string value... 6 Text Impression of overall voice quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 7
	Set string value... 7 Label >Intelligibility
	Set string value... 7 Text Intelligibility: Impression of the difficulty/ease of decoding the speech signal
	Set string value... 7 Key Poor;Good
	Set string value... 7 Helptext The impression of intelligibility. : A speaker with good intelligibility is easy to decode.
	# Row 8
	Set string value... 8 Label Help
	Set string value... 8 Text Scale Help
	Set string value... 8 Key #
	Set string value... 8 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingTEpair$ = "RatingTEpair"
procedure CreateRatingTEpair
	Create Table with column names... RatingTEpair 9
	... Label LeftX RightX LowY HighY Color Draw Link Value
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	Set string value... 1 Link -
	Set string value... 1 Value 
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	Set string value... 2 Link -
	Set string value... 2 Value 
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	Set string value... 3 Link -
	Set string value... 3 Value 
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 25
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	Set string value... 4 Link -
	Set string value... 4 Value 
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 80
	Set string value... 5 LowY 90
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	Set string value... 5 Link -
	Set string value... 5 Value 
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 LeftX 5
	Set string value... 6 RightX 80
	Set string value... 6 LowY 76
	Set string value... 6 HighY +4
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	Set string value... 6 Link -
	Set string value... 6 Value 
	# Row 7
	Set string value... 7 Label >Naturalness
	Set string value... 7 LeftX 5
	Set string value... 7 RightX 80
	Set string value... 7 LowY 58
	Set string value... 7 HighY +4
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	Set string value... 7 Link -
	Set string value... 7 Value 
	# Row 8
	Set string value... 8 Label !>Tightness
	Set string value... 8 LeftX 5
	Set string value... 8 RightX 80
	Set string value... 8 LowY 40
	Set string value... 8 HighY +4
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	Set string value... 8 Link -
	Set string value... 8 Value 
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 LeftX 70
	Set string value... 9 RightX 85
	Set string value... 9 LowY 25
	Set string value... 9 HighY +5
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	Set string value... 9 Link -
	Set string value... 9 Value 
endproc

procCreateRatingTEpair_DE$ = "RatingTEpair_DE"
procedure CreateRatingTEpair_DE
	Create Table with column names... RatingTEpair_DE 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (fragment A) and right (fragment B) which is closest to the description (center is "the same")
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text Which fragment sounds most like "real" TE speech and by how much (center is "equally")
	Set string value... 8 Key A;B
	Set string value... 8 Helptext TE-ness of voice
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Scale Help
	Set string value... 9 Key #
	Set string value... 9 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingTEpair_EN$ = "RatingTEpair_EN"
procedure CreateRatingTEpair_EN
	Create Table with column names... RatingTEpair_EN 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (fragment A) and right (fragment B) which is closest to the description (center is "the same")
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text Which fragment sounds most like "real" TE speech and by how much (center is "equally")
	Set string value... 8 Key A;B
	Set string value... 8 Helptext TE-ness of voice
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Scale Help
	Set string value... 9 Key #
	Set string value... 9 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingTEpair_ES$ = "RatingTEpair_ES"
procedure CreateRatingTEpair_ES
	Create Table with column names... RatingTEpair_ES 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (fragment A) and right (fragment B) which is closest to the description (center is "the same")
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text Which fragment sounds most like "real" TE speech and by how much (center is "equally")
	Set string value... 8 Key A;B
	Set string value... 8 Helptext TE-ness of voice
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Scale Help
	Set string value... 9 Key #
	Set string value... 9 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingTEpair_NL$ = "RatingTEpair_NL"
procedure CreateRatingTEpair_NL
	Create Table with column names... RatingTEpair_NL 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Kies een positie op de lijn tussen het eerste fragment (links, A) en het tweede fragment (rechts, B) het midden is "gelijk"
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text Welk fragment klinkt het beste als "echte" TE spraak, en hoeveel beter: aan de uiteinden "heel erg veel beter"
	Set string value... 8 Key A;B
	Set string value... 8 Helptext TE-ness of voice
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Schaal Hulp
	Set string value... 9 Key #
	Set string value... 9 Helptext Klik op de schaal waar u informatie over wilt, "Help" om verder te gaan
endproc

procCreateRatingTEsingle$ = "RatingTEsingle"
procedure CreateRatingTEsingle
	Create Table with column names... RatingTEsingle 9
	... Label LeftX RightX LowY HighY Color Draw Link Value
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	Set string value... 1 Link -
	Set string value... 1 Value 
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	Set string value... 2 Link -
	Set string value... 2 Value 
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	Set string value... 3 Link -
	Set string value... 3 Value 
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 25
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	Set string value... 4 Link -
	Set string value... 4 Value 
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 80
	Set string value... 5 LowY 90
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	Set string value... 5 Link -
	Set string value... 5 Value 
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 LeftX 5
	Set string value... 6 RightX 80
	Set string value... 6 LowY 76
	Set string value... 6 HighY +4
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	Set string value... 6 Link -
	Set string value... 6 Value 
	# Row 7
	Set string value... 7 Label >Naturalness
	Set string value... 7 LeftX 5
	Set string value... 7 RightX 80
	Set string value... 7 LowY 60
	Set string value... 7 HighY +4
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	Set string value... 7 Link -
	Set string value... 7 Value 
	# Row 8
	Set string value... 8 Label !>Tightness
	Set string value... 8 LeftX 5
	Set string value... 8 RightX 80
	Set string value... 8 LowY 40
	Set string value... 8 HighY +4
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	Set string value... 8 Link -
	Set string value... 8 Value 
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 LeftX 70
	Set string value... 9 RightX 85
	Set string value... 9 LowY 25
	Set string value... 9 HighY +5
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	Set string value... 9 Link -
	Set string value... 9 Value 
endproc

procCreateRatingTEsingle_DE$ = "RatingTEsingle_DE"
procedure CreateRatingTEsingle_DE
	Create Table with column names... RatingTEsingle_DE 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Kies een positie op de lijn tussen niet menselijk (links) en echte TE spraak (rechts)
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text klinkt het fragment synthetisch/niet menselijk (links), of als echte TE spraak (rechts)
	Set string value... 8 Key onmens;TE
	Set string value... 8 Helptext Is een oordeel over de afstand tot TE spraak
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Schaal Hulp
	Set string value... 9 Key #
	Set string value... 9 Helptext Klik op de schaal waar u informatie over wilt, "Help" om verder te gaan
endproc

procCreateRatingTEsingle_EN$ = "RatingTEsingle_EN"
procedure CreateRatingTEsingle_EN
	Create Table with column names... RatingTEsingle_EN 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Kies een positie op de lijn tussen niet menselijk (links) en echte TE spraak (rechts)
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text klinkt het fragment synthetisch/niet menselijk (links), of als echte TE spraak (rechts)
	Set string value... 8 Key onmens;TE
	Set string value... 8 Helptext Is een oordeel over de afstand tot TE spraak
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Schaal Hulp
	Set string value... 9 Key #
	Set string value... 9 Helptext Klik op de schaal waar u informatie over wilt, "Help" om verder te gaan
endproc

procCreateRatingTEsingle_ES$ = "RatingTEsingle_ES"
procedure CreateRatingTEsingle_ES
	Create Table with column names... RatingTEsingle_ES 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Kies een positie op de lijn tussen niet menselijk (links) en echte TE spraak (rechts)
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text klinkt het fragment synthetisch/niet menselijk (links), of als echte TE spraak (rechts)
	Set string value... 8 Key onmens;TE
	Set string value... 8 Helptext Is een oordeel over de afstand tot TE spraak
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Schaal Hulp
	Set string value... 9 Key #
	Set string value... 9 Helptext Klik op de schaal waar u informatie over wilt, "Help" om verder te gaan
endproc

procCreateRatingTEsingle_JA$ = "RatingTEsingle_JA"
procedure CreateRatingTEsingle_JA
	Create Table with column names... RatingTEsingle_JA 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Kies een positie op de lijn tussen niet menselijk (links) en echte TE spraak (rechts)
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text klinkt het fragment synthetisch/niet menselijk (links), of als echte TE spraak (rechts)
	Set string value... 8 Key onmens;TE
	Set string value... 8 Helptext Is een oordeel over de afstand tot TE spraak
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Schaal Hulp
	Set string value... 9 Key #
	Set string value... 9 Helptext Klik op de schaal waar u informatie over wilt, "Help" om verder te gaan
endproc

procCreateRatingTEsingle_NL$ = "RatingTEsingle_NL"
procedure CreateRatingTEsingle_NL
	Create Table with column names... RatingTEsingle_NL 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Kies een positie op de lijn tussen niet menselijk (links) en echte TE spraak (rechts)
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label !>Roughness
	Set string value... 6 Text Roughness: which fragment sounds more "Rough" and by how much (center is "equally")
	Set string value... 6 Key A;B
	Set string value... 6 Helptext Is a judgement of the roughness of a TE speaker
	# Row 7
	Set string value... 7 Label !>Tightness
	Set string value... 7 Text Tightness: which fragment sounds more "Tight" and by how much (center is "equally")
	Set string value... 7 Key A;B
	Set string value... 7 Helptext Is a judgement of tightness of a TE speaker
	# Row 8
	Set string value... 8 Label >Naturalness
	Set string value... 8 Text klinkt het fragment synthetisch/niet menselijk (links), of als echte TE spraak (rechts)
	Set string value... 8 Key onmens;TE
	Set string value... 8 Helptext Is een oordeel over de afstand tot TE spraak
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Schaal Hulp
	Set string value... 9 Key #
	Set string value... 9 Helptext Klik op de schaal waar u informatie over wilt, "Help" om verder te gaan
endproc

procCreateRatingText$ = "RatingText"
procedure CreateRatingText
	Create Table with column names... RatingText 25
	... Label LeftX RightX LowY HighY Color Draw
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 25
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	# Row 5
	Set string value... 5 Label $HuskinessTxt
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 60
	Set string value... 5 LowY 90
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	# Row 6
	Set string value... 6 Label ()Huskiness_0
	Set string value... 6 LeftX 15
	Set string value... 6 RightX +10
	Set string value... 6 LowY ^-4
	Set string value... 6 HighY +4
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	# Row 7
	Set string value... 7 Label ()Huskiness_1
	Set string value... 7 LeftX ^+10
	Set string value... 7 RightX +10
	Set string value... 7 LowY ^-0
	Set string value... 7 HighY +4
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	# Row 8
	Set string value... 8 Label ()Huskiness_2
	Set string value... 8 LeftX ^+10
	Set string value... 8 RightX +10
	Set string value... 8 LowY ^-0
	Set string value... 8 HighY +4
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	# Row 9
	Set string value... 9 Label ()Huskiness_3
	Set string value... 9 LeftX ^+10
	Set string value... 9 RightX +10
	Set string value... 9 LowY ^-0
	Set string value... 9 HighY +4
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	# Row 10
	Set string value... 10 Label $HoarsenessTxt
	Set string value... 10 LeftX 5
	Set string value... 10 RightX 60
	Set string value... 10 LowY 80
	Set string value... 10 HighY +5
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	# Row 11
	Set string value... 11 Label ()Hoarseness_0
	Set string value... 11 LeftX 15
	Set string value... 11 RightX +10
	Set string value... 11 LowY ^-4
	Set string value... 11 HighY +4
	Set string value... 11 Color Black
	Set string value... 11 Draw DrawNull
	# Row 12
	Set string value... 12 Label ()Hoarseness_1
	Set string value... 12 LeftX ^+10
	Set string value... 12 RightX +10
	Set string value... 12 LowY ^-0
	Set string value... 12 HighY +4
	Set string value... 12 Color Black
	Set string value... 12 Draw DrawNull
	# Row 13
	Set string value... 13 Label ()Hoarseness_2
	Set string value... 13 LeftX ^+10
	Set string value... 13 RightX +10
	Set string value... 13 LowY ^-0
	Set string value... 13 HighY +4
	Set string value... 13 Color Black
	Set string value... 13 Draw DrawNull
	# Row 14
	Set string value... 14 Label ()Hoarseness_3
	Set string value... 14 LeftX ^+10
	Set string value... 14 RightX +10
	Set string value... 14 LowY ^-0
	Set string value... 14 HighY +4
	Set string value... 14 Color Black
	Set string value... 14 Draw DrawNull
	# Row 15
	Set string value... 15 Label $NoiseTxt
	Set string value... 15 LeftX 5
	Set string value... 15 RightX 60
	Set string value... 15 LowY 70
	Set string value... 15 HighY +5
	Set string value... 15 Color Black
	Set string value... 15 Draw DrawNull
	# Row 16
	Set string value... 16 Label ()Noise_0
	Set string value... 16 LeftX 20
	Set string value... 16 RightX +10
	Set string value... 16 LowY ^-4
	Set string value... 16 HighY +4
	Set string value... 16 Color Black
	Set string value... 16 Draw DrawNull
	# Row 17
	Set string value... 17 Label ()Noise_1
	Set string value... 17 LeftX ^+10
	Set string value... 17 RightX +10
	Set string value... 17 LowY ^-0
	Set string value... 17 HighY +4
	Set string value... 17 Color Black
	Set string value... 17 Draw DrawNull
	# Row 18
	Set string value... 18 Label ()Noise_2
	Set string value... 18 LeftX ^+10
	Set string value... 18 RightX +10
	Set string value... 18 LowY ^-0
	Set string value... 18 HighY +4
	Set string value... 18 Color Black
	Set string value... 18 Draw DrawNull
	# Row 19
	Set string value... 19 Label $AccentedTxt
	Set string value... 19 LeftX 5
	Set string value... 19 RightX 60
	Set string value... 19 LowY 60
	Set string value... 19 HighY +5
	Set string value... 19 Color Black
	Set string value... 19 Draw DrawNull
	# Row 20
	Set string value... 20 Label ()Accented_0
	Set string value... 20 LeftX 20
	Set string value... 20 RightX +10
	Set string value... 20 LowY ^-4
	Set string value... 20 HighY +4
	Set string value... 20 Color Black
	Set string value... 20 Draw DrawNull
	# Row 21
	Set string value... 21 Label ()Accented_1
	Set string value... 21 LeftX ^+10
	Set string value... 21 RightX +10
	Set string value... 21 LowY ^-0
	Set string value... 21 HighY +4
	Set string value... 21 Color Black
	Set string value... 21 Draw DrawNull
	# Row 22
	Set string value... 22 Label ()Accented_2
	Set string value... 22 LeftX ^+10
	Set string value... 22 RightX +10
	Set string value... 22 LowY ^-0
	Set string value... 22 HighY +4
	Set string value... 22 Color Black
	Set string value... 22 Draw DrawNull
	# Row 23
	Set string value... 23 Label >Intelligibility
	Set string value... 23 LeftX 5
	Set string value... 23 RightX 80
	Set string value... 23 LowY ^-12
	Set string value... 23 HighY +4
	Set string value... 23 Color Black
	Set string value... 23 Draw DrawNull
	# Row 24
	Set string value... 24 Label >Impression
	Set string value... 24 LeftX 5
	Set string value... 24 RightX 80
	Set string value... 24 LowY ^-10
	Set string value... 24 HighY +4
	Set string value... 24 Color Black
	Set string value... 24 Draw DrawNull
	# Row 25
	Set string value... 25 Label Help
	Set string value... 25 LeftX 70
	Set string value... 25 RightX 85
	Set string value... 25 LowY 25
	Set string value... 25 HighY +5
	Set string value... 25 Color Black
	Set string value... 25 Draw DrawNull
endproc

procCreateRatingText_DE$ = "RatingText_DE"
procedure CreateRatingText_DE
	Create Table with column names... RatingText_DE 25
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $HuskinessTxt
	Set string value... 5 Text Huskiness (increased noise in the voice)
	Set string value... 5 Key !
	Set string value... 5 Helptext Huskiness (increased noise in the voice): convention of GRBASI.B scale
	# Row 6
	Set string value... 6 Label ()Huskiness_0
	Set string value... 6 Text normal
	Set string value... 6 Key !
	Set string value... 6 Helptext Huskiness: normal voice
	# Row 7
	Set string value... 7 Label ()Huskiness_1
	Set string value... 7 Text light
	Set string value... 7 Key !
	Set string value... 7 Helptext Huskiness: light huskiness
	# Row 8
	Set string value... 8 Label ()Huskiness_2
	Set string value... 8 Text moderate
	Set string value... 8 Key !
	Set string value... 8 Helptext Huskiness: moderate huskiness
	# Row 9
	Set string value... 9 Label ()Huskiness_3
	Set string value... 9 Text severe
	Set string value... 9 Key !
	Set string value... 9 Helptext Huskiness: severely abnormal
	# Row 10
	Set string value... 10 Label $HoarsenessTxt
	Set string value... 10 Text Hoarseness (irregular and raw voice)
	Set string value... 10 Key !
	Set string value... 10 Helptext Hoarseness (irregular and raw voice): conventiona of GRBASI.R scale
	# Row 11
	Set string value... 11 Label ()Hoarseness_0
	Set string value... 11 Text normal
	Set string value... 11 Key !
	Set string value... 11 Helptext Hoarseness: normal voice
	# Row 12
	Set string value... 12 Label ()Hoarseness_1
	Set string value... 12 Text light
	Set string value... 12 Key !
	Set string value... 12 Helptext Hoarseness: light Hoarseness
	# Row 13
	Set string value... 13 Label ()Hoarseness_2
	Set string value... 13 Text moderate
	Set string value... 13 Key !
	Set string value... 13 Helptext Hoarseness: moderate Hoarseness
	# Row 14
	Set string value... 14 Label ()Hoarseness_3
	Set string value... 14 Text severe
	Set string value... 14 Key !
	Set string value... 14 Helptext Hoarseness: severely abnormal
	# Row 15
	Set string value... 15 Label $NoiseTxt
	Set string value... 15 Text Noise (presence of non-speech speaker noise) 
	Set string value... 15 Key !
	Set string value... 15 Helptext Noise (presence of non-speech speaker noise)
	# Row 16
	Set string value... 16 Label ()Noise_0
	Set string value... 16 Text never
	Set string value... 16 Key !
	Set string value... 16 Helptext Noise: never
	# Row 17
	Set string value... 17 Label ()Noise_1
	Set string value... 17 Text sometimes
	Set string value... 17 Key !
	Set string value... 17 Helptext Noise: sometimes (now and then between phrases)
	# Row 18
	Set string value... 18 Label ()Noise_2
	Set string value... 18 Text mostly
	Set string value... 18 Key !
	Set string value... 18 Helptext Noise: most of the time/always (almost before every word) 
	# Row 19
	Set string value... 19 Label $AccentedTxt
	Set string value... 19 Text Accentedness (audibility of the origin of the speaker)   
	Set string value... 19 Key !
	Set string value... 19 Helptext Accentedness (hoorbaarheid van sprekerafkomst):  
	# Row 20
	Set string value... 20 Label ()Accented_0
	Set string value... 20 Text not
	Set string value... 20 Key !
	Set string value... 20 Helptext Accentedness: origin not audible
	# Row 21
	Set string value... 21 Label ()Accented_1
	Set string value... 21 Text slight
	Set string value... 21 Key !
	Set string value... 21 Helptext Accentedness: some sounds do refer to the origin of the speaker 
	# Row 22
	Set string value... 22 Label ()Accented_2
	Set string value... 22 Text clear
	Set string value... 22 Key !
	Set string value... 22 Helptext Accentedness: the speech does clearly reveal the origin (dialect) of the speaker 
	# Row 23
	Set string value... 23 Label >Intelligibility
	Set string value... 23 Text Intelligibility: Impression of the difficulty/ease of decoding the speech signal
	Set string value... 23 Key Poor;Good
	Set string value... 23 Helptext Intelligibility: Impression of the difficulty/ease of decoding the speech signal
	# Row 24
	Set string value... 24 Label >Impression
	Set string value... 24 Text Impression of overall voice quality (similarity to normal speech)
	Set string value... 24 Key Least;Most
	Set string value... 24 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 25
	Set string value... 25 Label Help
	Set string value... 25 Text Scale Help
	Set string value... 25 Key #
	Set string value... 25 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingText_EN$ = "RatingText_EN"
procedure CreateRatingText_EN
	Create Table with column names... RatingText_EN 25
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $HuskinessTxt
	Set string value... 5 Text Huskiness (increased noise in the voice)
	Set string value... 5 Key !
	Set string value... 5 Helptext Huskiness (increased noise in the voice): convention of GRBASI.B scale
	# Row 6
	Set string value... 6 Label ()Huskiness_0
	Set string value... 6 Text normal
	Set string value... 6 Key !
	Set string value... 6 Helptext Huskiness: normal voice
	# Row 7
	Set string value... 7 Label ()Huskiness_1
	Set string value... 7 Text light
	Set string value... 7 Key !
	Set string value... 7 Helptext Huskiness: light huskiness
	# Row 8
	Set string value... 8 Label ()Huskiness_2
	Set string value... 8 Text moderate
	Set string value... 8 Key !
	Set string value... 8 Helptext Huskiness: moderate huskiness
	# Row 9
	Set string value... 9 Label ()Huskiness_3
	Set string value... 9 Text severe
	Set string value... 9 Key !
	Set string value... 9 Helptext Huskiness: severely abnormal
	# Row 10
	Set string value... 10 Label $HoarsenessTxt
	Set string value... 10 Text Hoarseness (irregular and raw voice)
	Set string value... 10 Key !
	Set string value... 10 Helptext Hoarseness (irregular and raw voice): conventiona of GRBASI.R scale
	# Row 11
	Set string value... 11 Label ()Hoarseness_0
	Set string value... 11 Text normal
	Set string value... 11 Key !
	Set string value... 11 Helptext Hoarseness: normal voice
	# Row 12
	Set string value... 12 Label ()Hoarseness_1
	Set string value... 12 Text light
	Set string value... 12 Key !
	Set string value... 12 Helptext Hoarseness: light Hoarseness
	# Row 13
	Set string value... 13 Label ()Hoarseness_2
	Set string value... 13 Text moderate
	Set string value... 13 Key !
	Set string value... 13 Helptext Hoarseness: moderate Hoarseness
	# Row 14
	Set string value... 14 Label ()Hoarseness_3
	Set string value... 14 Text severe
	Set string value... 14 Key !
	Set string value... 14 Helptext Hoarseness: severely abnormal
	# Row 15
	Set string value... 15 Label $NoiseTxt
	Set string value... 15 Text Noise (presence of non-speech speaker noise) 
	Set string value... 15 Key !
	Set string value... 15 Helptext Noise (presence of non-speech speaker noise)
	# Row 16
	Set string value... 16 Label ()Noise_0
	Set string value... 16 Text never
	Set string value... 16 Key !
	Set string value... 16 Helptext Noise: never
	# Row 17
	Set string value... 17 Label ()Noise_1
	Set string value... 17 Text sometimes
	Set string value... 17 Key !
	Set string value... 17 Helptext Noise: sometimes (now and then between phrases)
	# Row 18
	Set string value... 18 Label ()Noise_2
	Set string value... 18 Text mostly
	Set string value... 18 Key !
	Set string value... 18 Helptext Noise: most of the time/always (almost before every word) 
	# Row 19
	Set string value... 19 Label $AccentedTxt
	Set string value... 19 Text Accentedness (audibility of the origin of the speaker)   
	Set string value... 19 Key !
	Set string value... 19 Helptext Accentedness (hoorbaarheid van sprekerafkomst):  
	# Row 20
	Set string value... 20 Label ()Accented_0
	Set string value... 20 Text not
	Set string value... 20 Key !
	Set string value... 20 Helptext Accentedness: origin not audible
	# Row 21
	Set string value... 21 Label ()Accented_1
	Set string value... 21 Text slight
	Set string value... 21 Key !
	Set string value... 21 Helptext Accentedness: some sounds do refer to the origin of the speaker 
	# Row 22
	Set string value... 22 Label ()Accented_2
	Set string value... 22 Text clear
	Set string value... 22 Key !
	Set string value... 22 Helptext Accentedness: the speech does clearly reveal the origin (dialect) of the speaker 
	# Row 23
	Set string value... 23 Label >Intelligibility
	Set string value... 23 Text Intelligibility: Impression of the difficulty/ease of decoding the speech signal
	Set string value... 23 Key Poor;Good
	Set string value... 23 Helptext Intelligibility: Impression of the difficulty/ease of decoding the speech signal
	# Row 24
	Set string value... 24 Label >Impression
	Set string value... 24 Text Impression of overall voice quality (similarity to normal speech)
	Set string value... 24 Key Least;Most
	Set string value... 24 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 25
	Set string value... 25 Label Help
	Set string value... 25 Text Scale Help
	Set string value... 25 Key #
	Set string value... 25 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingText_ES$ = "RatingText_ES"
procedure CreateRatingText_ES
	Create Table with column names... RatingText_ES 25
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $HuskinessTxt
	Set string value... 5 Text Huskiness (increased noise in the voice)
	Set string value... 5 Key !
	Set string value... 5 Helptext Huskiness (increased noise in the voice): convention of GRBASI.B scale
	# Row 6
	Set string value... 6 Label ()Huskiness_0
	Set string value... 6 Text normal
	Set string value... 6 Key !
	Set string value... 6 Helptext Huskiness: normal voice
	# Row 7
	Set string value... 7 Label ()Huskiness_1
	Set string value... 7 Text light
	Set string value... 7 Key !
	Set string value... 7 Helptext Huskiness: light huskiness
	# Row 8
	Set string value... 8 Label ()Huskiness_2
	Set string value... 8 Text moderate
	Set string value... 8 Key !
	Set string value... 8 Helptext Huskiness: moderate huskiness
	# Row 9
	Set string value... 9 Label ()Huskiness_3
	Set string value... 9 Text severe
	Set string value... 9 Key !
	Set string value... 9 Helptext Huskiness: severely abnormal
	# Row 10
	Set string value... 10 Label $HoarsenessTxt
	Set string value... 10 Text Hoarseness (irregular and raw voice)
	Set string value... 10 Key !
	Set string value... 10 Helptext Hoarseness (irregular and raw voice): conventiona of GRBASI.R scale
	# Row 11
	Set string value... 11 Label ()Hoarseness_0
	Set string value... 11 Text normal
	Set string value... 11 Key !
	Set string value... 11 Helptext Hoarseness: normal voice
	# Row 12
	Set string value... 12 Label ()Hoarseness_1
	Set string value... 12 Text light
	Set string value... 12 Key !
	Set string value... 12 Helptext Hoarseness: light Hoarseness
	# Row 13
	Set string value... 13 Label ()Hoarseness_2
	Set string value... 13 Text moderate
	Set string value... 13 Key !
	Set string value... 13 Helptext Hoarseness: moderate Hoarseness
	# Row 14
	Set string value... 14 Label ()Hoarseness_3
	Set string value... 14 Text severe
	Set string value... 14 Key !
	Set string value... 14 Helptext Hoarseness: severely abnormal
	# Row 15
	Set string value... 15 Label $NoiseTxt
	Set string value... 15 Text Noise (presence of non-speech speaker noise) 
	Set string value... 15 Key !
	Set string value... 15 Helptext Noise (presence of non-speech speaker noise)
	# Row 16
	Set string value... 16 Label ()Noise_0
	Set string value... 16 Text never
	Set string value... 16 Key !
	Set string value... 16 Helptext Noise: never
	# Row 17
	Set string value... 17 Label ()Noise_1
	Set string value... 17 Text sometimes
	Set string value... 17 Key !
	Set string value... 17 Helptext Noise: sometimes (now and then between phrases)
	# Row 18
	Set string value... 18 Label ()Noise_2
	Set string value... 18 Text mostly
	Set string value... 18 Key !
	Set string value... 18 Helptext Noise: most of the time/always (almost before every word) 
	# Row 19
	Set string value... 19 Label $AccentedTxt
	Set string value... 19 Text Accentedness (audibility of the origin of the speaker)   
	Set string value... 19 Key !
	Set string value... 19 Helptext Accentedness (hoorbaarheid van sprekerafkomst):  
	# Row 20
	Set string value... 20 Label ()Accented_0
	Set string value... 20 Text not
	Set string value... 20 Key !
	Set string value... 20 Helptext Accentedness: origin not audible
	# Row 21
	Set string value... 21 Label ()Accented_1
	Set string value... 21 Text slight
	Set string value... 21 Key !
	Set string value... 21 Helptext Accentedness: some sounds do refer to the origin of the speaker 
	# Row 22
	Set string value... 22 Label ()Accented_2
	Set string value... 22 Text clear
	Set string value... 22 Key !
	Set string value... 22 Helptext Accentedness: the speech does clearly reveal the origin (dialect) of the speaker 
	# Row 23
	Set string value... 23 Label >Intelligibility
	Set string value... 23 Text Intelligibility: Impression of the difficulty/ease of decoding the speech signal
	Set string value... 23 Key Poor;Good
	Set string value... 23 Helptext Intelligibility: Impression of the difficulty/ease of decoding the speech signal
	# Row 24
	Set string value... 24 Label >Impression
	Set string value... 24 Text Impression of overall voice quality (similarity to normal speech)
	Set string value... 24 Key Least;Most
	Set string value... 24 Helptext The overall voice quality (like GRADE in GRBAS)
	# Row 25
	Set string value... 25 Label Help
	Set string value... 25 Text Scale Help
	Set string value... 25 Key #
	Set string value... 25 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingText_NL$ = "RatingText_NL"
procedure CreateRatingText_NL
	Create Table with column names... RatingText_NL 25
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $HuskinessTxt
	Set string value... 5 Text Heesheid (toegenomen ruis in het stemgeluid)
	Set string value... 5 Key !
	Set string value... 5 Helptext Heesheid (toegenomen ruis in het stemgeluid): conventies van GRBASI.B schaal
	# Row 6
	Set string value... 6 Label ()Huskiness_0
	Set string value... 6 Text normaal
	Set string value... 6 Key !
	Set string value... 6 Helptext Heesheid: normale stem
	# Row 7
	Set string value... 7 Label ()Huskiness_1
	Set string value... 7 Text licht
	Set string value... 7 Key !
	Set string value... 7 Helptext Heesheid: licht hees
	# Row 8
	Set string value... 8 Label ()Huskiness_2
	Set string value... 8 Text matig
	Set string value... 8 Key !
	Set string value... 8 Helptext Heesheid: matig hees
	# Row 9
	Set string value... 9 Label ()Huskiness_3
	Set string value... 9 Text ernstig
	Set string value... 9 Key !
	Set string value... 9 Helptext Heesheid: ernstig afwijkend
	# Row 10
	Set string value... 10 Label $HoarsenessTxt
	Set string value... 10 Text Schorheid (onregelmatig en ruw stemgeluid)
	Set string value... 10 Key !
	Set string value... 10 Helptext Schorheid (onregelmatig en ruw stemgeluid): conventies van RBASI.R schaal
	# Row 11
	Set string value... 11 Label ()Hoarseness_0
	Set string value... 11 Text normaal
	Set string value... 11 Key !
	Set string value... 11 Helptext Schorheid: normale stem
	# Row 12
	Set string value... 12 Label ()Hoarseness_1
	Set string value... 12 Text licht
	Set string value... 12 Key !
	Set string value... 12 Helptext Schorheid: licht hees
	# Row 13
	Set string value... 13 Label ()Hoarseness_2
	Set string value... 13 Text matig
	Set string value... 13 Key !
	Set string value... 13 Helptext Schorheid: matig hees
	# Row 14
	Set string value... 14 Label ()Hoarseness_3
	Set string value... 14 Text ernstig
	Set string value... 14 Key !
	Set string value... 14 Helptext Schorheid: ernstig afwijkend
	# Row 15
	Set string value... 15 Label $NoiseTxt
	Set string value... 15 Text Bijgeluiden (aanwezigheid van niet-talige sprekergeluiden) 
	Set string value... 15 Key !
	Set string value... 15 Helptext Bijgeluiden (aanwezigheid van niet-talige sprekergeluiden)
	# Row 16
	Set string value... 16 Label ()Noise_0
	Set string value... 16 Text nooit
	Set string value... 16 Key !
	Set string value... 16 Helptext Bijgeluiden: nooit
	# Row 17
	Set string value... 17 Label ()Noise_1
	Set string value... 17 Text soms
	Set string value... 17 Key !
	Set string value... 17 Helptext Bijgeluiden: soms (af en toe eens tussen twee deelzinnen)
	# Row 18
	Set string value... 18 Label ()Noise_2
	Set string value... 18 Text meestal
	Set string value... 18 Key !
	Set string value... 18 Helptext Bijgeluiden: meestal/continu (ongeveer voor elk woord) 
	# Row 19
	Set string value... 19 Label $AccentedTxt
	Set string value... 19 Text Accentgraad (hoorbaarheid van sprekerafkomst)   
	Set string value... 19 Key !
	Set string value... 19 Helptext Accentgraad (hoorbaarheid van sprekerafkomst):  
	# Row 20
	Set string value... 20 Label ()Accented_0
	Set string value... 20 Text niet
	Set string value... 20 Key !
	Set string value... 20 Helptext Accentgraad: afkomst niet hoorbaar
	# Row 21
	Set string value... 21 Label ()Accented_1
	Set string value... 21 Text licht
	Set string value... 21 Key !
	Set string value... 21 Helptext Accentgraad: sommige klanken verwijzen tot op zekere hoogte naar het dialect van de spreker 
	# Row 22
	Set string value... 22 Label ()Accented_2
	Set string value... 22 Text duidelijk
	Set string value... 22 Key !
	Set string value... 22 Helptext Accentgraad: de spraak verraadt duidelijk de afkomst (dialect) van de spreker 
	# Row 23
	Set string value... 23 Label >Intelligibility
	Set string value... 23 Text Indruk van verstaanbaarheid: Hoe verstaanbaar is de spraak
	Set string value... 23 Key Slecht;Goed
	Set string value... 23 Helptext De Indruk van verstaanbaarheid : Hoe moeilijk of makkelijk is het om de spreker te verstaan.
	# Row 24
	Set string value... 24 Label >Impression
	Set string value... 24 Text Indruk van stemkwaliteit: Hoe goed/normaal/aangenaam is de stem
	Set string value... 24 Key Slecht;Goed
	Set string value... 24 Helptext De algemene stemkwaliteit (zoals de GRADE in GRBAS)
	# Row 25
	Set string value... 25 Label Help
	Set string value... 25 Text Scale Help
	Set string value... 25 Key #
	Set string value... 25 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingVowel$ = "RatingVowel"
procedure CreateRatingVowel
	Create Table with column names... RatingVowel 9
	... Label LeftX RightX LowY HighY Color Draw Link Value
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	Set string value... 1 Link -
	Set string value... 1 Value 
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	Set string value... 2 Link -
	Set string value... 2 Value 
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	Set string value... 3 Link -
	Set string value... 3 Value 
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 LeftX 5
	Set string value... 4 RightX 85
	Set string value... 4 LowY 25
	Set string value... 4 HighY 95
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	Set string value... 4 Link -
	Set string value... 4 Value 
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 80
	Set string value... 5 LowY 90
	Set string value... 5 HighY +5
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	Set string value... 5 Link -
	Set string value... 5 Value 
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 LeftX 5
	Set string value... 6 RightX 80
	Set string value... 6 LowY 76
	Set string value... 6 HighY +4
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	Set string value... 6 Link -
	Set string value... 6 Value 
	# Row 7
	Set string value... 7 Label >Continuity
	Set string value... 7 LeftX 5
	Set string value... 7 RightX 80
	Set string value... 7 LowY 58
	Set string value... 7 HighY +4
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	Set string value... 7 Link -
	Set string value... 7 Value 
	# Row 8
	Set string value... 8 Label >Noise
	Set string value... 8 LeftX 5
	Set string value... 8 RightX 80
	Set string value... 8 LowY 40
	Set string value... 8 HighY +4
	Set string value... 8 Color Black
	Set string value... 8 Draw DrawNull
	Set string value... 8 Link -
	Set string value... 8 Value 
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 LeftX 70
	Set string value... 9 RightX 85
	Set string value... 9 LowY 25
	Set string value... 9 HighY +5
	Set string value... 9 Color Black
	Set string value... 9 Draw DrawNull
	Set string value... 9 Link -
	Set string value... 9 Value 
endproc

procCreateRatingVowel_DE$ = "RatingVowel_DE"
procedure CreateRatingVowel_DE
	Create Table with column names... RatingVowel_DE 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Zeichenbereich
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Continuity
	Set string value... 7 Text Phonation continuity (\% voiced)
	Set string value... 7 Key   0\% ;100\% 
	Set string value... 7 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 8
	Set string value... 8 Label >Noise
	Set string value... 8 Text Noise
	Set string value... 8 Key Noise;No noise
	Set string value... 8 Helptext Noise: The amount of audible noise during speech
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Scale Hilfe
	Set string value... 9 Key #
	Set string value... 9 Helptext Dr\u"cken Sie auf die Scale \u"ber den Sie Informationen m\o"chten. Dr\u"cken Sie danach auf "Hilfe".
endproc

procCreateRatingVowel_EN$ = "RatingVowel_EN"
procedure CreateRatingVowel_EN
	Create Table with column names... RatingVowel_EN 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Continuity
	Set string value... 7 Text Phonation continuity (\% voiced)
	Set string value... 7 Key   0\% ;100\% 
	Set string value... 7 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 8
	Set string value... 8 Label >Noise
	Set string value... 8 Text Noise
	Set string value... 8 Key Noise;No noise
	Set string value... 8 Helptext Noise: The amount of audible noise during speech
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Scale Help
	Set string value... 9 Key #
	Set string value... 9 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingVowel_ES$ = "RatingVowel_ES"
procedure CreateRatingVowel_ES
	Create Table with column names... RatingVowel_ES 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Display area
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Continuity
	Set string value... 7 Text Phonation continuity (\% voiced)
	Set string value... 7 Key   0\% ;100\% 
	Set string value... 7 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 8
	Set string value... 8 Label >Noise
	Set string value... 8 Text Noise
	Set string value... 8 Key Noise;No noise
	Set string value... 8 Helptext Noise: The amount of audible noise during speech
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Scale Help
	Set string value... 9 Key #
	Set string value... 9 Helptext Press the scale you want information on, "Help" to continue
endproc

procCreateRatingVowel_NL$ = "RatingVowel_NL"
procedure CreateRatingVowel_NL
	Create Table with column names... RatingVowel_NL 9
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !CANVAS
	Set string value... 4 Text Display
	Set string value... 4 Key ¤
	Set string value... 4 Helptext Tekenvenster
	# Row 5
	Set string value... 5 Label $Scales
	Set string value... 5 Text Chose a grade on the line between left (poor) and right (good) descriptors of speech
	Set string value... 5 Key #
	Set string value... 5 Helptext Visual Analogue rating Scales
	# Row 6
	Set string value... 6 Label >Quality
	Set string value... 6 Text Voice Quality (similarity to normal speech)
	Set string value... 6 Key Least;Most
	Set string value... 6 Helptext Is a judgment of the overall voice quality.
	# Row 7
	Set string value... 7 Label >Continuity
	Set string value... 7 Text Phonation continuity (\% voiced)
	Set string value... 7 Key   0\% ;100\% 
	Set string value... 7 Helptext Refers to the continuity of phonation/voicing, i.e. proportion of vowel that is voiced
	# Row 8
	Set string value... 8 Label >Noise
	Set string value... 8 Text Noise
	Set string value... 8 Key Noise;No noise
	Set string value... 8 Helptext Noise: The amount of audible noise during speech
	# Row 9
	Set string value... 9 Label Help
	Set string value... 9 Text Schaal Help
	Set string value... 9 Key #
	Set string value... 9 Helptext Klik op de schaal waar u informatie over wilt hebben, "Help" als u verder wilt
endproc

procCreateRecPage$ = "RecPage"
procedure CreateRecPage
	Create Table with column names... RecPage 30
	... Label LeftX RightX LowY HighY Color Draw
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 LeftX 0
	Set string value... 1 RightX 0
	Set string value... 1 LowY 0
	Set string value... 1 HighY 0
	Set string value... 1 Color Black
	Set string value... 1 Draw DrawNull
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 LeftX 0
	Set string value... 2 RightX 0
	Set string value... 2 LowY 0
	Set string value... 2 HighY 0
	Set string value... 2 Color Black
	Set string value... 2 Draw DrawNull
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 LeftX 0
	Set string value... 3 RightX 0
	Set string value... 3 LowY 0
	Set string value... 3 HighY 0
	Set string value... 3 Color Black
	Set string value... 3 Draw DrawNull
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 LeftX 0
	Set string value... 4 RightX 0
	Set string value... 4 LowY 0
	Set string value... 4 HighY 0
	Set string value... 4 Color Black
	Set string value... 4 Draw DrawNull
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 LeftX 5
	Set string value... 5 RightX 85
	Set string value... 5 LowY 25
	Set string value... 5 HighY 95
	Set string value... 5 Color Black
	Set string value... 5 Draw DrawNull
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 LeftX 20
	Set string value... 6 RightX 80
	Set string value... 6 LowY 90
	Set string value... 6 HighY 120
	Set string value... 6 Color Black
	Set string value... 6 Draw DrawNull
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 LeftX 0
	Set string value... 7 RightX 10
	Set string value... 7 LowY 0
	Set string value... 7 HighY 10
	Set string value... 7 Color Black
	Set string value... 7 Draw DrawNull
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 LeftX 0
	Set string value... 8 RightX 10
	Set string value... 8 LowY 0
	Set string value... 8 HighY 10
	Set string value... 8 Color Blue
	Set string value... 8 Draw DrawNext
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 LeftX 0
	Set string value... 9 RightX 5
	Set string value... 9 LowY 0
	Set string value... 9 HighY 10
	Set string value... 9 Color Blue
	Set string value... 9 Draw DrawPrevious
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 LeftX 0
	Set string value... 10 RightX 0
	Set string value... 10 LowY 0
	Set string value... 10 HighY 0
	Set string value... 10 Color Black
	Set string value... 10 Draw DrawNull
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 LeftX 31
	Set string value... 11 RightX 41
	Set string value... 11 LowY 0
	Set string value... 11 HighY 10
	Set string value... 11 Color Red
	Set string value... 11 Draw DrawRecord
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 LeftX 43
	Set string value... 12 RightX 53
	Set string value... 12 LowY 0
	Set string value... 12 HighY 10
	Set string value... 12 Color Red
	Set string value... 12 Draw DrawPlay
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 LeftX 90
	Set string value... 13 RightX 100
	Set string value... 13 LowY 90
	Set string value... 13 HighY 100
	Set string value... 13 Color Red
	Set string value... 13 Draw DrawQuit
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 LeftX 0
	Set string value... 14 RightX 0
	Set string value... 14 LowY 0
	Set string value... 14 HighY 0
	Set string value... 14 Color Black
	Set string value... 14 Draw DrawConfig
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 LeftX 90
	Set string value... 15 RightX 100
	Set string value... 15 LowY 78
	Set string value... 15 HighY 88
	Set string value... 15 Color Black
	Set string value... 15 Draw DrawRefresh
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 LeftX 90
	Set string value... 16 RightX 100
	Set string value... 16 LowY 66
	Set string value... 16 HighY 76
	Set string value... 16 Color Black
	Set string value... 16 Draw DrawHelp
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 LeftX 0
	Set string value... 17 RightX 0
	Set string value... 17 LowY 0
	Set string value... 17 HighY 0
	Set string value... 17 Color Black
	Set string value... 17 Draw DrawSave
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 LeftX 0
	Set string value... 18 RightX 0
	Set string value... 18 LowY 0
	Set string value... 18 HighY 0
	Set string value... 18 Color Black
	Set string value... 18 Draw DrawNull
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 LeftX 0
	Set string value... 19 RightX 0
	Set string value... 19 LowY 0
	Set string value... 19 HighY 0
	Set string value... 19 Color Black
	Set string value... 19 Draw DrawNull
	# Row 20
	Set string value... 20 Label Draw_Spectrogram
	Set string value... 20 LeftX 0
	Set string value... 20 RightX 0
	Set string value... 20 LowY 0
	Set string value... 20 HighY 0
	Set string value... 20 Color Black
	Set string value... 20 Draw DrawNull
	# Row 21
	Set string value... 21 Label Draw_Ltas
	Set string value... 21 LeftX 0
	Set string value... 21 RightX 0
	Set string value... 21 LowY 0
	Set string value... 21 HighY 0
	Set string value... 21 Color Black
	Set string value... 21 Draw DrawNull
	# Row 22
	Set string value... 22 Label Draw_Intensity
	Set string value... 22 LeftX 0
	Set string value... 22 RightX 0
	Set string value... 22 LowY 0
	Set string value... 22 HighY 0
	Set string value... 22 Color Black
	Set string value... 22 Draw DrawNull
	# Row 23
	Set string value... 23 Label Draw_Harmonicity
	Set string value... 23 LeftX 0
	Set string value... 23 RightX 0
	Set string value... 23 LowY 0
	Set string value... 23 HighY 0
	Set string value... 23 Color Black
	Set string value... 23 Draw DrawNull
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 LeftX 0
	Set string value... 24 RightX 0
	Set string value... 24 LowY 0
	Set string value... 24 HighY 0
	Set string value... 24 Color Black
	Set string value... 24 Draw DrawNull
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 LeftX 0
	Set string value... 25 RightX 0
	Set string value... 25 LowY 0
	Set string value... 25 HighY 0
	Set string value... 25 Color Black
	Set string value... 25 Draw DrawNull
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 LeftX 0
	Set string value... 26 RightX 0
	Set string value... 26 LowY 0
	Set string value... 26 HighY 0
	Set string value... 26 Color Black
	Set string value... 26 Draw DrawNull
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 LeftX 0
	Set string value... 27 RightX 0
	Set string value... 27 LowY 0
	Set string value... 27 HighY 0
	Set string value... 27 Color Black
	Set string value... 27 Draw DrawNull
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 LeftX 0
	Set string value... 28 RightX 0
	Set string value... 28 LowY 0
	Set string value... 28 HighY 0
	Set string value... 28 Color Black
	Set string value... 28 Draw DrawNull
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 LeftX 0
	Set string value... 29 RightX 0
	Set string value... 29 LowY 0
	Set string value... 29 HighY 0
	Set string value... 29 Color Black
	Set string value... 29 Draw DrawPrevious
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 LeftX 0
	Set string value... 30 RightX 0
	Set string value... 30 LowY 0
	Set string value... 30 HighY 0
	Set string value... 30 Color Black
	Set string value... 30 Draw DrawNext
endproc

procCreateRecPage_EN$ = "RecPage_EN"
procedure CreateRecPage_EN
	Create Table with column names... RecPage_EN 30
	... Label Text Key Helptext
	# Fill table values
	# Row 1
	Set string value... 1 Label !Author
	Set string value... 1 Text Author
	Set string value... 1 Key !
	Set string value... 1 Helptext R.J.J.H. van Son
	# Row 2
	Set string value... 2 Label !Copyright
	Set string value... 2 Text Copyright
	Set string value... 2 Key !
	Set string value... 2 Helptext Copyright \co 2010-2012 R.J.J.H. van Son \&  the NKI
	# Row 3
	Set string value... 3 Label !License
	Set string value... 3 Text License
	Set string value... 3 Key !
	Set string value... 3 Helptext GNU GPL version 2 or later
	# Row 4
	Set string value... 4 Label !WindowTitle
	Set string value... 4 Text NKI TE-VOICE ANALYSIS tool: Main page
	Set string value... 4 Key !
	Set string value... 4 Helptext NKI TE-VOICE ANALYSIS tool: Main page
	# Row 5
	Set string value... 5 Label !CANVAS
	Set string value... 5 Text Display
	Set string value... 5 Key ¤
	Set string value... 5 Helptext Display area
	# Row 6
	Set string value... 6 Label !PathologicalType
	Set string value... 6 Text - Signal Type:
	Set string value... 6 Key 012349
	Set string value... 6 Helptext Pathological Signal Type (AST) in window title I-IV, type 1-4, 0 erases
	# Row 7
	Set string value... 7 Label Speaker
	Set string value... 7 Text Speaker
	Set string value... 7 Key k
	Set string value... 7 Helptext Input speaker data
	# Row 8
	Set string value... 8 Label !NextItem
	Set string value... 8 Text Next
	Set string value... 8 Key x|\\
	Set string value... 8 Helptext Next recording in %serial mode
	# Row 9
	Set string value... 9 Label !PreviousItem
	Set string value... 9 Text Spk
	Set string value... 9 Key x|\\
	Set string value... 9 Helptext Previous recording in %serial mode
	# Row 10
	Set string value... 10 Label File
	Set string value... 10 Text Open
	Set string value... 10 Key O
	Set string value... 10 Helptext Open sound file
	# Row 11
	Set string value... 11 Label Record
	Set string value... 11 Text Record
	Set string value... 11 Key R
	Set string value... 11 Helptext Record your speech. You have 4 seconds, watch the recording "light"
	# Row 12
	Set string value... 12 Label Play
	Set string value... 12 Text Play
	Set string value... 12 Key P
	Set string value... 12 Helptext Play back of your recorded pronunciation
	# Row 13
	Set string value... 13 Label Quit
	Set string value... 13 Text Quit
	Set string value... 13 Key Q
	Set string value... 13 Helptext Quit TEVA
	# Row 14
	Set string value... 14 Label Config
	Set string value... 14 Text Settings
	Set string value... 14 Key S
	Set string value... 14 Helptext Go to %%Configuration% page
	# Row 15
	Set string value... 15 Label Refresh
	Set string value... 15 Text Refresh
	Set string value... 15 Key h
	Set string value... 15 Helptext Redraw the current screen, the space-bar always refreshes screen
	# Row 16
	Set string value... 16 Label Help
	Set string value... 16 Text Help
	Set string value... 16 Key ?/
	Set string value... 16 Helptext Press the button you want information on, "Help" to continue
	# Row 17
	Set string value... 17 Label Save
	Set string value... 17 Text Print \# 
	Set string value... 17 Key #
	Set string value... 17 Helptext Save a report in printer format
	# Row 18
	Set string value... 18 Label Draw_Sound
	Set string value... 18 Text Sound
	Set string value... 18 Key S
	Set string value... 18 Helptext Draw the Sound
	# Row 19
	Set string value... 19 Label Draw_Pitch
	Set string value... 19 Text Pitch
	Set string value... 19 Key t
	Set string value... 19 Helptext Draw Pitch
	# Row 20
	Set string value... 20 Label Draw_Harmonicity
	Set string value... 20 Text Harmonicity
	Set string value... 20 Key H
	Set string value... 20 Helptext Draw the Harmonicity to Noise ratio
	# Row 21
	Set string value... 21 Label Draw_Spectrogram
	Set string value... 21 Text Spectrogram
	Set string value... 21 Key L
	Set string value... 21 Helptext Narrow band spectrogram (100 ms) with formants superimposed
	# Row 22
	Set string value... 22 Label Draw_Ltas
	Set string value... 22 Text Ltas
	Set string value... 22 Key L
	Set string value... 22 Helptext Long time average spectrum
	# Row 23
	Set string value... 23 Label Draw_Intensity
	Set string value... 23 Text Intensity
	Set string value... 23 Key I
	Set string value... 23 Helptext Draw Intensity
	# Row 24
	Set string value... 24 Label Draw_Rating
	Set string value... 24 Text Rating
	Set string value... 24 Key #
	Set string value... 24 Helptext Rate the speech on scales 
	# Row 25
	Set string value... 25 Label Select
	Set string value... 25 Text Select
	Set string value... 25 Key e
	Set string value... 25 Helptext Select new start and endtime
	# Row 26
	Set string value... 26 Label ToSelection
	Set string value... 26 Text To selection
	Set string value... 26 Key c
	Set string value... 26 Helptext Go to selected start and endtime
	# Row 27
	Set string value... 27 Label ZoomOut
	Set string value... 27 Text Zoom out -
	Set string value... 27 Key u\-_
	Set string value... 27 Helptext Double the current time window
	# Row 28
	Set string value... 28 Label ZoomIn
	Set string value... 28 Text Zoom in +
	Set string value... 28 Key n+=
	Set string value... 28 Helptext Halve the current time window
	# Row 29
	Set string value... 29 Label Previous
	Set string value... 29 Text < Previous
	Set string value... 29 Key \<\,
	Set string value... 29 Helptext Previous interval, or shift current time window to the left
	# Row 30
	Set string value... 30 Label Next
	Set string value... 30 Text Next >
	Set string value... 30 Key \>\.
	Set string value... 30 Helptext Next interval, or shift the current time window to the right
endproc

procCreateCreateTables$ = "CreateTables"
procedure CreateCreateTables
	Create Table with column names... CreateTables 72
	... Name
	# Fill table values
	# Row 1
	Set string value... 1 Name Background
	# Row 2
	Set string value... 2 Name Config
	# Row 3
	Set string value... 3 Name Config_DE
	# Row 4
	Set string value... 4 Name Config_EN
	# Row 5
	Set string value... 5 Name Config_ES
	# Row 6
	Set string value... 6 Name Config_JA
	# Row 7
	Set string value... 7 Name Config_NL
	# Row 8
	Set string value... 8 Name Credits_DE
	# Row 9
	Set string value... 9 Name Credits_EN
	# Row 10
	Set string value... 10 Name Credits_ES
	# Row 11
	Set string value... 11 Name Credits_JA
	# Row 12
	Set string value... 12 Name Credits_NL
	# Row 13
	Set string value... 13 Name Feedback_DE
	# Row 14
	Set string value... 14 Name Feedback_EN
	# Row 15
	Set string value... 15 Name Feedback_ES
	# Row 16
	Set string value... 16 Name Feedback_JA
	# Row 17
	Set string value... 17 Name Feedback_NL
	# Row 18
	Set string value... 18 Name Instruction_DE
	# Row 19
	Set string value... 19 Name Instruction_EN
	# Row 20
	Set string value... 20 Name Instruction_ES
	# Row 21
	Set string value... 21 Name Instruction_JA
	# Row 22
	Set string value... 22 Name Instruction_NL
	# Row 23
	Set string value... 23 Name MainPage
	# Row 24
	Set string value... 24 Name MainPage_DE
	# Row 25
	Set string value... 25 Name MainPage_EN
	# Row 26
	Set string value... 26 Name MainPage_ES
	# Row 27
	Set string value... 27 Name MainPage_JA
	# Row 28
	Set string value... 28 Name MainPage_NL
	# Row 29
	Set string value... 29 Name PrintSignal_DE
	# Row 30
	Set string value... 30 Name PrintSignal_EN
	# Row 31
	Set string value... 31 Name PrintSignal_ES
	# Row 32
	Set string value... 32 Name PrintSignal_JA
	# Row 33
	Set string value... 33 Name PrintSignal_NL
	# Row 34
	Set string value... 34 Name RatingA
	# Row 35
	Set string value... 35 Name RatingA_DE
	# Row 36
	Set string value... 36 Name RatingA_EN
	# Row 37
	Set string value... 37 Name RatingA_ES
	# Row 38
	Set string value... 38 Name RatingA_NL
	# Row 39
	Set string value... 39 Name RatingGRBAS
	# Row 40
	Set string value... 40 Name RatingGRBASPlus
	# Row 41
	Set string value... 41 Name RatingGRBASPlus_EN
	# Row 42
	Set string value... 42 Name RatingGRBASPlus_NL
	# Row 43
	Set string value... 43 Name RatingGRBAS_EN
	# Row 44
	Set string value... 44 Name RatingINFVo
	# Row 45
	Set string value... 45 Name RatingINFVo_DE
	# Row 46
	Set string value... 46 Name RatingINFVo_EN
	# Row 47
	Set string value... 47 Name RatingINFVo_ES
	# Row 48
	Set string value... 48 Name RatingINFVo_NL
	# Row 49
	Set string value... 49 Name RatingNKIAVL_NL
	# Row 50
	Set string value... 50 Name RatingTEpair
	# Row 51
	Set string value... 51 Name RatingTEpair_DE
	# Row 52
	Set string value... 52 Name RatingTEpair_EN
	# Row 53
	Set string value... 53 Name RatingTEpair_ES
	# Row 54
	Set string value... 54 Name RatingTEpair_NL
	# Row 55
	Set string value... 55 Name RatingTEsingle
	# Row 56
	Set string value... 56 Name RatingTEsingle_DE
	# Row 57
	Set string value... 57 Name RatingTEsingle_EN
	# Row 58
	Set string value... 58 Name RatingTEsingle_ES
	# Row 59
	Set string value... 59 Name RatingTEsingle_JA
	# Row 60
	Set string value... 60 Name RatingTEsingle_NL
	# Row 61
	Set string value... 61 Name RatingText
	# Row 62
	Set string value... 62 Name RatingText_DE
	# Row 63
	Set string value... 63 Name RatingText_EN
	# Row 64
	Set string value... 64 Name RatingText_ES
	# Row 65
	Set string value... 65 Name RatingText_NL
	# Row 66
	Set string value... 66 Name RatingVowel
	# Row 67
	Set string value... 67 Name RatingVowel_DE
	# Row 68
	Set string value... 68 Name RatingVowel_EN
	# Row 69
	Set string value... 69 Name RatingVowel_ES
	# Row 70
	Set string value... 70 Name RatingVowel_NL
	# Row 71
	Set string value... 71 Name RecPage
	# Row 72
	Set string value... 72 Name RecPage_EN
endproc

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
#!praat
#
# Library of functions to perform LPC analysis-synthesis
# of Tracheoesophageal speech. The emphasis is on
# the ability to manipulate the source characteristics
# of the synthesized speech.
#
# Copyright (C) 2010 R. J. J. H. van Son
# R.J.J.H.vanSon@gmail.com
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# To print out documentation, call:
#> perl -x LPCsourceLib.praat
# 
################################################################
#
# Automatically generated documentation
#
# Generate stimuli from Sound+TextGrid
# Replace unvoiced parts with originals
# AR: Analysis-Resynthesis
# EP: Equalized pitch (120-100)
# EI: Equalized intensity
# NS: New source using existing pulses
# Selected Sound plus TextGrid
#> call generate_stimuli .stimname$ .dirname$
#
# Regularize pitch
# Replace variable periods with fixed pitch period
# Use Analysis-Resynthesis of selected original
# (build using the selected TextGrid)
# as the source for the manipulation
# Add pitch accents where the textgrid has + in the Accents
# tier
# Selected Sound plus TextGrid
#> call equalize_pitch_in_AnaRes .pitchstart .pitchend
# 
# Replace variable periods with fixed pitch period on
# a declination. Use selected original
# Selected Sound
#> call equalize_pitch .pitchstart .pitchend
#
# Resynthesize with equalized amplitude
# Add intensity accents where the textgrid has + in the Accents
# Selected Sound plus TextGrid
#> call resynthesize_equalized_amplitude .fluctuation
#
# Resynthesize LPC Sound with new source
# Selected Sound plus TextGrid
#> call resynthesize_LPC_with_new_source
# 
# Create synthetic new source based on 
# pulse marking estimates.
# Selected Sound
#> call synthesize_new_source
#
# Simple two way analysis-resynthesis
# Replace unvoiced parts with original
# Selected: Sound and TextGrid
#> call LPC_analysis_resynthesis
#
# Equalize source amplitude
# Read LPC source, determine intensity and create a
# version with a given standard deviation in the intensity
# .newSD = Requested Standard Deviation in dB
# If .newSD = 0, the source is equalized as much as possible.
# Selected Sound
#> call equalize_source .newSD
#
# Superimpose accent stress on Intensity 
# Selected Sound plus TextGrid
#> call add_accent_intensity_source
# 
# Take selected LPC source and construct an intensity tier
# Selected Sound
#> call intensityTier_from_LPC_source
# 
# Convert a flow based source into a differentiated source
# Set intensity to 70dB. 
# Low-pass filter at .cutoffFreq
# Selected Sound
#> call differentiate_LPC_source .cutoffFreq
# 
# Get pulses from double integrated original wave file
# Selected Sound
#> call create_pulses_from_sound
#
# Convert an differentiated LPC source into a flow based source
# De-emphasize and integrate all samples, set intensity to 70 dB
# Selected Sound
#> call integrate_DiffLPC_source
#
# Extract an LPC source based on the inverse filtering of
# the selected Sound with its LPC
# Selected Sound
#> call extract_DiffLPC_source
# 
# LPC source to Pointprocess
# Selected Sound
#> call create_pointprocess_from_LPCsource
#
# Zero out intervals
#> call zero_intervals .sound$ .textgrid$ .tier .label$
# 
# Copy samples from sound1 to sound2, using the textgrid
# Use the intervals with "label" on tier "tier"
#> call replace_samples .sound1$ .sound2$ .textgrid$ .tier .label$
# 
# Add a '+' in the Accents tier for every stressed position
# Selected TextGrid
#> call stress_voiced_stretches .wordTier .word$ .vuvTier .accTier .accPosition
# 
# Add an Accents tier with given default value
# Selected TextGrid
#> call add_accent_tier .default$
# 
# Get the number of the Accents tier, if any
# Read out with accents_tier_number.accTier
# Zero of there is no Accents tier
# Selected TextGrid
#> call accents_tier_number
#
################################################################
#
# This is a fake procedure DO NOT CALL
# It hides the perl script text that generates the documentation 
# from Praat
procedure helptext_do_not_call
#
# To print out documentation, call:
#> perl -x LPCsourceLib.praat
#
#!perl
print <<"END_OF_HEADER";
################################################################
#
# Automatically generated documentation
END_OF_HEADER
@lines = <DATA>;
foreach (@lines){
    if(/^#(\s|$)/){
        print("$_");
    } elsif(/^procedure\s/) {
        s/^procedure\s/call /g;
        print("#> $_");
    };
}
print <<"END_OF_FOOTER";
#
################################################################
END_OF_FOOTER

__END__
endproc
#################################################################
#
# Resynthesize an utterrance with a TE voice from a sustained /a/
#
# Debugging
resynthesize_with_TE_source.testResysnthesis = 0

procedure resynthesize_with_TE_source .prosody .targetAR .originalRecording .teSourceRecording

	# Determine articulation rate etc in original
	call syllable_nuclei -25 2 0.3 1 .originalRecording
	.articulationrate = syllable_nuclei.articulationrate
	.speed = 1
	if .targetAR > 0 and .targetAR < 2
		.speed = .targetAR
	elsif syllable_nuclei.voicedcount > 4 and .articulationrate >= 2 and .articulationrate <= 6
		.speed = .targetAR/.articulationrate
	endif

	# Scale duration
	.scaleDuration = 1
	if .speed > 0
		.scaleDuration = 1/.speed
	endif
	
	# Scale prosody
	if .prosody > 1
		.prosody /= 100
	endif

	###################################################################
	#
	# Set up original recording and generate original parameters
	#
	###################################################################
	
	selectObject: .originalRecording
	.origDuration = Get total duration
	
	# Source
	selectObject: .originalRecording
	call extract_DiffLPC_source
	.origSource = selected: "Sound"
	Rename: "OriginalSource"
	
	# Pitch. It is best to determine pitch on the source signal
	selectObject: .origSource
	.origPitch = noprogress To Pitch: 0, 75, 600
	.origPitchTier = Down to PitchTier
	.origMeanPitch = Get mean (curve): 0, 0

	# Voicing It is best to determine voicing on the source signal
	# Use one of these two methods!!!
	selectObject: .origSource
	.origPoint = noprogress To PointProcess (periodic, cc): 80, 400
	.origVoicing = noprogress To TextGrid (vuv): 0.020, 0.01
	Rename: "OriginalVoicing"
	
	if 0
		select .origVoicing
		Remove
		call voicing_detector .origSource
		.origVoicing = voicing_detector.voicing
		select .origVoicing
		Rename: "OriginalVoicing"
	endif
	
	# Remove spurious voiced intervals
	select .origVoicing
	.numIntervals = Get number of intervals: 1
	for .interval to .numIntervals
		select .origVoicing
		.label$ = Get label of interval: 1, .interval
		.start = Get start point: 1, .interval
		.end = Get end point: 1, .interval
		call zero_crossing_rate '.originalRecording' '.start' '.end'
		if zero_crossing_rate.zc_rate > 5000
			select .origVoicing
			Set interval text: 1, .interval, "U"
		endif
	endfor

	# Source Intensity
	selectObject: .origSource
	call intensityTier_from_LPC_source
	.origIntensity = selected: "IntensityTier"
	.origMeanInt = intensityTier_from_LPC_source.energy

	# Original filter. 
	# Add some white noise to silent stretches to prevent instable filters
	selectObject: .originalRecording
	.tmp = Copy: "AdditiveNoise"
	Scale intensity: 70.0
	Formula... if abs(self) < 0.0001 then self + randomGauss(0,0.0001) else self fi
	call extract_LPC_filter
	.origFilter = selected: "LPC"
	Rename: "OriginalFilter"
	select .tmp
	Remove
	
	# Test resynthesis
	if .testResysnthesis
		select .origPoint
		Copy: "TestVoicing"
		select .origVoicing
		Copy: "TestVoicing"
		selectObject: .origFilter
		plusObject: .origSource
		.testSound_1 = Filter: "no"
		Scale intensity: 70.0
		Rename: "TestSynthesis_1"
	endif

	# Clean up
	select .origPoint
	plus .origPitch
	Remove
	
	###################################################################
	#
	# Scale parameters of original speech against mean 
	#
	###################################################################
	
	# Scale original pitch countour
	if .prosody <> 1
		select .origPitchTier
		Formula... .prosody*self + (1-.prosody)*.origMeanPitch
	endif

	# Scale original (source) intensity countour
	if .prosody <> 1
		select .origIntensity
		Formula... .prosody*self + (1-.prosody)*.origMeanInt
	endif

	###################################################################
	#
	# Set up source recording and generate source parameters
	#
	###################################################################

	# Set up TE source recording
	selectObject: .teSourceRecording
	.teSourceDuration = Get total duration
	
	# Get source sound
	selectObject: .teSourceRecording
	.sourceName$ = selected$("Sound")
	if index_regex(.sourceName$, "(?i_LPCsource)") <= 0
		call extract_DiffLPC_source
		.teSource = selected: "Sound"
	else
		selectObject: .teSourceRecording
		.teSource = Copy: "TESource"
	endif
	.teSourceDuration = Get total duration
	
	# Determine segments with speech
	selectObject: .teSource
	.teTextGrid = noprogress To TextGrid (silences): 80, 0, -10, 0.001, 0.001, "silent", "sounding"

	# Get source filter
	selectObject: .teSourceRecording
	call extract_LPC_filter
	.teFilter = selected: "LPC"
	
	###################################################################
	#
	# Replace Original source with TE source
	#
	###################################################################

	###################################################################
	#
	# Construct a new source signal that is long enough
	#
	###################################################################
	.teSourceCopy = -1
	.durationOfCopy = 0
	while .durationOfCopy + 0.001 < .origDuration
		selectObject: .teTextGrid
		.numSoundIntervals = Get number of intervals: 1
		for .i to .numSoundIntervals
			selectObject: .teTextGrid
			.label$ = Get label of interval: 1, .i
			if .label$ = "sounding" and .durationOfCopy + 0.001 < .origDuration
				.start = Get start point: 1, .i
				.end = Get end point: 1, .i
				# There are silent margins in the source
				if .start < 0.025
					.start = 0.025
				endif
				if .end > .teSourceDuration - 0.025
					.end = .teSourceDuration - 0.025
				endif
				.duration = .end - .start
				selectObject: .teSource
				if .durationOfCopy + .duration > .origDuration
					.end = .origDuration - .durationOfCopy + .start
				endif
				.tmp = Extract part: .start, .end, "rectangular", 1.0, "no"
				if .teSourceCopy > 0
					selectObject: .teSourceCopy
					plusObject: .tmp
					.new = Concatenate
					selectObject: .teSourceCopy
					plusObject: .tmp
					Remove
					.teSourceCopy = .new
				else
					.teSourceCopy = .tmp
				endif
				.tmp = -1
				.new = -1
				selectObject: .teSourceCopy
				.durationOfCopy = Get total duration
			endif
		endfor
	endwhile
	selectObject: .teSourceCopy
	Rename: "CroppedSource"
	
	# Test resynthesis
	if .testResysnthesis
		selectObject: .origFilter
		plusObject: .teSourceCopy
		.testSound_2 = Filter: "no"
		Scale intensity: 70.0
		Rename: "TestSynthesis_2"
	endif
	
	###################################################################
	#
	# Copy original intensity countour to new source
	#
	###################################################################
	if .prosody > 0
		selectObject: .teSourceCopy
		plusObject: .origIntensity
		.scaledTEsource = Multiply: 0.9
		Rename: "ScaledSource"
		
		# Clean up
		select .teSourceCopy
		Remove
	else
		selectObject: .teSourceCopy
		Rename: "ScaledSource"
		.scaledTEsource = .teSourceCopy
		.teSourceCopy = -1
	endif
	
	# Test resynthesis
	if .testResysnthesis
		selectObject: .origFilter
		plusObject: .scaledTEsource
		.testSound_3 = Filter: "no"
		Scale intensity: 70.0
		Rename: "TestSynthesis_3"
	endif

	###################################################################
	#
	# Superimpose Pitch of original over new source
	#
	###################################################################
	if .prosody > 0
		select .scaledTEsource
		.newSourceManipulation = noprogress To Manipulation: 0.01, 75, 600
		.newSourcePitch = Extract pitch tier
		.meanSourcePitch = Get mean (curve): 0, 0
		# Reduce pitch movements
		select .origPitchTier
		.meanTargetPitch = Get mean (curve): 0, 0
		if .meanTargetPitch > 0
			Formula... self * (.meanSourcePitch / .meanTargetPitch)
		endif
		plus .newSourceManipulation
		Replace pitch tier
		select .newSourceManipulation
		.intonatedTEsource = Get resynthesis (overlap-add)
		Rename: "IntonatedSource"
		
		select .newSourceManipulation
		plus .newSourcePitch
		plus .scaledTEsource
		Remove
	else
		select .scaledTEsource
		Rename: "IntonatedSource"		
		.intonatedTEsource = .scaledTEsource
		.scaledTEsource = -1
	endif
	
	# Test resynthesis
	if .testResysnthesis
		selectObject: .origFilter
		plusObject: .intonatedTEsource
		.testSound_4 = Filter: "no"
		Scale intensity: 70.0
		Rename: "TestSynthesis_4"
	endif
	
	###################################################################
	#
	# Replace voiced parts of original with new voice
	#
	###################################################################
	selectObject: .origSource
	.newSource = Copy: "NewSource"
	Scale intensity: 70.0
	selectObject: .intonatedTEsource
	Scale intensity: 70.0
	
	call replace_samples IntonatedSource NewSource OriginalVoicing 1 V

	selectObject: .origFilter
	plusObject: .newSource
	.speedSound = Filter: "no"
	Scale intensity: 70.0
	Rename: "OriginalWithTE"
	
	# Test resynthesis
	if .testResysnthesis
		selectObject: .origFilter
		plusObject: .newSource
		.testSound_5 = Filter: "no"
		Scale intensity: 70.0
		Rename: "TestSynthesis_5"
	endif

	###################################################################
	#
	# Clean up
	#
	###################################################################
	select .origPitchTier
	plus .origIntensity
	plus .origFilter
	plus .origSource
	plus .origVoicing
	plus .teTextGrid
	plus .teSource
	plus .intonatedTEsource
	plus .teFilter
	plus .newSource
	Remove
	
	###################################################################
	#
	# Change duration
	#
	###################################################################
	if .scaleDuration <> 1
		select .speedSound
		.newSoundManipulation = noprogress To Manipulation: 0.01, 60, 300
		.newSoundDurTier = Extract duration tier
		Add point: 0, .scaleDuration
		
		# Synthesize
		select .newSoundManipulation
		plus .newSoundDurTier
		Replace duration tier
	
		select .newSoundManipulation
		.newSound = noprogress Get resynthesis (overlap-add)
			
		select .newSoundManipulation
		plus  .newSoundDurTier
		plus .speedSound
		Remove
	else
		.newSound = .speedSound
		.speedSound = -1
	endif
	
	select .newSound 
endproc


# Get the average impulse response of the source
procedure deconvolute_impulse_response .minPitch .source
	select .source
	.duration = Get total duration
	.sampleFrequency = Get sampling frequency
	.points = noprogress To PointProcess (periodic, cc): 75, 400
	
	# Calculate window length
	if .minPitch <= 0
		.minPitch = 100
	endif
	.windowLength = 1.0/.minPitch
	.halfWindow = .windowLength / 2
	
	# generate summation
	.impulseResponse = Create Sound from formula: "ImpulseResponse", 1, 0.0, .windowLength, .sampleFrequency, "0"

	select .points
	.numPulses = Get number of points
	for .p to .numPulses
		select .points
		.time = Get time from index: .p
		.start = .time - .halfWindow
		.end = .start + .windowLength
		if .start >= 0 and .end <= .duration
			select .source
			.tmp = Extract part: .start, .end, "rectangular", 1.0, "no"
			Rename: "Impulse"
			select .impulseResponse
			Formula: "self + Object_'.tmp'[row,col]"
			
			# Clean up
			select .tmp
			Remove
		endif
	endfor
	select .impulseResponse
	Formula: "self / '.numPulses'"
endproc

#
# Generate stimuli from Sound+TextGrid
# Replace unvoiced parts with originals
# AR: Analysis-Resynthesis
# EP: Equalized pitch (120-100)
# EI: Equalized intensity
# NS: New source using existing pulses
# Selected Sound plus TextGrid
procedure generate_stimuli .stimname$ .dirname$
    .basename$ = selected$("Sound")
    .textGridname$ = selected$("TextGrid")
    
    # Analysis Resynthesis
    select Sound '.basename$'
    plus TextGrid '.textGridname$'
	call LPC_analysis_resynthesis
    Rename... '.stimname$'AR
    
    # Equalized pitch
    select Sound '.basename$'
    plus TextGrid '.textGridname$'
    call equalize_pitch_in_AnaRes 120 100
    Rename... '.stimname$'EP
    # Replace unvoiced parts
	call replace_samples '.basename$' '.stimname$'EP '.textGridname$' 3 U
    
	# Equalize source amplitude
    select Sound '.basename$'
    plus TextGrid '.textGridname$'
    call resynthesize_equalized_amplitude 0
    Rename... '.stimname$'EI

    # Create new source and resynthesize
    select Sound '.basename$'
    plus TextGrid '.textGridname$'
    call resynthesize_LPC_with_new_source
    Rename... '.stimname$'NS

    # Write out
    if index_regex(.dirname$, "[\w\.]") > 0
        select Sound '.stimname$'AR
        nowarn Write to WAV file... '.dirname$'/'.stimname$'AR.wav
        select Sound '.stimname$'EP
        nowarn Write to WAV file... '.dirname$'/'.stimname$'EP.wav
        select Sound '.stimname$'EI
        nowarn Write to WAV file... '.dirname$'/'.stimname$'EI.wav
        select Sound '.stimname$'NS
        nowarn Write to WAV file... '.dirname$'/'.stimname$'NS.wav
        select Sound '.stimname$'AR
        plus Sound '.stimname$'EP
        plus Sound '.stimname$'EI
        plus Sound '.stimname$'NS
        Remove
    endif

endproc

#
# Regularize pitch
# Replace variable periods with fixed pitch period
# Use Analysis-Resynthesis of selected original
# (build using the selected TextGrid)
# as the source for the manipulation
# Add pitch accents where the textgrid has + in the Accents
# tier
# Selected Sound plus TextGrid
procedure equalize_pitch_in_AnaRes .pitchstart .pitchend
    .basename$ = selected$("Sound")
    .textGridname$ = selected$("TextGrid")
    .basePointsName$ = .basename$+"_Pulses"
    call create_pulses_from_sound
    Rename... '.basePointsName$'
    select PointProcess '.basePointsName$'
    
    select TextGrid '.textGridname$'
    call accents_tier_number
    .accTier = accents_tier_number.accTier
    .numAccIntervals = Get number of intervals... '.accTier'
    
    # Analysis Resynthesis
    select Sound '.basename$'
    plus TextGrid '.textGridname$'
	call LPC_analysis_resynthesis
    Rename... '.basename$'AR_TMP
    
    select Sound '.basename$'AR_TMP
    .duration = Get total duration
    To Manipulation... 0.005 50 350
    Rename... '.basename$'TMP
    plus PointProcess '.basePointsName$'
    Replace pulses
    select Manipulation '.basename$'TMP
    Extract pitch tier
    Rename... '.basename$'TMP
    
    Remove points between... 0 '.duration'
    Add point... 0 '.pitchstart'
    Add point... .duration '.pitchend'
    for .i to .numAccIntervals
        select TextGrid '.textGridname$'
        .currentAcc$ = Get label of interval... '.accTier' '.i'
        # Add accent movement
        if .currentAcc$ = "+"
            .currentStart = Get start point... '.accTier' '.i'
            .currentEnd = Get end point... '.accTier' '.i'
            .currentThird = .currentStart + (.currentEnd - .currentStart)/3
            select PitchTier '.basename$'TMP
            .currentStartF0 = Get value at time... '.currentStart'
            .currentEndF0 = Get value at time... '.currentEnd'
            .currentThirdF0 = Get value at time... '.currentThird'
            # Add 2 semitones
            .currentThirdF0 *= 10^(2/12)
            Add point... '.currentStart' '.currentStartF0'
            Add point... '.currentThird' '.currentThirdF0'
            Add point... '.currentEnd' '.currentEndF0'
        endif
    endfor

    # Replace PitchTier
    select PitchTier '.basename$'TMP
    plus Manipulation '.basename$'TMP
    Replace pitch tier
    select Manipulation '.basename$'TMP
    Get resynthesis (overlap-add)
    Rename... '.basename$'_normalizedPitch
    
    select Manipulation '.basename$'TMP
    plus PitchTier '.basename$'TMP
    plus PointProcess '.basePointsName$'
    plus Sound '.basename$'AR_TMP
    Remove
    
    select Sound '.basename$'_normalizedPitch
endproc

# 
# Replace variable periods with fixed pitch period on
# a declination. Use selected original
# Selected Sound
procedure equalize_pitch .pitchstart .pitchend
    .basename$ = selected$("Sound")
    .basePointsName$ = .basename$+"_Pulses"
    call create_pulses_from_sound
    Rename... '.basePointsName$'
    select PointProcess '.basePointsName$'
    
    select Sound '.basename$'
    .duration = Get total duration
    To Manipulation... 0.005 50 350
    Rename... '.basename$'TMP
    plus PointProcess '.basePointsName$'
    Replace pulses
    select Manipulation '.basename$'TMP
    Extract pitch tier
    Rename... '.basename$'TMP
    
    Remove points between... 0 '.duration'
    Add point... 0 '.pitchstart'
    Add point... .duration '.pitchend'
    plus Manipulation '.basename$'TMP
    Replace pitch tier
    select Manipulation '.basename$'TMP
    Get resynthesis (overlap-add)
    Rename... '.basename$'_normalizedPitch
    
    select Manipulation '.basename$'TMP
    plus PitchTier '.basename$'TMP
    plus PointProcess '.basePointsName$'
    Remove
    
    select Sound '.basename$'_normalizedPitch
endproc

#
# Resynthesize with equalized amplitude
# Add intensity accents where the textgrid has + in the Accents
# Selected Sound plus TextGrid
procedure resynthesize_equalized_amplitude .fluctuation
    .basename$ = selected$("Sound")
    .textGridname$ = selected$("TextGrid")
    
    select Sound '.basename$'
    Resample... 11000 50
    .downbasename$ = selected$("Sound")
    .duration = Get total duration
    .sampleFreq = Get sampling frequency
    
    # LPC
    select Sound '.downbasename$'
    To LPC (autocorrelation)... 10 0.025 0.005 50
    Rename... '.basename$'_LPC

    # LPC Source
    select Sound '.downbasename$'
	call extract_DiffLPC_source
	Rename... '.basename$'_DiffLPCSource
    call integrate_DiffLPC_source
    Rename... '.basename$'_LPCSource
    
    select Sound '.basename$'_LPCSource
  	call equalize_source '.fluctuation'
    Rename... '.basename$'_TMPintnormalized
    plus TextGrid '.textGridname$'
    call add_accent_intensity_source
    Rename... '.basename$'_TMPintaccented
    call differentiate_LPC_source 4500
    Rename... '.basename$'_TMPnormalized
    call zero_intervals '.basename$'_TMPnormalized '.textGridname$' 3 U

    # Synthesize sound
    select Sound '.basename$'_TMPnormalized
	Scale intensity... 70
    plus LPC '.basename$'_LPC
    Filter... Yes
    Rename... '.basename$'_eqintensity
	Scale intensity... 70
   
    # Replace unvoiced parts
	call replace_samples '.basename$' '.basename$'_eqintensity '.textGridname$' 3 U
    
    # Clean up
    select Sound '.basename$'_TMPnormalized
    plus Sound '.downbasename$'
    plus Sound '.basename$'_DiffLPCSource
    plus Sound '.basename$'_LPCSource
    plus LPC '.basename$'_LPC
    plus Sound '.basename$'_TMPintnormalized
    plus Sound '.basename$'_TMPintaccented
    Remove
    
    select Sound '.basename$'_eqintensity
endproc

#
# Resynthesize LPC Sound with new source
# Selected Sound plus TextGrid
procedure resynthesize_LPC_with_new_source
    .basename$ = selected$("Sound")
    .textGridname$ = selected$("TextGrid")
    
    select Sound '.basename$'
    Resample... 11000 50
    .downbasename$ = selected$("Sound")
    .duration = Get total duration
    .sampleFreq = Get sampling frequency
    
    # LPC
    select Sound '.downbasename$'
    To LPC (autocorrelation)... 10 0.025 0.005 50
    Rename... '.basename$'_LPC
    
    # New source
    select Sound '.downbasename$'
    call synthesize_new_source
    Rename... '.basename$'_new_phonation
    De-emphasize (in-line)... 50
    call zero_intervals '.basename$'_new_phonation '.textGridname$' 3 U

    # LPC resynthesis
    select LPC '.basename$'_LPC
    plus Sound '.basename$'_new_phonation
    Filter... yes
    Scale intensity... 70
    Rename... '.basename$'_LPCsynthphon
	call replace_samples '.downbasename$' '.basename$'_LPCsynthphon '.textGridname$' 3 U
    
    # Clean up
    select Sound '.basename$'_new_phonation
    plus LPC '.basename$'_LPC
    plus Sound '.downbasename$'
    Remove
    
    select Sound '.basename$'_LPCsynthphon
    
endproc

# 
# Create synthetic new source based on 
# pulse marking estimates.
# Selected Sound
procedure synthesize_new_source
    .basename$ = selected$("Sound")
    
    select Sound '.basename$'
    .duration = Get total duration
    .sampleFreq = Get sampling frequency
    
    # Get original source
    select Sound '.basename$'
	call extract_DiffLPC_source
	Rename... '.basename$'_DiffLPCSource
    
    # Intensity
	select Sound '.basename$'_DiffLPCSource
	call intensityTier_from_LPC_source
    Rename... TMPintensityTier
    Down to TableOfReal
    
    # Pulses
    select Sound '.basename$'
    call create_pulses_from_sound
    Rename... '.basename$'
    
    # Generate phonation
    select PointProcess '.basename$'
    To Sound (phonation)... '.sampleFreq' 1.0 0.05 0.7 0.03 3.0 4.0
    Rename... '.basename$'_new_phonation
    
    # Transfer intensity to new source
    select Sound '.basename$'_new_phonation
    Formula... self * 10^(IntensityTier_TMPintensityTier(x)/20)
    
    # Clean up
    select Sound '.basename$'_DiffLPCSource
    plus PointProcess '.basename$'
    plus IntensityTier TMPintensityTier
    plus TableOfReal TMPintensityTier
    Remove
    
    select Sound '.basename$'_new_phonation
endproc

#
# Simple two way analysis-resynthesis
# Replace unvoiced parts with original
# Selected: Sound and TextGrid
procedure LPC_analysis_resynthesis
    .basename$ = selected$("Sound")
    .textGridname$ = selected$("TextGrid")
    
    select Sound '.basename$'
    Resample... 11000 50
    .downbasename$ = selected$("Sound")
    .duration = Get total duration
    .sampleFreq = Get sampling frequency
    
    
    # LPC
    select Sound '.downbasename$'
    To LPC (autocorrelation)... 10 0.025 0.005 50
    Rename... '.basename$'_LPC
    
    # Extract source
    select Sound '.downbasename$'
	call extract_DiffLPC_source
	Rename... '.basename$'_DiffLPCSource
	call integrate_DiffLPC_source
    Rename... '.basename$'_LPCSource

    # Diff source again
    select Sound '.basename$'_LPCSource
    call differentiate_LPC_source 4000
    Rename... '.basename$'_DiffIntDiffLPCSource
    
    # Resynthesize
    select Sound '.basename$'_DiffIntDiffLPCSource
    plus LPC '.basename$'_LPC
    Filter... Yes
    Rename... '.basename$'_AnalResyn
    Scale intensity... 70
    call replace_samples '.downbasename$' '.basename$'_AnalResyn '.textGridname$' 3 US

    # Clean up
    select Sound '.basename$'_DiffIntDiffLPCSource
    plus Sound '.basename$'_DiffLPCSource
    plus Sound '.basename$'_LPCSource
    plus Sound '.downbasename$'
    plus LPC '.basename$'_LPC
    Remove
    
    # Ready
    select Sound '.basename$'_AnalResyn
endproc

#
# Equalize source amplitude
# Read LPC source, determine intensity and create a
# version with a given standard deviation in the intensity
# .newSD = Requested Standard Deviation in dB
# If .newSD = 0, the source is equalized as much as possible.
# Selected Sound
procedure equalize_source .newSD
    .basename$ = selected$("Sound")
	 .duration = Get total duration
    Copy... '.basename$'_normalized
	call intensityTier_from_LPC_source
    Rename... TMPintensityTier
    Down to TableOfReal
    .oldMean = Get column mean (index)... 2
    .oldSD = Get column stdev (index)... 2
    .multFactor = -1
    if .oldSD > 0
        .multFactor = (.newSD - .oldSD)/.oldSD
    endif
    select IntensityTier TMPintensityTier
    Formula... .oldMean + (self - .oldMean) * .multFactor
    select Sound '.basename$'_normalized
    Formula... self * 10^((IntensityTier_TMPintensityTier(x) - .oldMean)/20)
    .numSamples = Get number of samples
    Set value at sample number... Both 1 0
    Set value at sample number... Both '.numSamples' 0
    Scale intensity... 70
    # Clean up
    select IntensityTier TMPintensityTier
    plus TableOfReal TMPintensityTier
    Remove
    
    select Sound '.basename$'_normalized
endproc

#
# Superimpose accent stress on Intensity 
# Selected Sound plus TextGrid
procedure add_accent_intensity_source
    .basename$ = selected$("Sound")
    .textGridname$ = selected$("TextGrid")
    select Sound '.basename$'
    .duration = Get total duration

    select TextGrid '.textGridname$'
    call accents_tier_number
    .accTier = accents_tier_number.accTier
    .numAccIntervals = Get number of intervals... '.accTier'
    
    Create IntensityTier... '.basename$'TMP 0.0 '.duration'
    
    .startI = 70
    .endI = 68
    Add point... 0 '.startI'
    Add point... .duration '.endI'
    for .i to .numAccIntervals
        select TextGrid '.textGridname$'
        .currentAcc$ = Get label of interval... '.accTier' '.i'
        # Add accent movement
        if .currentAcc$ = "+"
            .currentStart = Get start point... '.accTier' '.i'
            .currentEnd = Get end point... '.accTier' '.i'
            .currentThird = .currentStart + (.currentEnd - .currentStart)/3
            select IntensityTier '.basename$'TMP
            .currentStartI = .startI + ((.endI - .startI)/.duration)*.currentStart
            .currentEndI = .startI + ((.endI - .startI)/.duration)*.currentEnd
            .currentThirdI = .startI + ((.endI - .startI)/.duration)*.currentThird
            # Add 2 semitones
            .currentThirdI += 3
            Add point... '.currentStart' '.currentStartI'
            Add point... '.currentThird' '.currentThirdI'
            Add point... '.currentEnd' '.currentEndI'
        endif
    endfor
    select Sound '.basename$'
    plus IntensityTier '.basename$'TMP
    Multiply... yes
    Rename... '.basename$'_accentedI

    select IntensityTier '.basename$'TMP
    Remove
    
    select Sound '.basename$'_accentedI
endproc

# 
# Take selected LPC source and construct an intensity tier
# Selected Sound
procedure intensityTier_from_LPC_source
    .basename$ = selected$("Sound")
	   To Intensity... 40 0 yes
	   .energy = Get mean: 0, 0, "energy"
	   .sones = Get mean: 0, 0, "sones"
	   .dB = Get mean: 0, 0, "dB"
	   Down to IntensityTier
    select Intensity '.basename$'
    Remove
    select IntensityTier '.basename$'
endproc

# 
# Convert a flow based source into a differentiated source
# Set intensity to 70dB. 
# Low-pass filter at .cutoffFreq
# Selected Sound
procedure differentiate_LPC_source .cutoffFreq
    .basename$ = selected$("Sound")
    Filter (pass Hann band)... 4 '.cutoffFreq' 1
    Rename... '.basename$'_Integrated

    Formula... if col < ncol then self[col+1]-self[col] else 0 fi
    
    Scale intensity... 70
endproc

# 
# Get pulses from double integrated original wave file
# Selected Sound
procedure create_pulses_from_sound
    .basename$ = selected$("Sound")
	# Create pointprocess on zeros of the integrated original
	select Sound '.basename$'
    call differentiate_LPC_source 4000
    Rename... FirstDiffOrig
    
    call integrate_DiffLPC_source
    Rename... FirstIntOrig
    call integrate_DiffLPC_source
    Rename... SecondIntOrig
    
    # Get PointProcess
	call create_pointprocess_from_LPCsource
    Rename... '.basename$'
    
    # Clean up
    select Sound FirstDiffOrig
    plus Sound FirstIntOrig
    plus Sound SecondIntOrig
    Remove
    
    select PointProcess '.basename$'
endproc

#
# Convert an differentiated LPC source into a flow based source
# De-emphasize and integrate all samples, set intensity to 70 dB
# Selected Sound
procedure integrate_DiffLPC_source
    .basename$ = selected$("Sound")
    Copy... '.basename$'_SourceInt
    De-emphasize (in-line)... 50
    Subtract mean
    Formula... self+self[col-1]
    Subtract mean
    Filter (pass Hann band)... 40 5500 1
    Subtract mean
    Rename... '.basename$'_LPCSource
    
    select Sound '.basename$'_SourceInt
    Remove
    
    select Sound '.basename$'_LPCSource
	Scale intensity... 70
endproc

#
# Extract an LPC filter 
# Selected Sound
lpcsourcelib.analysis_type = 2
procedure extract_LPC_filter
	if lpcsourcelib.analysis_type = undefined
		lpcsourcelib.analysis_type = 1
	endif
	
    .basename$ = selected$("Sound")
    Resample... 11000 50
    .tmp = Rename... '.basename$'_DownSampled
    if lpcsourcelib.analysis_type = 2
		noprogress To LPC (covariance): 10, 0.025, 0.005, 50
    elsif lpcsourcelib.analysis_type = 3
		noprogress To LPC (burg): 10, 0.025, 0.005, 50
    elsif lpcsourcelib.analysis_type = 4
		noprogress To LPC (marple): 10, 0.025, 0.005, 50, 1e-6, 1e-6
	else # lpcsourcelib.analysis_type = 1 and others
		noprogress To LPC (autocorrelation): 10, 0.025, 0.005, 50
	endif
    Rename... '.basename$'_LPC
    
    select .tmp
    Remove
    
    select LPC '.basename$'_LPC
endproc

#
# Extract an LPC source based on the inverse filtering of
# the selected Sound with its LPC
# Selected Sound
procedure extract_DiffLPC_source
 	if lpcsourcelib.analysis_type = undefined
		lpcsourcelib.analysis_type = 1
	endif
	
   .basename$ = selected$("Sound")
    Resample... 11000 50
    Rename... '.basename$'_DownSampled
    if lpcsourcelib.analysis_type = 2
		noprogress To LPC (covariance): 10, 0.025, 0.005, 50
    elsif lpcsourcelib.analysis_type = 3
		noprogress To LPC (burg): 10, 0.025, 0.005, 50
    elsif lpcsourcelib.analysis_type = 4
		noprogress To LPC (marple): 10, 0.025, 0.005, 50, 1e-6, 1e-6
	else # lpcsourcelib.analysis_type = 1 and others
		noprogress To LPC (autocorrelation): 10, 0.025, 0.005, 50
	endif
    Rename... '.basename$'_LPC
    select Sound '.basename$'_DownSampled
    plus LPC '.basename$'_LPC
    Filter (inverse)
	Scale intensity... 70
    Rename... '.basename$'_DiffLPCSource
    
    select Sound '.basename$'_DownSampled
    plus LPC '.basename$'_LPC
    Remove
    
    select Sound '.basename$'_DiffLPCSource
endproc

# 
# LPC source to Pointprocess
# Selected Sound
procedure create_pointprocess_from_LPCsource
    .basename$ = selected$("Sound")
	# Create pointprocess on zeros of the LPC source
	select Sound '.basename$'
	To PointProcess (zeroes)... Left yes no
endproc

#
# Zero out intervals
procedure zero_intervals .sound$ .textgrid$ .tier .label$
    select TextGrid '.textgrid$'
    .numIntervals = Get number of intervals... '.tier'
    for .i to .numIntervals
        select TextGrid '.textgrid$'
        .currentLabel$ = Get label of interval... '.tier' '.i'
        if .currentLabel$ = .label$
            .start = Get start point... '.tier' '.i'
            .end = Get end point... '.tier' '.i'
            .midpoint = (.start + .end)/2
            select Sound '.sound$'
            .etime = 0.001
            # Zero out intervals
            # Fade in
            Formula... if x >= .start and x <= .midpoint then self * exp(-(x-.start)/.etime) else self fi
            # Fade out
            Formula... if x < .end and x >= .midpoint    then self * exp(-(.end - x)/.etime) else self fi
        endif
    endfor
endproc

# 
# Copy samples from sound1 to sound2, using the textgrid
# Use the intervals with "label" on tier "tier"
procedure replace_samples .sound1$ .sound2$ .textgrid$ .tier .label$
    select TextGrid '.textgrid$'
    .numIntervals = Get number of intervals... '.tier'
    for .i to .numIntervals
        select TextGrid '.textgrid$'
        .currentLabel$ = Get label of interval... '.tier' '.i'
        if .currentLabel$ = .label$
            .start = Get start point... '.tier' '.i'
            .end = Get end point... '.tier' '.i'
            .midpoint = (.start + .end)/2
            select Sound '.sound2$'
            .etime = 0.005
            Formula... if x >= .start and x < .midpoint then self * exp(-(x-.start)/.etime) + Sound_'.sound1$'(x)*(1-exp(-(x-.start)/.etime)) else self fi
            Formula... if x < .end and x >= .midpoint   then self * exp(-(.end - x)/.etime) + Sound_'.sound1$'(x)*(1-exp(-(.end - x)/.etime)) else self fi
        endif
    endfor
endproc

# 
# Add a '+' in the Accents tier for every stressed position
# Selected TextGrid
procedure stress_voiced_stretches .wordTier .word$ .vuvTier .accTier .accPosition
    .basename$ = selected$("TextGrid")
    .numWords = Get number of intervals... '.wordTier'
    .numVUV = Get number of intervals... '.vuvTier'
    for .word to .numWords
        .currentWord$ = Get label of interval... '.wordTier' '.word'
        if .currentWord$ = .word$
            .currentStart = Get start point... '.wordTier' '.word'
            .i = 0
            repeat
                .i += 1
                .currentvuvStart = Get start point... '.vuvTier' '.i'
            until .currentvuvStart >= .currentStart or .i >= .numVUV
            .i -= 1
            repeat
                .i += 1
                .currentVoicing$ = Get label of interval... '.vuvTier' '.i'
                if .currentVoicing$ = "V"
                    .accPosition -= 1
                    if .accPosition = 0
                        Set interval text... '.accTier' '.i' +
                    endif
                endif
            until .accPosition <= 0 or .i >= .numVUV
        endif
    endfor
    select TextGrid '.basename$'
endproc

# 
# Add an Accents tier with given default value
# Selected TextGrid
procedure add_accent_tier .default$
    .basename$ = selected$("TextGrid")
    .numTiers = Get number of tiers
    .wordsTier = 2
    .vuvTier = 3
    for .i to .numTiers
        .currentName$ = Get tier name... '.i'
        if .currentName$ = "Words"
            .wordsTier = .i
        elsif .currentName$ = "VUV"
            .vuvTier = .i
        endif
    endfor
    .newTier = .vuvTier + 1
    Duplicate tier... '.vuvTier' '.newTier' Accents
    .numIntervals = Get number of intervals... '.newTier'
    for .i to .numIntervals
        Set interval text... '.newTier' '.i' '.default$'
    endfor
    .accTier = .newTier
    
    select TextGrid '.basename$'
endproc

# 
# Get the number of the Accents tier, if any
# Read out with accents_tier_number.accTier
# Zero of there is no Accents tier
# Selected TextGrid
procedure accents_tier_number
    .basename$ = selected$("TextGrid")
    .numTiers = Get number of tiers
    .accTier = 0
    for .i to .numTiers
        .currentName$ = Get tier name... '.i'
        if .currentName$ = "Accents"
            .accTier = .i
        endif
    endfor
    
    select TextGrid '.basename$'
endproc

###########################################################################
#                                                                         #
#  Praat Script Syllable Nuclei                                           #
#  Copyright (C) 2008  Nivja de Jong and Ton Wempe                        #
#                                                                         #
#    This program is free software: you can redistribute it and/or modify #
#    it under the terms of the GNU General Public License as published by #
#    the Free Software Foundation, either version 3 of the License, or    #
#    (at your option) any later version.                                  #
#                                                                         #
#    This program is distributed in the hope that it will be useful,      #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of       #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        #
#    GNU General Public License for more details.                         #
#                                                                         #
#    You should have received a copy of the GNU General Public License    #
#    along with this program.  If not, see http://www.gnu.org/licenses/   #
#                                                                         #
###########################################################################
#
# modified 2010.09.17 by Hugo Quené, Ingrid Persoon, & Nivja de Jong
# Overview of changes:
# + change threshold-calculator: rather than using median, use the almost maximum
#     minus 25dB. (25 dB is in line with the standard setting to detect silence
#     in the "To TextGrid (silences)" function.
#     Almost maximum (.99 quantile) is used rather than maximum to avoid using
#     irrelevant non-speech sound-bursts.
# + add silence-information to calculate articulation rate and ASD (average syllable
#     duration.
#     NB: speech rate = number of syllables / total time
#         articulation rate = number of syllables / phonation time
# + remove max number of syllable nuclei
# + refer to objects by unique identifier, not by name
# + keep track of all created intermediate objects, select these explicitly,
#     then Remove
# + provide summary output in Info window
# + do not save TextGrid-file but leave it in Object-window for inspection
#     (if requested in startup-form)
# + allow Sound to have starting time different from zero
#      for Sound objects created with Extract (preserve times)
# + programming of checking loop for mindip adjusted
#      in the orig version, precedingtime was not modified if the peak was rejected !!
#      var precedingtime and precedingint renamed to .currenttime and .currentint
#
# + bug fixed concerning summing total pause, feb 28th 2011
#
# modified 2014.10.24 by Rob van Son
# Overview of changes:
# + Converted to a function form. Can be called as -
# call syllable_nuclei -25 2 0.3 1 .soundFile
#   where .soundFile is the ID of an open soundfile
# + Added noprogress and cleaned up object id assignment
# 
###########################################################################

# counts syllables of sound utterances
# NB unstressed syllables are sometimes overlooked
# NB filter sounds that are quite noisy beforehand
# NB use Silence threshold (dB) = -25 (or -20?)
# NB use Minimum .dip between peaks (dB) = between 2-4 (you can first try;
#                                                      For clean and filtered: 4)
# syllable_nuclei.soundname$	- Name of sound object
# syllable_nuclei.voicedcount	- Count of vocied segments
# syllable_nuclei.npause		- Count of pauses
# syllable_nuclei.originaldur	- Original duration
# syllable_nuclei.speakingtot	- Duration of speech
# syllable_nuclei.speakingrate	- Syllable per second, gross
# syllable_nuclei.articulationrate - Syllables per speaking time
# syllable_nuclei.asd			- Average syllable duration
# 
# Arguments
# real .silence_threshold -25 (dB)
# real .minimum_dip_between_peaks 2 (dB)
# real .minimum_pause_duration 0.3 (s)
# boolean .keep_Soundfiles_and_Textgrids 1
# fileID .soundFile
#
# Example 
# call syllable_nuclei -25 2 0.3 1 .originalRecording

procedure syllable_nuclei .silence_threshold .minimum_dip_between_peaks .minimum_pause_duration .keep_Soundfiles_and_Textgrids .soundid

	# Get object name
	select .soundid
	.soundname$ = selected$("Sound")

	# shorten variables
	.silencedb = .silence_threshold
	.mindip = .minimum_dip_between_peaks
	.showtext = .keep_Soundfiles_and_Textgrids
	.minpause = .minimum_pause_duration

	.originaldur = Get total duration
	# allow non-zero starting time
	.bt = Get starting time

	# Use intensity to get .threshold
	.intid = noprogress To Intensity... 50 0 yes
	.start = Get time from frame number... 1
	.nframes = Get number of frames
	.end = Get time from frame number... '.nframes'

	# estimate noise floor
	select .intid
	.minint = Get minimum... 0 0 Parabolic
	# estimate noise max
	.maxint = Get maximum... 0 0 Parabolic
	#get .99 quantile to get maximum (without influence of non-speech sound bursts)
	.max99int = Get quantile... 0 0 0.99

	# estimate Intensity .threshold
	.threshold = .max99int + .silencedb
	.threshold2 = .maxint - .max99int
	.threshold3 = .silencedb - .threshold2
	if .threshold < .minint
	    .threshold = .minint
	endif

	# get pauses (silences) and speakingtime
	select .soundid
	.textgridid = noprogress To TextGrid (silences)... 80 0 '.threshold3' '.minpause' 0.1 silent sounding
	.silencetierid = Extract tier... 1
	.silencetableid = Down to TableOfReal... sounding
	nsounding = Get number of rows
	.npauses = 'nsounding'
	.speakingtot = 0
	for ipause from 1 to .npauses
	   beginsound = Get value... 'ipause' 1
	   endsound = Get value... 'ipause' 2
	   speakingdur = 'endsound' - 'beginsound'
	   .speakingtot = 'speakingdur' + '.speakingtot'
	endfor

	select '.intid'
	Down to Matrix
	.matid = selected("Matrix")
	# Convert intensity to sound
	.sndintid = noprogress To Sound (slice)... 1

	# use total duration, not .end time, to find out duration of .intdur
	# in order to allow nonzero starting times.
	.intdur = Get total duration
	intmax = Get maximum... 0 0 Parabolic

	# estimate peak positions (all peaks)
	.ppid = noprogress To PointProcess (extrema)... Left yes no Sinc70

	numpeaks = Get number of points

	# fill array with time points
	for .i from 1 to numpeaks
	    t'.i' = Get time from index... '.i'
	endfor


	# fill array with intensity values
	select '.sndintid'
	.peakcount = 0
	for .i from 1 to numpeaks
	    value = Get value at time... t'.i' Cubic
	    if value > .threshold
	          .peakcount += 1
	          int'.peakcount' = value
	          .timepeaks'.peakcount' = t'.i'
	    endif
	endfor


	# fill array with valid peaks: only intensity values if preceding
	# .dip in intensity is greater than .mindip
	select '.intid'
	.validpeakcount = 0
	.currenttime = .timepeaks1
	.currentint = int1

	for .p to .peakcount-1
	   .following = .p + 1
	   .followingtime = .timepeaks'.following'
	   .dip = Get minimum... '.currenttime' '.followingtime' None
	   .diffint = abs(.currentint - .dip)

	   if .diffint > .mindip
	      .validpeakcount += 1
	      validtime'.validpeakcount' = .timepeaks'.p'
	   endif
	      .currenttime = .timepeaks'.following'
	      .currentint = Get value at time... .timepeaks'.following' Cubic
	endfor


	# Look for only voiced parts
	select '.soundid'
	.pitchid = noprogress To Pitch (ac)... 0.02 30 4 no 0.03 0.25 0.01 0.35 0.25 450

	.voicedcount = 0
	for .i from 1 to .validpeakcount
	   .querytime = validtime'.i'

	   select '.textgridid'
	   .whichinterval = Get interval at time... 1 '.querytime'
	   .whichlabel$ = Get label of interval... 1 '.whichinterval'

	   select '.pitchid'
	   value = Get value at time... '.querytime' Hertz Linear

	   if value <> undefined
	      if .whichlabel$ = "sounding"
	          .voicedcount = .voicedcount + 1
	          voicedpeak'.voicedcount' = validtime'.i'
	      endif
	   endif
	endfor

	# calculate time correction due to shift in time for Sound object versus
	# intensity object
	.timecorrection = .originaldur/.intdur

	# Insert voiced peaks in TextGrid
	if .showtext > 0
	   select '.textgridid'
	   Insert point tier... 1 syllables
	  
	   for .i from 1 to .voicedcount
	       position = voicedpeak'.i' * .timecorrection
	       Insert point... 1 position '.i'
	   endfor
	endif

	# clean up before next sound file is opened
	select .intid
	plus .matid
	plus .sndintid
	plus .ppid
	plus .pitchid
	plus .silencetierid
	plus .silencetableid
	plus .textgridid
	Remove
	if .showtext < 1
	   select '.soundid'
	   plus '.textgridid'
	   Remove
	endif

	# summarize results in Info window
	.speakingrate = '.voicedcount'/'.originaldur'
	.articulationrate = '.voicedcount'/'.speakingtot'
	.npause = '.npauses'-1
	.asd = '.speakingtot'/'.voicedcount'
endproc

procedure zero_crossing_rate .soundfile .start .end
	select .soundfile
	.tmp = Extract part: .start, .end, "rectangular", 1, "no"
	.duration = Get total duration
	.tmpPoint = noprogress To PointProcess (zeroes): 1, "yes", "yes"
	.zero_crossings = Get number of points
	.zc_rate = -1
	if .duration > 0
		.zc_rate = .zero_crossings / .duration
	endif
	
	select .tmp
	plus .tmpPoint
	Remove
endproc

procedure voicing_detector .soundfile
	select .soundfile
	.tmp = noprogress To Harmonicity (cc): 0.01, 75, 0.1, 1
	.tmpMatrix = To Matrix
	.tmpIntensity = To Intensity
	.voicing = To TextGrid (silences): -40, 0.01, 0.01, "U", "V"

	select .tmp
	plus .tmpMatrix
	plus .tmpIntensity
	Remove
endproc

# Set up system and load preferences
#
# TEVA 1.1
# 
# Intializing Praat script
#
#     TEVA: Initialize.praat defines and sets the global variables
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
	feedbackYL = 13
	feedbackXL = 0
	feedbackXR = 80
	feedbackYL = 13
	feedbackYH = 20
	wipeFeedbackArea$ = "demo Paint rectangle... White 'feedbackXL' 'feedbackXR' 'feedbackYL' 'feedbackYH'"
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
	wipePlotArea$ = "demo Paint rectangle... White -5 'canvasXR' 'feedbackYL' 'headerYH'"

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
	config.showBackground = 0
	config.recordingTime$ = "4"
	config.speakerData$ = ""
	config.speakerDataBackup$ = ""
	config.createBackup = 0
	config.speakerDataTable = -1
	if te.recordingMode
		config.speakerSerial$ = "Forw"
	else
		config.speakerSerial$ = "None"
	endif
	config.localInitializationFile$ = "TEVAinit.tsv"
	config.saveAll = 0
	config.autoSelect = 0
	config.calcGNE = 0
	te.calcLowHighHNR = 0
	config.showFormants = 0
	config.muteOutput = 0
	config.selectionWindow = 2.0
	config.ratingForm$ = "Vowel"
	config.vasScaleTicks = 0
	#config.pitchalgorithm$ = "VanAs"
	config.pitchalgorithm$ = "CC300"
	config.source$ = "Original"
	config.sourceFile$ = ""
	# config.useCache
	# Use a hidden cach directory to store results of lengthy analysis
	# config.useCache > 0 : Enforce a cache
	# config.useCache = 0 : Use cache if present
	# config.useCache < 0 : Never use a cache
	config.useCache = 0
	localCacheDir$ = ".tevaCache"
	
	#
	# root directory for automatic runs (experiments)
	# the root directory always ends with a /
	config.rootDirectory$ = shellDirectory$
	# On macs, use the Volume "TEVAEXP" (case sensitive)
	if macintosh
		config.rootDirectory$ = "/Volumes/TEVAEXP/"
	endif
	# Set to 1 to clean GUI interface
	config.ratingExperiment = 0
	config.randomizeSpeakerData = 0
	
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
	te.voicingTextGrid = -1
	
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
	
	config.language$ = "EN"
	logging = 0
	# preferencesAppDir$ must have been defined, which happens in the App file
	preferencesAppFile$ = preferencesAppDir$+"/'demoAppName$'rc.tsv"
	preferencesTableDir$ = "'preferencesAppDir$'/Data"
	config.openLog$ = "'preferencesAppDir$'/log"
	preferencesScriptsDir$ = "'preferencesAppDir$'/scripts"
	defaultFontSize = 12
	defaultFont$ = "Helvetica"
	defaultFontColor$ = "Black"
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
	te.useFullASTselection = 1
	
	# On unix and mac, default to PDF and allow PNG files
	config.saveFMT$ = "PDF"
	if windows
		# On windows, only PNG and EPS are possible (kill EMF)
		config.saveFMT$ = "PNG"
	endif

endproc

procedure global_setup
	# Set up directories if they do not exist already
	call set_up_directories
	# Get saved preferences
	call read_preferences ""
	
	# Load local preferences if present
	if fileReadable(config.rootDirectory$+config.localInitializationFile$)
		call read_preferences 'config.rootDirectory$''config.localInitializationFile$'
	elsif fileReadable(homeDirectory$+"/"+config.localInitializationFile$)
		call read_preferences 'homeDirectory$'/'config.localInitializationFile$'
	endif
	
	# Set inital language
	call set_language 'config.language$'
	# Set Speaker color
	call switch_speaker_next_button 'config.speakerSerial$'

	# Expand relative file names
	call expand_releative_paths
	
	# In case a SpeakerData table is given, load speakerdata, and set to first item
	if config.speakerData$ <> ""
		# Allow to ask for a new table component
		if index_regex(config.speakerData$, "\[\[[^\]]*\]\]")
			.requestText$ = replace_regex$(config.speakerData$, "^.*\[\[([^\]]*)\]\].*$", "\1", 0)
			call getLanguageTexts Config SpeakerData
			beginPause("")
				sentence (.requestText$, "")
			clicked = endPause ("'getLanguageTexts.cancelText$'", "'getLanguageTexts.continueText$'", 2, 1)
			# Cancel
			if clicked = 2
				.requestTextVar$ = replace_regex$(.requestText$, "^([A-Z])", "\l\1", 0)
				.requestTextVar$ = replace_regex$(.requestTextVar$, "\s*\(.*$", "", 0)
				.requestTextVar$ = replace_regex$(.requestTextVar$, "[\s.?!()/\\\\]", "_", 0)
				.replaceText$ = '.requestTextVar$'$
				config.speakerData$ = replace_regex$(config.speakerData$, "\[\[[^\]]*\]\]", "[[]]", 0)
				config.speakerData$ = replace$(config.speakerData$, "[[]]", .replaceText$, 0)
			endif
		endif
		call ReadSpeakerData 'config.speakerData$'
		# Set display to first item
		call processMainPageNextItem 0 0 0
		# Search first empty row
		if config.speakerDataTable > 0 and speakerID$ <> "" and speakerID$ <> "0"
			selectObject: config.speakerDataTable
			.numColumns = Get number of columns
			.numRows = Get number of rows
			.first = 1
			if .numColumns > 4
				for .c from 5 to .numColumns
					.cLabel$ = Get column label: .c
					.r = Search column: .cLabel$, "?"
					if .r > .first
						.first = .r
					endif
				endfor
			endif
			if .first < .numRows
				speakerID$ = Get value: .first, "ID"
			endif
		endif
	endif
	
	# Set up speaker data table, if needed
	if config.speakerDataTable <= 0
		config.speakerData$ = ""
		config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime
	endif
endproc

procedure switch_speaker_next_button .set_nextItem$
	# Speaker & !NextItem -> !Speaker & NextItem
	if .set_nextItem$ = "Forw"
		call hide_button 'te.buttons$' Speaker
		call hide_button 'te.buttons$' PreviousItem
		call unhide_button 'te.buttons$' !NextItem
	elsif .set_nextItem$ = "Backw" 
		call hide_button 'te.buttons$' Speaker
		call hide_button 'te.buttons$' NextItem
		call unhide_button 'te.buttons$' !PreviousItem
	# !Speaker & Next -> Speaker & !NextItem
	elsif .set_nextItem$ = "None"
		call unhide_button 'te.buttons$' !Speaker
		call hide_button 'te.buttons$' NextItem
		call hide_button 'te.buttons$' PreviousItem
	endif
endproc

# In a rating experiment, all unnecessary buttons are removed
procedure hide_buttons_for_rating_experiment
		call hide_all_buttons 'te.buttons$'
		call unhide_button 'te.buttons$' Play
		call unhide_button 'te.buttons$' Quit
		call unhide_button 'te.buttons$' Refresh
		call unhide_button 'te.buttons$' Speaker
endproc

procedure expand_releative_paths
	# config.speakerData$
	if startsWith(config.speakerData$, "./")
		config.speakerData$ = replace_regex$(config.speakerData$, "^\./", "'config.rootDirectory$'", 0)
	elsif startsWith(config.speakerData$, "~/")
		config.speakerData$ = replace_regex$(config.speakerData$, "^~/", "'homeDirectory$'/", 0)
	endif
	# config.sourceFile$
	if startsWith(config.sourceFile$, "./")
		config.sourceFile$ = replace_regex$(config.sourceFile$, "^\./", "'config.rootDirectory$'", 0)
	elsif startsWith(config.sourceFile$, "~/")
		config.sourceFile$ = replace_regex$(config.sourceFile$, "^~/", "'homeDirectory$'/", 0)
	endif
	# config.openLog$
	if startsWith(config.openLog$, "./")
		config.openLog$ = replace_regex$(config.openLog$, "^\./", "'config.rootDirectory$'", 0)
	elsif startsWith(config.openLog$, "~/")
		config.openLog$ = replace_regex$(config.openLog$, "^~/", "'homeDirectory$'/", 0)
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
	demo 'defaultFontColor$'
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
			if .pathType$ = ""
				.pathType$ = "-"
			endif
			if index_regex(.pathType$, "[^0-9]") <= 0
				call toRoman '.pathType$'
				.pathType$ = toRoman.roman$
			elsif index_regex(.pathType$, "[\?\-]")
				.pathType$ = ""
			endif
			otherASTentries$ = otherASTentries$+" "+.pathType$
			# Next round
			.iColl += 1
			.column = Get column index... AST'.iColl'
		endwhile
	endif
	# Set automatic Pathological type and write header
	call autoSetPathType
	if speakerID$ <> ""
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
	demo 'defaultFontColor$'
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
		call readTable '.preferencesFile$'
		if readTable.tableID > 0
			.preferenceTable$ = selected$("Table")
			.numPrefKeys = Get number of rows
	
			for .row to .numPrefKeys
				.variableName$ = Get value... '.row' Key
				# Check names of variables
				if index_regex(.variableName$, "^(config|mainPage)\.")
					if variableExists(.variableName$)
						.variableValue = Get value... '.row' Value
						if .variableValue <> undefined
							'.variableName$' = '.variableValue'
						endif
					elsif variableExists(.variableName$+"$")
						.variableValue$ = Get value... '.row' Value
						# Double check language!!!!
						if .variableName$ = "config.language"
							.buttonsTable$ = te.buttons$
							if .buttonsTable$ = ""
								.buttonsTable$ = buttonsTableName$
							endif
							call checkTable '.buttonsTable$'_'.variableValue$'
							if not checkTable.available
								.variableValue$ = te.defaultLanguage$
							endif
						endif
						.variableName$ = .variableName$+"$"
						'.variableName$' = "'.variableValue$'"
					endif
				endif
			endfor
			select Table '.preferenceTable$'
			Remove
		endif
		
		# Reset variables
		if te.ratingTable > 0
			select te.ratingTable
			Remove
			te.ratingTable = -1
		endif
		
		# Handle relative paths
		call expand_releative_paths
	endif
endproc

procedure write_preferences .preferencesFile$
	if config.rememberPreferences <= 0
		goto ENDOFWRITEPREFERENCES
	endif
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
	
	# Write out
	select Table Preferences
	Write to table file... '.preferencesFile$'
	Remove
	label ENDOFWRITEPREFERENCES
endproc

procedure get_nextSpeaker .speakerID$
	.reset = 0
	.numRows = 0
	call get_speakerInfo '.speakerID$'
	.row = get_speakerInfo.row
	call ReadSpeakerData 'config.speakerData$'
	if config.speakerDataTable > 0
		select config.speakerDataTable
		.numRows = Get number of rows
		.row += 1
		if .row <= 0
			.row = .numRows
			.reset = 1
		elsif .row > .numRows
			.row = 1
			.reset = 1
		endif
						
		# Randomize rows if necessary
		if .reset > 0 and config.randomizeSpeakerData
			select config.speakerDataTable
			Randomize rows
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
	.reset = 0
	call get_speakerInfo '.speakerID$'
	.row = get_speakerInfo.row
	call ReadSpeakerData 'config.speakerData$'
	if config.speakerDataTable > 0
		select config.speakerDataTable
		.numRows = Get number of rows
		.row -= 1
		if .row <= 0
			.row = .numRows
			.reset = 1
		elsif .row > .numRows
			.row = 1
			.reset = 1
		endif
		
		# Randomize rows if necessary
		if .reset > 0 and config.randomizeSpeakerData
			select config.speakerDataTable
			Randomize rows
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
	# 0 is a reset
	if .speakerID$ = "0"
		.speakerID$ = ""
		speakerInfo$ = ""
		speakerComments$ = ""
		pathologicalType = 0
	endif
	
	.id$ = .speakerID$
	.text$ = speakerInfo$
	.description$ = speakerComments$
	.audio$ = te.currentFileName$
	.ast$ = "'pathologicalType'"
	.row = 0
	.startTime = -1
	.endTime = -1
	.saveAudio$ = "No"
	
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
				# Look if the audio has to be saved
				.saveAudio$ = "No"
				if .audio$ <> ""
					select config.speakerDataTable
					.colIndex = Get column index... SaveAudio
					if .colIndex > 0
						.saveAudio$ = Get value... '.row' SaveAudio
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

# Set all audio files paths relative to the path to the .tableFile$
# Write them into a COPY of the table
procedure normalize_speakerData .tableFile$
	.rootPath$ = replace_regex$(.tableFile$, "[^/]+$", "", 0)
	.rootCurrent$ = ""
	if .tableFile$ <> config.speakerData$
		.rootCurrent$ = replace_regex$(config.speakerData$, "[^/]+$", "", 0)
	endif
	select config.speakerDataTable
	.table = Copy... TempTable
	.numRows = Get number of rows
	for .row to .numRows
		select .table
		.audioPath$ = Get value... '.row' Audio
		# Expand current audio paths
		if .rootCurrent$ <> "" and not startsWith(.audioPath$, "/")
			.audioPath$ = .rootCurrent$+.audioPath$
		endif
		# Remove .rootPath's from audio paths
		if startsWith(.audioPath$, .rootPath$)
			.audioPath$ = replace$(.audioPath$, .rootPath$, "", 1)
			Set string value... '.row' Audio '.audioPath$'
		endif
	endfor
endproc

# Non-interactive procedure to load a specific speaker from Speaker Data
procedure loadSpeaker .newSpeakerID$
	call get_speakerInfo '.newSpeakerID$'
	.newSpeakerID$ = get_speakerInfo.id$
	speakerInfo$ = get_speakerInfo.text$
	speakerComments$ = get_speakerInfo.description$
	te.currentFileName$ = get_speakerInfo.audio$
	pathologicalType = 'get_speakerInfo.ast$'
	call getOpenFile 'te.currentFileName$'
	Rename... Speech
	call set_new_speakerdata '.newSpeakerID$'
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
		# After loading speaker data, this becomes the root directory.
		config.rootDirectory$ = .dataDir$+"/"
		call load_local_preferences '.dataDir$'
		# Find the table
		if index_regex(.speakerData$, "\.(?itsv|table)")
			.numSelected = numberOfSelected()
			if .numSelected > 0
				.currentSelected = selected()
			else
				.currentSelected = -1
			endif
			call readTable '.speakerData$'
			config.speakerDataTable = readTable.tableID
			if config.speakerDataTable <= 0 or .currentSelected = config.speakerDataTable
				config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime
			else
				# Complete columns
				.col = Get column index... ID
				if .col <= 0
					Append column... ID
					# We really need unique IDs!!! Supply them
					.numRows = Get number of rows
					for .i to .numRows
						Set string value... '.i' ID Item'.i'
					endfor
				else
					# Check and correct ID's for uniqueness
					select config.speakerDataTable
					.numRows = Get number of rows
					.idList$ = tab$
					for .row to .numRows
						select config.speakerDataTable
						.id$ = Get value... '.row' ID
						.exists = index_regex(.idList$, "\t'.id$'\t")
						if .exists != undefined and .exists > 0
							.copyNum = 1
							while index_regex(.idList$, "\t'.id$'_'.copyNum'\t")
								.copyNum += 1
							endwhile
							.id$ = .id$+"_'.copyNum'"
							Set string value... '.row' ID '.id$'
						endif
						.idList$ = .idList$+.id$+tab$
					endfor
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
			# After loading speaker data, this becomes the root directory.
			config.rootDirectory$ = .dataDir$+"/"
			call load_local_preferences '.dataDir$'
					
			# Randomize rows if necessary
			if config.randomizeSpeakerData
				select config.speakerDataTable
				Randomize rows
			endif
		else
			# Reset SpeakerData table
			call initializeSpeakerData
			config.speakerData$ = .speakerData$
			# Create new SpeakerData table
			.rawStrings = Read Strings from raw text file... '.speakerData$'
			.numStrings = Get number of strings
			if .numStrings > 0
				config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime

				for .row to .numStrings
					select .rawStrings
					.currentString$ = Get string... '.row'
					
					select config.speakerDataTable
					Append row
					if index_regex(.currentString$, "\t")
						.column = 1
						while index_regex(.currentString$, "\S")
							.nextEnd = index_regex(.currentString$, "[\t\n]")
							if .nextEnd <= 0
								.nextEnd = length(.currentString$) + 1
							endif
							.colLabel$ = Get column label... '.column'
							.nextValue$ = left$(.currentString$, (.nextEnd - 1))
							.currentString$ = right$(.currentString$, (length(.currentString$) - .nextEnd))
							Set string value... '.row' '.colLabel$' '.currentString$'
							.column += 1
						endwhile
					else
						Set string value... '.row' ID Item'.row'
						Set string value... '.row' Audio '.currentString$'
					endif
				endfor
				# Remove empty first row
				select config.speakerDataTable
				.lastRow = Get number of rows
				Remove row... .lastRow
			endif
			select .rawStrings
			Remove
			
			# Created new data table, backup if needed
			if config.createBackup
				config.speakerData$ = replace_regex$(config.speakerData$, "(\.\w+)$", ".tsv", 0)
				select config.speakerDataTable
				Save as tab-separated file... 'config.speakerData$'
			endif
		endif
	endif
endproc

procedure load_audio_file .newSpeakerID$ .fileName$
	if .fileName$ <> ""
		call getOpenFile '.fileName$'
		Rename... Speech
		recordedSound$ = selected$("Sound")
		te.openSound = selected("Sound")
		call set_new_speakerdata '.newSpeakerID$'
		call post_processing_sound
		# Draw
		call init_window
	endif
endproc

procedure initializeSpeakerData
	.speakerID$ = speakerID$
	if  config.speakerDataTable > 0
		select config.speakerDataTable
		Remove
	endif
	call get_speakerInfo 0
	config.speakerDataBackup$ = ""
	config.speakerData$ = ""
	config.speakerDataTable = -1
endproc

procedure WriteSpeakerData
	call get_speakerInfo 'speakerID$'
	# Table does not exist
	if config.speakerDataTable <= 0
		config.speakerDataBackup$ = ""
		config.speakerData$ = ""
		config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime
		select config.speakerDataTable
		.row = Get number of rows
	elsif get_speakerInfo.row > 0
		.row = get_speakerInfo.row
	else
		select config.speakerDataTable
		.id$ = Get value... 1 ID
		.numRows = Get number of rows
		if .numRows = 1 and (.id$ = "" or .id$ <> "?")
			.row = 1
		else		
			Append row
			.row = Get number of rows
		endif
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
			call readTable 'config.speakerData$'
			.tmpTable = readTable.tableID
			if .tmpTable > 0
				Save as tab-separated file... 'config.speakerDataBackup$'
				select .tmpTable
				Remove
			endif
		endif
		select config.speakerDataTable
		# Sort rows if necessary
		if config.speakerDataTable > 0 and config.randomizeSpeakerData
			select config.speakerDataTable
			Sort rows: "ID"
		endif
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
	if .pathType < 9
		pathologicalType = .pathType
	endif
	call get_speakerInfo 'speakerID$'
	if get_speakerInfo.row > 0
		# .pathType 9 is just for marking the interval
		if .pathType >= 9
			Set string value... 'get_speakerInfo.row' StartTime 'selectedStartTime:4'
			Set string value... 'get_speakerInfo.row' EndTime 'selectedEndTime:4'
		elsif pathologicalType > 0
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
# Include the main page buttons and procedures
#
# TEVA 1.1
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
	call convert_praat_to_latin1 '.helpText$'
	.helpText$ = convert_praat_to_latin1.text$
	
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
			if .filename$ <> ""
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
				call get_speakerInfo 0
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
	if te.currentFileName$ <> ""
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
		# Get rid of speaker table in running recording task
		if te.recordingTaskTable > 0
			call unload_RecordingTask
		endif
	endif
	
	.newSpeakerID$ = get_previousSpeaker.id$
	.newFileName$ = get_nextSpeaker.audio$
	call reset_analysis
	speakerID$ = .newSpeakerID$
	te.currentFileName$ = .newFileName$
	if te.currentFileName$ <> ""
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
		# Search first empty row
		if config.speakerDataTable > 0 and speakerID$ <> "" and speakerID$ <> "0"
			selectObject: config.speakerDataTable
			.numColumns = Get number of columns
			.numRows = Get number of rows
			.first = 1
			if .numColumns > 4
				for .c from 5 to .numColumns
					.cLabel$ = Get column label: .c
					.r = Search column: .cLabel$, "?"
					if .r > .first
						.first = .r
					endif
				endfor
			endif
			if .first < .numRows
				speakerID$ = Get value: .first, "ID"
			endif
		endif
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
			elsif startsWith(buttonClicked.label$, ">")
				.labelRating$ = replace_regex$(buttonClicked.label$, "^[^a-zA-Z]+([A-Za-z])", "\l\1", 0)
				rating.'.labelRating$' = buttonClicked.fractionX

				call set_RatingValues config.speakerDataTable Rating.'.labelRating$' 'buttonClicked.fractionX'
				call get_RatingValues 'config.speakerDataTable' 'te.ratingTable'
	
				.fractionYRating = buttonClicked.fractionY
				call Draw_button_internal 1 'te.rating$' 'buttonClicked.label$' 0
				call link_RatingValues 'te.ratingTable' 'config.speakerDataTable' 'buttonClicked.label$'
			elsif index(buttonClicked.label$, "_")
				.labelPrefix$ = ""
				.labelRating$ = buttonClicked.label$
				.value$ = replace_regex$(buttonClicked.label$, "^[^_]*_(.*)$", "\1", 0)
				if startsWith(buttonClicked.label$, "()")
					.labelPrefix$ = replace_regex$(.labelRating$, "^([^a-zA-Z]+).*$", "\1", 0)
					.labelRating$ = replace_regex$(.labelRating$, "^[^a-zA-Z]+", "", 0)
				endif
				.labelRating$ = replace_regex$(.labelRating$, "^([^_]*)_.*$", "\l\1", 0)
				if variableExists("rating.'.labelRating$'$")
					.pressed$ = rating.'.labelRating$'$
					.labelRatingName$ = replace_regex$(.labelRating$, "^([A-Za-z])", "\u\1", 0)
					call Draw_button_internal 1 'te.rating$' '.labelPrefix$''.labelRatingName$'_'.pressed$' 0
				endif
				call set_RawRatingValues config.speakerDataTable Rating.'.labelRating$' '.value$'
				call get_RatingValues 'config.speakerDataTable' 'te.ratingTable'
				if variableExists("rating.'.labelRating$'$")
					.pressed$ = rating.'.labelRating$'$
					.labelRatingName$ = replace_regex$(.labelRating$, "^([A-Za-z])", "\u\1", 0)
					call Draw_button_internal 1 'te.rating$' '.labelPrefix$''.labelRatingName$'_'.pressed$' 2
				endif
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
		.currentID$ = demoAppName$
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
			if startsWith(.ratingKey$, ">") or startsWith(.ratingKey$, "()")
				.variableName$ = replace_regex$(.ratingKey$, "^[^a-zA-Z]+([A-Za-z])", "\l\1", 0)
			else
				.variableName$ = .ratingKey$
			endif
			if index(.ratingKey$, "_")
				.variableName$ = replace_regex$(.variableName$, "_.*$", "", 0)
			endif
			.variableName$ = replace_regex$(.variableName$, "^([A-Za-z])", "\l\1", 0)
			if index_regex(.variableName$, "[$,:;!]") <= 0
				call get_speakerInfo 'speakerID$'
				.row = get_speakerInfo.row
				select .speakerDataTable
				.column = Get column index... Rating.'.variableName$'
				'.variableName$' = -1
				if .row > 0
					if .column > 0
						# Clean up earlier values
						rating.'.variableName$' = -1
						rating.'.variableName$'ArrayLength = 0
						rating.'.variableName$'Array[1] = -1
						.valueTxt$ = Get value... .row Rating.'.variableName$'
						.value = Get value... .row Rating.'.variableName$'
						if not .value = undefined
							rating.'.variableName$' = (.value - 1)/999
							rating.'.variableName$'$ = "'.value'"
						endif
						# Ranges
						if index(.valueTxt$, ";")
							rating.'.variableName$'ArrayLength = 0
							while index_regex(.valueTxt$, "[0-9]") > 0
								rating.'.variableName$'ArrayLength += 1
								.value = extractNumber(.valueTxt$, "")
								rating.'.variableName$'Array['.variableName$'ArrayLength] = (.value - 1)/999
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

procedure set_RawRatingValues .speakerDataTable .variable$ .value$
	if .speakerDataTable > 0
		call get_speakerInfo 'speakerID$'
		.row = get_speakerInfo.row
		select .speakerDataTable
		.numRows = Get number of rows
		if .row <= 0 or .row > .numRows
			.row = 1
		endif
		# Check if column exists
		.col = Get column index: .variable$
		if .col <= 0
			Append column: .variable$
		endif
		Set numeric value... .row '.variable$' '.value$'
		
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
							rating.'.labelRating$' = .newValue
							call set_RatingValues '.speakerTable' Rating.'.variable$' '.newValue'
							call get_RatingValues '.speakerTable' '.ratingTable'
							call Draw_button_internal 1 '.rating$' '.variableLabel$' 0
						endif
					endfor
				endif 
			endif
		endif
endproc
# Include the configuration page buttons and procedures
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
	call initializeSpeakerData
	
	# Get help text
	call getLanguageTexts '.table$' '.label$'
	.newFile$ = chooseReadFile$ (getLanguageTexts.helpText$)
	config.speakerData$ = .newFile$
	# Set local preferences
	.dataDir$ = replace_regex$(config.speakerData$, "(^|[/:\\])[^/:\\]+$", "", 0)
	call load_local_preferences '.dataDir$'

    call Draw_button '.table$' '.label$' 0
endproc

procedure processConfigSpeakerDirectory .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerDirectory"
	# Remove old data table
	# Get help text
	call getLanguageTexts '.table$' '.label$'
	.dataDir$ = chooseDirectory$ (getLanguageTexts.helpText$)
	# Remove old DataTable
	if .dataDir$ <> ""
		call initializeSpeakerData
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
			if index_regex(.fileName$, "(?i\.(wav|au|snd|aif[fc]?|flac|mp3)$)")
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
	endif
	
    call Draw_button '.table$' '.label$' 0
endproc

procedure processConfigSpeakerMerge .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SpeakerMerge"
	# Get help text
	call getLanguageTexts '.table$' '.label$'
	.newFile$ = chooseReadFile$ (getLanguageTexts.helpText$)
	# Read new file
	if .newFile$ != "" and fileReadable(.newFile$)
		call readTable '.newFile$'
		.tmpNewSpeakerData = readTable.tableID
		if .tmpNewSpeakerData > 0
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
	endif
    call Draw_button '.table$' '.label$' 0
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
			call readTable 'config.speakerDataBackup$'
			if readTable.tableID > 0
				config.speakerDataTable = readTable.tableID
				config.createBackup = 1
				select config.speakerDataTable
				Save as tab-separated file... 'config.speakerData$'
			endif
		endif
	endif
	
    call Draw_button '.table$' '.label$' 0
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
			config.speakerDataBackup$ = ""
			config.speakerData$ = .filename$
		endif
	endif
    call Draw_button '.table$' '.label$' 0
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
    call Draw_button '.table$' '.label$' 0
endproc

procedure processConfigSaveAll .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "SaveAll"

	config.saveAll = not config.saveAll

	.displayButton = 2*config.saveAll
    call Draw_button '.table$' '.label$' '.displayButton'
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
		call reset_analysis
		# Initialize Speaker Data
		call initializeSpeakerData
		speakerInfo$ = ""
		speakerComments$ = ""
		pathologicalType = 0
		# Set up new speaker data table
		if config.speakerDataTable <= 0
			config.speakerDataTable = Create Table with column names... SpeakerData 1 ID Text Description Audio AST StartTime EndTime
		endif
	endif
    call Draw_button '.table$' '.label$' 0
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

	call Draw_button '.table$' SaveFMT_'config.saveFMT$' 0
	config.saveFMT$ = .fmt$
	call Draw_button '.table$' SaveFMT_'config.saveFMT$' 2

endproc

procedure processConfigAutoSelect .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "AutoSelect"

	config.autoSelect = not config.autoSelect

	.displayButton = 2*config.autoSelect
    call Draw_button '.table$' '.label$' '.displayButton'
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
    call Draw_button '.table$' '.label$' 0
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
    call Draw_button '.table$' '.label$' 0
endproc

procedure processConfigRecordingTime .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "RecordingTime"
	.fileLabel$ = "RecordingTask"
	# Original values
	.orig_recordingTime$ = config.recordingTime$
	.orig_recordingTaskFile$ = config.recordingTaskFile$
	.orig_recordingTarget$ = config.recordingTarget$
	.orig_recordingScreen$ = config.recordingScreen$
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
			sentence (.inputTaskFile$, config.recordingScreen$ + config.recordingTaskFile$)
			sentence (.inputTarget$, config.recordingTarget$)
		clicked = endPause ("'getLanguageTexts.cancelText$'", "'.inputTaskFile$'", "'.inputTarget$'", "'.inputTaskClear$'", "'getLanguageTexts.continueText$'", 5, 1)
		# Cancel
		if clicked = 1
			config.recordingTime$ = .orig_recordingTime$
			config.recordingTaskFile$ = .orig_recordingTaskFile$
			config.recordingTarget$ = .orig_recordingTarget$
			config.recordingScreen$ = .orig_recordingScreen$
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
				if startsWith(.inputFile$, "*")
					config.recordingScreen$ = left$(.inputFile$, 1)
					.inputFile$ = right$(.inputFile$, length(.inputFile$) - 1)
				endif
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
    call Draw_button '.table$' '.label$' 0
endproc

procedure processConfigShowBackground .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "ShowBackground"
	config.showBackground = not config.showBackground
	.displayButton = 2*config.showBackground
    call Draw_button '.table$' '.label$' '.displayButton'
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
    call Draw_button '.table$' '.label$' '.displayButton'
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
    call Draw_button '.table$' '.label$' '.displayButton'
endproc

procedure processConfigCalcGNE .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "CalcGNE"
	config.calcGNE = not config.calcGNE
	.displayButton = 2*config.calcGNE
    call Draw_button '.table$' '.label$' '.displayButton'
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

procedure processConfigSource .change$ .clickX .clickY .pressed$
	.table$ = "Config"
	.label$ = "Source_'.change$'"
	.file$ = ""
    call Draw_button '.table$' Source_'config.source$' 0
    # No open Sound, nothing to do
    if te.openSound <= 0
		config.source$ = "Original"
		.change$ = "Original"
		if te.originalRecording > 0
			select te.originalRecording
			Remove
		endif
	endif
	
	# Get original sound
	if te.originalRecording > 0
		.originalRecording = te.originalRecording
		te.originalRecording = -1
		# Reset everything and load the file again
		@getOpenFile: "'.originalRecording'"
		# Restore the original recording
		te.originalRecording = .originalRecording
	elsif te.openSound > 0
		select te.openSound
		te.originalRecording = Copy: "OriginalRecording"
	else
		# Nothing to do, reset button
		call Draw_button '.table$' '.label$' 0
		config.source$ = "Original"
		goto SKIPVOICESOURCE
	endif

	# Change original sound
	if .change$ <> "Original"
		config.source$ = .change$
		# Get feedback texts
		call getLanguageTexts '.table$' '.label$'
		.helpText$ = getLanguageTexts.text$
		call get_feedback_text 'config.language$' SpeakerAudio
		.inputFile$ = get_feedback_text.text$
		.inputProsody$ = "Prosody"
		.inputAR$ = "Syll sec"
		.prosody = 0.8
		.articulationRate = 3.5
		if config.sourceFile$ <> "" and fileReadable(config.sourceFile$)
			.file$ = config.sourceFile$
		else
			.file$ = ""
		endif
		.clicked = -1
		while .clicked <> 3 and .clicked <> 1
			beginPause(getLanguageTexts.helpText$)
				sentence (.inputFile$, .file$)
				positive (.inputProsody$, .prosody)
				positive (.inputAR$, .articulationRate)
			.clicked = endPause ("'getLanguageTexts.cancelText$'", .inputFile$, "'getLanguageTexts.continueText$'", 3, 1)
			# Cancel
			if .clicked = 1
				.file$ = ""
			# Input source file
			elsif .clicked = 2
				.filename$ = chooseReadFile$ (.file$)
				if .filename$ <> "" and fileReadable(.filename$)
					.file$ = .filename$
				endif
			# Continue
			elsif .clicked = 3
				.inputFile$ = replace_regex$(.inputFile$, "^(.)", "\l\1", 0)
				.inputProsody$ = replace_regex$(.inputProsody$, "^(.)", "\l\1", 0)
				.inputAR$ = replace_regex$(.inputAR$, "^(.)", "\l\1", 0)
				.inputAR$ = replace_regex$(.inputAR$, "[^a-zA-Z0-9_\-]", "\_", 0)
				.file$ = '.inputFile$'$
				.prosody = '.inputProsody$'
				.articulationRate = '.inputAR$'
				if .file$ <> "" and fileReadable(.file$)
					config.sourceFile$ = .file$
					te.source = Read from file: config.sourceFile$
					.sourceType$ = selected$()
					.sourceType$ = extractWord$(.sourceType$, "")
					if .sourceType$ <> "Sound"
						select te.source
						Remove
						te.source = -1
						config.source$ = "Original"
					elsif te.openSound > 0
						@copy_source_into_target: .prosody, .articulationRate
						.originalRecording = te.originalRecording
						te.originalRecording = -1
						@getOpenFile: "'te.openSound'"
						config.source$ = "Change"
						# Restore the original recording
						te.originalRecording = .originalRecording
					endif
				endif
			endif
		endwhile
	endif
	label SKIPVOICESOURCE
    call Draw_button '.table$' Source_'config.source$' 2
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
 	demo Text... '.xleft' Left '.ytext' Bottom 'demoAppName$' version 0.1
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
		call get_printsignal_text 'config.language$' Rating.quality
		.vq$ = get_printsignal_text.text$
		call get_RatingInfo Rating.impression '.speakerID$'
		if get_RatingInfo.subtext$ <> ""
			.subtext$ = .subtext$ + " " + .vq$ + "/" + get_RatingInfo.subtext$
		else
			# There is always a computed value
			.subtext$ = .subtext$ + " " + get_printsignal_text.text$ + ": -"
		endif
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

# Start instruction loop
while demoWaitForInput()
	.label$ = ""
	.clickX = -1
	.clickY = -1
	.pressed$ = ""
	if demoClicked()
		.clickX = demoX()
		.clickY = demoY()
		call buttonClicked 'te.buttons$' '.clickX' '.clickY'
		.label$ = buttonClicked.label$
	elsif demoKeyPressed()
		.pressed$ = demoKey$()
		call keyPressed 'te.buttons$' '.pressed$'
		.label$ = keyPressed.label$
	endif
	
	# You cannot select a text field
	if startsWith(.label$, "$") or startsWith(.label$, "!")
		# All caps labels are "unhideable"
		if index_regex(.label$, "[a-z]") > 0
			.label$ = ""
		endif
	endif
	
	# Do things
	if .label$ != ""
		# Push button down
		call Draw_button 'te.buttons$' '.label$' 1
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
	call log_command 'te.buttons$' '.label$' '.clickX' '.clickY' '.pressed$'
	
	# Process the command
	if .label$ <> "" and not startsWith(.label$,"!")
		.label$ = replace$(.label$, "_", " ", 0)
		call process'te.buttons$''.label$' '.clickX' '.clickY' '.pressed$'
	elsif .label$ <> "" and startsWith(.label$,"!")
		.label$ = right$(.label$, length(.label$)-1)
		.label$ = replace$(.label$, "_", " ", 0)
		call process'te.buttons$''.label$' '.clickX' '.clickY' '.pressed$'
	endif
endproc

# Intialize buttons
procedure init_buttons
	# Set Speaker color
	call switch_speaker_next_button 'config.speakerSerial$'

	call Draw_all_buttons 'te.buttons$'
endproc

# Draw all buttons
procedure Draw_all_buttons .table$
	.varPrefix$ = replace_regex$(.table$, "^(.)", "\l\1", 0)
	if index_regex(.table$, "[^0-9]") > 0
		select Table '.table$'
	else
		select '.table$'
		.table$ = selected$("Table")
	endif
	.numRows = Get number of rows
	
	for .row to .numRows
		.label$ = Get value... '.row' Label
		if startsWith(.label$, ">")
		    call Draw_button_internal 1 '.table$' '.label$' 0
		elsif startsWith(.label$, "()")
			.pressed$ = "0"
			.labelName$ = replace_regex$(.label$, "^[^A-Za-z]+([^_]+)(_.*)?$", "\l\1", 0)
			.varValue$ = replace_regex$(.label$, "^[^_]+_(.*)$", "\1", 0)
			if variableExists("rating.'.labelName$'$") 
				.tmp$ = rating.'.labelName$'$
				if .tmp$ = .varValue$
					.pressed$ = "2"
				endif
			endif
		    call Draw_button_internal 1 '.table$' '.label$' '.pressed$'
			
        elsif not startsWith(.label$, "!") 
			.pressed = 0
			# Determine the "pressed" state of a button
			# A variable with the same name as the button will act as a
			# "pressed state"
			.variableName$ = .varPrefix$+"."+(replace_regex$(.label$, "^(.)", "\l\1", 0))
			# Simple boolean variables
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
		if not startsWith(.label$, "!")
			.rowHidden = Search column... Label !'.label$'
			if .rowHidden > 0
				goto NOBUTTON
			endif
		endif
		call emergency_table_exit Button Table '.table$' does not have a row with label '.label$'
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
	.topBackGroundColorDown$ = "{0.82,0.82,0.9}"
	.topLineColorDown$ = "{0.3,0.3,0.3}"
	.topLineWidthDown = 1.5
	.topBackGroundColorDisabled$ = "{0.90,0.90,0.90}"
	.topLineColorDisabled$ = "{0.85,0.85,0.85}"
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
    .buttonKey$ = Get value... '.row' Key
    .buttonColor$ = Get value... '.row' Color
    .buttonDraw$ = Get value... '.row' Draw
    .buttonKey$ = Get value... '.row' Key
    
    # No visible button
    if .leftX <= 0 and .rightX <= 0 and .lowY <= 0 and .highY <= 0
    	goto NOBUTTON
    endif

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
		.eraseLeft = .shiftLeftX - 0.1
		.eraseRight = .shiftRightX + 0.1
		.eraseBottom = .shiftLowY - 0.01
		.eraseTop = .shiftHighY + 0.01
		demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
	endif
	# Set a "gray area" around buttons with a _
	if index(.label$, "_")
		# Make erase area minutely larger
		.eraseLeft = .shiftLeftX - 0.5
		.eraseRight = .shiftRightX + 0.5
		.eraseBottom = .shiftLowY - 0.8
		.eraseTop = .shiftHighY + 0.8
		demo Paint rectangle... {0.92,0.92,0.92} .eraseLeft .eraseRight .eraseBottom .eraseTop
	endif
	
    # If label starts with "$", it is a text field. Then do not draw the button
	if startsWith(.label$, "()")
		.radius = min((.shiftRightX - .shiftLeftX), (.highY - .lowY)/4)
		.innerRadius = 2* .radius / 3
		.circleX = (.shiftRightX + .shiftLeftX)/2
		.circleY = .shiftHighY - .radius

    	# Give some depth to button: Draw flank outline
		if .shiftDown or .shiftX or .shiftY
			if .push <= 0
    			demo Paint circle: .flankBackGroundColorUp$, .circleX, .circleY, .radius
				demo Colour: .flankLineColorUp$
    			demo Line width: .flankLineWidthUp
			else
    			demo Paint circle: .flankBackGroundColorDown$, .circleX, .circleY, .radius
				demo Colour: .flankLineColorDown$
    			demo Line width: .flankLineWidthDown
			endif
    		demo Draw circle: .circleX, .circleY, .radius
		endif
		
		.circleX = (.rightX + .leftX)/2
		.circleY = .highY - .radius

    	# Draw the button top
		if .push = 0
			demo Paint circle: .topBackGroundColorUp$, .circleX, .circleY, .radius
			demo Colour: .topLineColorUp$
			demo Line width: .topLineWidthUp
		elsif .push < 0
			demo Paint circle: .topBackGroundColorDisabled$, .circleX, .circleY, .radius
			demo Colour: .topLineColorDisabled$
			demo Line width: .topLineWidthDisabled
		elsif .push = 1
			demo Paint circle: .topBackGroundColorDisabled$, .circleX, .circleY, .radius
			demo Paint circle: "Grey", .circleX, .circleY, .innerRadius
			demo Colour: .topLineColorDisabled$
			demo Line width: .topLineWidthDisabled
		else
			# Button Down
			.circleX = (.rightX + .leftX)/2 - .shiftDown
			.circleY = .highY -.radius - .shiftDown

			demo Paint circle: .topBackGroundColorDown$, .circleX, .circleY, .radius
			demo Paint circle: "Black", .circleX, .circleY, .innerRadius
			demo Colour: .topLineColorDown$
			demo Line width: .topLineWidthDown
		endif
    	demo Draw circle: .circleX, .circleY, .radius
		
	elsif not startsWith(.label$, "$")
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
	.keyText$ = replace$(.buttonKey$, "\", "", 0)
	.keyText$ = replace$(.keyText$, "-", "", 0)
	.newText$ = ""
	if .keyText$ <> ""
		.newText$ = replace_regex$(.buttonText$, "['.keyText$']", "#%&", 1)
	endif
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
    elsif .push <= -2
        .buttonColor$ = "{0.85,0.85,0.85}"
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
	# Handle VAScale bars
    if startsWith(.label$, ">")
		# Wipe previous Text
		.eraseLeft = .leftX
		.textLength = demo Text width (wc)... '.newText$'
		.eraseRight = .eraseLeft + .textLength
		.eraseBottom = .highY + 1
		.eraseTop = .eraseBottom + adjustFontSizeOnHeight.lineHeight
		demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
		
		# Write new label
		demo Text special... '.leftX' Left '.highY' Bottom 'defaultFont$' '.buttonFontSize' '.rotation' '.buttonText$'
		# Write other texts
		.leftMark$ = ""
		.rightMark$ = ""
		if index(.buttonKey$, ";") > 0
			.leftMark$ = left$(.buttonKey$, index(.buttonKey$, ";")-1)
			.rightMark$ = extractLine$(.buttonKey$, ";")
		endif
		if index_regex(.leftMark$, "\S")
			.textX = .leftX - 1
			# Wipe area
			.eraseRight = .textX
			.textLength = demo Text width (wc)... '.leftMark$'
			call points_to_wc '.buttonFontSize'
			.textHeight = points_to_wc.wc
			.eraseLeft = .eraseRight - .textLength - 1
			.eraseBottom = .lowY
			.eraseTop = .eraseBottom + .textHeight + 1
			demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
			# Write left mark
			demo Text special... '.textX' Right '.lowY' Bottom 'defaultFont$' '.buttonFontSize' '.rotation' '.leftMark$'
		endif
		if index_regex(.rightMark$, "\S")
			.textX = .rightX + 0.5
			# Wipe area
			.eraseLeft = .textX
			.textLength = demo Text width (wc)... '.rightMark$'
			call points_to_wc '.buttonFontSize'
			.textHeight = points_to_wc.wc
			.eraseRight = .eraseLeft + .textLength + 1
			.eraseBottom = .lowY
			.eraseTop = .eraseBottom + .textHeight + 1
			demo Paint rectangle... White .eraseLeft .eraseRight .eraseBottom .eraseTop
			demo Text special... '.textX' Left '.lowY' Bottom 'defaultFont$' '.buttonFontSize' '.rotation' '.rightMark$'
		endif
		# Draw ticks
		if config.vasScaleTicks
			.deltaSmallTick = (.rightX - .leftX)/20
			.deltaLargeTick = (.rightX - .leftX)/10
			demo Colour... {0.6,0.6,0.8}
			demo Line width... 1
	 		# Small scale ticks
	 		.tickhighY = .highY - (.highY-.lowY)/3
	 		.ticklowY = .lowY + (.highY-.lowY)/3
			.scaleTick = .leftX + .deltaSmallTick
			while .scaleTick < .rightX
				demo Draw line... '.scaleTick' '.ticklowY' '.scaleTick' '.tickhighY'
				.scaleTick +=  .deltaLargeTick
			endwhile
	 		# Big scale ticks
	 		.tickhighY = .highY - (.highY-.lowY)/5
	 		.ticklowY = .lowY + (.highY-.lowY)/5
			.scaleTick = .leftX + .deltaLargeTick
			.tickTexts = 10
			while .scaleTick < .rightX
				demo Text special... '.scaleTick' Centre '.lowY' Top 'defaultFont$' 7 0 '.tickTexts'
				demo Draw line... '.scaleTick' '.ticklowY' '.scaleTick' '.tickhighY'
				.scaleTick +=  .deltaLargeTick
				.tickTexts += 10
			endwhile
		endif
		
		# Draw current position tick
		.varName$ = replace_regex$(.label$, "^[^a-zA-Z]+([a-zA-Z])", "\l\1", 0)
		.varName$ = "rating.'.varName$'"
		.varNameArray$ = "'.varName$'Array"
		.fraction = -1
		# Several values
		if variableExists(.varNameArray$+"[1]") and '.varName$'Array[1] > -1
			.vasColor$ = "Blue"
			.numFractions = '.varName$'ArrayLength
			for .fi to .numFractions
				.fraction = '.varNameArray$'[.fi]
				if .fraction != undefined
					if .fraction < 0
						.fraction = 0.5
						.vasColor$ = "Grey"
					endif
					.midpoint = .leftX + .fraction * (.rightX - .leftX)
					demo Colour... '.vasColor$'
					demo Line width... 1.5
					demo Draw line... '.midpoint' '.lowY' '.midpoint' '.highY'
				endif
			endfor
		# Single marker
		elsif variableExists(.varName$)
			.vasColor$ = "Red"
			.fraction = -1
			.fraction = '.varName$'
			if .fraction < 0
				.fraction = 0.5
				.vasColor$ = "Grey"
			endif
			.midpoint = .leftX + .fraction * (.rightX - .leftX)
			demo Colour... '.vasColor$'
			demo Line width... 1.5
			demo Draw line... '.midpoint' '.lowY' '.midpoint' '.highY'
		endif
	elsif startsWith(.label$, "()")
		demo Text special... '.centerX' Centre '.lowY' Half 'defaultFont$' '.buttonFontSize' 0 '.newText$'
    else
		demo Text special... '.centerX' Centre '.anchorY' '.verticalAlignment$' 'defaultFont$' '.buttonFontSize' '.rotation' '.newText$'
	endif
	demoShow()

	# Reset
	call set_font_size 'defaultFontSize'
    demo 'defaultFontColor$'
    demo Line width... 'defaultLineWidth'
    
    label NOBUTTON
endproc

procedure set_window_title .table$ .addedText$
    select Table '.table$'
    .row = Search column... Label !WindowTitle
	if .row < 1
		call emergency_table_exit Button Table '.table$' does not have a row with label !WindowTitle
	endif
	.windowText$ = Get value... '.row' Text
	call convert_praat_to_latin1 '.windowText$'
	.windowText$ = convert_praat_to_latin1.text$

	if index(.windowText$, "$$$")
		.displayWindowText$ = replace$(.windowText$, "$$$", .addedText$, 0)
	else
		.displayWindowText$ = .windowText$ + .addedText$
	endif
	
    demoWindowTitle(.displayWindowText$ )
endproc

# Handle language setting 
procedure processLanguageCodes .table$ .label$
	.table$ = "Config"
    call Draw_button 'te.config$' Language_'config.language$' 0
    call Draw_button 'te.config$' '.label$' 2
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
    if te.buttons$ <> ""
        select Table 'te.buttons$'
        Remove
		.redraw_config = 1
    endif
    if te.config$ <> ""
        select Table 'te.config$'
        Remove
		.redraw_config = 1
    endif
    if te.ratingTable > 0
		select te.ratingTable
		Remove
		te.ratingTable = -1
		te.rating$ = ""
    endif
    
    # Set language
	call checkTable 'buttonsFileName$'_'.lang$'
	# Handle alternative Main Page layout
	if not checkTable.available
		call checkTable 'buttonsTableName$'_'.lang$'
	endif
	
	if checkTable.available
		config.language$ = .lang$
		
		if config.language$ = "JA"
			CJK font style preferences: "Japanese"
		elsif config.language$ = "ZH"
			CJK font style preferences: "Chinese"
		endif
	else
		config.language$ = "EN"
	endif
    
    # Load buttons tables
    call loadLanguageTable 'buttonsTableName$' 'config.language$'
    select loadLanguageTable.tableID
    te.buttons$ = selected$("Table")
    call relative2absolutePosition 'te.buttons$'
	if config.ratingExperiment
		call hide_buttons_for_rating_experiment
	endif
    # Load configuration table
    call loadLanguageTable 'configTableName$' 'config.language$'
    select loadLanguageTable.tableID
    te.config$ = selected$("Table")
    call relative2absolutePosition 'te.config$'
    
    # Hide platform specific buttons on load
	if windows
		call hide_button 'te.config$' SaveFMT_PDF
	else
		call hide_button 'te.config$' SaveFMT_EMF
	endif
    

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
# Convert relative button positions to absolute button positions
procedure relative2absolutePosition .table$
	select Table '.table$'
	.numRows = Get number of rows
	
	for .row to .numRows
		# Get button values, between lines
		# ^+/-x means "add/subtract x to/from value on the previous row"
		if .row > 1
			.prevRow = .row - 1
			select Table '.table$'
			.leftXtxt$ = Get value... '.row' LeftX
			.rightXtxt$ = Get value... '.row' RightX
			.lowYtxt$ = Get value... '.row' LowY
			.highYtxt$ = Get value... '.row' HighY
			if startsWith(.leftXtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' LeftX
				.leftXtxt$ = right$(.leftXtxt$, length(.leftXtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.leftXtxt$'
				select Table '.table$'
				Set numeric value... '.row' LeftX 'r2aConversionOfValue2.result'
			elsif startsWith(.rightXtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' RightX
				.rightXtxt$ = right$(.rightXtxt$, length(.rightXtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.rightXtxt$'
				select Table '.table$'
				Set numeric value... '.row' RightX 'r2aConversionOfValue2.result'
			endif
			if startsWith(.lowYtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' LowY
				.lowYtxt$ = right$(.lowYtxt$, length(.lowYtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.lowYtxt$'
				select Table '.table$'
				Set numeric value... '.row' LowY 'r2aConversionOfValue2.result'
			elsif startsWith(.highYtxt$, "^")
				.prevValuetxt$ = Get value... '.prevRow' HighY
				.highYtxt$ = right$(.highYtxt$, length(.highYtxt$) - 1)
				call r2aConversionOfValue2 '.prevValuetxt$' '.highYtxt$'
				select Table '.table$'
				Set numeric value... '.row' HighY 'r2aConversionOfValue2.result'
			endif
		endif
		
		# Get button values, per line
		# +/-x means "add/subtract x to/from value of other edge"
		select Table '.table$'
		.leftXtxt$ = Get value... '.row' LeftX
		.rightXtxt$ = Get value... '.row' RightX
		.lowYtxt$ = Get value... '.row' LowY
		.highYtxt$ = Get value... '.row' HighY
		if index_regex(.rightXtxt$, "^[+-]")
			call r2aConversionOfValue2 '.leftXtxt$' '.rightXtxt$'
			select Table '.table$'
			Set numeric value... '.row' RightX 'r2aConversionOfValue2.result'
		elsif index_regex(.leftXtxt$, "^[+-]")
			call r2aConversionOfValue2 '.rightXtxt$' '.leftXtxt$'
			select Table '.table$'
			Set numeric value... '.row' LeftX 'r2aConversionOfValue2.result'
		endif
		if index_regex(.highYtxt$, "^[+-]")
			call r2aConversionOfValue2 '.lowYtxt$' '.highYtxt$'
			select Table '.table$'
			Set numeric value... '.row' HighY 'r2aConversionOfValue2.result'
		elsif index_regex(.lowYtxt$, "^[+-]")
			call r2aConversionOfValue2 '.highYtxt$' '.lowYtxt$'
			select Table '.table$'
			Set numeric value... '.row' LowY 'r2aConversionOfValue2.result'
		endif
	endfor
endproc

procedure r2aConversionOfValue2 .value1$ .value2$
	.result = 0
	if index_regex(.value2$, "^[+-]")
		.sign$ = replace_regex$(.value2$, "^([+-]).*$", "\1", 0)
		.newValue$ = replace_regex$(.value2$, "^[+-](.*)$", "\1", 0)
		.result = '.value1$' '.sign$' '.newValue$'
	else
		.result = '.value2$'
	endif
endproc

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

procedure hide_all_buttons .table$
	select Table '.table$'
	.numRows = Get number of rows
	for .row to .numRows
		select Table '.table$'
		.label$ = Get value: .row, "Label"
		if not startsWith(.label$, "!")
			call hide_button '.table$' '.label$'
		endif
	endfor
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
		call emergency_table_exit "'.label$'" is not a key in '.table$'
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
procedure buttonClicked .table$ .x .y
	.label$ = ""
	select Table '.table$'
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
				.fractionX = 0.5
				.fractionY = 0.5
				if (.rightX - .leftX) > 0
					.fractionX = (.x - .leftX)/(.rightX - .leftX)
				endif
				if (.highY - .lowY) > 0
					.fractionY = (.y - .lowY)/(.highY - .lowY)
				endif
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
    if .sound and not config.muteOutput
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
	.currentSpeakerID$ = speakerID$
	call reset_analysis
	speakerID$ = .currentSpeakerID$
	.recordingTaskPrompt = 0
	.sampleFreq = te.defaultSampleFreq
	if config.frequency <= 5000
		.sampleFreq = 11025
	endif
	
	# There is a very nasty delay before the first recording starts, do a dummy record
	if not variableExists("recordingInitialized")
		call basic_sound_recording 'te.recordingSampleFrequency' 0.1
		Remove
		recordingInitialized = 1
	endif

    # Show a task window
	.rectime = 'config.recordingTime$'
	if speakerID$ = ""
		call get_speakerInfo 1
		speakerID$ = get_speakerInfo.id$
	endif
    if te.recordingTaskTable > 0
		.recordingTaskPrompt = 1
		call get_speakerInfo 'speakerID$'
		if get_speakerInfo.row > 0
			.recordingTaskPrompt = get_speakerInfo.row
		endif
		select te.recordingTaskTable
		.numRows = Get number of rows
		.timeColumn = Get column index... time
		if .timeColumn > 0 and .recordingTaskPrompt <= .numRows
			.rectime = Get value... '.recordingTaskPrompt' time
		endif
		if .rectime = undefined or .rectime <= 0
			.rectime = 'config.recordingTime$'
		endif
		# When doing a recording task, wipe the screen
		demo Erase all
    endif
    
    # Display prompt if needed (Warning BEFORE the recording light)
	if .recordingTaskPrompt > 0
		.originalPopUpcolor$ = popUp.backgroundcolor$
		popUp.backgroundcolor$ = popUp.warncolor$
		.origFontColor$ = defaultFontColor$
		defaultFontColor$ = "Grey"
		call display_prompt 'te.recordingTaskTable' '.recordingTaskPrompt'
		defaultFontColor$ = .origFontColor$
		demo 'defaultFontColor$'
		popUp.backgroundcolor$ = .originalPopUpcolor$
		# Wait a moment
		call basic_sound_recording 'te.recordingSampleFrequency' 'te.waitRecordingTask'
		Remove
	endif

	# Display a recording light
	demo Paint circle... Red 'recordingLightX' 'recordingLightY' 2
	demoShow()
    
    # Display prompt if needed (AFTER the recording light)
	if .recordingTaskPrompt > 0
		popUp.backgroundcolor$ = popUp.gocolor$
		call display_prompt 'te.recordingTaskTable' '.recordingTaskPrompt'
		popUp.backgroundcolor$ = .originalPopUpcolor$
	endif

    # Record
 	call basic_sound_recording 'te.recordingSampleFrequency' '.rectime'
    .recording = basic_sound_recording.sound

	# Keep track of current sound
	call getTimeStamp
	te.recordingTimeStamp$ = getTimeStamp.string$
	te.currentFileName$ = ""
	
    # Remove prompt if needed (Warning BEFORE the recording light)
	if .recordingTaskPrompt > 0
		# When doing a recording task, wipe the screen
		demo Erase all
	else
		# Remove recording light
		demo Paint circle... White 'recordingLightX' 'recordingLightY'  2.5
	    call wipeArea 'wipeFeedbackArea$'
	endif

    # Downsample for speed
    if .sampleFreq <> te.recordingSampleFrequency
		.downsampled = Resample... '.sampleFreq' 50
		select .recording
		Remove
		.recording = .downsampled
		select .recording
		.downsampled = -1
    endif
    
	call draw_recording_level

	# Process sound
	select .recording
    Rename... Speech
	te.openSound = selected("Sound")
    recordedSound$ = selected$("Sound")
    select te.openSound
	currentStartTime = 0
	currentEndTime = Get total duration
	
	# Cut out real sound from silences/noise (if NO prompt)
	if te.recordingTaskTable <= 0
		call sound_detection 'recordedSound$' 'soundMargin'
	else
		call remove_margins 'recordedSound$' 'soundMargin'
	endif
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
	
	if config.autoSelect
		call argMinASTselection
	endif
	
	select te.openSound
endproc

# Uses global variables!!!
procedure basic_sound_recording .samplingFrequency .recordingTime
	.sound = nocheck noprogress nowarn Record Sound (fixed time)... 'config.input$' 0.99 0.5 '.samplingFrequency' '.recordingTime'
	if .sound = undefined
		.sound = Create Sound: "Pronunciation", 0, .recordingTime, .samplingFrequency, "0"
	endif
	
	# The recorded sound should now be the selected object!!!
	select .sound
endproc

procedure setup_recordingTask
	.skiprecording = 0
	.noPostfix = 0

	# Initialize TEVA
	call unload_RecordingTask
	
	# Update config.recordingTaskFile$
	if not fileReadable(config.recordingTaskFile$) and fileReadable("'defaultDirectory$'/'config.recordingTaskFile$'")
		if config.recordingTarget$ = ""
			.filenameStart = rindex_regex(config.recordingTaskFile$, "[\\/:]+[^\\/:]+$")
			config.recordingTarget$ = left$(config.recordingTaskFile$, .filenameStart - 1)
			config.recordingTarget$ = "'defaultDirectory$'/'config.recordingTarget$'"
		endif
		config.recordingTaskFile$ = "'defaultDirectory$'/'config.recordingTaskFile$'"
	endif
	
	# Read a list of prompts from a text file and create a default recording task table
	if fileReadable(config.recordingTaskFile$) and index_regex(config.recordingTaskFile$, "\.(txt|TXT|text)$") > 0
		.strings = Read Strings from raw text file: config.recordingTaskFile$
		.numStrings = Get number of strings
		.s = 1
		.text$ = Get string: .s
		while startsWith(.text$, "//")
			.s += 1
			.text$ = Get string: .s
		endwhile
		te.recordingTaskTable = Create Table with column names... RecordingTaskTable 1 postfix time align font size text
		Set string value... 1 postfix _p1
		Set numeric value... 1 time 'config.recordingTime$'
		Set string value... 1 align centre
		Set string value... 1 font Helvetica
		Set numeric value... 1 size 24
		Set string value... 1 text '.text$'
		.start = .s + 1
		.w = 1
		for .s from .start to .numStrings
			select .strings
			.text$ = Get string: .s
			# Skip empty lines
			if index_regex(.text$, "\S") and not startsWith(.text$, "//")
				select te.recordingTaskTable
				Append row
				.w += 1
				Set string value... .w postfix _p'.w'
				Set numeric value... .w time 'config.recordingTime$'
				Set string value... .w align centre
				Set string value... .w font Helvetica
				Set numeric value... .w size 24
				Set string value... .w text '.text$'
			endif
		endfor
		select .strings
		Remove
	# Read a recording task
	elsif fileReadable(config.recordingTaskFile$)
		call readTable 'config.recordingTaskFile$'
		te.recordingTaskTable = readTable.tableID
		# Do a sanity check
		if te.recordingTaskTable > 0
			.fullName$ = selected$ ()
			.type$ = extractWord$(.fullName$, "")
			if .type$ <> "Table"
				Remove
				te.recordingTaskTable = -1
				config.recordingTaskFile$ = ""
				.skiprecording = 1
			else
				.textIndex = Get column index: "text"
				if .textIndex <= 0
					Remove
					te.recordingTaskTable = -1
					config.recordingTaskFile$ = ""
					.skiprecording = 1
				else
					.textIndex = Get column index: "postfix"
					if .textIndex <= 0
					.noPostfix = 1
					endif
				endif
				
			endif
		endif
	# Create a recording task from a single line of text
	elsif startsWith(config.recordingTaskFile$, "[") and endsWith(config.recordingTaskFile$, "]")
		.text$ = left$(config.recordingTaskFile$, length(config.recordingTaskFile$) - 1)
		.text$ = right$(.text$, length(.text$) - 1)
		te.recordingTaskTable = Create Table with column names... RecordingTaskTable 1 postfix time align font size text
		.lineEnd = index(.text$, "<newline>")
		.i = 1
		repeat
			select te.recordingTaskTable
			.numRows = Get number of rows
			if .numRows < .i
				Append row
			endif
			if .lineEnd > 0
				.currentLine$ = left$(.text$, .lineEnd - 1)
				.text$ = right$(.text$, length(.text$) - (.lineEnd + 8))
				.lineEnd = index(.text$, "<newline>")
			else
				.currentLine$ = .text$
				.text$ = ""
				.lineEnd = 0
			endif
			Set string value... '.i' postfix _rec'.i'
			Set numeric value... '.i' time 'config.recordingTime$'
			Set string value... '.i' align centre
			Set string value... '.i' font Helvetica
			Set numeric value... '.i' size 24
			Set string value... '.i' text '.currentLine$'
			.i += 1
		until length(.text$) <= 0
	endif
	if te.recordingTaskTable > 0		
		# Switch to serial
		config.speakerSerial$ = "Forw"
		# Set up new Speaker table
		call initializeSpeakerData
		# Set TEVA to store all audio
		te.saveAudio = 1
		# Initialize Speaker Data
		speakerInfo$ = ""
		speakerComments$ = ""
		pathologicalType = 0
		# Ask for speaker ID
		.table$ = "MainPage"
		.label$ = "Record"
		call getLanguageTexts '.table$' '.label$'
		call get_feedback_text 'config.language$' Speaker
		# Get feedback texts
		call get_feedback_text 'config.language$' SpeakerID
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.inputText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Cancel
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.cancelText$ = convert_praat_to_latin1.text$
		call get_feedback_text 'config.language$' Continue
		call convert_praat_to_latin1 'get_feedback_text.text$'
		.continueText$ = convert_praat_to_latin1.text$
		clicked = -1
		beginPause(getLanguageTexts.helpText$)
			sentence (.inputText$, "")
		clicked = endPause ("'.cancelText$'", "'.continueText$'", 2, 1)
		if clicked = 2
			.inputText$ = replace_regex$(.inputText$, ".+", "\l&\$", 0)
			.inputText$ = replace_regex$(.inputText$, "[ ]", "_", 0)
			.inputText$ = replace_regex$(.inputText$, "\$", "", 0)
			speakerID$ = '.inputText$'$
			te.restartRecordingTask = 0
		endif
		# On Windows, clear the screen
		if windows
			call init_window
		endif

		# If a speaker ID has been supplied
		if speakerID$ <> ""
			# Date and time
			call i8n_date
			.datetime$ = i8n_date.printDate$
			# New speakerDataTable
			config.speakerData$ = ""
			config.speakerDataTable = Create Table with column names... Speaker_Data 1 ID Text Description StartTime EndTime Audio SaveAudio AST
			select te.recordingTaskTable
			.numRows = Get number of rows
			if .noPostfix
				.postfix = "rec1"
			else
				.postfix$ = Get value... 1 postfix
			endif
			.prompt$ = Get value... 1 text
			.filename$ = replace_regex$(speakerID$, "[^a-zA-Z0-9\.\-_]", "_", 0)
			if .filename$ <> ""
				createDirectory("'config.recordingTarget$'/'.filename$'")
			endif
			config.speakerData$ = "'config.recordingTarget$'/'.filename$'/'.filename$'_'.datetime$'.Table"
			select config.speakerDataTable
			Set string value... 1 ID '.filename$''.postfix$'
			Set string value... 1 Audio 'config.recordingTarget$'/'.filename$'/'.filename$''.postfix$'_'.datetime$'.wav
			# Initilaise on first row
			speakerID$ = "'.filename$''.postfix$'"
			call set_new_speakerdata 'speakerID$'
			
			# Fill other rows
			for .i from 2 to .numRows
				select te.recordingTaskTable
				if .noPostfix
					.postfix = "rec'.i'"
				else
					.postfix$ = Get value... '.i' postfix
				endif
				.prompt$ = Get value... '.i' text
				select config.speakerDataTable
				Append row
				Set string value... '.i' ID '.filename$''.postfix$'
				Set string value... '.i' Audio 'config.recordingTarget$'/'.filename$'/'.filename$''.postfix$'_'.datetime$'.wav
			endfor
		else
			.skiprecording = 1
		endif
	endif	
	
endproc

procedure unload_RecordingTask
    if te.recordingTaskTable > 0		
		select te.recordingTaskTable
		Remove
		te.recordingTaskTable = -1
		te.restartRecordingTask = 1
	endif
	call initializeSpeakerData
	call reset_analysis
	call get_speakerInfo 0
	call get_nextSpeaker 0
	call get_previousSpeaker 0
	te.saveAudio = 0
endproc

procedure display_prompt .table .number
	.maxWidth = 95
	if .table > 0
		select .table
		.align$ = "left"
		.alignColumn = Get column index... align
		.numRows = Get number of rows
		if .number > 0 and .number <= .numRows
			# Get the values
			if .alignColumn > 0
				.align$ = Get value... '.number' align
			endif
			.font$ = Get value... '.number' font
			.fontSize = Get value... '.number' size
			.font$ = extractWord$(.font$, "")
			.text$ = Get value... '.number' text
			
			# Add newlines
			if index(.text$, "\n") <= 0
				demo '.font$'
				call set_font_size '.fontSize'
	
				.line$ = ""
				.newtext$ = " "
				while index_regex(.text$, "\S") > 0
					.word$ = replace_regex$(.text$, "^([\S]*[^\S]*[\S]*)(.*$)", "\1", 0)
					.text$ = replace_regex$(.text$, "^([\S]*[^\S]*[\S]*)(.*$)", "\2", 0)
					.textWidth = demo Text width (wc)... "'.line$''.word$'"
					if .textWidth <= .maxWidth
						.line$ = .line$ + .word$
					else
						.newtext$ = .newtext$ + "\n" + .line$
						.line$ = .word$
					endif
				endwhile
				if index_regex(.line$, "\S") > 0
					.text$ = .newtext$ + "\n" + .line$
				endif
				demo 'defaultFont$'
				call set_font_size 'defaultFontSize'
			endif
			
			# Write popup
			call text2popuptable '.align$' '.font$' '.fontSize' "'.text$'"
			display_prompt.popUpTable = text2popuptable.textTable
			call write_text_table display_prompt.popUpTable
			
		endif
	endif
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
procedure remove_margins .sound$ .margin
	select Sound '.sound$'
	.origSound = selected("Sound")
	.soundlength = Get total duration
	.intensity = Get intensity (dB)
	.begintime = 0
	.endtime = .soundlength
	.internalSilence = 2*.margin
	
	# Silence and remove noise, DANGEROUS
	.textgridSound = To TextGrid (silences)... 'minimumPitch' 0 'noiseThresshold' '.internalSilence' 0.1 silent sounding
	Rename... Input'.sound$'

	select .textgridSound
	.numberofIntervals = Get number of intervals... 1
	if .numberofIntervals > 2 and .intensity > minimumIntensity
		select .textgridSound
		# First interval
		.value$ = Get label of interval... 1 1
		.intbegin = Get starting point... 1 1
		.intend = Get end point... 1 1
		if .value$ = "silent" and .intend > .margin
			.begintime = .intend - .margin
		endif
		# Last interval
		.value$ = Get label of interval... 1 '.numberofIntervals'
		.intbegin = Get starting point... 1 '.numberofIntervals'
		.intend = Get end point... 1 '.numberofIntervals'
		if .value$ = "silent" and .intbegin + .margin < .soundlength
			.endtime = .intbegin + .margin
		endif
		
		# Copy sound
		select .origSound
    	.newSound = Extract part... '.begintime' '.endtime' Rectangular 1.0 no
		Rename... '.sound$'
		select .origSound
		Remove
		select .newSound
	endif
	
endproc

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
	if .numberofIntervals < 2
		.numberofIntervals = 0
	endif

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
	# Clean up
	call reset_analysis
	call write_preferences ""
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
    demoWindowTitle("'demoAppName$': Change settings")
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
		    call buttonClicked 'te.config$' '.clickX' '.clickY'
		    .label$ = buttonClicked.label$
	    elsif demoKeyPressed()
		    .pressed$ = demoKey$()
		    call keyPressed 'te.config$' '.pressed$'
		    .label$ = keyPressed.label$
	    endif

		# You cannot select a text field
		if startsWith(.label$, "$")
			.label$ = ""
		endif
		
	    # Do things
	    if .label$ != ""
		    # Handle push button in process_config
			call Draw_button 'te.config$' '.label$' 1
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
    call Draw_all_buttons 'te.config$'
	call set_window_title 'te.config$'  
    # Set correct buttons (alert)
	call setConfigMainPage
endproc

# Do what is asked
procedure process_config .label$ .clickX .clickY .pressed$
	# Log raw commands to replay in file
	call log_command 'te.config$' '.label$' '.clickX' '.clickY' '.pressed$'
	
	if .label$ <> "" and not startsWith(.label$,"!")
		.label$ = replace$(.label$, "_", " ", 0)
		call process'te.config$''.label$' '.clickX' '.clickY' '.pressed$'
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
	.arrowSize = .lineWidth / 3
	demo Line width... '.lineWidth'
 	demo Colour... 'popUp.bordercolor$'
	demo Paint rectangle... 'popUp.backgroundcolor$' '.htXleft' '.htXright' '.htYlow' '.htYhigh'
	demo Draw rectangle... '.htXleft' '.htXright' '.htYlow' '.htYhigh'
	demo Line width... '.arrowSize'
	demo Arrow size... '.arrowSize'
	demo Draw arrow... '.xstart' '.ystart' '.xend' '.yend'
	demo Line width... 'defaultLineWidth'
	demo Arrow size... 1
	demo 'defaultFontColor$'
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
	# Check existence of (first) audiofile
	.testFile$ = replace_regex$(.openDialogue$, "\{([^,]+)[^\}]*\}", "\1", 0)
	if fileReadable(.testFile$)
		.filename$ = .openDialogue$
	elsif index_regex(.openDialogue$, "[^0-9]") <= 0
		.filename$ = .openDialogue$
	else
		call convert_praat_to_latin1 '.openDialogue$'
		.openDialogue$ = convert_praat_to_latin1.text$
		.filename$ = chooseReadFile$ (.openDialogue$)
	endif
	if .filename$ <> "" and fileReadable(.filename$) and index_regex(.filename$, "(?i\.(txt|tsv|table)$)")
		# Reset all internal structures
		call reset_analysis
		call initializeSpeakerData
		call unload_RecordingTask
		
		config.speakerData$ = .filename$
		.dataDir$ = replace_regex$(config.speakerData$, "(^|[/:\\])[^/:\\]+$", "", 0)
		call load_local_preferences '.dataDir$'
		.filename$ = ""
	endif
	# Get the file. We insist on the correct extention as we cannot check for "incorrect" files in other ways.
	call readAudio '.filename$'
	.sndInput = readAudio.audioID
	if .sndInput > 0
		# Reset all internal structures
		call reset_analysis
		
		select .sndInput
		.numChannels = Get number of channels
		if .numChannels > 1
			.monoInput= Convert to mono
			select .sndInput
			Remove
			select .monoInput
		endif
		call log_command "# Open File: '.filename$'"
		# Keep track of current sound
		te.currentFileName$ = .filename$

		# Get only the filename
		.endDirectory = rindex_regex(.filename$, "[/\\:]")
		.startName = .endDirectory + 1
		.nameLength = rindex(.filename$, ".") - .startName
		currentSoundName$ = mid$(.filename$, .startName, .nameLength)
		currentDirectoryName$ = left$(.filename$, .endDirectory)
		
		te.openSound = selected("Sound")
		recordedSound$ = selected$("Sound")
		
		# Set up empty speaker data table if none is present
		if config.speakerDataTable <= 0
			config.speakerData$ = ""
			config.speakerDataTable = Create Table with column names... Speaker_Data 1 ID Text Description Audio AST StartTime EndTime
			Set string value... 1 ID 'recordedSound$'
			Set string value... 1 Audio 'te.currentFileName$'
		endif
		
		# Keep track of current sound
		select te.openSound
		te.recordingTimeStamp$ = ""
		currentStartTime = 0
		currentEndTime = Get total duration
		# Reset selected window
		selectedStartTime = currentStartTime
		selectedEndTime = currentEndTime
	endif
endproc

procedure set_new_speakerdata .newSpeakerID$
	if .newSpeakerID$ = "" or .newSpeakerID$ = "-"
		if currentSoundName$ <> ""
			.newSpeakerID$ = currentSoundName$
		else
			.newSpeakerID$ = recordedSound$
		endif
	endif
	speakerID$ = .newSpeakerID$
	call get_speakerInfo 'speakerID$'
	speakerInfo$ = get_speakerInfo.text$
	speakerComments$ = get_speakerInfo.description$
	pathologicalType = 'get_speakerInfo.ast$'
	te.currentFileName$ = get_speakerInfo.audio$
	
	# If this was loaded from a Speaker Data file, set the Select Window
	if get_speakerInfo.row > 0 and get_speakerInfo.endTime > 0 
		selectedStartTime = get_speakerInfo.startTime
		selectedEndTime = get_speakerInfo.endTime
		call predictASTvalue
		predictedPathType = predictASTvalue.ast
	elsif config.autoSelect
		# If no selection if given, determine it
		call argMinASTselection
	endif
	
endproc

procedure readFromFile .filename$
	call readAudio '.filename$'
	.sndInput = readAudio.audioID
	if .sndInput > 0
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
					if 	te.skipNextStep = 1
						te.skipNextStep = 0
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
					elsif .command$ = "Help" or te.skipNextStep = 1
						# Skip
						te.skipNextStep = 0
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
	# Reset default directory
	defaultDirectory$ = .dataDir$
	
	# Default preferences file
	.localPrefs$ = "'.dataDir$'/'demoAppName$'preferences.tsv"
	
	# Look for a suitable preferences file in the current or parent directory
	if fileReadable("'.dataDir$'/'demoAppName$'preferences.tsv")
		.localPrefs$ = "'.dataDir$'/'demoAppName$'preferences.tsv"
	elsif fileReadable("'.dataDir$'/.tevarc")
		.localPrefs$ = "'.dataDir$'/.tevarc"
	elsif fileReadable("'.dataDir$'/../'demoAppName$'preferences.tsv")
		.localPrefs$ = "'.dataDir$'/../'demoAppName$'preferences.tsv"
	elsif fileReadable("'.dataDir$'/../.tevarc")
		.localPrefs$ = "'.dataDir$'/../.tevarc"
	endif

	if fileReadable(.localPrefs$)
		call write_preferences ""
		call read_preferences '.localPrefs$'
		call switch_speaker_next_button 'config.speakerSerial$'
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
	.table = -1
	.tableFileName$ = .tableName$
	if .tableName$ = "MainPage"
		.tableFileName$ = buttonsFileName$
	endif
	# Search for the table in local, preference, and global directories
	if localTableDir$ <> "" and fileReadable("'localTableDir$'/'.tableFileName$'.Table")
    	.table = nocheck Read from file... 'localTableDir$'/'.tableFileName$'.Table
    	Rename: .tableName$
	elsif fileReadable("'preferencesTableDir$'/'.tableFileName$'.Table")
    	.table = nocheck Read from file... 'preferencesTableDir$'/'.tableFileName$'.Table
    	Rename: .tableName$
	elsif fileReadable("'globaltablelists$'/'.tableFileName$'.Table")
    	.table = nocheck Read from file... 'globaltablelists$'/'.tableFileName$'.Table
    	Rename: .tableName$
	elsif variableExists(.tableName$)
		.tableID = '.tableName$'
		select .tableID
		.table = .tableID
	# Load them from script
	elsif variableExists("procCreate'.tableFileName$'$")
		call Create'.tableFileName$'
    	Rename: .tableName$
		.table = selected("Table")
	else
		call emergency_table_exit '.tableFileName$' cannot be found
	endif
	
	# Check whether this is a real table
	selectObject: .table
	.fullName$ = selected$ ()
	.type$ = extractWord$(.fullName$, "")
	if .type$ <> "Table"
		Remove
		.table = -1
	endif

	if .table <= 0
		call emergency_table_exit '.tableFileName$' corrupted or cannot be found
	endif
endproc

procedure checkTable .tableName$
	.available = 0
	if localTableDir$ <> "" and fileReadable("'localTableDir$'/'.tableName$'.Table")
    	.available = 1
	elsif fileReadable("'preferencesTableDir$'/'.tableName$'.Table")
    	.available = 1
	elsif fileReadable("'globaltablelists$'/'.tableName$'.Table")
    	.available = 1
	# Load them from script
	elsif variableExists("procCreate'.tableName$'$")
    	.available = 1
	else
    	.available = 0
    endif
endproc


procedure check_and_load_language .tableName$ .language$
	.tableFileName$ = .tableName$
	# Handle alternative Main Page layouts
	if .tableName$ = "MainPage"
		call checkTable 'buttonsFileName$'_'.language$'
		if checkTable.available
			.tableFileName$ = buttonsFileName$
		endif
	endif
	
	call checkTable '.tableFileName$'_'.language$'
	.table = -1
	if checkTable.available
		call loadTable '.tableFileName$'_'.language$'
	else
		call loadTable '.tableFileName$'_'te.defaultLanguage$'
	endif
	.table = loadTable.table
endproc

# Create a pop-up window with text from a Text Table
procedure write_text_table .table$
	.xleft = 5
 	.xright = 95
  	.ylow = 20
   	.yhigh = 85
	.lineHeight = 2.5
	.align$ = "Left"
	.tabString$ = "mmmmmm"

	# Get table with text and longest line
	call loadTable '.table$'
	.instructionText = selected()
	.numLines = Get number of rows
	.instructionFontSize = 14
	.referenceText$ = ""
	.maxlength = 0
	.maxLine = 0
	.maxFontSize = 0
	.maxWidth = 0
	.maxHeight = .lineHeight
	.currentHeight = .lineHeight
	.currentColor$= defaultFontColor$
	for .l to .numLines
		select '.instructionText'
		.currentText$ = Get value... '.l' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables '.currentText$'
		.currentText$ = expand_praat_variables.text$

		.font$ = Get value... '.l' font
		.fontSize = Get value... '.l' size
		# Get optional font color
		.currentColor$ = defaultFontColor$
		.colorColumn = Get column index... color
		if .colorColumn > 0
			.currentColor$ = Get value... '.l' color
			if index_regex(.currentColor$, "[^ \-\?]") <= 0
				.currentColor$ = defaultFontColor$
			endif
		endif
		# Get optional line height
		.heightColumn = Get column index... height
		if .heightColumn > 0
			.currentHeight = Get value... '.l' height
		endif
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
		if .currentHeight > .maxHeight
			.maxHeight = .currentHeight
		endif
	endfor
	select '.instructionText'
	.referenceText$ = Get value... '.maxLine' text
	# Handle tabs
	.testTabString$ = left$(.tabString$, ceiling(length(.tabString$)/2))
	.referenceText$ = replace$(.referenceText$, "<tab>", .testTabString$, 0)
	
	.maxLineFont$ = Get value... '.maxLine' font
	.instructionFontSize = Get value... '.maxLine' size
	.lineHeight = .maxHeight
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
	
	.tabSize = demo Text width (wc)... '.tabString$'
	
	# Adjust width to size of text
	.textWidth = demo Text width (wc)... '.referenceText$' + 4
	.xmid = (.xright + .xleft) / 2
	.xleft = .xmid - .textWidth / 2
	.xright = .xmid + .textWidth / 2

	.numRows = Get number of rows
	# Calculate length from number of lines.
 	.dy = .lineHeight
	.midY = .yhigh - (.yhigh - .ylow)/2
	.yhigh = .midY + (.numRows+1) * .dy / 2
	.ylow = .yhigh - (.numRows+1) * .dy
	.textleft = .xleft + 2
	.textXAnchor = .textleft
	
	demo Line width... 8
 	demo Colour... 'popUp.bordercolor$'
	demo Paint rectangle... 'popUp.backgroundcolor$' '.xleft' '.xright' '.ylow' '.yhigh'
	demo Draw rectangle... '.xleft' '.xright' '.ylow' '.yhigh'
	demo Line width... 'defaultLineWidth'
	demo '.currentColor$'
 	.ytext = .yhigh - 2 - .dy
	for .i to .numRows
		select '.instructionText'
		.font$ = Get value... '.i' font
		.fontSize = Get value... '.i' size
		.font$ = extractWord$(.font$, "")
		.currentHeight = .lineHeight
		if .heightColumn > 0
			.currentHeight = Get value... '.i' height
		endif
		.align$ = "Left"
		.alignColumn = Get column index... align
		if .alignColumn > 0
			.align$ = Get value... '.i' align
		endif
		if index_regex(.align$, "(?icentre)")
			.textXAnchor = .xmid
		elsif index_regex(.align$, "(?iright)")
			.textXAnchor = .xright - 2
		else
			.textXAnchor = .textleft
		endif
		# Scale font
		.fontSize = floor(.fontSize*.fontSizeFactor)
		if .fontSize < 4
			.fontSize = 4
		endif
		.line$ = Get value... '.i' text
		# Expand variables, eg, 'praatVersion$'
		call expand_praat_variables "'.line$'"
		.line$ = expand_praat_variables.text$

		# Display text
		if index(.line$, "<tab>") <= 0
			demo Text special... '.textXAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.line$'
		else
			if index_regex(.align$, "(?icentre)")
				.leftAnchor = .textleft
				.currentAnchor = .leftAnchor
				while index_regex(.line$, "\S")
					if index(.line$, "<tab>")
						.tabline$ = left$(.line$, index(.line$, "<tab>") - 1)
						.line$ = right$(.line$, length(.line$) - index(.line$, "<tab>") - 4)
					else
						.tabline$ = .line$
						.line$ = ""
					endif
					.textWidth = demo Text width (wc)... '.tabline$'
					.centerAnchor = .tabSize * ceiling((.currentAnchor + .textWidth/2)/.tabSize)
					demo Text special... '.centerAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.tabline$'
					.currentAnchor += .textWidth
					.currentAnchor = .leftAnchor + .tabSize * ceiling((.currentAnchor - .leftAnchor)/.tabSize)
					# Prevent overlap
					if .currentAnchor < .centerAnchor + .textWidth/2
						.currentAnchor = .centerAnchor + .textWidth/2
					endif
				endwhile
			elsif index_regex(.align$, "(?iright)")
				.currentAnchor = .textXAnchor
				while index_regex(.line$, "\S")
					if rindex(.line$, "<tab>")
						.tabline$ = right$(.line$, length(.line$) - rindex(.line$, "<tab>") - 4)
						.line$ = left$(.line$, rindex(.line$, "<tab>") - 1)
					else
						.tabline$ = .line$
						.line$ = ""
					endif
					.textWidth = demo Text width (wc)... '.tabline$'
					demo Text special... '.currentAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.tabline$'
					.currentAnchor -= .textWidth
					.currentAnchor = .textXAnchor - .tabSize * ceiling((.textXAnchor - .currentAnchor)/.tabSize)
				endwhile
			else
				.currentAnchor = .textXAnchor
				while index_regex(.line$, "\S")
					if index(.line$, "<tab>")
						.tabline$ = left$(.line$, index(.line$, "<tab>") - 1)
						.line$ = right$(.line$, length(.line$) - index(.line$, "<tab>") - 4)
					else
						.tabline$ = .line$
						.line$ = ""
					endif
					.textWidth = demo Text width (wc)... '.tabline$'
					demo Text special... '.currentAnchor' '.align$' '.ytext' Bottom '.font$' '.fontSize' 0 '.tabline$'
					.currentAnchor += .textWidth
					.currentAnchor = .textXAnchor + .tabSize * ceiling((.currentAnchor - .textXAnchor)/.tabSize)
				endwhile
			endif
		endif
		.ytext -= .currentHeight
	endfor	
	demoShow()	
	call set_font_size 'defaultFontSize'
	demo 'defaultFontColor$'
	
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
	demo 'defaultFontColor$'
 	.ytext = .yhigh - 2 - .dy
	# Write text
	demo Text special... '.xmid' Centre '.ytext' Bottom '.font$' '.popupFontSize' 0 '.text$'

	demoShow()	
	demo 'defaultFont$'
	call set_font_size 'defaultFontSize'
endproc

procedure text2popuptable .align$ .font$ .size .popUpText$
	if variableExists(.popUpText$)
		.popUpText$ = "'.popUpText$'"
	endif
	if .popUpText$ <> ""
		if startsWith(.popUpText$, """")
			.popUpText$ = right$(.popUpText$, length(.popUpText$) - 1)
			.popUpText$ = left$(.popUpText$, length(.popUpText$) - 1)
		endif
		call points_to_wc '.size'
		.height = points_to_wc.wc
		if index_regex(.popUpText$, "\S") <= 0
			.popUpText$ = "-"
		endif
		.textTable = Create Table with column names... Text 1 align font size height text
		# Set values
		Set string value... 1 align '.align$'
		Set string value... 1 font '.font$'
		Set numeric value... 1 size '.size'
		Set numeric value... 1 height '.height'
		Set string value... 1 text 
		
		while length(.popUpText$) > 0
			select .textTable
			Insert row... 1
			.endOfLine = rindex_regex(.popUpText$, "\\n")
			.leftPart = .endOfLine - 1
			.rightPart = length(.popUpText$) - .endOfLine
			if .endOfLine > 0
				.rightPart -= 1
			endif
			.currentLine$ = right$(.popUpText$, .rightPart)
			if startsWith(.currentLine$, " ")
				.currentLine$ = "\\ " + .currentLine$
			endif
			.popUpText$ = left$(.popUpText$, .leftPart)

			# Set values
			Set string value... 1 align '.align$'
			Set string value... 1 font '.font$'
			Set numeric value... 1 size '.size'
			Set numeric value... 1 height '.height'
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
	.maxlength = 0
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
	
	demo 'defaultFontColor$'
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
	demo 'defaultFontColor$'
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
	if startsWith(.text$, """") and endsWith(.text$, """")
		.text$ = left$(.text$, length(.text$) - 1)
		.text$ = right$(.text$, length(.text$) - 1)
	endif
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
	.closed = 0
    if te.openSound > 0
		.closed = 1
        select te.openSound
        # If this file should be saved, do it now!
		if te.saveAudio > 0
			if config.speakerDataTable > 0 and config.speakerData$ <> ""
				select config.speakerDataTable
				Save as tab-separated file... 'config.speakerData$'
			endif
			select te.openSound
			.tmpPartSoundID = Extract part... 'selectedStartTime' 'selectedEndTime' rectangular 1.0 true
			Save as WAV file... 'te.currentFileName$'
			select te.openSound
		endif
		if te.pitch > 0
			plus te.pitch
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
		if te.voicingTextGrid > 0
			plus 'te.voicingTextGrid'
		endif
 		if te.spectrogram > 0
			plus 'te.spectrogram'
			plus 'te.formant'
		endif
		Remove
		
		te.openSound = 0
		te.pitch = 0
		te.spectrogram = 0
		te.formant = 0
		te.harmonicity = 0
		te.gneSound = 0
		selectedEndTime = 0
		selectedStartTime = 0
		currentStartTime = 0
		currentEndTime = 0
		
        recordedSound$ = ""
        currentSoundName$ = ""
		call get_speakerInfo 0
        
		pitchName$ = ""
		pitchTierName$ = ""
		ltasName$ = ""
		intensityName$ = ""
		spectrogramName$ = ""
		formantName$ = ""
		pointProcessName$ = ""
		te.voicingTextGrid = -1
		gneName$ = ""
		harmonicityName$ = ""
		te.currentFileName$ = ""
		
		maxTimeIntensity = 0
		
		call reset_sourcemanipulations
    endif
endproc

# A table error, can be insiduously caused by an outdate preferences file!
procedure emergency_table_exit .message$
	# If you come here as a user, your preferences file is borked
	if preferencesAppFile$ <> "" and fileReadable(preferencesAppFile$)
		deleteFile(preferencesAppFile$)
	endif
	# Put out message
	call get_feedback_text 'config.language$' Cancel
	call convert_praat_to_latin1 'get_feedback_text.text$'
	.cancelText$ = convert_praat_to_latin1.text$
	beginPause: "Fatal Error"
	comment: .message$
	endPause: .cancelText$, 1
	exit '.message$'
endproc

procedure loadLanguageTable .tableName$ .language$
	call loadTable '.tableName$'
    .table$ = selected$("Table")
    .tableID = selected("Table")
    Append column... Text
    Append column... Key
    Append column... Helptext
    .numLabels = Get number of rows
    call check_and_load_language '.tableName$' '.language$'
    .tableLang$ = selected$("Table")
    .tableLangID = selected("Table")
    for .row to .numLabels
		select .tableID
		.label$ = Get value... '.row' Label
        call findLabel '.tableLang$' '.label$'
	    if findLabel.row > 0
            select .tableLangID
        	.valueText$ = Get value... 'findLabel.row' Text
        	.valueKey$ = Get value... 'findLabel.row' Key
        	.valueHelp$ = Get value... 'findLabel.row' Helptext
        	select .tableID
        	Set string value... '.row' Text '.valueText$'
        	Set string value... '.row' Key '.valueKey$'
        	Set string value... '.row' Helptext '.valueHelp$'
		elsif index(.label$, "_")
			# Load alternative language table
			.startChar = rindex(.label$, "_")
			.otherLanguage$ = right$(.label$, length(.label$) - .startChar)
			call check_and_load_language '.tableName$' '.otherLanguage$'
    		.otherLang$ = selected$("Table")
    		.otherLangID = selected("Table")
        	call findLabel '.otherLang$' '.label$'
	    	if findLabel.row > 0
            	select .otherLangID
        		.valueText$ = Get value... 'findLabel.row' Text
        		.valueKey$ = Get value... 'findLabel.row' Key
        		.valueHelp$ = Get value... 'findLabel.row' Helptext
        		select .tableID
        		Set string value... '.row' Text '.valueText$'
        		Set string value... '.row' Key '.valueKey$'
        		Set string value... '.row' Helptext '.valueHelp$'
        	else
            	call emergency_table_exit Cannot find Label: '.otherLang$' '.label$'
        	endif
			select .otherLangID
			Remove
        else
            call emergency_table_exit Cannot find Label: '.tableLang$' '.label$'
        endif
    endfor
    select .tableLangID
    Remove
endproc

# Emulate mkdir -p, use /
procedure extend_directory_path .root$ .path$
	.root$ = replace_regex$(.root$, """", "", 0)
	.path$ = replace_regex$(.path$, """", "", 0)

	if startsWith(.path$, .root$)
		.path$ = replace_regex$(.path$, "^'.root$'/*", "", 0)
	endif

	while .path$ <> "" and index_regex(.path$, "[^ \t\n\-\?\!]")
		.nextDir$ = replace_regex$(.path$, "^([^/]*)(/(.*)|$)", "\1", 0)
		.path$ = replace_regex$(.path$, "^([^/]*)(/(.*)|$)", "\3", 0)
		# Disallow things containing only NOPE characters
		if .nextDir$ <> "" and index_regex(.nextDir$, "[^ \t\n\-\?\!]")
			.root$ = .root$+"/"+.nextDir$
			createDirectory(.root$)
		endif
	endwhile
endproc

# Read a list of audio files and concatenate them
procedure readAudioList .filename$
	.start = index(.filename$, "{")
	.end = index(.filename$, "}")
	.length = length(.filename$)
	.prev$ = left$(.filename$, .start - 1)
	.post$ = right$(.filename$, .length - .end)
	.inside$ = mid$(.filename$, .start + 1, .end - .start - 1)
	.n = 0
	while length(.inside$) > 0
		.stretch = index(.inside$, ",") - 1
		if .stretch < 0
			.stretch = length(.inside$)
		endif
		.mid$ = left$(.inside$, .stretch)
		if length(.inside$) - .stretch - 1 > 0
			.inside$ = right$(.inside$, length(.inside$) - .stretch - 1)
		else
			.inside$ = ""
		endif
		# Read audio file
		if index_regex(.prev$+.mid$+.post$, "(?i\.(wav|au|snd|aif[fc]?|flac|mp3))$") > 0 and fileReadable(.prev$+.mid$+.post$)
			.n += 1
			.tmp = Read from file: .prev$+.mid$+.post$
			# Check result and clean up if wrong
			if .tmp = undefined or .tmp <= 0
				.audio[.n] = -1
				.n -= 1
			else
				.fullName$ = selected$ ()
				.type$ = extractWord$(.fullName$, "")
				if .type$ <> "Sound"
					Remove
					.audio[.n] = -1
					.n -= 1
				else
					selectObject: .tmp
					.audio[.n] = Resample: te.defaultSampleFreq, 50
					selectObject: .tmp
					Remove
				endif
			endif
		
		endif
	endwhile
	selectObject: .audio[1]
	for .i from 2 to .n
		plusObject: .audio[.i]
	endfor
	.audioID = Concatenate
	selectObject: .audio[1]
	for .i from 2 to .n
		plusObject: .audio[.i]
	endfor
	Remove
	selectObject: .audioID
endproc

# Safely read an audio file
procedure readAudio .filename$
	.audioID = -1
	# Check existence of (first) audiofile
	.testFile$ = replace_regex$(.filename$, "\{([^,]+)[^\}]*\}", "\1", 0)

	if .filename$ <> "" and fileReadable(.testFile$) and index_regex(.testFile$, "(?i\.(wav|au|snd|aif[fc]?|flac|mp3))$") > 0
		# Do some magic, concatenate audio inside {} brackects
		if index(.filename$, "{")
			call readAudioList '.filename$'
			.audioID = readAudioList.audioID
		else
			.audioID = nocheck Read from file... '.filename$'
		endif
		if .audioID = undefined or .audioID <= 0
			.audioID = -1
		else
			.fullName$ = selected$ ()
			.type$ = extractWord$(.fullName$, "")
			if .type$ <> "Sound"
				Remove
				.audioID = -1
			endif
		endif
		
		# No audio file has been read
		if .audioID <= 0
			call get_feedback_text 'config.language$' BrokenTable
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.brokenTableText$ = convert_praat_to_latin1.text$
			call getLanguageTexts Config SpeakerData
			.inputText$ = getLanguageTexts.inputText$
			beginPause(".inputText$")
				comment("'getLanguageTexts.helpText$': '.brokenTableText$'")
			clicked = endPause ("'getLanguageTexts.continueText$'", 1, 1)
		endif
	elsif .filename$ <> "" and index_regex(.filename$, "[^0-9]") <= 0
		select '.filename$'
		.fullName$ = selected$ ()
		.type$ = extractWord$(.fullName$, "")
		.name$ = extractWord$(.fullName$, " ")
		if .type$ = "Sound"
			.audioID = Copy: .name$
		endif
	endif
endproc

# Safely read a table
procedure readTable .filename$
	.tableID = -1
	if .filename$ <> "" and fileReadable(.filename$) and index_regex(.filename$, "(?i\.(tsv|table|csv))$") > 0
		.tableID = nocheck Read from file... '.filename$'
		if .tableID = undefined or .tableID <= 0
			.tableID = -1
		else
			.fullName$ = selected$ ()
			.type$ = extractWord$(.fullName$, "")
			if .type$ <> "Table"
				Remove
				.tableID = -1
			endif
		endif
		
		# No table has been read
		if .tableID <= 0
			call get_feedback_text 'config.language$' BrokenTable
			call convert_praat_to_latin1 'get_feedback_text.text$'
			.brokenTableText$ = convert_praat_to_latin1.text$
			call getLanguageTexts Config SpeakerData
			.inputText$ = getLanguageTexts.inputText$
			beginPause(".inputText$")
				comment("'getLanguageTexts.helpText$': '.brokenTableText$'")
			clicked = endPause ("'getLanguageTexts.continueText$'", 1, 1)
		endif
	endif
endproc

########################################################################
# 
# Convert signal source
# 
########################################################################
procedure reset_sourcemanipulations
	if te.originalRecording > 0
		select te.originalRecording
		Remove
		te.originalRecording = 0
	endif
	if te.source > 0
		select te.source
		Remove
		te.source = 0
	endif
	config.source$ = "Original"
endproc

procedure copy_source_into_target .prosody .articulationrate
	if te.originalRecording <= 0
		select te.openSound
		te.originalRecording = Copy: "OriginalSound"
	endif
	.originalRecording = te.originalRecording
	te.originalRecording = -1
	.source = te.source
	te.source = -1
	# Reset everything and load the file again
	@getOpenFile: "'.originalRecording'"
	te.originalRecording = .originalRecording
	te.source = .source
	@resynthesize_with_TE_source: .prosody, .articulationrate, te.openSound, te.source
	select te.openSound
	Remove
	te.openSound = resynthesize_with_TE_source.newSound
	config.source$ = "Change"
endproc
