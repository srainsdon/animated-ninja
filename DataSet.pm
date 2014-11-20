{
package DataSet;
use Moose;
	
has 'files' => (
	is      => 'rw',
	isa => 'ArrayRef[File]',
	auto_deref => 1,
	);
}

{
package File;
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
package File::Flex;
use Moose;
extends 'File';

has '+type' => ( 
	default => 'Flex' 
	);
}

{
package File::Wallace;
use Moose;
extends 'File';

has '+type' => ( 
	default => 'Wallace' 
	);
}

{
package File::DoorCount;
use Moose;
extends 'File';

has '+type' => ( 
	default => 'DoorCount' 
	);
}

{
package File::Dennys;
use Moose;
extends 'File';

has '+type' => ( 
	default => 'Dennys' 
	);
}
1;
