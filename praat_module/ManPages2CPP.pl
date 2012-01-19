#!/usr/bin/perl
# 
# Convert Praat ManPages files to the equivalent CPP code.
# If no target file is given, uses STDOUT
# 
# Use:
# perl ManPages2CPP.pl <source-file> [target-file]
#
my $TargetFile = "-";
open(FILEOUT, ">$TargetFile") || die "$TargetFile: $!\n";

my @currentTime = localtime(time);
my $currentYear = $currentTime[5] + 1900;
# Print file header
my $Header <<= "
/* manual_Exp.c
 *
 * Copyright (C) ${currentYear} R.J.J.H. van Son
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

#include \"ManPagesM.h\"

void manual_TEanalysis_init (ManPages me);
void manual_TEanalsyis_init (ManPages me) {

";

#print FILEOUT $Header;

# Process all files
while (my $SourceFile = shift(@ARGV))
{
	open(FILEIN, "<$SourceFile") || die "$SourceFile: $!\n";
	
	my $line = <FILEIN>;
	chomp($line);
	if($line ne "ManPagesTextFile")
	{
		die "$SourceFile is not a valid Praat ManPage\n";
	};
	$line = <FILEIN>;
	chomp($line);
	my ($Title, $Author, $Date, $Time);
	if($line =~ /^\"([^\"]+)\" \"([^\"]*)\"\s+(\d{8,8})\s+(\d+)\s*$/)
	{
		$Title = $1;
		$Author = $2;
		$Date = $3;
		$Time = $4;
	}
	else
	{
		die "$SourceFile is not a valid Praat ManPage\n";
	};

	# Create output text
	my $ManPageText = "";
	while(<FILEIN>)
	{
		# Skip empty lines
		next unless /\S/;
		chomp;
		my $Macro = "\t";
		my $Text = "";
		my ($Startmarker, $Endmarker) = ("\"", "\"");
		if(/^\s*\<([^\>]+)\>\s+(\".*)$/)
		{
			$Macro = uc($1);
			$Text = $2;
		}
		else
		{
			$Text = $_;
		};
		
		$Text =~ s/\\/\\\\/g;
		# Insert links to standard Praat pages
		$Text =~ s/\#\#\[/\@\@/g;
		$Text =~ s/\]\#/\@/g;
		# Handle start quotes
		if($Text =~ /^\s*\"[^\"]/)
		{
			$Startmarker = "(L\"";
			$Text =~ s/^\s*\"//g;
		};
		# Handle end quotes	
		if($Text =~ /[^\"]\"\s*$/)
		{
			$Endmarker = "\")";
			$Text =~ s/\"\s*$//g;
		};
		# Handle Praat double quotes
		$Text =~ s/\"\"/\\"/g;

		$ManPageText .= "$Macro $Startmarker$Text$Endmarker\n";
	};

	print FILEOUT "MAN_BEGIN (L\"$Title\", L\"$Author\", $Date)\n";
	print FILEOUT $ManPageText;
	print FILEOUT "MAN_END\n\n";
	
};
# Tail
# print FILEOUT "}\n";
# Clean up
close(FILEOUT);
