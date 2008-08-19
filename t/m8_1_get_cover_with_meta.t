#
# Test retrieving cover with special symbols in title
#
use strict;

use Test::More tests => 2;
use IMDB::Film;

my $film = new IMDB::Film(crit => '13 (Tzameti)');

is($film->code, '0475169', 'Movie ID');
like($film->cover, qr#/images/M/MV5BMzQ3NzU3MzU5OF5BMl5BanBnXkFtZTcwNDM4NDIzMQ@@._V1._SX100_SY135_.jpg#, 'Movie Cover');

