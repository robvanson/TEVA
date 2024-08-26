MAN_BEGIN (U"AST categories", U"R.J.J.H. van Son", 20111201)
ENTRY (U"Category boundaries")
NORMAL (U"Categories are determined when the corresponding analysis is performed, e.g., when a display is drawn or data are saved. "
	 "Automatically determined values are displayed in Arabic numbers (1, 2, 3, 4). Categories set by hand are displayed by Roman "
	 "numerals (%I, %II, %III, %IV). Category boundaries are taken from (Van As, 2001, Table 5.4 p88) and here indicated by Roman numerals for clarity.")
LIST_ITEM (U"\\bu Voiced Fraction:")
LIST_ITEM (U"  %I < 90.2\\%  < %II < 77.45\\%  < %III < 50\\%  < %IV (VF < 50\\%  is %IV also for F__0_ sd and Jitter)")
LIST_ITEM (U"\\bu F__0_ standard deviation:")
LIST_ITEM (U"  %I < 3.360 < %II < 7.495 < %III; %IV if Voiced Fraction < 50\\% ")
LIST_ITEM (U"\\bu Jitter:")
LIST_ITEM (U"  %I < 5.3\\%  < %II < 8.05\\%  <  %III; %IV if Voiced Fraction < 50\\% ")
LIST_ITEM (U"\\bu Mean Harmonicity:")
LIST_ITEM (U"  %I > 7.195 > %II > 4.050 > %III > 1.925 > %IV (dB)")
LIST_ITEM (U"\\bu GNE:")
LIST_ITEM (U"  %I > 0.820 > %II > 0.795 > %III > .745 > %IV")
LIST_ITEM (U"\\bu BED:")
LIST_ITEM (U"  %I > 23.85 > %II > 19.95 > %III > 13.50 > %IV (dB)")
NORMAL (U"The final automatic AST category is defined as the median of the individual measures.")
MAN_END

MAN_BEGIN (U"Acoustic Signal Typing", U"R.J.J.H. van Son", 20111201)
ENTRY (U"Introduction")
NORMAL (U"The quality of the voice in Tracheoesophageal (TE) speech is determined by the characteristics "
	 "of the neo-glottis. Individual differences in the functioning of the neo-glottis after treatment cause great variation "
	 "in the intelligibility and quality of speech. The voice pathology of TE speech is graded into four levels.")
ENTRY (U"Pathology types (Van As, 2001, Chapter 5)")
NORMAL (U"%%Type I - Stable \\&  Harmonic% \\s{(press 1)}")
LIST_ITEM (U"\\bu Stable signal for longer than two seconds")
LIST_ITEM (U"\\bu Clear harmonics up to at least 1000 Hz")
NORMAL (U"%%Type II - Stable \\&  At least one harmonic% \\s{(press 2)}")
LIST_ITEM (U"\\bu Stable signal for longer than two seconds")
LIST_ITEM (U"\\bu At least one stable harmonic at the fundamental frequency for longer than two seconds")
NORMAL (U"%%Type III - Unstable or Partly harmonic% \\s{(press 3)}")
LIST_ITEM (U"\\bu No stable signal for longer than two seconds, or")
LIST_ITEM (U"\\bu Harmonics in only part of the sample (for longer than 1 second)")
NORMAL (U"%%Type IV - Barely harmonic% \\s{(press 4)}")
LIST_ITEM (U"\\bu No or only short-term detectable harmonics (for shorter than 1 second)")
NORMAL (U"\\s{(press 0 to reset)}")
NORMAL (U"%%Table of the relation between the four types of acoustic signal typing "
	 "and the perceptual judgment of overall voice quality for 39 speakers "
	 "(converted to percentages).%")
CODE (U"|  Perceptual judgment of overall voice quality |")
CODE (U"|         Good     Reasonable  Poor             |")
CODE (U"| Type I    70\\%       40\\%          0\\%              |")
CODE (U"| Type II   45\\%       45\\%         10\\%              |")
CODE (U"| Type III  20\\%       35\\%         45\\%              |")
CODE (U"| Type IV    0\\%       25\\%         75\\%              |")
ENTRY (U"Acoustic measures of voice quality")
NORMAL (U"In Acoustic Signal Typing, the voice characteristics are determined using acoustic analysis of speech. "
	 "The typing is based on both visual inspection of plots of these analysis parameters and quantitive measures "
	 "of a short (e.g., 0.1 second) stretch of \"stable\" speech.")
NORMAL (U"Visual determination of pathology uses displays of:")
LIST_ITEM (U"\\bu @@waveform|Waveform@")
LIST_ITEM (U"\\bu @@Pitch@")
LIST_ITEM (U"\\bu @@Spectrogram@")
LIST_ITEM (U"\\bu @@Ltas|Long Time Average Spectrum@ (LTAS)")
LIST_ITEM (U"\\bu @@Intensity@")
LIST_ITEM (U"\\bu @@Harmonicity|Harmonicity-to-Noise ratio@")
NORMAL (U"A quantitative evaluation is based on the analysis of:")
LIST_ITEM (U"\\bu @@PointProcess: To TextGrid (vuv)...|Maximum Voicing Duration@, longest interval of voicing (seconds)")
LIST_ITEM (U"\\bu @@Voice 1. Voice breaks|Voiced fraction@, fraction of frames that is voiced (\\% )")
LIST_ITEM (U"\\bu @@Voice 2. Jitter|Jitter@ (\\% )")
LIST_ITEM (U"\\bu Standard deviation of the @@Pitch@")
LIST_ITEM (U"\\bu BED (band energy difference), difference in dB between high and low power in the @@Ltas|LTAS@")
LIST_ITEM (U"\\bu The mean of the @@Harmonicity@")
LIST_ITEM (U"\\bu GNE (glottal to noise excitation ratio), the maximum of a form of @@Harmonicity@")
NORMAL (U"These measures are determined on a short segment (around 0.1 second) of speech from the most stable part "
	 "of a sustained /a/ sound. @@AST categories|Pathological categories@ are defined using (Van As, 2001)."
	 "See @@Analysis|Analysis calculations and displays@ for details on the commands used.")
ENTRY (U"References:")
LIST_ITEM (U"\\bu Van As, C.J. (##2001#), %%Tracheoesophageal Speech. A Multidimensional Assessment of Voice Quality%, "
	 "Ph.D.-thesis, University of Amsterdam, 209 pag.")
LIST_ITEM (U"\\bu van As-Brooks, C.J., Koopmans-van Beinum, F.J., Pols, L.C.W., and Hilgers, F.J.M. (##2006#), "
	 "%%Acoustic Signal Typing for Evaluation of Voice Quality in Tracheoesophageal Speech% "
	 "Journal of Voice, Volume ##20# (3), p355-368.")
LIST_ITEM (U"\\bu Van As, C.J. (##2008#), %%Acoustic analyses of postlaryngectomy voice and their perceptual relevance% "
	 "Invitational Round Table \"Evidence-based Voice and Speech Rehabilitation in Head and Neck Cancer\", p8-14 "
	 "[http://dare.uva.nl/document/130984]")
MAN_END

MAN_BEGIN (U"Adding speaker information", U"R.J.J.H. van Son", 20111220)
INTRO (U"How to add information about a speaker to TEVA.")
NORMAL (U"Record or Open an /a/ sound, select a stable part of the recording:")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
ENTRY (U"Adding information about a recording")
NORMAL (U"TEVA can keep a record of recordings. Click the %Speaker button at the bottom "
	 "left of the @@Overview of Main page|Main page@. A window will open where you can enter an "
	 "identifier (name or code) and other information like sex, age, treatment etc. There is also "
	 "a field for more informal comments. The top text field is an identifier for the recording, the next lower one "
	 "contains information about the speaker, ID, name, and so on. The bottom text field is for comments. "
	 "Click the %Continue button when you have completed the input. You can change the text later if you like.")
ENTRY (U"Reading a table with speaker information")
NORMAL (U"In general, it is better to collect speaker information in a table beforehand. "
	 "You can open such a table with the %Open button in the @@Overview of Main page|Main page@, "
	 "or with the %Data button in the @@Overview of Configuration page|Configuration page@. When opened,"
	 "you will have to select a specific speaker or recording from the list. This is done using the %Speaker button "
	 "on the @@Overview of Main page|Main page@. In the top text field, you can type in the ID code of the recording, "
	 "or the line number in the table, and click %Ready. Or you can step through all the records with the next (>) "
	 "and previous (<) buttons. If you enter a partial ID, it will be matched to the start of the ID's in the table. "
	 "The first record that matches will be selected. If you enter a non-existing recording ID in the top, ID, field, "
	 "a new record is added to the table. You can remove the current record by completely emptying the top, record ID "
	 "field, and replace it with a single dash, ##-#.")
NORMAL (U"You can save changes to the list with the %Save button in the "
	 "@@Overview of Configuration page|Configuration page@. You can close and purge the current table with the "
	 "%Close button in the @@Overview of Configuration page|Configuration page@. With %Close, the current table is not "
	 "saved. However, all changes made in an existing speaker table will be saved in a backup file with the same name "
	 "as the original file, but with a tilde (~) added to the name (e.g., %%example.Table% becomes %%example~.Table%). "
	 "This backup file will be kept until the table is saved to file using the %Save button or all changes are purged "
	 "with the %Close button, after which the backup will be removed. "
	 "The backup file will be overwritten the next time the table is opened from file and a change is made. "
	 "When using %Save to save a list, an attempt wil be made to convert all paths to audio files to "
	 "paths relative to the position of the saved table. ")
ENTRY (U"Format of the speaker info table (%%.tsv% or %%.Table%)")
NORMAL (U"Speaker Info tables are tab delimited (tsv) lists with five fields, starting with a line "
	 "with the field names separated by tabs, i.e., %ID, %Text, %Description, %Audio, %AST (the order is immaterial). "
	 "The extension of the file should be %%.tsv% or %%.Table%.")
LIST_ITEM (U"1: ID of speaker or recording (must be unique)")
LIST_ITEM (U"2: Essential information, often starting with the ID code")
LIST_ITEM (U"3: Free form comments")
LIST_ITEM (U"4: Relative path to the audio file")
LIST_ITEM (U"5: Manually entered @@Acoustic Signal Typing|Acoustic Signal Type@, i.e., %1, %2, %3, or %4")
LIST_ITEM (U"6: Start time of interval for which the @@Acoustic Signal Typing|AST@ was entered")
LIST_ITEM (U"7: End time of interval for which the @@Acoustic Signal Typing|AST@ was entered")
LIST_ITEM (U"8+: Any number of values for @@VAS rating scales (EN)|rating scales@")
NORMAL (U"If the table contains a path to a sound file, this file will be opened automatically "
	 "when the record is chosen")
NORMAL (U"Missing columns are automatically generated when the table is read. So, if a table without the %Description and "
	 "%AST columns is read, two empty columns with the corresponding labels are created.")
NORMAL (U"An example file: %%SignaltypeVoiceSamples.Table%")
CODE (U"ID          Text                        Description Audio                      AST StartTime EndTime")
CODE (U"Speaker1    Speaker1, M 66yo, Type I    [comments]  signaltype1voicesample.wav 1   0.000     1.750")
CODE (U"Speaker2    Speaker2, M 48yo, Type II   [comments]  signaltype2voicesample.wav 2   1.000     2.750")
CODE (U"Speaker3    Speaker3, F 77yo, Type III  [comments]  signaltype3voicesample.wav 3   0.500     2.250")
CODE (U"Speaker4    Speaker4, F 48yo, Type IV   [comments]  signaltype4voicesample.wav 4   1.250     3.000")
NORMAL (U"A text-only file without the %%.tsv% or %%.Table% extension will be read as a list of records separated by tabs. "
	 "The order of the fields is like above, %ID %Text %Description %Audio %AST %StartTime %EndTime. For instance, if three fields "
	 "are given, they will be entered as %ID, %Text, %Description. If only a single field is given, it is treated as the Audio field. "
	 "The ID field will be set to numbered %%Item[row]% values if not present. Upon reading, such a file will be converted to a a full "
	 "table and saved (if backups are set, %%~.tsv%). Backup files too will be saved as %%~.tsv% files.")
ENTRY (U"Next:")
LIST_ITEM (U"\\bu @@Determine pathological type@")
LIST_ITEM (U"\\bu @@Perceptual rating of a vowel@")
LIST_ITEM (U"\\bu @@VoicePrints@")
LIST_ITEM (U"\\bu @@Prompted speech recordings@")
MAN_END

MAN_BEGIN (U"Analysis", U"R.J.J.H. van Son", 20111213)
INTRO (U"Praat commands used to calculate the analysis results")
NORMAL (U"TEVA is a Praat script. The commands used to perform the analysis and draw the "
	 "displays are listed here:")
ENTRY (U"Displays")
ENTRY (U"@@Sound@")
CODE (U"-")
ENTRY (U"@@Pitch@")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Pitch (cc)...|To Pitch (cc)...@ 0 40 15 yes 0.03 0.40 0.045 0.35 0.14 300")
NORMAL (U"There are three options, a low and high pitch cutoff (300 and 600Hz), and a compatible option "
	 "that implements the settings of Van As 2001")
CODE (U"@@Sound: To Pitch (cc)...|To Pitch (cc)...@ 0 40 15 no  0.03 0.40 0.01 0.35 0.14 250")
ENTRY (U"@@Spectrogram@")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Spectrogram...|To Spectrogram...@ 0.1 'F__n_' 0.001 10 Gaussian")
NORMAL (U"F__n_ is the Nyquist frequency")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Formant (burg)...|To Formant (burg)...@ 0.02 4 4400 0.1 50")
ENTRY (U"@@Ltas@")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Spectrum...|To Spectrum...@ yes")
CODE (U"@@Spectrum: To Ltas (1-to-1)|To Ltas (1-to-1)@")
ENTRY (U"@@Intensity@")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Intensity...|To Intensity...@ 60 0 yes")
ENTRY (U"@@Harmonicity@")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Harmonicity (cc)...|To Harmonicity (cc)...@ 'dT' 40 0 1.0")
NORMAL (U"dT is the time step. The position of the maximum Harmonicity is determined on a smoothed "
	 "low-pass filtered contour using %%'dT' 40 0 4.5% (low-pass 5Hz and 5Hz transition), %not on the highest peak.")
ENTRY (U"Measurements")
ENTRY (U"Voiced fraction")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Pitch...|To Pitch...@ 0 60 600")
NORMAL (U"Count the number of voiced frames in the window and divide by the total number of frames. "
	 "Using these settings, the step size (frame duration) is 0.0125s.")
ENTRY (U"GNE (glottal to noise excitation ratio) ")
CODE (U"select Sound SND")
CODE (U"Extract part... 'T__1_' 'T__2_' rectangular 1.0 false")
CODE (U"To Harmonicity (gne)... 500 4500 1000 80")
CODE (U"gne = Get maximum")
NORMAL (U"T__1_ and T__2_ are the start and end time, respectively")
ENTRY (U"@@Voice 2. Jitter|Jitter@")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Pitch...|To Pitch...@ 0 60 600")
CODE (U"@@Pitch: To PointProcess|To PointProcess@")
CODE (U"jitter = @@PointProcess: Get jitter (local)...|Get jitter (local)...@ 'T__1_' 'T__2_' 0.0001 0.05 5")
NORMAL (U"T__1_ and T__2_ are the start and end time, respectively")
ENTRY (U"@@Voice 3. Shimmer|Shimmer@")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Pitch...|To Pitch...@ 0 60 600")
CODE (U"@@Pitch: To PointProcess|To PointProcess@")
CODE (U"select Sound SND")
CODE (U"plus PointProcess SND")
CODE (U"shimmer = Get shimmer (local)... 'T__1_' 'T__2_' 0.0001 0.05 5 5")
NORMAL (U"T__1_ and T__2_ are the start and end time, respectively")
ENTRY (U"BED (band energy difference)")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Spectrum...|To Spectrum...@ yes")
CODE (U"@@Spectrum: To Ltas (1-to-1)|To Ltas (1-to-1)@")
CODE (U"Get number of bins")
NORMAL (U"Average power over bins. Where $lowPower is the average power over bins between "
	 "0 and 500 Hz and $highPower is the average power over bins between 4000 and 5000 Hz")
CODE (U"bed = 10 * log10(lowPower / highPower)")
ENTRY (U"CoG (spectral center of gravity)")
CODE (U"select Sound SND")
CODE (U"@@Sound: To Spectrum...|To Spectrum...@ yes")
CODE (U"@@Spectrum: To Ltas (1-to-1)|To Ltas (1-to-1)@")
CODE (U"Get number of bins")
NORMAL (U"Sum the power ($$10^^(power/10)^$), $sumPower over the bins and the product of frequency and energy"
	 "($$f * 10^^(power/10)^$), $productFreq, over all bins.")
CODE (U"cog = productFreq / sumPower")
ENTRY (U"Maximum Voicing Duration (MVD)")
CODE (U"select Pitch SND")
CODE (U"To PointProcess")
CODE (U"To TextGrid (vuv)... 0.2 0.1")
CODE (U"Get longest interval with label %V")
ENTRY (U"Formant quality factors (QF_i)")
CODE (U"select Formant SND")
CODE (U"medianF = @@Formant: Get quantile...|Get quantile...@ 'i' 'T__1_' 'T__2_' Hertz 0.50")
CODE (U"medianB = @@Formant: Get quantile...|Get quantile of bandwidth...@ 'i' 'T__1_' 'T__2_' Hertz 0.50")
CODE (U"qf = medianF / medianB")
MAN_END

MAN_BEGIN (U"Determine pathological type", U"R.J.J.H. van Son", 20111220)
INTRO (U"How to determine the @@Acoustic Signal Typing|pathological type@ (acoustic signal typing)")
NORMAL (U"Record or Open an /a/ sound, select a stable part of the recording and add information "
	 "about the speaker and recording:")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
ENTRY (U"Pathological type")
NORMAL (U"A short description of the criteria to determine the pathological type is displayed "
	 "when you click on the %Pathology button on the @@Overview of Configuration page|Configuration page@. "
	 "It can also be found on the @@Acoustic Signal Typing@ manual page.")
NORMAL (U"The criteria for the pathological typing are mostly impressionistic. This is about the ability "
	 "of the speaker to produce a stable /a/ sound with many harmonics. This can be evaluated by listening "
	 "to the sound, and looking at the %Spectrogram. Inspection of the %Pitch and %Harmonicity displays will "
	 "give extra information. ")
NORMAL (U"When a voice has been evaluated and a type decided upon, the type can be entered by pressing "
	 "one of the number keys, 1-4 for types I - IV. The types can always be changed. The currently selected "
	 "type will be printed over the display and stored together with the boundaries of the current selection "
	 "in the table with speaker data. Pressing 0 will erase the type and the boundaries. Pressing 9 will set "
	 "the boundaries but will not change the type.")
ENTRY (U"Acoustic signal typing and Voice Quality")
NORMAL (U"There are also experimental @@AST categories|automatic evaluation of pathological type@ and %%Voice Quality%.  "
	 "These automatic evaluations are displayed in the @@VoicePrints@. ")
ENTRY (U"Next:")
LIST_ITEM (U"\\bu @@Perceptual rating of a vowel@")
LIST_ITEM (U"\\bu @@VoicePrints@")
LIST_ITEM (U"\\bu @@Prompted speech recordings@")
MAN_END

MAN_BEGIN (U"Example evaluating AST", U"R.J.J.H. van Son", 20120208)
INTRO (U"A tutorial example of how to evaluate the Acoustic Signal Typing on a sample of recordings")
ENTRY (U"Download and open the example corpus")
NORMAL (U"Download the TEVA_AST_example.zip file from [To be announced] and extract it to a convenient location. "
	 "Open TEVA and then click the %Open button on the @@Overview of Main page|Main page@. A file selection window will "
	 "open. Navigate into the map you just downloaded and select %%SignaltypeVoiceSamples.Table%. Then click %Choose. The "
	 "@@Overview of Main page|Main page@ now contains a display of an empty sound. %%SignaltypeVoiceSamples.Table% "
	 "contains data on a number of recordings. You must now select the recording you want to use. ")
ENTRY (U"Select speakers")
NORMAL (U"Click on the %Speaker button (lower left). A new window will open. Click on the ##=# button. "
	 "You now see a table with 5 columns and 4 lines (enlarge the window if you do not see all of it). The headings "
	 "read %ID, %Text, %Description, %Audio, and %AST. Except for the %Description column, all columns contain "
	 "metadata for the recordings mentioned in the %Audio column. Close the Info window and click in the TEVA window "
	 "to view the Speaker window.")
NORMAL (U"The Speaker window has three text fields. The top one contains the ID of the recording, the next field "
	 "a short description of the speaker (e.g., name or ID, age, sex, etc.). You can change this field, or even create "
	 "it for a newly recorded voice. If you enter an ID, or just the start of the ID, or row number in the table, "
	 "the corresponding speaker from the Info window will be read and displayed in TEVA. If you empty the ID field "
	 "completely and replace it with a single dash ##-#, the current record will be removed from the table.")
NORMAL (U"Put a single %%3% in the top field of the Speaker window to select the third entry in the Table. "
	 "Then Click the %Continue button. You now see a display of the recording of the fourth speaker. You see the ID of this "
	 "speaker and the @@Acoustic Signal Typing|Pathological Type@ as it was recorded in the Table.")
ENTRY (U"Find a stable interval")
NORMAL (U"Inspect the recording using the %Sound and %Spectrogram windows. You can change the frequency range of the %Spectrogram "
	 "by selecting the desired top frequency in the @@Overview of Configuration page|Configuration page@. After selecting the most stable "
	 "part of the speech, decide how the speech can be judged according to following statements as %Good, %Mediocre, or %Bad. See also "
	 "@@Acoustic Signal Typing@")
LIST_ITEM (U"\\bu The speaker can keep a stable /a/ sound over more than 2 seconds")
LIST_ITEM (U"\\bu There are clear harmonics up to 1000Hz")
LIST_ITEM (U"\\bu There is at least one stable harmonic for longer than 2 seconds")
LIST_ITEM (U"\\bu There are harmonics in part of the sample, for longer than 1 second")
NORMAL (U"With these statements in mind, pick an interval where the vowel is most stable. You can use "
	 "the %%Zoom in% and %%Zoom out% buttons as well as the %%Previous% (move left) and %%Next% (move right) buttons "
	 "to navigate around.")
NORMAL (U"When you found a part that you think is most stable, select an interval of 200 ms. Click the %Select button. "
	 "You are now asked to click on the position in the display where you want the start of the interval. When you do that, "
	 "a vertical blue line appears. Now you are asked to click on the position in the display where the end of the interval "
	 "should come. Click there. Alternatively, you can simply click inside the display window to select the first boundary."
	 "After that it proceeds as with the %Select button. Make sure that the interval is at least 100 ms "
	 "long. You can find the times of start and end points at the top of the graph. You can %%Zoom in% or go %%To selection%, "
	 "but that is not necessary. ")
ENTRY (U"Acoustic analysis")
NORMAL (U"Inspect the other displays, %%Pitch%, %%Ltas%, %%Intensity%, and %%Harmonicity%. Below each "
	 "of these displays, analysis parameters will be printed about the selected interval (see also "
	 "@@Analysis@ and @@AST categories@). Do these acoustic parameters support your evaluation of the preceding "
	 "statements? Use the %%Previous% (move left) and %%Next% (move right) buttons to move the selected interval around "
	 "and see how this affects the acoustic parameters. ")
ENTRY (U"Entering the Pathological Type")
NORMAL (U"When you have decided what type of pathological voice the recording has, you simply push one of the numbers "
	 "%%1-4%, and the type is recorded. The type will be displayed in the window and in the title bar. Push %%0% to remove "
	 "the type.")
ENTRY (U"Speeding up evaluations in long lists")
NORMAL (U"In case you need to examine a large number of recordings in sequence, a simplification exists. Select the "
	 "%Serial button on the @@Overview of Configuration page|Configuration page@. When you go back to the @@Overview of Main page|Main page@, "
	 "the %Speaker button now reads %Nxt and has turned blue. Clicking on this %Nxt button now automatically reads and displays "
	 "the next recording in the list. Just click on the %Serial button again to reset TEVA to the default behavior.")
ENTRY (U"Saving your work")
NORMAL (U"After evaluating the sounds, the pathological types and remarks added to the Speaker Info table should be saved "
	 "to disk. Go to the @@Overview of Configuration page|Configuration page@ and click on %Save. Fill in the name you want the file "
	 "to have (or use the default) and click %Save. During the work, every change or addition made to the Speaker Info table "
	 "is saved into a backup file with the same name as the original file and an added ##~# character. When you %Save or %Close "
	 "the table, this backup file is removed. Otherwise, it will remain until you open the table again and change something in it. "
	 "If you accidently forgot to save the table, you can simply open the backup file and save it under the old, or a new, name.")
NORMAL (U"To save the complete analysis of a single recording, use the @@VoicePrints|Print@ button on the "
	 "@@Overview of Main page|Main page@. This will ask for a place and name to save a directory with all the displays and "
	 "all the analysis data for the current time interval.")
ENTRY (U"Advanced topic: Pre-set local preferences")
NORMAL (U"For some projects, e.g., evaluation of a large corpus by judges or teaching a course, each user should start TEVA "
	 "using the same preferences settings. For that purpose, the preferences can be pre-set in a file called %%TEVApreferences.tsv% "
	 "or %%.tevarc% stored in the same directory as the %%<list>.Table% file (the former file is visible, the latter is hidden). "
	 "When the %%<list>.Table% file is opened, the settings file is read. See the global preferences file for the available settings.")
MAN_END

MAN_BEGIN (U"Example evaluating a Corpus", U"R.J.J.H. van Son", 20120308)
INTRO (U"A tutorial example of how to evaluate the Acoustic Signal Typing in a corpus")
ENTRY (U"Download and open the corpus")
NORMAL (U"Download the corpus .zip file from [To be announced] and extract it to a convenient location. "
	 "Open TEVA and then click the %Open button on the @@Overview of Main page|Main page@. A file selection window will "
	 "open. Navigate into the map you just downloaded and select the assigned table file. Then click %Choose. The "
	 "@@Overview of Main page|Main page@ now contains a display of an empty sound.")
ENTRY (U"Stepping through the Corpus")
NORMAL (U"You will notice that after opening the Table file, some settings of TEVA have changed. The display type has changed to "
	 "%Spectrogram, with a range from 0-2kHz. The %Speaker button at the bottom left has changed to a blue %Spk button. When you click "
	 "on the %Spk button, a file will be loaded. If you just started, this will be the first file ([1] in the window title). "
	 "If you already have worked on this project, the next file without an AST label will be displayed. Every time the %Spk button is "
	 "clicked, the next file will be loaded.")
NORMAL (U"If you ever have to go to a different file than the next in the list, click on the %Settings button "
	 "to go to the @@Overview of Configuration page|Configuration page@ and below the #Selection header click the "
	 "%%< Serial button% for the previous item in the list or %Individual for selecting any item in the list. "
	 "After that change, the direction symbol will be reversed on the @@Overview of Main page|Main page@ or the original "
	 "%Speaker button will reappear on the @@Overview of Main page|Main page@. Use this button to step to or display the required "
	 "file. To get back to the earlier state with the blue %Spk button, click again on the %Settings button to go to the "
	 "@@Overview of Configuration page|Configuration page@ and click the %%Serial >% button (which should change from %black to %red).")
NORMAL (U"TEVA will keep the name of the last used file with speaker and recording data in the preferences file. Next time TEVA "
	 "is opened, you just have to click on the %Spk button to continue where you left off and get to the next recording.")
ENTRY (U"Evaluate a recording")
NORMAL (U"Use the %Spectrogram (or another analysis display) to determine the @@Acoustic Signal Typing|Acoustic Signal Type@. You can "
	 "click inside the display to indicate a window of interest and use the %%Zoom&Select% panel to navigate through the recording. "
	 "Note that every (time) display will have a bar below it indicating the parts considered %Voiced by Praat (http://www.praat.org) "
	 "voicing detection (@@Pitch@).")
NORMAL (U"Inspect the recording using the %Spectrogram and %Sound windows. You can change the frequency range of the %Spectrogram "
	 "by selecting the desired top frequency in the @@Overview of Configuration page|Configuration page@. After selecting the most stable "
	 "part of the speech, decide how the speech can be judged according to following statements as %Good, %Mediocre, or %Bad. See also "
	 "@@Acoustic Signal Typing@")
LIST_ITEM (U"\\bu The speaker can keep a stable /a/ sound over more than 2 seconds")
LIST_ITEM (U"\\bu There are clear harmonics up to 1000Hz")
LIST_ITEM (U"\\bu There is at least one stable harmonic for longer than 2 seconds")
LIST_ITEM (U"\\bu There are harmonics in part of the sample, for longer than 1 second")
NORMAL (U"With these statements in mind, pick an interval where the vowel is most stable. You can use "
	 "the %%Zoom in% and %%Zoom out% buttons as well as the %%Previous% (move left) and %%Next% (move right) buttons "
	 "in the %%Zoom&Select% panel to navigate around. Help about signal typing can be found in the man pages (@@Acoustic Signal Typing@) "
	 "or in the %Pathology window on the @@Overview of Configuration page|Configuration page@. After you have decided which pathological "
	 "type you want to assign, just press the number key (one of 1-4). Press 0 to remove your choice. After that, you can press %Spk to go "
	 "to the next recording.")
NORMAL (U"You can also operate TEVA (almost) completely by pressing shortcut keys instead of using the buttons. "
	 "The sequence %Open -> %Spk -> %Play -> %3 -> %Spk can be entered as  %o, %x, %p, %3, %x. You will obviously have to choose the "
	 "Table file after pressing %o(pen).")
ENTRY (U"Saving your work")
NORMAL (U"To save your evaluations, click on the %Settings button to go to the "
	 "@@Overview of Configuration page|Configuration page@ and click the %Save button (%%not the% Save %%button on the% "
	 "@@Overview of Main page|Main page@%). A window will open which asks you where to save the Table. Select the file you opened "
	 "before to replace the original Table. If you forget to save your work, TEVA will prompt you to save your work when you "
	 "%Quit or open another Table. Selecting %Cancel will let you leave without saving your work. If you ever leave TEVA without saving "
	 "the Table file, you will find a %%recovery file% next to the original file. This file has the same name as the original, but with "
	 "a ~ added. Open this file and save it to replace the original to recover the \"lost\" work. Note that this recovery file will be "
	 "removed if you open the original file and either change something, %Save it again, or %Close it.")
ENTRY (U"Advanced: Setting local preferences")
NORMAL (U"To set up local preferences for a project, create a file called %%TEVApreferences.tsv% or %%.tevarc% and store it in the same"
	 "directory as the Table with the list of recordings. For example, the preferences for this example read (white-space is single tabs):")
CODE (U"Key                     Value")
CODE (U"config.frequency        2000")
CODE (U"config.showFormants     0")
CODE (U"config.speakerSerial    1")
CODE (U"mainPage.draw           Spectrogram")
NORMAL (U"A complete preferences file as created by TEVA, e.g., %%~/Library/Preferences/TEVA/TEVArc.tsv%, could look like "
	 "(again, use single tabs to separate the fields):")
CODE (U"Key                     Value")
CODE (U"config.language         EN")
CODE (U"config.frequency        2000")
CODE (U"config.showFormants     0")
CODE (U"config.speakerData      /Users/guest/Examples/SignaltypeVoiceSamples.Table")
CODE (U"config.speakerSerial    1")
CODE (U"config.recordingTime    4")
CODE (U"config.showBackground   1")
CODE (U"config.input            Microphone")
CODE (U"config.muteOutput       0")
CODE (U"config.openLog          /Users/gues/Library/Preferences/TEVA/log")
CODE (U"mainPage.draw           Spectrogram")
NORMAL (U"Note that the last Table used is stored in the preferences file (here it is %%SignaltypeVoiceSamples.Table%).")
MAN_END

MAN_BEGIN (U"Getting started with TEVA", U"R.J.J.H. van Son", 20111206)
INTRO (U"The NKI TE-VOICE ANALYSIS tool (TEVA) is a multi-platform stand-alone application. It is "
	 "available for MS Windows, Apple Macintosh OSX, and Linux. It is also available as a separate interactive "
	 "Praat script (http://www.praat.org).")
ENTRY (U"Getting a copy of TEVA")
NORMAL (U"TEVA is licensed under the @@TEVA license|GNU GPLv2@ and can be freely used and distributed. You can "
	 "download a copy of TEVA from http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI_TEVA/ . TEVA "
	 "can be saved on your hard disk or USB thumb drive and started by clicking on the icon.")
ENTRY (U"The TEVA pages")
NORMAL (U"After you start TEVA, a window will appear. This will initially contain the %Main page. "
	 "In normal practice, this is the page you will spend most of your time in. "
	 "There is a second page which allows you to change the settings of the application, "
	 "the %Configuration page. You can turn pages using a button on the top right of each page "
	 "(with an arrow symbol \\->).")
NORMAL (U"Each page contains a number of buttons. The %Main page also contains a canvas which is used "
	 "to draw the results of the analysis on. You interact with TEVA by clicking the buttons. For instance, "
	 "at the top-right of the Main page, there is a #Quit button labeled with a red #$X cross that will terminate the "
	 "application when you click on it. While the TEVA application is busy processing whatever the click of a button "
	 "asks it to do, the button will be grayed out (the label will be gray too instead of black or colored). "
	 "While a button is grayed out, TEVA will not respond to other button clicks.")
NORMAL (U"Every button has a keyboard shortcut. This shortcut is generally a single character, one of the letters of the "
	 "label on the button. That character will be printed in %italic in the label. For instance, in English, the "
	 "Quit button is labeled ##%%Q%uit# (with an italic %Q). Hitting the #Q key (upper or lowercase) will terminate the program.")
NORMAL (U"You can change the size of the TEVA window just as you can with every other window on your desktop. "
	 "However, you will notice that the positioning of the buttons and texts on the page will be off. "
	 "Sometimes the windows will look completely scrambled. The page can be redrawn with the #Refresh button "
	 "or by hitting the ##space bar#. Use the ##space bar# when the page is so scrambled that you cannot click the "
	 "#Refresh button anymore.")
NORMAL (U"Each page contains a #Help button. This button is labeled with a ##?# question mark. Hitting the "
	 "##?# or ##/# key will start the interactive #Help service. While #Help is active, a single line of help text will "
	 "appear whenever you click a button. Clicking the #Help button again will stop the #Help service. The help text "
	 "for each button will include the keyboard shortcuts in the current language.")
ENTRY (U"General functions")
NORMAL (U"Here are descriptions of a few often used buttons for general use. "
	 "English labels will be used here. The keyboard shortcuts are given between the [brackets] (might depend on language).")
LIST_ITEM (U"On the %Main page")
LIST_ITEM (U"\\bu #Quit: [Q] Stop TEVA. Will save the current preferences")
LIST_ITEM (U"\\bu #Settings: [S] Go to %Configuration page")
LIST_ITEM (U"\\bu #Refresh: [h] Redraw the current page, hitting the space-bar always refreshes the screen")
LIST_ITEM (U"\\bu #Help: [?] Press on the button you want information on, press %%Help% again to continue")
LIST_ITEM (U"  ")
LIST_ITEM (U"On the %Configuration page")
LIST_ITEM (U"\\bu #Help: [?] Press the button you want information on, press %%Help% again to continue")
LIST_ITEM (U"\\bu #Return: [R] Go back to %Main page")
LIST_ITEM (U"\\bu #English: [E] Use English labels and help")
LIST_ITEM (U"\\bu #Deutsch: [D] Use German labels and help")
LIST_ITEM (U"\\bu #Nederlands: [N] Use Dutch labels and help")
LIST_ITEM (U"\\bu #Manual: [M] Display this manual")
NORMAL (U"More can be found in @@Overview of Main page@ and @@Overview of Configuration page@.")
ENTRY (U"Language support")
NORMAL (U"TEVA supports a few languages, currently English, German, and Dutch. Extending this to other languages "
	 "is rather easy (just translating a few dozen sentences). But it can only be done with the help of a native speakers of that language. "
	 "Please contact us if you would like to help to port TEVA to your language.")
MAN_END

MAN_BEGIN (U"Introduction to TEVA", U"R.J.J.H. van Son", 20111206)
INTRO (U"the NKI TE-VOICE ANALSYSIS tool (TEVA) is developed as a tool for use in education and research. "
	 "TEVA is intended to help Speech Pathologists and other researchers to study "
	 "the acoustic characteristics of TE speech and to allow them to "
	 "get experience with the acoustic analysis of Tracheoesophageal (TE) speech.")
ENTRY (U"Introduction")
NORMAL (U"TEVA is built on top of the Praat phonetics software package (http://www.praat.org). As such  "
	 "TEVA presents a selection of the relevant analysis methods with an easy to use interface. "
	 "The approach to the analysis of TE speech used in TEVA is based on the work of Corina van As-Brooks as described in her "
	 "PhD thesis (@@Acoustic Signal Typing|Van As, 2001@).")
MAN_END

MAN_BEGIN (U"NKI TE-VOICE ANALYSIS tool (DE)", U"R.J.J.H. van Son", 20111201)
INTRO (U"The %%NKI TE-VOICE ANALYSIS tool% (TEVA) is intended to help the "
	 "education and research of Speech Pathologists and others who want to study "
	 "Tracheoesophageal speech. TEVA implements @@Acoustic Signal Typing@ from the "
	 "work of Corina van As-Brooks (Van As 2001; 2006)")
ENTRY (U"Contents")
LIST_ITEM (U"@@Introduction to TEVA|What is the NKI TEVA tool@")
LIST_ITEM (U"@@Getting started with TEVA|Getting started@")
LIST_ITEM (U"@@Overview of Main page|Overview of the Main page@")
LIST_ITEM (U"@@Overview of Configuration page|Overview of the Configuration page@")
LIST_ITEM (U"@@TEVA Tutorials|Tutorials@")
LIST_ITEM (U"@@Analysis|Analysis calculations and displays@")
LIST_ITEM (U"@@Acoustic Signal Typing@")
LIST_ITEM (U"@@TEVA lizenz|TEVA Urheberrechte und Lizenz@")
LIST_ITEM (U"@@What's new?@")
MAN_END

MAN_BEGIN (U"NKI TE-VOICE ANALYSIS tool (EN)", U"R.J.J.H. van Son", 20111201)
INTRO (U"The %%NKI TE-VOICE ANALYSIS tool% (TEVA) is intended to help the "
	 "education and research of Speech Pathologists and others who want to study "
	 "Tracheoesophageal speech. TEVA implements @@Acoustic Signal Typing@ from the "
	 "work of Corina van As-Brooks (Van As 2001; 2006). ")
ENTRY (U"Contents")
LIST_ITEM (U"@@Introduction to TEVA|What is the NKI TEVA tool@")
LIST_ITEM (U"@@Getting started with TEVA|Getting started@")
LIST_ITEM (U"@@Overview of Main page|Overview of the Main page@")
LIST_ITEM (U"@@Overview of Configuration page|Overview of the Configuration page@")
LIST_ITEM (U"@@TEVA Tutorials|Tutorials@")
LIST_ITEM (U"@@Analysis|Analysis calculations and displays@")
LIST_ITEM (U"@@Acoustic Signal Typing@")
LIST_ITEM (U"@@TEVA license|TEVA Copyright and License@")
LIST_ITEM (U"@@What's new?@")
MAN_END

MAN_BEGIN (U"NKI TE-VOICE ANALYSIS tool (ES)", U"R.J.J.H. van Son", 20111201)
INTRO (U"The %%NKI TE-VOICE ANALYSIS tool% (TEVA) is intended to help the "
	 "education and research of Speech Pathologists and others who want to study "
	 "Tracheoesophageal speech. TEVA implements @@Acoustic Signal Typing@ from the "
	 "work of Corina van As-Brooks (Van As 2001; 2006) ")
ENTRY (U"Contents")
LIST_ITEM (U"@@Introduction to TEVA|What is the NKI TEVA tool@")
LIST_ITEM (U"@@Getting started with TEVA|Getting started@")
LIST_ITEM (U"@@Overview of Main page|Overview of the Main page@")
LIST_ITEM (U"@@Overview of Configuration page|Overview of the Configuration page@")
LIST_ITEM (U"@@TEVA Tutorials|Tutorials@")
LIST_ITEM (U"@@Analysis|Analysis calculations and displays@")
LIST_ITEM (U"@@Acoustic Signal Typing@")
LIST_ITEM (U"@@TEVA license|TEVA Copyright and License@")
LIST_ITEM (U"@@What's new?@")
MAN_END

MAN_BEGIN (U"NKI TE-VOICE ANALYSIS tool (JP)", U"R.J.J.H. van Son", 20111201)
INTRO (U"The %%NKI TE-VOICE ANALYSIS tool% (TEVA) is intended to help the "
	 "education and research of Speech Pathologists and others who want to study "
	 "Tracheoesophageal speech. TEVA implements @@Acoustic Signal Typing@ from the "
	 "work of Corina van As-Brooks (Van As 2001; 2006). ")
ENTRY (U"Contents")
LIST_ITEM (U"@@Introduction to TEVA|What is the NKI TEVA tool@")
LIST_ITEM (U"@@Getting started with TEVA|Getting started@")
LIST_ITEM (U"@@Overview of Main page|Overview of the Main page@")
LIST_ITEM (U"@@Overview of Configuration page|Overview of the Configuration page@")
LIST_ITEM (U"@@TEVA Tutorials|Tutorials@")
LIST_ITEM (U"@@Analysis|Analysis calculations and displays@")
LIST_ITEM (U"@@Acoustic Signal Typing@")
LIST_ITEM (U"@@TEVA license|TEVA Copyright and License@")
LIST_ITEM (U"@@What's new?@")
MAN_END

MAN_BEGIN (U"NKI TE-VOICE ANALYSIS tool (NL)", U"R.J.J.H. van Son", 20111201)
INTRO (U"The %%NKI TE-VOICE ANALYSIS tool% (TEVA) is intended to help the "
	 "education and research of Speech Pathologists and others who want to study "
	 "Tracheoesophageal speech. TEVA implements @@Acoustic Signal Typing@ from the "
	 "work of Corina van As-Brooks (Van As 2001; 2006) ")
ENTRY (U"Contents")
LIST_ITEM (U"@@Introduction to TEVA|What is the NKI TEVA tool@")
LIST_ITEM (U"@@Getting started with TEVA|Getting started@")
LIST_ITEM (U"@@Overview of Main page|Overview of the Main page@")
LIST_ITEM (U"@@Overview of Configuration page|Overview of the Configuration page@")
LIST_ITEM (U"@@TEVA Tutorials|Tutorials@")
LIST_ITEM (U"@@Analysis|Analysis calculations and displays@")
LIST_ITEM (U"@@Acoustic Signal Typing@")
LIST_ITEM (U"@@TEVA licentie|TEVA auteursrechten en licentie@")
LIST_ITEM (U"@@What's new?@")
MAN_END

MAN_BEGIN (U"Opening an existing recording", U"R.J.J.H. van Son", 20111220)
INTRO (U"How to open existing sound files in TEVA. ")
ENTRY (U"Audio formats")
NORMAL (U"TEVA can handle all @@Sound files|audio file formats@# that %Praat can read. "
	 "This includes, among others, WAV, AIFF/C, FLAC, and MP3 files.")
ENTRY (U"Open a file")
NORMAL (U"To open an existing recording, click the %Open button on the @@Overview of Main page|Main page@. "
	 "A file select window will open which allows you to select the file in the customary way. Then click %Choose. "
	 "The file will open and the currently selected analysis display will be drawn.")
ENTRY (U"Next:")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
LIST_ITEM (U"\\bu @@Determine pathological type@")
LIST_ITEM (U"\\bu @@Perceptual rating of a vowel@")
LIST_ITEM (U"\\bu @@VoicePrints@")
LIST_ITEM (U"\\bu @@Prompted speech recordings@")
MAN_END

MAN_BEGIN (U"Overview of Configuration page", U"R.J.J.H. van Son", 20111206)
INTRO (U"TEVA is used by clicking buttons on the current page. Here is a list of the buttons on the Configuration page with a "
	 "description of their use. English labels will be used here. The keyboard shortcuts are given between the []-brackets (might depend on language)."
	 "See also the @@Overview of Main page@.")
NORMAL (U"Many of buttons are radio type push buttons. When clicked, they remain \"pushed down\" until another button is pushed. The state "
	 "of these button is remembered between invocations of TEVA. Buttons on a (light) gray background are grouped together, like the language choice buttons or the  "
	 "%%Frequency% buttons. ")
ENTRY (U"General functions")
LIST_ITEM (U"\\bu #Help: [?] Press the button you want information on, press %%Help% again to continue")
LIST_ITEM (U"\\bu #Return: [R] Go back to %Main page")
LIST_ITEM (U"\\bu #English: [E] Use English labels and help")
LIST_ITEM (U"\\bu #日本語: [D] Use Japanese labels and help")
LIST_ITEM (U"\\bu #Deutsch: [D] Use German labels and help")
LIST_ITEM (U"\\bu #Nederlands: [N] Use Dutch labels and help")
ENTRY (U"%%Frequency%: Spectral display")
NORMAL (U"The display of spectral features should be reduced to exclude irrelevant detail. "
	 "Set the maximal frequency to a frequency that just includes all the relevant features. The "
	 "sample frequency of recordings are adjusted to this display frequency. If the display frequency "
	 "is set to 5 kHz or below, the sample frequency will be set to 11.025 kHz (down from 22.050 kHz). ")
LIST_ITEM (U"\\bu ##10kHz#: [01] Display up to 10 kHz")
LIST_ITEM (U"\\bu ##8kHz#: [8] Display up to 8 kHz")
LIST_ITEM (U"\\bu ##5kHz#: [5] Display up to 5 kHz")
LIST_ITEM (U"\\bu ##3kHz#: [3] Display up to 3 kHz")
LIST_ITEM (U"\\bu ##2kHz#: [2] Display up to 2 kHz")
LIST_ITEM (U"\\bu ##1kHz#: [1] Display up to 1 kHz")
ENTRY (U"%%Pitch%")
NORMAL (U"Pitch tracker settings")
LIST_ITEM (U"\\bu ##Low#: [ ] Reduced octave jumps, for normal and low pitches (<300 Hz)")
LIST_ITEM (U"\\bu ##High#: [ ] Reduced octave jumps, for high pitches (<600 Hz)")
LIST_ITEM (U"\\bu ##Compatible#: [ ] Settings from C.J. van As 2001 \"Tracheoesophageal Speech\" p83")
ENTRY (U"%%Archive% recording and collection of audio")
LIST_ITEM (U"\\bu ##Audio#: [!] Save current audio selection to file")
LIST_ITEM (U"\\bu ##Recording#: [c] Time of recording in seconds or @@Recording tasks@ ")
ENTRY (U"%%Execute% automatic analysis that might be time consuming")
LIST_ITEM (U"\\bu ##Formants#: [F] Calculate and draw formants in spectrogram")
LIST_ITEM (U"\\bu ##AutoSelect#: [ ] Select the \"best\" interval automatically")
LIST_ITEM (U"\\bu ##GNE#: [ ] Calculate the GNE value")
ENTRY (U"%%Voiceprint% output format")
NORMAL (U"The format to write the voicprint image to. Not all formats are available on all platforms")
LIST_ITEM (U"\\bu ##EPS#: [ ] Encapsulated Postscript picture format")
LIST_ITEM (U"\\bu ##PNG#: [ ] Portable network graphics bitmap picture format")
LIST_ITEM (U"\\bu ##PDF#: [ ] Portable document picture format (not on MS Windows)")
LIST_ITEM (U"\\bu ##With audio#: [ ] Save recordings together with %%Voiceprint% (same name, but with WAV extension)")
ENTRY (U"%%Selection% of speakers or recordings from the speaker data table")
LIST_ITEM (U"\\bu ##Individual#: [i] Select individual recordings (%Speaker button changes to black %Speaker)")
LIST_ITEM (U"\\bu ##Serial >#: [>] Step through all recordings in sequence (%Speaker button changes to blue %Spk, next recording)")
LIST_ITEM (U"\\bu ##< Serial#: [<] Step backwards through all recordings in sequence (%%< Speaker% button changes to blue %Spk, previous recording)")
ENTRY (U"%%Speakers%: Speaker data tables and recording duration")
NORMAL (U"It is useful to have a list of speaker data available. TEVA can read and write Tab delimited tables (tsv) "
	 "with speaker data. A backup of this file, with a tilde '~' appended to the name, is created if the data are changed.")
LIST_ITEM (U"\\bu ##Data#: [D] Read table with speaker data")
LIST_ITEM (U"\\bu ##Directory#: [y] Create a table from all recordings in a directory")
LIST_ITEM (U"\\bu ##Save#: [v] Write current table with speaker data")
LIST_ITEM (U"\\bu ##Close#: [o] Close current table and open a new, empty one")
LIST_ITEM (U"\\bu ##Merge#: [g] Merge new table with current speaker data")
LIST_ITEM (U"\\bu ##Sort#: [V] Sort the list of recordings")
LIST_ITEM (U"\\bu ##Shuffle#: [u] Randomize the list of recordings")
LIST_ITEM (U"\\bu ##Revert#: [c] Revert speaker data to saved version")
NORMAL (U"Each row in the speaker table contains at least five fields separated by tabs:")
LIST_ITEM (U"[1] ##ID# Speaker, or Recording, ID (must be unique)")
LIST_ITEM (U"[2] ##Text# Speaker description (age, sex, etc)")
LIST_ITEM (U"[3] ##Description# Comments")
LIST_ITEM (U"[4] ##Audio# File name of a recording with path relative to the table")
LIST_ITEM (U"[5] ##AST# @@Acoustic Signal Typing|Acoustic Signal Type@ (%%1-4%)")
LIST_ITEM (U"[6] ##StartTime# Start of the window used for AST (optional)")
LIST_ITEM (U"[7] ##EndTime# End of the window used for AST (optional)")
LIST_ITEM (U"[8] Prepared columns with @@Acoustic Signal Typing|Acoustic Signal Type@ (%%1-4%) (optional)")
NORMAL (U"If given, the recording will be automatically loaded if this speaker is selected "
	 "in the main page. Additional columns are used for specific functions, e.g., ##@@VAS rating scales (EN)|VAS rating scales@#. ")
ENTRY (U"%%Rating% screens")
LIST_ITEM (U"\\bu ##Vowels#: Use ##@@VAS rating scales (EN)|VAS rating@# for long vowel realizations")
LIST_ITEM (U"\\bu ##Text#: Use ##@@VAS rating scales (EN)|VAS rating@# for text reading realizations")
LIST_ITEM (U"\\bu ##IINFVo#: Use ##@@VAS rating scales (EN)|VAS rating@# for running speech")
LIST_ITEM (U"\\bu ##GRBAS#: Use ##@@VAS rating scales (EN)|GRBAS rating@# for voice")
LIST_ITEM (U"\\bu ##Markers#: ##@@VAS rating scales (EN)|VAS@# scale markers display On/Off")
ENTRY (U"Miscelaneous")
LIST_ITEM (U"\\bu ##Background#: [B] Show background or not")
LIST_ITEM (U"\\bu ##Microphone#: [h] Use the built-in microphone for recording")
LIST_ITEM (U"\\bu ##Line input |#: [|+] Use the line-input for recording")
LIST_ITEM (U"\\bu ##Mute x#: [x] Mute output sound")
LIST_ITEM (U"\\bu ##Test recording#: [T] Test recording level")
NORMAL (U"##Recording# sets the duration of live recordings. It also allows to set complex recording tasks")
ENTRY (U"Additional information")
LIST_ITEM (U"\\bu ##Pathology#: [P] Information about pathological types")
LIST_ITEM (U"\\bu ##Manual#: [M] This manual")
LIST_ITEM (U"\\bu ##About#: [iA] Information about NKI TE-VOICE ANALYSIS tool and credits")
MAN_END

MAN_BEGIN (U"Overview of Main page", U"R.J.J.H. van Son", 20111206)
INTRO (U"TEVA is used by clicking buttons on the current page. Here is a list of the buttons on the Main page with a description of their use."
	 "English labels will be used here. The keyboard shortcuts are given between the []-brackets (might depend on language)."
	 "See also the @@Overview of Configuration page@.")
ENTRY (U"The display")
NORMAL (U"In the center of the page is the display area where a graph is drawn with the analysis. Below the time axis (if present), "
	 "the voiced parts are indicated with blue-gray line segments. A green marker will indicate the point where the @@Harmonicity@ is "
	 "maximal (which indicates a potential \"best\" part). These two additional markers will in general appear only after, respectively, "
	 "the @@Pitch@ and @@Harmonicity@ contours have been displayed.")
ENTRY (U"General functions")
LIST_ITEM (U"\\bu #Quit: [Q] Stop TEVA. Will save the current preferences")
LIST_ITEM (U"\\bu #Settings: [S] Go to %Configuration page")
LIST_ITEM (U"\\bu #Refresh: [h] Redraw the current page, hitting the space-bar always refreshes the screen")
LIST_ITEM (U"\\bu #Help: [?] Press on the button you want information on, press %%Help% again to continue")
ENTRY (U"Recorded speech")
LIST_ITEM (U"\\bu ##Speaker#: [k] Input speaker data. Speakers from a table can be selected by ID, row number, "
	 "or by stepping to the next, ##>#, or previous , ##<#, speaker. Click ##Ready# to complete")
LIST_ITEM (U"\\bu ##Spk#: [x|] Alternative to %Speaker button in %Serial mode, steps through a list of recordings "
	 "one by one")
LIST_ITEM (U"\\bu ##Open#: [O] Open sound file (or a list of sound files)")
LIST_ITEM (U"\\bu ##Record#: [R] Record your speech. You have 4 seconds, watch the recording \"light\" on the top left")
LIST_ITEM (U"\\bu ##Play#: [P] Play back of recording")
NORMAL (U"The sound level of the sound will be indicated as a colored circle in the top left of the page. The diameter scales with "
	 "the maximal amplitude and the color indicates whether the maximal amplitude is too high (red), good (green), or too low (darker green to black).")
ENTRY (U"Selecting an interval of speech")
NORMAL (U"The current time window will be indicated with vertical blue lines if it is smaller than the "
	 "current display. Changing the display (eg, zoom in or out) will set the display window to the current time window.")
LIST_ITEM (U"\\bu #Select: [e] Select a new start and an endtime with the cursor")
LIST_ITEM (U"\\bu ##To selection#: [c] Go to selected start and endtime")
LIST_ITEM (U"\\bu ##Zoom out#: [u-] Double the current time window")
LIST_ITEM (U"\\bu ##Zoom in#: [n+] Halve the current time window")
LIST_ITEM (U"\\bu ##Previous#: [<] Previous interval, or shift current time window to the left")
LIST_ITEM (U"\\bu ##Next#: [>] Next interval, or shift the current time window to the right")
NORMAL (U"A shortcut to the %Select button is to click inside the display graph. The point where clicked will be marked as the "
	 "first boundary and all will proceed as if the %Select button was pressed. After selecting the first boundary, pressing the #- or #+ "
	 "keys will position a %1 or %2 second window around the (first) selection point, respectively. Pressing any other key or clicking the "
	 "%Select button again will cancel the selection.")
ENTRY (U"Saving and printing a report")
LIST_ITEM (U"\\bu #Print [\\# ] Save a one page report in printer format (@@VoicePrints|Voice print@)")
NORMAL (U"A report with graphs and the analysis results can be saved into a report in printing format. "
	 "The report contains the waveform of the current window, a 0.1 second enlargement window, and the @@Spectrogram@, @@Pitch@, "
	 "and @@Ltas@ graphs."
	 "The analysis windows are calculated and pictures are combined into a single page report. On Apple OSX the pictures are saved as PDF "
	 "graphics, on Microsoft Windows as (extended) WMF graphics. On all systems, pictures can also saved as PostScript graphics (EPS). "
	 "There is experimental support for PNG format on Mac OSX and Linux.")
ENTRY (U"@@Analysis|Analysis calculations and displays@")
NORMAL (U"Selected statistics about the analysis will be written below the display. This includes the "
	 "@@Acoustic Signal Typing@ analysis related to the display.")
LIST_ITEM (U"\\bu ##Sound#: [S] The Sound waveform")
LIST_ITEM (U"\\bu ##Pitch#: [t] Pitch contour")
LIST_ITEM (U"\\bu ##Spectrogram#: [L] Narrow band spectrogram (100 ms window) with formants superimposed")
LIST_ITEM (U"\\bu ##Ltas#: [L] Long time average spectrum")
LIST_ITEM (U"\\bu ##Intensity#: [I] Intensity")
LIST_ITEM (U"\\bu ##Harmonicity#: [H] The Harmonicity to Noise ratio")
LIST_ITEM (U"\\bu ##Rating#: [] Subset of ##@@VAS rating scales (EN)|INFVo VAS rating@#")
MAN_END

MAN_BEGIN (U"Perceptual rating of a vowel", U"R.J.J.H. van Son", 20140822)
INTRO (U"How to determine the perceptual quality of a vowel using @@VAS rating scales (EN)|VAS rating@.")
NORMAL (U"Record or Open an /a/ sound, select a stable part of the recording and add information "
	 "about the speaker and recording:")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
LIST_ITEM (U"\\bu @@Determine pathological type@")
ENTRY (U"Perceptual rating using Visual Analogue Scales")
NORMAL (U"On the @@Overview of Main page|main@ page, select the %Rating button (bottom right). The screen will "
	 "show a number of horizontal bars with titles and qualifications to the left and right of each bar. To change the "
	 "type evaluations, go to the @@Overview of Configuration page|Configuration page@ and select one of the buttons "
	 "labeled %Vowels, %Text, %IINFVo, or %GRBAS (see @@VAS rating scales (EN)|VAS rating@).")
NORMAL (U"Listen to the sound by pressing the %Play button. Click on the position in the Visual Analogue Scale "
	 "that corresponds to the relative quality of the speech. Default, there will be a grey mark at the center of each "
	 "scale. When a selection is made, a red mark will be visible at the indicated position. Use the @@VoicePrints|Print@ "
	 "button to save and print the evaluation. It is best to leave the scale %Markers off when evaluating speech. These "
	 "scale %Markers are useful when inspecting evaluation scores. ")
ENTRY (U"Acoustic signal typing and Voice Quality")
NORMAL (U"There are also experimental @@AST categories|automatic evaluation of pathological type@ and %%Voice Quality%.  "
	 "These automatic evaluations are displayed in the @@VoicePrints@. ")
ENTRY (U"Next:")
LIST_ITEM (U"\\bu @@VoicePrints@")
LIST_ITEM (U"\\bu @@Prompted speech recordings@")
MAN_END

MAN_BEGIN (U"Prompted speech recordings", U"R.J.J.H. van Son", 20140822)
INTRO (U"Use on-screen @@Recording tasks|prompts@ to record speech.")
NORMAL (U"When collecting speech from informants or patients, it is very useful to be able to direct them through the "
	 "recording session with @@Recording tasks|prompt@ screens. ")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
LIST_ITEM (U"\\bu @@Determine pathological type@")
LIST_ITEM (U"\\bu @@VoicePrints@")
ENTRY (U"Set up a simple prompt screen: #a as in %hat")
NORMAL (U"On the @@Overview of Configuration page|configuration page@, click the %Recording button under the Archive "
	 "heading. A window will appear. ")
LIST_ITEM (U"\\bu 1 In the %Recording field, enter the default duration of the recording in seconds, e.g., 4")
LIST_ITEM (U"\\bu 2 In the %Task field, enter [\\# \\# a\\#  as in \\% \\% hat\\% ], including the []-brackets")
LIST_ITEM (U"\\bu 3 Press the %Store button and select the directory or map you want to store the recorded speech in. ")
LIST_ITEM (U"\\bu 3 Press %Continue")
ENTRY (U"Record speech")
NORMAL (U"Go back to the @@Overview of Main page|main page@. When you press the %Record button, a window will appear. "
	 "Enter the recording ID or filename and press %Continue.")
LIST_ITEM (U"\\bu 1 The prompt text will appear in a blank window on a red background.")
LIST_ITEM (U"\\bu 2 Recording starts when the background switches to green and the red dot appears at the top-left.")
LIST_ITEM (U"\\bu 3 The audio selection is stored to file when you click on the blue %Spk button or if you quit TEVA.")
MAN_END

MAN_BEGIN (U"Recording tasks", U"R.J.J.H. van Son", 20140512)
INTRO (U"TEVA can be used to record a list of tasks initiated by pompts. "
	 "Such prompts can be simple, like [#a as in %%hat%], as well as page "
	 "sequences with formatted text. A recording task is defined by setting the "
	 "%%Task% field in the Recording window of the "
	 "@@Overview of Configuration page|Configuration page@. The recording sessions "
	 "is started by clicking the %%Record%  button on the @@Overview of Main page|Main page@. ")
LIST_ITEM (U"\\bu Each recording session starts with a  window that asks "
	 "for the ID or name of the speaker")
LIST_ITEM (U"\\bu After an ID or name is entered, the first prompt is displayed. "
	 "While you are not satisfied with a recording, you can re-record by "
	 "clicking the %%Record% button.")
LIST_ITEM (U"\\bu When satisfied with the recording, click the (blue) %%Nxt% "
	 "button for the next prompt. ")
LIST_ITEM (U"\\bu When all the prompts have been displayed, an %%end of list% "
	 "message appears (only when there is more than one prompts). After you clicked "
	 "anywhere in the window, you can start a new recording session. ")
ENTRY (U"Recording task window")
NORMAL (U"When clicking %%Recording% on the "
	 "@@Overview of Configuration page|Configuration page@ a small window appears. "
	 "This window asks for three pieces of information: ")
LIST_ITEM (U"\\bu #Recording: Default duration of recordings (4 s)")
LIST_ITEM (U"\\bu #Task: The prompt, either in []-brackets for text, or a file with lines of text, or a Table with prompts")
LIST_ITEM (U"\\bu #Store: The directory where the recordings will be stored")
ENTRY (U"Recording")
NORMAL (U"The number of seconds recorded. This is a default time that can "
	 "be changed in a table with recording prompts. Defaults to 4 seconds.")
ENTRY (U"Task")
NORMAL (U"The prompt text in %%Praat% @@Text styles@ format. Alternatively, "
	 "a text or table file with prompts can be selected by pressing the %%Task% button. "
	 "Each line in a (ASCII|DOS) text file will be displayed as a single prompt screen. "
	 "Each line will give rise to a numbered recording. If the %%Task% file is a (tsv, "
	 "or tab-separated values) table, the size and formating of the prompts can be "
	 "controlled. ")
ENTRY (U"Store")
NORMAL (U"The directory where the recordings are stored. Each recording is "
	 "stored in a sub-directory with the ID or name of the %%Speaker%. File names "
	 "are constructed from the ID or name of the %%Speaker%, the number of name of "
	 "the prompt screen, and a time stamp. ")
MAN_END

MAN_BEGIN (U"Recording your own voice", U"R.J.J.H. van Son", 20111220)
INTRO (U"How to record and analyze a voice.")
ENTRY (U"Record your voice")
NORMAL (U"First set up your computer for voice recording. You should use a microphone of a reasonable "
	 "quality. Furthermore, if your computer has some kind of %Microphone boost feature, make sure it is turned off. "
	 "Then use some application you know to check whether you can actually record your sound. For instance, if you have "
	 "Praat (http://www.praat.org) or Audacity (http://audacity.sourceforge.net) installed, try to record your voice with them. "
	 "If recording works, you can continue.")
NORMAL (U"After you started TEVA, click on the %Settings (\\->) button to go to the @@Overview of Configuration page|Configuration page@. "
	 "There you should check the relevant sound input, either %Microphone if you use a built-in microphone or the microphone jack, or "
	 "%%Line input% if you have connected to the line input. You can use the %%Test recording% button to open a window where you can check the "
	 "setup and recording level. Close the window when you are satisfied. Note that your changes in the settings of this window will be ignored.")
NORMAL (U"After you are satisfied that the recording setup is working, go back to the @@Overview of Main page|Main page@ by clicking "
	 "the %Return (\\->) button.")
NORMAL (U"On the @@Overview of Main page|Main page@, click on the red %Record (\\bu) button. A bright red spot will appear in the top "
	 "left corner of the page during the time of the recording. The default duration of a recording is 4 seconds. You can change this duration "
	 "on the @@Overview of Configuration page|Configuration page@, with the %Recording button. While the red spot is visible, speak a "
	 "sustained /a/ sound in the microphone.")
NORMAL (U"After the recording has stopped, the wave-form of the recorded sound will be shown in the central part of the "
	 "@@Overview of Main page|Main page@. The wave-form display is the default setting of TEVA. However, if TEVA was closed the last time while another "
	 "display was selected, that display will be used again. The bright red spot in the top left corner will have been replaced by a open colored circle. "
	 "The diameter and color of the circle indicate the maximum amplitude of the recorded sound. A big red circle means the recorded sound might have "
	 "been too loud and clipped. A green circle indicates a safe recording level. When the circle becomes smaller and the color becomes darker towards black, "
	 "the sound level of the recording might have been too soft.")
NORMAL (U"Listen to the recorded sound. You can play the recorded sound by clicking the red %Play button (right pointing solid triangle). "
	 "You might notice that the recorded sound is not 4 seconds long (or whatever your recording setting is). TEVA will cut off silence at the "
	 "start and end of the recording. Check whether there is enough of the /a/ recorded and that there is no background noise in the recording. "
	 "Repeat the recording procedure until you are satisfied with the result. You do not have to reject the old recording, a new recording simply "
	 "replaces the existing recording.")
ENTRY (U"Other displays and analysis")
NORMAL (U"When you click on any of the buttons on the right side below %Sound, e.g., %Pitch, %Spectrogram, %Ltas, %Intensity, or %Harmonicity, "
	 "these will be displayed instead. Calculation of some of these displays might take some time, so be patient. Below all of the windows, except "
	 "%Sound and %Spectrogram, text will appear with statistics of these analysis types. The button labeled %Rating will display "
	 "##@@VAS rating scales (EN)|Visual Analogue Scales (VAS)@# for perceptual rating of the sounds. ")
ENTRY (U"Next:")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
LIST_ITEM (U"\\bu @@Determine pathological type@")
LIST_ITEM (U"\\bu @@VoicePrints@")
MAN_END

MAN_BEGIN (U"Saving a report", U"R.J.J.H. van Son", 20111220)
INTRO (U"Generate a printable report. ")
NORMAL (U"Record or Open an /a/ sound, select a stable part of the recording and add information "
	 "about the speaker and recording:")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
LIST_ITEM (U"\\bu @@Determine pathological type@")
NORMAL (U"After selecting a stable part of a recording and determining the pathological type, "
	 "the results should be stored in a report for later use. This is done by clicking the %Print "
	 "button on the @@Overview of Main page|Main page@. A name can be entered and then click %Save. "
	 "The default name is the ID code in the Speaker information.")
NORMAL (U"The displays are regenerated on a page and saved in one of the supported formats: PNG, EPS, and PDF. "
	 "Currently, PDF is not supported on MS Windows. The output format can be selected on the "
	 "@@Overview of Configuration page|Configuration page@ under the heading %VoicePrint. If the %%With audio% is "
	 "button selected on the @@Overview of Configuration page|Configuration page@, the selected audio fragment is "
	 "saved alongside the %VoicePrint. ")
ENTRY (U"Next:")
LIST_ITEM (U"\\bu @@Example evaluating AST@")
MAN_END

MAN_BEGIN (U"Selecting stable sounds", U"R.J.J.H. van Son", 20111220)
INTRO (U"How to select a stable part of the voice.")
NORMAL (U"Record or Open an /a/ sound and add information about the speaker and recording:")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
ENTRY (U"Introduction and basics")
NORMAL (U"Not all parts of your recording will be useful for analysis. Selecting "
	 "a part of the recording is done with the buttons around the %Select button. If the current interval is smaller than the current window, "
	 "the boundaries of the current interval are indicated by vertical blue lines. With %%Zoom in% (+) and %%Zoom out% (-) you can decrease and increase the size "
	 "of the window. With the %Previous and %Next buttons you can step through the recording. With the %Select button you can indicate the start and end of "
	 "the preferred interval. ")
ENTRY (U"Selecting a stable interval of speech")
NORMAL (U"Go to the %Spectrogram for selecting a stable part of your /a/ recording. %%Zoom out% until you see the complete recording. You might "
	 "notice that the recorded sound is not 4 seconds long (or whatever your recording setting is). TEVA will cut off silence at the start and end of the "
	 "recording. A stable /a/ sound will show a smooth spectrogram with many harmonics as horizontal lines. The more harmonics are clearly visible, "
	 "the better the voice is. Find the longest stretch of speech with many, flat harmonics. This will be the interval to analyse. For the "
	 "@@Acoustic Signal Typing@ analysis, around 1-2 seconds of speech are needed.")
NORMAL (U"Click on %Select. A blue text will appear below the display \"%%Select new start time (or press Select or a key to continue)%\". If you "
	 "press %Select again or press any key on the keyboard, the selection procedure will stop. Use the mouse pointer to click on the start "
	 "of the desired stable interval inside the display. This procedure can be done much easier by simply clicking on the display at the point "
	 "where you want the border to be. This will automatically bring you to step two of the %Select procedure.")
NORMAL (U"A vertical blue line will be draw at the point where you clicked. The text below the display will have changed to "
	 "\"%%Select new end time, #- or #+ for a 1 or 2 sec window (cancel with Select or another key)%\". Use the mouse pointer to click on the end of the desired stable interval "
	 "inside the display. A second blue line will appear and the text disappears. If you press the #- key, a new interval of"
	 "1 second wide will appear centered on the point you selected in step 1. If you press the #+ key, a new interval with a width "
	 "of 2 seconds will appear. ")
NORMAL (U"If you now click on the %Play button, you will hear only the "
	 "fragment you selected. The blue lines will be present in all other displays, except the %Ltas display. The %Ltas display will have changed and will "
	 "only give the spectrum of the selected interval. All the statistics printed below the displays will refer to only the selected interval.")
NORMAL (U"You can move around the selected interval with the %Previous and %Next buttons. You can make the window match the selected interval by "
	 "clicking on %%To selection%.")
ENTRY (U"Next:")
LIST_ITEM (U"\\bu @@Determine pathological type@")
LIST_ITEM (U"\\bu @@Perceptual rating of a vowel@")
LIST_ITEM (U"\\bu @@VoicePrints@")
LIST_ITEM (U"\\bu @@Prompted speech recordings@")
MAN_END

MAN_BEGIN (U"TEVA Tutorials", U"R.J.J.H. van Son", 20111219)
INTRO (U"Tutorials to get acquainted with TEVA")
LIST_ITEM (U"\\bu @@Recording your own voice@")
LIST_ITEM (U"\\bu @@Opening an existing recording@")
LIST_ITEM (U"\\bu @@Selecting stable sounds@")
LIST_ITEM (U"\\bu @@Adding speaker information@")
LIST_ITEM (U"\\bu @@Determine pathological type@")
LIST_ITEM (U"\\bu @@Perceptual rating of a vowel@")
LIST_ITEM (U"\\bu @@VoicePrints@")
LIST_ITEM (U"\\bu @@Prompted speech recordings@")
LIST_ITEM (U"\\bu Examples:")
LIST_ITEM (U"\\bu @@Example evaluating AST|Evaluating AST@")
LIST_ITEM (U"\\bu @@Example evaluating a Corpus|Evaluating a Corpus@")
MAN_END

MAN_BEGIN (U"TEVA license", U"R.J.J.H. van Son", 20111206)
ENTRY (U"NKI TE-VOICE ANALYSIS tool version 1.0")
NORMAL (U"Netherlands Cancer Institute tool for ##Tracheoesophageal Voice Analysis# (TEVA)")
NORMAL (U"For more information, visit our websites: http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI_TEVA/ "
	 "and http://www.provoxweb.info/acoustic-analyses.html . "
	 "TEVA is based on Praat (http://www.praat.org)")
NORMAL (U"This application was made possible by an unrestricted research grant from: "
	 "##ATOS MEDICAL AB#: P.O. BOX 183 SE-242 22 H\\O\"RBY SWEDEN")
NORMAL (U"This application is licensed under the GNU GPL version 2 or later (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)")
CODE (U"The NKI TE-VOICE ANALYSIS tool")
CODE (U"Copyright \\co 2011 Netherlands Cancer Institute and R.J.J.H. van Son")
CODE (U"Praat code Copyright \\co 1992-2011 Paul Boersma and David Weenink")
NORMAL (U"$$This program is free software; you can redistribute it and/or "
	 "modify it under the terms of the GNU General Public License "
	 "as published by the Free Software Foundation; either version 2 "
	 "of the License, or (at your option) any later version.$")
NORMAL (U"$$This program is distributed in the hope that it will be useful, "
	 "but ##WITHOUT ANY WARRANTY#; without even the implied warranty of "
	 "##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE#.  See the "
	 "GNU General Public License for more details.$")
NORMAL (U"$$You should have received a copy of the GNU General Public License "
	 "along with this program; if not, write to the Free Software "
	 "Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.$")
MAN_END

MAN_BEGIN (U"TEVA licentie", U"R.J.J.H. van Son", 20120208)
ENTRY (U"NKI TE-VOICE ANALYSIS tool versie 1.0")
NORMAL (U"Nederlands Kanker Instituut aplicatie voor ##Tracheoesophageale Stemanalyse# (TEVA)")
NORMAL (U"Voor meer informatie, bezoek onze websites: http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI_TEVA/ "
	 "en http://www.provoxweb.info/acoustic-analyses.html . "
	 "Gebaseerd op Praat (http://www.praat.org)")
NORMAL (U"Deze applicatie is mogelijk gemaakt door een vrije onderzoeksbeurs van:")
NORMAL (U"##ATOS MEDICAL AB#: P.O. BOX 183 SE-242 22 H\\O\"RBY SWEDEN")
NORMAL (U"TEVA wordt gedistribueerd onder de GNU GPL Licentie versie 2 of later (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)")
CODE (U"NKI TE-VOICE ANALYSIS tool")
CODE (U"Productie en auteursrechten \\co 2010-2012 Het Nederlands Kanker Instituut en R.J.J.H. van Son")
CODE (U"Praat auteursrechten \\co 1992-2012 Paul Boersma en David Weenink")
NORMAL (U"$$Dit programma is vrije software: je mag het herdistribueren "
	 "en/of wijzigen onder de voorwaarden van de GNU Algemene "
	 "Publieke Licentie zoals gepubliceerd door de Free Software Foundation, "
	 "onder versie 2 van de Licentie of (naar jouw keuze) "
	 "elke latere versie.$")
NORMAL (U"$$Dit programma is gedistribueerd in de hoop dat het nuttig zal"
	 "zijn maar ##ZONDER ENIGE GARANTIE#; zelfs zonder de impliciete garanties"
	 "die ##GEBRUIKELIJK ZIJN IN DE HANDEL# of voor ##BRUIKBAARHEID VOOR EEN"
	 "SPECIFIEK DOEL#. Zie de GNU Algemene Publieke Licentie voor meer details.$")
NORMAL (U"$$Je hoort een kopie van de GNU Algemene Publieke Licentie te hebben"
	 "ontvangen samen met dit programma. Als dat niet het geval is, zie"
	 "[http://www.gnu.org/licenses/].$")
MAN_END

MAN_BEGIN (U"TEVA lizenz", U"R.J.J.H. van Son", 20120208)
ENTRY (U"NKI TE-VOICE ANALYSIS tool version 1.0")
NORMAL (U"Netherlands Cancer Institute Anwendung f\\u\"r Tracheoesophageale Stimmanalyse")
NORMAL (U"F\\u\"r weitere Informationen, besuchen sie bitte unsere Webseiten: http://www.provoxweb.info/acoustic-analyses.html "
	 "und http://www.fon.hum.uva.nl/IFA-SpokenLanguageCorpora/NKIcorpora/NKI\\_ TEVA/")
NORMAL (U"Entwickeld mit Praat (http://www.praat.org)")
NORMAL (U"TEVA wird herausgegeben unter die GNU GPL Lizenz version 2 oder jeder sp\\a\"teren Version (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)")
CODE (U"NKI TE-VOICE ANALYSIS tool")
CODE (U"Erstellt und Urheberrechte \\co 2010-2012 von das NKI und R.J.J.H. van Son")
CODE (U"Praat Urheberrechte \\co 1992-2012 Paul Boersma und David Weenink")
NORMAL (U"Diese Anwendung wurde erm\\o\"glicht durch ein uneingeschr\\a\"nktes Forschungsstipendium von:")
NORMAL (U"##ATOS MEDICAL AB#: P.O. BOX 183 SE-242 22 H\\O\"RBY SWEDEN")
NORMAL (U"$$Dieses Programm ist freie Software. Sie k\\o\"nnen es unter den Bedingungen"
	 "der GNU General Public License, wie von der Free Software Foundation"
	 "ver\\o\"ffentlicht, weitergeben und/oder modifizieren, entweder gem\\a\"\\ss"
	 "Version 2 der Lizenz oder (nach Ihrer Option) jeder sp\\a\"teren Version.$")
NORMAL (U"$$Die Ver\\o\"ffentlichung dieses Programms erfolgt in der Hoffnung, da\\ss es"
	 "Ihnen von Nutzen sein wird, aber ##OHNE IRGENDEINE GARANTIE#, sogar ohne"
	 "die implizite Garantie der ##MARKTREIFE# oder der ##VERWENDBARKEIT F\\U\"R EINEN"
	 "BESTIMMTEN ZWECK#. Details finden Sie in der GNU General Public License.$")
NORMAL (U"$$Sie sollten ein Exemplar der GNU General Public License zusammen mit"
	 "diesem Programm erhalten haben. Falls nicht, siehe"
	 "<http://www.gnu.org/licenses/>.$")
MAN_END

MAN_BEGIN (U"VAS rating scales (EN)", U"R.J.J.H. van Son", 20120810)
INTRO (U"Visual Analogue rating Scales for IINFVo and GRBAS.")
NORMAL (U"##(I)INFV0# and ##GRBAS# are standards for rating voices used in Speech Therapy. TEVA will primarily be used to "
	 "study voicing in sustained vowels. In these circumstances, the standard %Impression, %Intelligibility, and %Fluency "
	 "scales of ##(I)INFVo# would be of little use. Therefore, the TEVA Rating screen also includes derived sets of the scales.")
ENTRY (U"Visual Analogue Scale (VAS) rating")
NORMAL (U"In VAS rating, the judges have to indicate the severety of some condition as a mark on a line. "
	 "Each parameter has to be scored on a Visual Analogue Scale (VAS) that takes the form of an undivided horizontal bar, "
	 "where a position has to be marked. The extreme right concurs with a very good score for this parameter. In (I)INFVo "
	 "%Impression rating this is a substitute voice %Most like a normal voice. The extreme left concurs with a very bad "
	 "score for this parameter, that is, %Least like a normal voice. The words %Least and %Most are printed at the end of "
	 "the bars. The other scales have equivalent words printed at the end of the bar. ")
NORMAL (U"When a parameter has not yet been marked, a vertical gray line will appear in the center of the scale. "
	 "When a parameter has been marked, a vertical red line will appear on that position.")
ENTRY (U"(I)INFVo scales")
LIST_ITEM (U"\\bu ##Impression# (Least to Most equal to normal speech)")
LIST_ITEM (U"The overall voice quality. This parameter is the combined impression caused by all the properties "
	 "of the voice such as pleasant/unpleasant to listen to, fluent or cut, good volume or not, intelligible or not, etc.")
LIST_ITEM (U"\\bu ##Intelligibility# (Poor to Good)")
LIST_ITEM (U"The impression of intelligibility. It is an answer to the question \"how much effort do you "
	 "think it would take to understand this person when he or she was trying to make a conversation with you?\" ")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
LIST_ITEM (U"\\bu ##Fluency# (Disfluent to Fluent)")
LIST_ITEM (U"The perceived smoothness of the sound production. Samples containing a lot of hesitations between "
	 "successive sounds and within continuant sounds (e.g., vowels and some consonants) score badly. ")
LIST_ITEM (U"\\bu ##Voice# (Unsteady to Steady)")
LIST_ITEM (U"Is voicing steady or does the pitch change uncontrollable.")
ENTRY (U"Vowel Scales (derived from (I)INFVo and GRBAS scales)")
LIST_ITEM (U"\\bu ##Voice Quality# (similarity to normal speech)")
LIST_ITEM (U"Is a judgment of the overall voice quality. Comparable to Grade from the GRBAS scale: Overall grade of "
	 "voice deviancy or pathology.")
LIST_ITEM (U"\\bu ##Phonation continuity# (proportion of vowel)")
LIST_ITEM (U"For vowels, this scale refers to the stability of phonation/voicing (i.e. proportion of vowel that is voiced). "
	 "In general speech, quality of voicing means that voicing is voiced or unvoiced where it is supposed to be voiced or "
	 "unvoiced. As such, voices that produce a lot of breathy noise and contain little or no voiced segments score badly. "
	 "Voices that produce a lot of hesitations (e.g., because of spasms) and cannot produce prolonged voiced segments score "
	 "in the middle of the VAS")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
ENTRY (U"GRBAS scales")
NORMAL (U"Standard GRBAS rating scales")
LIST_ITEM (U"\\bu ##Grade#")
LIST_ITEM (U"The degree of hoarseness, amount of noise in the produced sound")
LIST_ITEM (U"\\bu ##Roughness#")
LIST_ITEM (U"The grade of roughness, in relation to the irregular fluctuation of the fundamental frequency")
LIST_ITEM (U"\\bu ##Breathiness#")
LIST_ITEM (U"Grade of breathiness, the fraction of the non-modulated turbulence noise in the produced sound")
LIST_ITEM (U"\\bu ##Asthenia#")
LIST_ITEM (U"The overall weakness of voice ")
LIST_ITEM (U"\\bu ##Strain#")
LIST_ITEM (U"Strained quality, (tenseness of voice, overall muscular tension)")
ENTRY (U"Consensus ratings")
NORMAL (U"Sometimes it is necessary to combine ratings from two or more raters into a single consensus rating. This can be "
	 "achieved by combining the tables written for all the raters. Concatenate the numbers for each rater with %%;% (a semicolon-\";\" character) into a single "
	 "tab-delimited column. The ratings will be displayed with blue markers. Clicking in the customary way on the "
	 "VAScale will generate the single consensus rating in Red.")
ENTRY (U"References")
LIST_ITEM (U"M. B. J. Moerman, J. P. Martens, M. J. Van der Borgt, M. Peleman, M. Gillis, P. H. Dejonckere (2006)."
	 "'Perceptual evaluation of substitution voices: development and evaluation of the (I)INFVo rating scale', "
	 "%%Eur Arch Otorhinolaryngol%, 263: 183-87.")
MAN_END

MAN_BEGIN (U"VAS rating scales (EN)", U"R.J.J.H. van Son", 20120810)
INTRO (U"Visual Analogue rating Scales for IINFVo and GRBAS.")
NORMAL (U"##(I)INFV0# and ##GRBAS# are standards for rating voices used in Speech Therapy. TEVA will primarily be used to "
	 "study voicing in sustained vowels. In these circumstances, the standard %Impression, %Intelligibility, and %Fluency "
	 "scales of ##(I)INFVo# would be of little use. Therefore, the TEVA Rating screen also includes derived sets of the scales.")
ENTRY (U"Visual Analogue Scale (VAS) rating")
NORMAL (U"In VAS rating, the judges have to indicate the severety of some condition as a mark on a line. "
	 "Each parameter has to be scored on a Visual Analogue Scale (VAS) that takes the form of an undivided horizontal bar, "
	 "where a position has to be marked. The extreme right concurs with a very good score for this parameter. In (I)INFVo "
	 "%Impression rating this is a substitute voice %Most like a normal voice. The extreme left concurs with a very bad "
	 "score for this parameter, that is, %Least like a normal voice. The words %Least and %Most are printed at the end of "
	 "the bars. The other scales have equivalent words printed at the end of the bar. ")
NORMAL (U"When a parameter has not yet been marked, a vertical gray line will appear in the center of the scale. "
	 "When a parameter has been marked, a vertical red line will appear on that position.")
ENTRY (U"(I)INFVo scales")
LIST_ITEM (U"\\bu ##Impression# (Least to Most equal to normal speech)")
LIST_ITEM (U"The overall voice quality. This parameter is the combined impression caused by all the properties "
	 "of the voice such as pleasant/unpleasant to listen to, fluent or cut, good volume or not, intelligible or not, etc.")
LIST_ITEM (U"\\bu ##Intelligibility# (Poor to Good)")
LIST_ITEM (U"The impression of intelligibility. It is an answer to the question \"how much effort do you "
	 "think it would take to understand this person when he or she was trying to make a conversation with you?\" ")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
LIST_ITEM (U"\\bu ##Fluency# (Disfluent to Fluent)")
LIST_ITEM (U"The perceived smoothness of the sound production. Samples containing a lot of hesitations between "
	 "successive sounds and within continuant sounds (e.g., vowels and some consonants) score badly. ")
LIST_ITEM (U"\\bu ##Voice# (Unsteady to Steady)")
LIST_ITEM (U"Is voicing steady or does the pitch change uncontrollable.")
ENTRY (U"Vowel Scales (derived from (I)INFVo and GRBAS scales)")
LIST_ITEM (U"\\bu ##Voice Quality# (similarity to normal speech)")
LIST_ITEM (U"Is a judgment of the overall voice quality. Comparable to Grade from the GRBAS scale: Overall grade of "
	 "voice deviancy or pathology.")
LIST_ITEM (U"\\bu ##Phonation continuity# (proportion of vowel)")
LIST_ITEM (U"For vowels, this scale refers to the stability of phonation/voicing (i.e. proportion of vowel that is voiced). "
	 "In general speech, quality of voicing means that voicing is voiced or unvoiced where it is supposed to be voiced or "
	 "unvoiced. As such, voices that produce a lot of breathy noise and contain little or no voiced segments score badly. "
	 "Voices that produce a lot of hesitations (e.g., because of spasms) and cannot produce prolonged voiced segments score "
	 "in the middle of the VAS")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
ENTRY (U"GRBAS scales")
NORMAL (U"Standard GRBAS rating scales")
LIST_ITEM (U"\\bu ##Grade#")
LIST_ITEM (U"The degree of hoarseness, amount of noise in the produced sound")
LIST_ITEM (U"\\bu ##Roughness#")
LIST_ITEM (U"The grade of roughness, in relation to the irregular fluctuation of the fundamental frequency")
LIST_ITEM (U"\\bu ##Breathiness#")
LIST_ITEM (U"Grade of breathiness, the fraction of the non-modulated turbulence noise in the produced sound")
LIST_ITEM (U"\\bu ##Asthenia#")
LIST_ITEM (U"The overall weakness of voice ")
LIST_ITEM (U"\\bu ##Strain#")
LIST_ITEM (U"Strained quality, (tenseness of voice, overall muscular tension)")
ENTRY (U"Consensus ratings")
NORMAL (U"Sometimes it is necessary to combine ratings from two or more raters into a single consensus rating. This can be "
	 "achieved by combining the tables written for all the raters. Concatenate the numbers for each rater with %%;% (a semicolon-\";\" character) into a single "
	 "tab-delimited column. The ratings will be displayed with blue markers. Clicking in the customary way on the "
	 "VAScale will generate the single consensus rating in Red.")
ENTRY (U"References")
LIST_ITEM (U"M. B. J. Moerman, J. P. Martens, M. J. Van der Borgt, M. Peleman, M. Gillis, P. H. Dejonckere (2006)."
	 "'Perceptual evaluation of substitution voices: development and evaluation of the (I)INFVo rating scale', "
	 "%%Eur Arch Otorhinolaryngol%, 263: 183-87.")
MAN_END

MAN_BEGIN (U"VAS rating scales (EN)", U"R.J.J.H. van Son", 20120810)
INTRO (U"Visual Analogue rating Scales for IINFVo and GRBAS.")
NORMAL (U"##(I)INFV0# and ##GRBAS# are standards for rating voices used in Speech Therapy. TEVA will primarily be used to "
	 "study voicing in sustained vowels. In these circumstances, the standard %Impression, %Intelligibility, and %Fluency "
	 "scales of ##(I)INFVo# would be of little use. Therefore, the TEVA Rating screen also includes derived sets of the scales.")
ENTRY (U"Visual Analogue Scale (VAS) rating")
NORMAL (U"In VAS rating, the judges have to indicate the severety of some condition as a mark on a line. "
	 "Each parameter has to be scored on a Visual Analogue Scale (VAS) that takes the form of an undivided horizontal bar, "
	 "where a position has to be marked. The extreme right concurs with a very good score for this parameter. In (I)INFVo "
	 "%Impression rating this is a substitute voice %Most like a normal voice. The extreme left concurs with a very bad "
	 "score for this parameter, that is, %Least like a normal voice. The words %Least and %Most are printed at the end of "
	 "the bars. The other scales have equivalent words printed at the end of the bar. ")
NORMAL (U"When a parameter has not yet been marked, a vertical gray line will appear in the center of the scale. "
	 "When a parameter has been marked, a vertical red line will appear on that position.")
ENTRY (U"(I)INFVo scales")
LIST_ITEM (U"\\bu ##Impression# (Least to Most equal to normal speech)")
LIST_ITEM (U"The overall voice quality. This parameter is the combined impression caused by all the properties "
	 "of the voice such as pleasant/unpleasant to listen to, fluent or cut, good volume or not, intelligible or not, etc.")
LIST_ITEM (U"\\bu ##Intelligibility# (Poor to Good)")
LIST_ITEM (U"The impression of intelligibility. It is an answer to the question \"how much effort do you "
	 "think it would take to understand this person when he or she was trying to make a conversation with you?\" ")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
LIST_ITEM (U"\\bu ##Fluency# (Disfluent to Fluent)")
LIST_ITEM (U"The perceived smoothness of the sound production. Samples containing a lot of hesitations between "
	 "successive sounds and within continuant sounds (e.g., vowels and some consonants) score badly. ")
LIST_ITEM (U"\\bu ##Voice# (Unsteady to Steady)")
LIST_ITEM (U"Is voicing steady or does the pitch change uncontrollable.")
ENTRY (U"Vowel Scales (derived from (I)INFVo and GRBAS scales)")
LIST_ITEM (U"\\bu ##Voice Quality# (similarity to normal speech)")
LIST_ITEM (U"Is a judgment of the overall voice quality. Comparable to Grade from the GRBAS scale: Overall grade of "
	 "voice deviancy or pathology.")
LIST_ITEM (U"\\bu ##Phonation continuity# (proportion of vowel)")
LIST_ITEM (U"For vowels, this scale refers to the stability of phonation/voicing (i.e. proportion of vowel that is voiced). "
	 "In general speech, quality of voicing means that voicing is voiced or unvoiced where it is supposed to be voiced or "
	 "unvoiced. As such, voices that produce a lot of breathy noise and contain little or no voiced segments score badly. "
	 "Voices that produce a lot of hesitations (e.g., because of spasms) and cannot produce prolonged voiced segments score "
	 "in the middle of the VAS")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
ENTRY (U"GRBAS scales")
NORMAL (U"Standard GRBAS rating scales")
LIST_ITEM (U"\\bu ##Grade#")
LIST_ITEM (U"The degree of hoarseness, amount of noise in the produced sound")
LIST_ITEM (U"\\bu ##Roughness#")
LIST_ITEM (U"The grade of roughness, in relation to the irregular fluctuation of the fundamental frequency")
LIST_ITEM (U"\\bu ##Breathiness#")
LIST_ITEM (U"Grade of breathiness, the fraction of the non-modulated turbulence noise in the produced sound")
LIST_ITEM (U"\\bu ##Asthenia#")
LIST_ITEM (U"The overall weakness of voice ")
LIST_ITEM (U"\\bu ##Strain#")
LIST_ITEM (U"Strained quality, (tenseness of voice, overall muscular tension)")
ENTRY (U"Consensus ratings")
NORMAL (U"Sometimes it is necessary to combine ratings from two or more raters into a single consensus rating. This can be "
	 "achieved by combining the tables written for all the raters. Concatenate the numbers for each rater with %%;% (a semicolon-\";\" character) into a single "
	 "tab-delimited column. The ratings will be displayed with blue markers. Clicking in the customary way on the "
	 "VAScale will generate the single consensus rating in Red.")
ENTRY (U"References")
LIST_ITEM (U"M. B. J. Moerman, J. P. Martens, M. J. Van der Borgt, M. Peleman, M. Gillis, P. H. Dejonckere (2006)."
	 "'Perceptual evaluation of substitution voices: development and evaluation of the (I)INFVo rating scale', "
	 "%%Eur Arch Otorhinolaryngol%, 263: 183-87.")
MAN_END

MAN_BEGIN (U"VAS rating scales (EN)", U"R.J.J.H. van Son", 20120810)
INTRO (U"Visual Analogue rating Scales for IINFVo and GRBAS.")
NORMAL (U"##(I)INFV0# and ##GRBAS# are standards for rating voices used in Speech Therapy. TEVA will primarily be used to "
	 "study voicing in sustained vowels. In these circumstances, the standard %Impression, %Intelligibility, and %Fluency "
	 "scales of ##(I)INFVo# would be of little use. Therefore, the TEVA Rating screen also includes derived sets of the scales.")
ENTRY (U"Visual Analogue Scale (VAS) rating")
NORMAL (U"In VAS rating, the judges have to indicate the severety of some condition as a mark on a line. "
	 "Each parameter has to be scored on a Visual Analogue Scale (VAS) that takes the form of an undivided horizontal bar, "
	 "where a position has to be marked. The extreme right concurs with a very good score for this parameter. In (I)INFVo "
	 "%Impression rating this is a substitute voice %Most like a normal voice. The extreme left concurs with a very bad "
	 "score for this parameter, that is, %Least like a normal voice. The words %Least and %Most are printed at the end of "
	 "the bars. The other scales have equivalent words printed at the end of the bar. ")
NORMAL (U"When a parameter has not yet been marked, a vertical gray line will appear in the center of the scale. "
	 "When a parameter has been marked, a vertical red line will appear on that position.")
ENTRY (U"(I)INFVo scales")
LIST_ITEM (U"\\bu ##Impression# (Least to Most equal to normal speech)")
LIST_ITEM (U"The overall voice quality. This parameter is the combined impression caused by all the properties "
	 "of the voice such as pleasant/unpleasant to listen to, fluent or cut, good volume or not, intelligible or not, etc.")
LIST_ITEM (U"\\bu ##Intelligibility# (Poor to Good)")
LIST_ITEM (U"The impression of intelligibility. It is an answer to the question \"how much effort do you "
	 "think it would take to understand this person when he or she was trying to make a conversation with you?\" ")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
LIST_ITEM (U"\\bu ##Fluency# (Disfluent to Fluent)")
LIST_ITEM (U"The perceived smoothness of the sound production. Samples containing a lot of hesitations between "
	 "successive sounds and within continuant sounds (e.g., vowels and some consonants) score badly. ")
LIST_ITEM (U"\\bu ##Voice# (Unsteady to Steady)")
LIST_ITEM (U"Is voicing steady or does the pitch change uncontrollable.")
ENTRY (U"Vowel Scales (derived from (I)INFVo and GRBAS scales)")
LIST_ITEM (U"\\bu ##Voice Quality# (similarity to normal speech)")
LIST_ITEM (U"Is a judgment of the overall voice quality. Comparable to Grade from the GRBAS scale: Overall grade of "
	 "voice deviancy or pathology.")
LIST_ITEM (U"\\bu ##Phonation continuity# (proportion of vowel)")
LIST_ITEM (U"For vowels, this scale refers to the stability of phonation/voicing (i.e. proportion of vowel that is voiced). "
	 "In general speech, quality of voicing means that voicing is voiced or unvoiced where it is supposed to be voiced or "
	 "unvoiced. As such, voices that produce a lot of breathy noise and contain little or no voiced segments score badly. "
	 "Voices that produce a lot of hesitations (e.g., because of spasms) and cannot produce prolonged voiced segments score "
	 "in the middle of the VAS")
LIST_ITEM (U"\\bu ##Noise# (Noise to No noise)")
LIST_ITEM (U"Unintended additive noise reflects the amount of annoyance caused by the audibility of all "
	 "sorts of uncontrolled noises, such as bubbly noise, breathy noise, clicks, etc., produced during speech.")
ENTRY (U"GRBAS scales")
NORMAL (U"Standard GRBAS rating scales")
LIST_ITEM (U"\\bu ##Grade#")
LIST_ITEM (U"The degree of hoarseness, amount of noise in the produced sound")
LIST_ITEM (U"\\bu ##Roughness#")
LIST_ITEM (U"The grade of roughness, in relation to the irregular fluctuation of the fundamental frequency")
LIST_ITEM (U"\\bu ##Breathiness#")
LIST_ITEM (U"Grade of breathiness, the fraction of the non-modulated turbulence noise in the produced sound")
LIST_ITEM (U"\\bu ##Asthenia#")
LIST_ITEM (U"The overall weakness of voice ")
LIST_ITEM (U"\\bu ##Strain#")
LIST_ITEM (U"Strained quality, (tenseness of voice, overall muscular tension)")
ENTRY (U"Consensus ratings")
NORMAL (U"Sometimes it is necessary to combine ratings from two or more raters into a single consensus rating. This can be "
	 "achieved by combining the tables written for all the raters. Concatenate the numbers for each rater with %%;% (a semicolon-\";\" character) into a single "
	 "tab-delimited column. The ratings will be displayed with blue markers. Clicking in the customary way on the "
	 "VAScale will generate the single consensus rating in Red.")
ENTRY (U"References")
LIST_ITEM (U"M. B. J. Moerman, J. P. Martens, M. J. Van der Borgt, M. Peleman, M. Gillis, P. H. Dejonckere (2006)."
	 "'Perceptual evaluation of substitution voices: development and evaluation of the (I)INFVo rating scale', "
	 "%%Eur Arch Otorhinolaryngol%, 263: 183-87.")
MAN_END

MAN_BEGIN (U"VoicePrints", U"R.J.J.H. van Son", 20140211)
INTRO (U"#Introduction")
NORMAL (U"The development of voice characteristics and voice quality after laryngectomy is important for the quality of speech and, ultimately, for the quality of life (QoL) of the patient. Clinical practice and subsequent therapies will benefit when such developments are documented over the course of treatments and even beyond. This documentation should consist of professional and perceptual (subjective) evaluations of the voice and the results of acoustic analysis.")
NORMAL (U"Based on research of Van As, Clapham, and others, a set of acoustic measures have emerged that are useful to describe the voice of tracheolaryngeal (TE) speakers. These have been incorporated in the Voice Print of @@NKI TE-VOICE ANALYSIS tool (EN)|TEVA@ which gives a single-page view of the most important acoustic and perceptual measures of the TE voice. Voice prints are useful to document the acoustic characteristics of the TE voice. ")
NORMAL (U"Traditionally, voice evaluations are done on sustained vowels and articulated speech, e.g., words, sentences, and read stories. For TE speech, the basic evaluations can be done on sustained vowels, most importantly, sustained /a/. ")
ENTRY (U"Perceptual evaluation of voice")
NORMAL (U"Several perceptual dimensions are traditionally distinguished to evaluate voice and speech quality. These voice and speech evaluations are implemented in @@NKI TE-VOICE ANALYSIS tool (EN)|TEVA@ as Visual Analogue Scales (VAS) on the @@VAS rating scales (EN)|Rating@ page. For TE speech, three scales can express the most important qualities of the /a/ (under the %%Vowels% Rating): ")
LIST_ITEM (U"\\bu ##Quality#: The overall similarity to normal voice quality")
LIST_ITEM (U"\\bu ##Continuity#: The continuity of phonation/voicing, i.e. proportion of vowel that is voiced in \\% ")
LIST_ITEM (U"\\bu ##Noise#: The amount of audible noise during speech ")
NORMAL (U"The VoicePrint will print out the Voice Quality rating (VQ). ")
ENTRY (U"Visual evaluation of voice")
NORMAL (U"Van As-Brooks has developed a four grade @@Acoustic Signal Typing@ of voice that is based on visual "
	 "inspection of the @@Spectrogram@. The @@Acoustic Signal Typing|AST@ categories can be entered using the number "
	 "keys 1-4, the key 0 removes the @@Acoustic Signal Typing|AST@ category. @@Acoustic Signal Typing|AST@ categories are "
	 "displayed as Roman numerals on the @@Overview of Main page|main@ page.")
ENTRY (U"Acoustic measures of voice")
ENTRY (U"Information displayed on a voice print")
LIST_ITEM (U"\\bu #Title: Title or ID of the print, date and time of the voice print, Acoustic Signal type, and Voice Quality")
LIST_ITEM (U"\\bu #Waveform: The overall waveform of the selected window")
LIST_ITEM (U"\\bu ##Waveform 0.1s#: Display of 0.1s in the center of the window")
LIST_ITEM (U"\\bu #Spectrogram: Power spectrogram")
LIST_ITEM (U"\\bu #Pitch: Pitch contour")
LIST_ITEM (U"\\bu #Ltas: Long time average spectrum")
NORMAL (U"#References")
LIST_ITEM (U"\\bu Van As, C.J. (##2001#), %%Tracheoesophageal Speech. A Multidimensional Assessment of Voice Quality%, "
	 "Ph.D.-thesis, University of Amsterdam, 209 pag.")
LIST_ITEM (U"\\bu van As-Brooks, C.J., Koopmans-van Beinum, F.J., Pols, L.C.W., and Hilgers, F.J.M. (##2006#), "
	 "%%Acoustic Signal Typing for Evaluation of Voice Quality in Tracheoesophageal Speech% "
	 "Journal of Voice, Volume ##20# (3), p355-368.")
LIST_ITEM (U"\\bu Van As, C.J. (##2008#), %%Acoustic analyses of postlaryngectomy voice and their perceptual relevance% "
	 "Invitational Round Table \"Evidence-based Voice and Speech Rehabilitation in Head and Neck Cancer\", p8-14 "
	 "[http://dare.uva.nl/document/130984]")
MAN_END

MAN_BEGIN (U"What's new?", U"R.J.J.H. van Son", 20120215)
INTRO (U"Latest changes in TEVA.")
NORMAL (U"##21 September 2014#")
LIST_ITEM (U"\\bu Added a recording option that allows prompts to appear on the screen with automatic save.")
LIST_ITEM (U"\\bu Japanese translation.")
LIST_ITEM (U"\\bu Changed the print command to generate a PNG and PDF pages with all graphics.")
LIST_ITEM (U"\\bu VAS now include GRBAS and full IINFVo.")
LIST_ITEM (U"\\bu Support for several pitch detecting settings (high/low and compatible).")
LIST_ITEM (U"\\bu .")
NORMAL (U"##24 September 2013#")
LIST_ITEM (U"\\bu Added a backward option to Serial.")
NORMAL (U"##17 January 2013#")
LIST_ITEM (U"\\bu Added support for consensus scoring in Visual Analogue Scales (VAS).")
NORMAL (U"##06 December 2012#")
LIST_ITEM (U"\\bu Added a second evaluation display with Visual Analogue Scales (VAS).")
LIST_ITEM (U"\\bu Reworked displays with Visual Analogue Scales (VAS).")
LIST_ITEM (U"\\bu Added support for automatic AST determination based on learned models")
LIST_ITEM (U"\\bu Added a local analysis cache for repeated analysis runs")
NORMAL (U"##26 October 2012#")
LIST_ITEM (U"\\bu Added an evaluation display with Visual Analogue Scales (VAS).")
NORMAL (U"##17 July 2012#")
LIST_ITEM (U"\\bu Better usage for blind AST evaluation experiments. Among others, shuffle of speaker data, "
	 "merging of AST lists, and mute of sound.")
NORMAL (U"##17 February 2012#")
LIST_ITEM (U"\\bu Voiced parts of the signal are indicated by a blue-gray line below the time axis")
LIST_ITEM (U"\\bu A %Serial mode to step through a all items in a Speaker Data list")
NORMAL (U"##15 February 2012#")
LIST_ITEM (U"\\bu Start of %%What's new?%")
MAN_END

