#
# Test retrieving cover with special symbols in title
#
use strict;

use Test::More tests => 2;
use IMDB::Film;

my $film = new IMDB::Film(crit => '13 (Tzameti)');

is($film->code, '0475169', 'Movie ID');
like($film->cover, '/\.jpg/i', 'Movie Cover');

