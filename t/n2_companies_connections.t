#
# Test retrieving list of movie's companies and connections.
#

use strict;

use Test::More tests => 5;
use IMDB::Film;

use Data::Dumper;

my $crit = '0062755';
my %pars = (cache => 0, debug => 0, crit => $crit);

my $obj = new IMDB::Film(%pars);

my $companies = $obj->full_companies;
my $connections = $obj->connections;

is($companies->{production}->[0]->{name}, 'Twentieth Century Fox Film Corporation', 'Production company name');
is_deeply($companies->{distributors}->[6], {'name' => 'FS Film Oy', 'url' => '/company/co0093099/', 'extra' => '(2006) (Finland) (DVD)'}, 'Distributor');
is_deeply($connections->{featured_in}->[0], {'title' => 'Murder by Numbers', 'id' => '0293435', 'year' => '2004'}, 'Featured In Connection');
is_deeply($connections->{version_of}->[0], {'title' => 'The Boston Strangler', 'id' => '0490817', 'year' => '2006'}, 'Version Of');                                                                                                         
is_deeply($connections->{referenced_in}->[0], {'title' => 'Rowan & Martin\'s Laugh-In', 'episode' => '22', 'series_title' => 'Episode', 'id' => '0690766', 'year' => '1969', 'season' => '2'}, 'Referenced In');                                                                                                       
