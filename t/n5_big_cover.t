use strict;

use Test::More tests => 1;
use IMDB::Film;

my %default_pars = (debug => 0, cache => 0);

my $obj = new IMDB::Film(%default_pars, crit => '0062755');
is($obj->big_cover, 'http://ia.media-imdb.com/images/M/MV5BMTI5MTAzMzIxMl5BMl5BanBnXkFtZTcwMDk4ODYyMQ@@._V1._SX350_SY500_.jpg', 'Big cover');
