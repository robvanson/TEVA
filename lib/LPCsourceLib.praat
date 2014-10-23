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
procedure resynthesize_with_TE_source .prosody .speed .originalRecording .teSourceRecording

	# Scale prosody
	if .prosody > 1
		.prosody /= 100
	endif
	
	# Scale speed
	.scaleDuration = 1
	if .speed > 0
		.scaleDuration = 1/.speed		
	endif

	# Set up original recording and scale duration
	selectObject: .originalRecording
	.newOriginalManipulation = noprogress To Manipulation: 0.01, 75, 600
	.newOriginalDurTier = Extract duration tier
	Add point: 0, .scaleDuration
	plus .newOriginalManipulation
	Replace duration tier
	select .newOriginalManipulation
	.origPitchTier = Extract pitch tier
	.origMeanPitch = Get mean (curve): 0, 0

	select .newOriginalManipulation
	.scaledOriginalRecording = Get resynthesis (overlap-add)
	# Clean up
	select .newOriginalManipulation
	plus .newOriginalDurTier
	Remove
	
	select .scaledOriginalRecording
	.origDuration = Get total duration
	
	selectObject: .scaledOriginalRecording
	.origPoint = noprogress To PointProcess (periodic, cc): 75, 600
	.origVoicing = noprogress To TextGrid (vuv): 0.02, 0.01
	Rename: "OriginalVoicing"
	
	# Clean up
	select .origPoint
	Remove
	
	# Scale original intensity countour
	if .prosody <> 1
		select .origPitchTier
		Formula... .prosody*self + (1-.prosody)*.origMeanPitch
	endif

	selectObject: .scaledOriginalRecording
	call extract_DiffLPC_source
	.origSource = selected: "Sound"
	Rename: "OriginalSource"
	
	selectObject: .origSource
	call intensityTier_from_LPC_source
	.origIntensity = selected: "IntensityTier"
	.origMeanInt = intensityTier_from_LPC_source.energy
	# Scale original intensity countour
	if .prosody <> 1
		select .origIntensity
		Formula... .prosody*self + (1-.prosody)*.origMeanInt
	endif

	selectObject: .scaledOriginalRecording
	call extract_LPC_filter
	.origFilter = selected: "LPC"

	# Set up TE source recording
	selectObject: .teSourceRecording
	.teSourceDuration = Get total duration
	
	selectObject: .teSourceRecording
	.teTextGrid = noprogress To TextGrid (silences): 80, 0, -15, 0.1, 0.1, "silent", "sounding"
	
	selectObject: .teSourceRecording
	call extract_DiffLPC_source
	.teSource = selected: "Sound"
	
	selectObject: .teSourceRecording
	call extract_LPC_filter
	.teFilter = selected: "LPC"
	
	# Replace Original source with TE source
	
	# Construct a source signal that is long enough
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
	
	# Scale intensity
	selectObject: .teSourceCopy
	plusObject: .origIntensity
	.scaledTEsource = Multiply: 0.9
	Rename: "ScaledSource"
	
	# Superimpose Pitch of original over new source
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
	Remove
	
	# Replace voiced parts of original with new voice
	selectObject: .origSource
	.newSource = Copy: "NewSource"
	call replace_samples IntonatedSource NewSource OriginalVoicing 1 V
	
	selectObject: .origFilter
	plusObject: .newSource
	.newSound = Filter: "no"
	Scale intensity: 70.0
	Rename: "OriginalWithTE"

	# Clean up
	select .origPitchTier
	plus .origIntensity
	plus .origFilter
	plus .origSource
	plus .origVoicing
	plus .teTextGrid
	plus .teSource
	plus .scaledTEsource
	plus .intonatedTEsource
	plus .teSourceCopy
	plus .teFilter
	plus .newSource
	Remove
	
	select .newSound 
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
procedure extract_LPC_filter
    .basename$ = selected$("Sound")
    Resample... 11000 50
    .tmp = Rename... '.basename$'_DownSampled
    noprogress To LPC (autocorrelation)... 10 0.025 0.005 50
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
    .basename$ = selected$("Sound")
    Resample... 11000 50
    Rename... '.basename$'_DownSampled
    noprogress To LPC (autocorrelation)... 10 0.025 0.005 50
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
            .etime = 0.001
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
