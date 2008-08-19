#
# Test for movie trivia and goofs
#

use strict;

use Test::More tests => 8;
use IMDB::Film;

my $film = new IMDB::Film(crit => '0113277');
is($film->title, 'Heat', 'Movie title');
like($film->trivia, qr/.+/, 'Movie trivia');
like($film->goofs, qr/.+/, 'Movie goofs');
is($film->awards, '6 nominations', 'Movie avards');
is($film->aspect_ratio, '2.35 : 1', 'Movie Aspect Ratio');

# Test movie without aka info
$film = new IMDB::Film(crit => '0105898');
is($film->title, 'Zipperface', 'Movie title');
is(scalar(@{$film->also_known_as}), 0, 'AKA info');
is($film->awards, '', 'Movie avards');
