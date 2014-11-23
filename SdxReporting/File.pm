
{
package SdxReporting::File;
use Moose;

has 'name' => (
	is       => 'rw',
	isa      => 'Str',
	required => 1,
	);
	
has 'type' => (
	is      => 'rw',
	isa     => 'Str',
	default => 'Wallace'
	);
has 'path' => (
	is	=> 'rw',
	isa	=> 'Str',
	);
}

{
package SdxReporting::File::Flex;
use Moose;
extends 'SdxReporting::File';

has '+type' => ( 
	default => 'Flex' 
	);
}


1;
