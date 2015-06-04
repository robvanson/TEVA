#!/usr/bin/perl
#
# Convert an expanded praat script into a single string
# Output a stand alone Praat main program
#
# Use:
# perl praatscript2cprogram.pl script.praat > script.h
# 
print <<'ENDOFHEADER';
/* C const char string with Praat script
 * Generated automatically
 * For license, see Praat script text
 *
 */

static char32_t myDemoScript [] = U""
ENDOFHEADER
while(<>){
	# Protect special characters
	s/\\/\\\\/g;
	s/\n/\\n/g;
	s/\"/\\"/g;
	print "\"$_\"\n";
};
print <<'ENDOFFOOTER';
;

ENDOFFOOTER
