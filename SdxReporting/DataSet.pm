{
package SdxReporting::DataSet;
use Moose;
	
has 'Files' => (
	is      => 'rw',
	isa => 'ArrayRef[SdxReporting::File]',
	auto_deref => 1,
	);
}

{
	package SdxReporting::DataSet::Record;
	use Moose;
	
has 'TimeStamp' => (
	is => 'rw',
	isa => 'Str'
);
has 'Store' => (
	is => 'rw',
	isa => 'Int'
);
has 'NumOfTrans' => (
	is => 'rw',
	isa => 'Int'
);
}

1;
