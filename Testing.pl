#!/usr/bin/perl -w
use SdxReporting::DataSet;
use Data::Dumper;

my $File1 = SdxReporting::DataSet::Flex->new( 
	name => '2014-11-18-Flex.xlsx' );
my $File2 = SdxReporting::DataSet::Flex->new( 
	name => '2014-11-17-Flex.xlsx' );
my $File3 = SdxReporting::DataSet::Flex->new( 
	name => '2014-11-16-Flex.xlsx' );
print Dumper($File1);

my $data = SdxReporting::DataSet->new(
	Files => [$File1, $File2, $File3]);

join( " ", map { $_->name } $data->Files ), 