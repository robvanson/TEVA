#!/bin/bash
#
# Convert HTML pages as created by Praat -> Manual -> Save manual to HTML directory...
# And correct links to Praat manual
#
UNAME=$(uname -s)
if [[ ${UNAME} == "Darwin" ]]; then
	SEDCMD='sed -i ""'
else
	SEDCMD="sed --in-place"
fi
# Use in-place editing by Perl
perl -n -i'' ConvertHTMLpages.pl ${@:-*.html}

# Keep the original picture files and replace those generated by Praat
sed -i ""  's/Adding_speaker_information_1.png/Main_page_screenshot.png/g' Adding_speaker_information.html
rm -f Adding_speaker_information_1.png
sed -i ""  's/Adding_speaker_information_2.png/Speaker_screenshot.png/g' Adding_speaker_information.html
rm -f Adding_speaker_information_2.png
sed -i ""  's/Adding_speaker_information_3.png/SpeakerInfo_screenshot.png/g' Adding_speaker_information.html
rm -f Adding_speaker_information_3.png
sed -i ""  's/VoicePrints_1.png/signaltype3_example.png/g' VoicePrints.html
rm -f VoicePrints_1.png
sed -i ""  's/Example_evaluating_AST_1.png/Speaker_screenshot.png/g' Example_evaluating_AST.html
rm -f Example_evaluating_AST_1.png
sed -i ""  's/Example_evaluating_AST_2.png/SpeakerInfo_screenshot.png/g' Example_evaluating_AST.html
rm -f Example_evaluating_AST_2.png
sed -i ""  's/Example_evaluating_a_Corpus_1.png/Main_page_serial_screenshot.png/g' Example_evaluating_a_Corpus.html
rm -f Example_evaluating_a_Corpus_1.png
sed -i ""  's/Example_evaluating_a_Corpus_2.png/Main_page_serial_detail_Nxt.png/g' Example_evaluating_a_Corpus.html
rm -f Example_evaluating_a_Corpus_2.png
sed -i ""  's/Example_evaluating_a_Corpus_3.png/Configure_page_serial_detail.png/g' Example_evaluating_a_Corpus.html
rm -f Example_evaluating_a_Corpus_3.png
sed -i ""  's/Perceptual_rating_of_a_vowel_1.png/VAS_display.png/g' Perceptual_rating_of_a_vowel.html
rm -f Perceptual_rating_of_a_vowel_1.png
sed -i ""  's/Prompted_speech_recordings_1.png/Recording_tasks_window.png/g' Prompted_speech_recordings.html
rm -f Prompted_speech_recordings_1.png
sed -i ""  's/Prompted_speech_recordings_2.png/RecordingID_Window.png/g' Prompted_speech_recordings.html
rm -f Prompted_speech_recordings_2.png
sed -i ""  's/Prompted_speech_recordings_3.png/RecordingTask_Single.png/g' Prompted_speech_recordings.html
rm -f Prompted_speech_recordings_3.png

perl -i'' -ne 'if(m!(<a href\=\"NKI_TE-VOICE_ANALYSIS_tool__EN__1.png\" target\=\"_blank\"><img height=\d+ width=\d+ src=NKI_TE-VOICE_ANALYSIS_tool__EN__1.png></a>)!){$a = $1;$b = $a;$a=~s/NKI_TE-VOICE_ANALYSIS_tool__EN__1.png/Main_page_screenshot.png/g;$b=~s/NKI_TE-VOICE_ANALYSIS_tool__EN__1.png/Configure_page_screenshot.png/g;s!(<a href="NKI_TE-VOICE_ANALYSIS_tool__EN__1.png" target="_blank"><img height=250 width=450 src=NKI_TE-VOICE_ANALYSIS_tool__EN__1.png></a>)!$a$b!g;};print $_' NKI_TE-VOICE_ANALYSIS_tool__EN_.html
rm -f NKI_TE-VOICE_ANALYSIS_tool__EN__1.png
perl -i'' -ne 's! height\=\d+ ! !ig; s! width\=\d+ ! width=45% !ig; print $_' NKI_TE-VOICE_ANALYSIS_tool__EN_.html

sed -i ""  's/Opening_an_existing_recording_1.png/Main_page_screenshot.png/g' Opening_an_existing_recording.html
rm -f Opening_an_existing_recording_1.png
sed -i ""  's/Recording_tasks_1.png/Recording_tasks_window.png/g' Recording_tasks.html
rm -f Recording_tasks_1.png
sed -i ""  's/Overview_of_Configuration_page_1.png/Configure_page_screenshot.png/g' Overview_of_Configuration_page.html
rm -f Overview_of_Configuration_page_1.png
sed -i ""  's/Overview_of_Main_page_1.png/Main_page_screenshot.png/g' Overview_of_Main_page.html
rm -f Overview_of_Main_page_1.png
sed -i ""  's/Recording_your_own_voice_1.png/Main_page_screenshot.png/g' Recording_your_own_voice.html
rm -f Recording_your_own_voice_1.png
sed -i ""  's/Saving_a_report_1.png/Main_page_screenshot.png/g' Saving_a_report.html
rm -f Saving_a_report_1.png
sed -i ""  's/Saving_a_report_2.png/Save_screenshotTop.png/g' Saving_a_report.html
rm -f Saving_a_report_2.png
sed -i ""  's/VAS_rating_scales__EN__1.png/VAS_display.png/g' VAS_rating_scales__EN_.html
rm -f VAS_rating_scales__EN__1.png
perl -i'' -ne 's!((<a href=\")(Save_screenshotTop.png)(\"[^>]*><img [^>]+)(Save_screenshotTop.png)([^>]*></a>))!\1&nbsp;\2Save_screenshotBottom.png\4Save_screenshotBottom.png\6!g; print $_' Saving_a_report.html
perl -i'' -ne 's! height\=\d+ ! !ig; s! width\=\d+ ! width=45% !ig; print $_' Saving_a_report.html

sed -i ""  's/Selecting_stable_sounds_1.png/Main_page_screenshot.png/g' Selecting_stable_sounds.html
rm -f Selecting_stable_sounds_1.png

# Patch HTML files
#for file in $(ls -1 ${@:-*.html}); do
	
	
#done
