#!/usr/bin/perl
#
open(PRINTORDER, "<html_print_order.txt")||die "html_print_order.txt: $!\n";

my $HeaderPrinted = 0;
@Order = <PRINTORDER>;
foreach $file (@Order)
{
	chomp($file);
	open(FILE, "<$file") || die "$file: $!\n";
	@CurrentFile = <FILE>;
	
	my $skipHeader = 1;
	while($skipHeader)
	{
		$skipHeader = 0 if $CurrentFile[0] =~ m!\<body!;
		print $CurrentFile[0] unless $HeaderPrinted;
		shift(@CurrentFile);
	};
	# Insert a page break in printing
	if($HeaderPrinted)
	{
		$anchorName = $file;
		$anchorName =~ s/\.html//g;
		print <<"ENDOFCHAPTERHEADER";
	<p style="page-break-before:always;">
	<a name="$anchorName">&nbsp;</a>
	</p>
ENDOFCHAPTERHEADER
	};
	++$HeaderPrinted;
	
	
	while($CurrentFile[0] !~ m!\</body!)
	{
		$currentLine = shift(@CurrentFile);
		$currentLine =~ s!href\=\"([\w\-]+)\.html\"!href="#\1"!ig;
		print $currentLine;
	};
	
	close(FILE);	
};

print <<"ENDOFFOOTER";
</body>
</html>
ENDOFFOOTER
