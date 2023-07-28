#!/usr/bin/env perl
use 5.30.0; 
use strict; 
use warnings; 
use DBI;
use utf8;
my $dbname = "san";
# my $host = "127.0.0.1"; #default
# my $port = "5432"; #default
my $username = "san";
my $password = "san";

my $dbh = DBI->connect("dbi:Pg:dbname=$dbname",
                $username,
                $password );
##################################### 
my $col="title"; # column
my $id="1"; # book_id
say "YOUR INPUT:\ncolumn=$col \nbook_id=$id\n";

my $my_query = "select ".$col." from book where book_id=".$id;
say "YOUR QUERY:\n$my_query";

# INITIAL query:
# my $sth = $dbh->prepare('SELECT title from book where book_id=1');

my $sth = $dbh->prepare($my_query);
$sth->execute();

my @row;
my $flag = 0; # Bad query = 0 # Good query = 1 
say "\nRESULT:";

binmode(STDOUT,':utf8'); # russian lang
while ( @row = $sth->fetchrow_array ) { 
	print "@row\n";
	$flag = 1;
}

if ($flag==0) {
	say "Your input is bad! Try again!";
}
###########################################
