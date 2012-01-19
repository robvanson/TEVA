#!/usr/bin/perl
#
# Expand include files in praat script.
# Writes the expanded script to STDOUT.
# Concatenates all arguments.
#
# Use:
# perl expandPraatScripts.pl <file1> ...

add_build_SHA();

foreach my $input (@ARGV)
{
	expand($input);
};

sub expand # (filename)
{	
	my $filename = shift;
	my $directory = `dirname $filename`;
	chomp($directory);
	open(FILE, "<$filename") || die "$!: $filename\n";
	my @CurrentScript = <FILE>;
	close(FILE);
	foreach my $line (@CurrentScript) {
		if($line =~ /^([^\#]*)include\s+(\S+)/){
			my ($previous, $match, $following) = ($1, $2, $');
			print "$previous\n" if $previous =~ /\S/;
			# Insert included file
			expand("$directory/$match");
			print "$following" if  $following =~ /\S/;
		}
		else
		{
			print $line;
		};
	};
};

# Add git SHA1 commit
sub add_build_SHA
{
	if(-d "../.git"){
		open(HEAD, "<../.git/HEAD"); 
		my $headRef = <HEAD>;
		close(HEAD);
		if($headRef =~ /^\s*ref\:\s+/){
			$refPtr = $';
			chomp($refPtr);
			open(HEAD, "<../.git/$refPtr");
			$headSHA = <HEAD>;
			$headSHA =~ s/s//g;
			$headSHA = uc(substr($headSHA, 0, 10));
		}
		else {
			$headSHA = $headRef;
		};

		($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = gmtime();
		$year = ${year}+1900;
		${mon} = sprintf("%02d",${mon}+1);
		${mday} = sprintf("%02d",${mday});
		${hour} = sprintf("%02d",${hour});
		${min} = sprintf("%02d",${min});
		${sec} = sprintf("%02d",${sec});
		$UTCstring = "${year}-${mon}-${mday}T${hour}:${min}:${sec}Z";
		print "\nbuild_SHA\$ = \"$headSHA $UTCstring\"\n";
	}
};
