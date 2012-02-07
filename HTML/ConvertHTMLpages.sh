#!/bin/bash
#
# Convert HTML pages as created by Praat -> Manual -> Save manual to HTML directory...
# And correct links to Praat manual
#
# Use in-place editing by Perl
perl -n -i'' ConvertHTMLpages.pl ${@:-*.html}

# Patch HTML files
for file in $(ls -1 ${@:-*.html}); do
	
	if [[ "${file}" == "Overview_of_Main_page.html" ]]; then
		perl -i'' -ne 's!(\Q</b></font></table></table>\E)\s*$!\1<p align=center>\n<a href="Main_page_screenshot.png" target="_blank"><img width="50%" src="Main_page_screenshot.png" VSPACE=10></a>\n</p>\n!g;print $_' \
			${file}
	fi

	if [[ "${file}" == "Overview_of_Configuration_page.html" ]]; then
		perl -i'' -ne 's!(\Q</b></font></table></table>\E)\s*$!\1<p align=center>\n<a href="Configure_page_screenshot.png" target="_blank"><img width="50%" src="Configure_page_screenshot.png" VSPACE=10></a>\n</p>\n!g;print $_' \
			${file}
	fi
	
	if [[ "NKI_TE-VOICE_ANALYSIS_tool.html Recording_your_own_voice.html Opening_an_existing_recording.html Adding_speaker_information.html Selecting_stable_sounds.html Saving_a_report.html " =~ ${file} ]]; then
		perl -i'' -ne 's!(\Q</b></font></table></table>\E)\s*$!\1<p align=center>\n<a href="Main_page_screenshot.png" target="_blank"><img width="33%" src="Main_page_screenshot.png" VSPACE=10></a>\n</p>\n!g;print $_' \
			${file}
	fi
	
	if [[ "${file}" == "NKI_TE-VOICE_ANALYSIS_tool.html" ]]; then
		perl -i'' -ne 's!(\Q<img width="33%" src="Main_page_screenshot.png" VSPACE=10></a>\E)\s*$!\1&nbsp;<a href="Configure_page_screenshot.png" target="_blank"><img width="39%" src="Configure_page_screenshot.png" VSPACE=10></a>\n!g;print $_' \
			${file}
	fi
	if [[ "${file}" == "Saving_a_report.html" ]]; then
		perl -i'' -ne 's!^(\Q<h3>Links to this page</h3>\E)\s*$!<p align=center>\n<a href="Save_screenshotTop.png" target="_blank"><img width="25%" src="Save_screenshotTop.png"></a>\n<a href="Save_screenshotBottom.png" target="_blank"><img width="25%" src="Save_screenshotBottom.png"></a>\n</p>\1!g;print $_' \
			${file}
	fi
	
	if [[ "${file}" == "Adding_speaker_information.html" ]]; then
		perl -i'' -ne 's!^(\QAdding information about a recording\E)</h3>\s*$!\1 <p align=center>\n<a href="Speaker_screenshot.png" target="_blank"><img width="25%" src="Speaker_screenshot.png" VSPACE=10></a>\n</h3></p>\n!g;print $_' \
			${file}
		perl -i'' -ne 's!^(\QFormat of the speaker info table\E)</h3>\s*$!\1 <p align=center>\n<a href="SpeakerInfo_screenshot.png" target="_blank"><img width="25%" src="SpeakerInfo_screenshot.png" VSPACE=10></a>\n</h3></p>\n!g;print $_' \
			${file}
	fi
	if [[ "${file}" == "Example_evaluating_AST.html" ]]; then
		perl -i'' -ne 's!(\QYou must now select the recording you want to use.</p>\E)\s*$!\1 <p align=center>\n<a href="Speaker_screenshot.png" target="_blank"><img width="25%" src="Speaker_screenshot.png" VSPACE=10></a>\n</h3></p>\n!g;print $_' \
			${file}
		perl -i'' -ne 's!(\QClose the Info window.\E)</p>\s*$!\1</p> <p align=center>\n<a href="SpeakerInfo_screenshot.png" target="_blank"><img width="50%" src="SpeakerInfo_screenshot.png" VSPACE=10></a>\n</p>\n!g;print $_' \
			${file}
	fi
done
