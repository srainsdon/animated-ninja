#!/usr/bin/perl

use strict;
use Spreadsheet::ParseExcel;
use DateTime::Format::Strptime qw( );

my $sourcename = shift @ARGV or die "invocation: $0 <source file>\n";
my $source_excel = new Spreadsheet::ParseExcel;
my $source_book = $source_excel->Parse($sourcename) or die "Could not open source Excel file $sourcename: $!";
my $storage_book;
my $ReportDate;


foreach my $source_sheet_number (0 .. $source_book->{SheetCount}-1)
{
 my $source_sheet = $source_book->{Worksheet}[$source_sheet_number];

 next unless defined $source_sheet->{MaxRow};
 next unless $source_sheet->{MinRow} <= $source_sheet->{MaxRow};
 next unless defined $source_sheet->{MaxCol};
 next unless $source_sheet->{MinCol} <= $source_sheet->{MaxCol};

 foreach my $row_index ($source_sheet->{MinRow} .. $source_sheet->{MaxRow})
 {
  foreach my $col_index ($source_sheet->{MinCol} .. $source_sheet->{MaxCol})
  {
   my $source_cell = $source_sheet->{Cells}[$row_index][$col_index];
   if ($source_cell)
   {
    next if ($source_cell->Value eq "");
    if ($row_index == 4 && $col_index == 2) {
      my ($tmpDay, $tmpDate) = split(", ", $source_cell->Value);
      print "|$tmpDate|\n";
      
      my $format = DateTime::Format::Strptime->new(
      pattern   => '%B %d %Y',
      time_zone => 'local',
      on_error  => 'croak',
      );
      $ReportDate = $format->parse_datetime('$tmpDate');
      print $ReportDate;
     }
    #print "( $row_index , $col_index ) =>", $source_cell->Value, "\t";
    #print  $source_cell->Value . ",";
   }
  } 
  print "\n";
 } 
}
#print "done!\n";
