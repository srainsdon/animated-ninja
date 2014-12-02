#!/usr/bin/perl -w

use strict;
use Cwd;
	
    my $dir = getcwd;

    opendir(DIR, $dir) or die $!;

    while (my $file = readdir(DIR)) {

        # We only want files
        next unless (-f "$dir/$file");

        # Use a regular expression to find files ending in .txt
        next unless ($file =~ m/\.xls$/ || $file =~ m/\.XLS$/);
		
		print "perl ProssesExcel.pl $file\n";
    }
	
    closedir(DIR);
    exit 0;