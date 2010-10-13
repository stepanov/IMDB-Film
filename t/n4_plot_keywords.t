#
# Test retrieving list of movie keywords.
#

use strict;

use Test::More tests => 3;
use IMDB::Film;

use Data::Dumper;

my %pars = (cache => 0, debug => 0, crit => 'Troy');

my $obj = new IMDB::Film(%pars);

my $plot_keywords = $obj->plot_keywords();

is($plot_keywords->[0], 'Trojan', 'First plot keyword');
is($plot_keywords->[4], 'Epic', '5th plot keyword');
is($plot_keywords->[9], 'Queen', '10th plot keyword');
