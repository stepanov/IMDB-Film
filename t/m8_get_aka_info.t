#
# Test retrieving AKA info
#
use strict;

use Test::More tests => 4;
use IMDB::Film;

my $film = new IMDB::Film(crit => '0341266');

is($film->title, 'Bhoot', 'Movie title');
is(scalar(@{$film->also_known_as}), 2, 'Also known as info');

$film = new IMDB::Film(crit => '0403358');

like($film->title, qr/nochnoy dozor/i, 'Movie title');
ok(scalar(@{$film->also_known_as}) >= 1, 'Also known as info');
