#!/usr/bin/perl
#
# Convert HTML pages as created by Praat -> Manual -> Save manual to HTML directory...
# And correct links to Praat manual
#
# Use in-place editing by Perl
#
# use:
# perl -n -i'' ConvertHTMLpages.pl *
#
# Mark all links and convert to href anchors
s!\<b\>\[([^\]]*)\]\</b\>!<a href=[[["$1"]]]>$1</a>!g;
# Cut out URL from Text
s!\[\[\[\"([^\|\"]+)\|[^\"]+\"\]\]\]![[["$1"]]]!g;
# Cut out link text from URL
s!\>[^\|\<]+\|([^\<]+)\</a>!>$1</a>!g;
# Convert all punctuation characters to _
my $punt = "\s\Q.:,()[]\E";
while(m!\[\[\[\"([^\s\.\:\,\(\)\[\]\"]+)[\s\.\:\,\(\)\[\]]!)
{
	s!\[\[\[\"([^\s\.\:\,\(\)\[\]\"]+)[\s\.\:\,\(\)\[\]]!\[\[\["${1}_!g;
};
# Insert URL
s!\[\[\[\"!"http://www.fon.hum.uva.nl/praat/manual/!g;
s!\"\]\]\]!.html" target="_blank"!ig;

# Ready, output line
print $_;
