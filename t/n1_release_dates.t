#
# Test retrieving list of movie release dates.
#

use strict;

use Test::More tests => 3;
use IMDB::Film;

use Data::Dumper;

my $crit = '0403358';
my %pars = (cache => 0, debug => 0, crit => $crit);

my $obj = new IMDB::Film(%pars);

my $release_dates = $obj->release_dates;

is_deeply($release_dates->[0], {country => 'Russia', date => '27 June 2004', info => 'Moscow Film Festival'}, 'Release Dates with link');
is_deeply($release_dates->[5], {country => 'Germany', date => 'February 2005', info => 'Berlin International Film Festival'}, 'Release Dates without link');
is_deeply($release_dates->[1], {country => 'Belarus', date => '8 July 2004', info => ''}, 'Release dates without info');
