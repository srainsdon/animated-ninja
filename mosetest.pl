package Holder;

use Moose;
use MooseX::AttributeHelpers;

has 'things' => (
    metaclass => 'Collection::Array',
    is => 'rw',
    isa => 'ArrayRef[Str]',
    default => sub { [qw/blue green green yellow/] },
    auto_deref => 1,
    provides => {
        'push' => 'add_things'
    },
);

package main;

my $holder = Holder->new();

print "My things are:\t\t", join(' ', $holder->things() ), "\n";

$holder->add_things('mango');

print "My things are now:\t", join(' ', $holder->things() ), "\n";