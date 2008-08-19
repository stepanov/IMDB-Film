#
# Test retrieving list of movie release dates.
#

use strict;

use Test::More tests => 2;
use IMDB::Film;

use Data::Dumper;

my $crit = '0403358';
my %pars = (cache => 0, debug => 0, crit => $crit);

my $obj = new IMDB::Film(%pars);

is_deeply($obj->release_dates()->[0], {country => 'Russia', date => '27 June, 2004'}, 'Release Dates');

$obj = new IMDB::Film(crit => 'eternal sunshine of the spotless mind', debug => 0);

is_deeply($obj->release_dates()->[0], {country => 'USA', date => '19 March, 2004'}, 'Release Dates');

warn Dumper $obj->release_dates();
