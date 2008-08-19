use strict;
use warnings;

use Test::More tests => 2;

use IMDB::Film;

my $crit = '0332452';
my $sites = [
	{"http://troymovie.warnerbros.com/index_flash.html" 				=> "Warner Brothers"},
	{"http://www.troia-ofilme.com.br/"									=> "Warner Bros. [br]"},
	{"http://www.troijaelokuva.fi"										=> "Official Site [fi]"},
	{"http://www.troy.jp/"												=> "Warner Bros. [jp]"},
	{"http://www.warnerbros.co.uk/movies/troy/?fromtout=homepage_b1"	=> "Warner Bros. [uk]"},
	{"http://www.warnerbros.fr/movies/troy/"							=> "Warner Bros [fr]"},
];

my %pars = (cache => 0, debug => 0, crit => $crit);

my $obj = new IMDB::Film(%pars);

is_deeply($obj->official_sites, $sites, 'Official sites');

$crit = '0118880';

%pars = (cache => 0, debug => 0, crit => $crit);

$obj = new IMDB::Film(%pars);

is_deeply($obj->official_sites, undef, 'Official sites');
