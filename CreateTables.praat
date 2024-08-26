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
