{
package SdxReporting::DataSet;
use Moose;
	
has 'Files' => (
	is      => 'rw',
	isa => 'ArrayRef',
	auto_deref => 1,
	);
}

{
package SdxReporting::DataSet;
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
package SdxReporting::DataSet::Flex;
use Moose;
extends 'SdxReporting::DataSet';

has '+type' => ( 
	default => 'Flex' 
	);
}


1;
