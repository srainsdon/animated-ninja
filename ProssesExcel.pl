#!/usr/bin/perl

# MySql DateTime Format 2003-01-16 23:12:01

use strict;
use Spreadsheet::ParseExcel;
use DateTime::Format::Strptime qw( );

my $sourcename = shift @ARGV or die "invocation: $0 <source file>\n";
my $source_excel = new Spreadsheet::ParseExcel;
my $source_book = $source_excel->Parse($sourcename) or die "Could not open source Excel file $sourcename: $!";

print "File: $sourcename Being Prossesed.\n";

my $tmpFn = substr($sourcename, 11);
my ($StoreName, $tmpExt) = split(/\./, $tmpFn);
my $storage_book;
my $ReportDate;
my $SaveNum = 0;
my $TimeStamp;
my $Count = 0;

my $StoreIds = {
	'Jamba'		=> 1,
	'SubCo'		=> 2,
	'Pizza' 	=> 3,
	'Stovers'	=> 4,
	'Traders'	=> 5,
	'Bobs-Flex'	=> 6,
	'Wallace'	=> 7,
	'Bobs-Door'	=> 8,
	'Dennys'	=> 9,
	'Grill'		=> 10,
	'MeinBowl'	=> 11,
	'EBB1'		=> 12,
	'EBB2'		=> 13,
	'Bogeys'	=> 14,
	'Joes'		=> 15,
};

my $StoreId = $StoreIds->{$StoreName};

use DBI;
my $dbh = DBI->connect('DBI:mysql:Sodexo_15Min;host=srv1.247ly.com', 'srainsdon', 'N0cand0a',
	            { RaiseError => 1 }
	           );
my $sth = $dbh->prepare(q{
	INSERT INTO Sodexo_15Min.Transaction (TransactionTime, TransactionNumber, StoreID) VALUES (?, ?, ?)
	}) or die $dbh->errstr;

#print "|$StoreId|-|$tmpFn|-|$StoreName|-|$tmpExt|\n";
return unless ($tmpExt eq "xls");

print "Store: $StoreName\n";

#print "TransactionTime, TransactionNumber, StoreID\n";

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
    if ($row_index => 10) {
		
		if ($col_index == 0) {
			$TimeStamp = substr($source_cell->Value, 0, 5);
			if ($TimeStamp =~ /\d+:\d+/) {
			#print "$ReportDate $TimeStamp:15, ";
			$SaveNum = 1;
			}
		}
		if ($col_index == 9 && $SaveNum == 1) {
    		#print "$ReportDate $TimeStamp:15, " . $source_cell->Value . ", $StoreId\n";
			 $sth->execute("$ReportDate $TimeStamp:00", $source_cell->Value, $StoreId) or die $dbh->errstr;
			 print ".";
			 $Count++;
			$SaveNum = 0;
		}
    }
	if ($row_index == 4 && $col_index == 2) {
      my ($tmpDay, $tmpDate) = split(", ", $source_cell->Value);
      #print "|$tmpDate|\n";
	  my %mon2num = qw(
	    jan 01  feb 02  mar 03  apr 04 may 05  jun 06
	    jul 07  aug 08  sep 09  oct 10 nov 11 dec 12
	  );
	  my ($tmpMonth, $tmpDayNum, $tmpYear) = split(" ", $tmpDate);
	  $tmpMonth = $mon2num{ lc substr($tmpMonth, 0, 3) };
      $ReportDate = $tmpYear . "-" . $tmpMonth . "-" . $tmpDayNum;
	  print "Report Date: $ReportDate\n";
     }
    #print "( $row_index , $col_index ) =>", $source_cell->Value, "\t";
    #print  $source_cell->Value . ",";
   }
  } 
  #print "\n";
 } 
}
print "done! $Count Number of Rows added\n";
$dbh->disconnect();
