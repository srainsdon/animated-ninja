{
package SdxReporting::Config;
use Moose;
use MooseX::AttributeHelpers;
use Config::Simple;

has 'Setting' => (
	metaclass => 'Collection::Hash',
	is        => 'rw',
	isa       => 'HashRef[Str]',
	default   => sub { {} },
	provides  => {
		exists    => 'exists_in_mapping',
		keys      => 'ids_in_mapping',
		get       => 'get_mapping',
		set       => 'set_mapping',
	},
  );
sub BUILD {
      my $self = shift;
	  my %Config;
	  my $Value;
	  Config::Simple->import_from( "Config", \%Config);
	  foreach my $key (keys %Config) {
		  my $keyen = $key;
			  #$keyen =~ s/\.//gi;
			  #print $keyen, '=>', $Config{$key}, "\n";
			  $self->set_mapping($keyen, $Config{$key});
	      }
	  
  }
}
1;