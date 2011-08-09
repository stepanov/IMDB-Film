#
# Test retrieving cover with special symbols in title
#
use strict;

use Test::More tests => 4;
use IMDB::Film;

my $film = new IMDB::Film(crit => '13 Tzameti');

is($film->code, '0475169', 'Movie ID');
like($film->cover, '/\.jpg/i', 'Movie Cover');

# Test cover of Walli*E movie with special HTML symbols
$film = new IMDB::Film(crit => '910970');
like($film->cover, '/http.+\@.+\.jpg/i', 'Cover for title with special HTML symbols');

# Test for movie without cover - Two Gentlemen Sharing
$film = new IMDB::Film(crit => '0065133');
is($film->cover, undef, 'Movie wihtout cover');

