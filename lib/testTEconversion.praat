include LPCsourceLib.praat

.origFile$ = "~/Desktop/TEconversion/rob_het_weer.wav"
.origFile$ = "~/Desktop/TEconversion/rob_80_dappere.wav"
.origFile$ = "~/Desktop/TEconversion/FH_80_dappere.wav"
#.teSourcefile$[1] = "~/Desktop/TEconversion/0CHBNYUS_post-4_a-normaal-1.wav"
.teSourcefile$[1] = "~/Desktop/TEconversion/signaltype1voicesample.wav"
.teSourcefile$[2] = "~/Desktop/TEconversion/signaltype2voicesample.wav"
.teSourcefile$[3] = "~/Desktop/TEconversion/signaltype3voicesample.wav"
.teSourcefile$[4] = "~/Desktop/TEconversion/signaltype4voicesample.wav"

.defaultProsody = 0.6
.defaultAR = 3.8
lpcsourcelib.analysis_type = 2

# Get data original recording
.originalRecording = Read from file: .origFile$
for .ast to 4
	.prosody = .defaultProsody / .ast
	.file$ = .teSourcefile$[.ast]
	.teSourceRecording  = Read from file: .file$
	@resynthesize_with_TE_source: .prosody, .defaultAR, .originalRecording, .teSourceRecording
	Rename: "Example'.ast'"
	
	select .teSourceRecording
	Remove
endfor

