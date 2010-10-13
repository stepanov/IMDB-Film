#
# Test retrieving AKA info
#
use strict;

use Test::More tests => 4;
use IMDB::Film;

my $film = new IMDB::Film(crit => '0341266');

is($film->title, 'Bhoot', 'Movie title');
is($film->also_known_as->[0], 'Ghost', 'Also known as info');

$film = new IMDB::Film(crit => '0403358');

like($film->title, qr/nochnoi dozor/i, 'Movie title');
is($film->also_known_as->[0], 'Guardianes de la noche', 'Also known as info');
