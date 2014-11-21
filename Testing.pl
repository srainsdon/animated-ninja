#!/usr/bin/perl -w
use SdxReporting::DataSet;
use SdxReporting::File;
use Data::Dumper;
use SdxReporting::Config;
use Config::Simple;
my $obj = SdxReporting::Config->new;
#$obj->reFresh();
my @ids = $obj->ids_in_mapping;
foreach my $Setting (@ids) { 
    print "$Setting <=> " , $obj->get_mapping($Setting) , "\n";
} 



#my $File1 = SdxReporting::File::Flex->new( 
#	name => '2014-11-18-Flex.xlsx' );
#my $File2 = SdxReporting::File::Flex->new( 
#	name => '2014-11-17-Flex.xlsx' );
#my $File3 = SdxReporting::File::Flex->new( 
#	name => '2014-11-16-Flex.xlsx' );
#print Dumper($File1);
#
#my $data = SdxReporting::DataSet->new(
#	Files => [$File1, $File2, $File3]);

#join( " ", map { $_->name } $data->Files ); 

#print Dumper(%config);