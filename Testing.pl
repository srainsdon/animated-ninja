#!/usr/bin/perl -w
use DataSet;
use Data::Dumper;

my $File1 = File::Flex->new( 
	name => '2014-11-18-Flex.xlsx' );
my $File2 = File::Flex->new( 
	name => '2014-11-17-Flex.xlsx' );
my $File3 = File::Flex->new( 
	name => '2014-11-16-Flex.xlsx' );
print Dumper($File1);
print Dumper($File2);
print Dumper($File3);
my $data = DataSet->new(
	files => [$File1, $File2, $File3]
	);
print Dumper($data);
#print $data->files;