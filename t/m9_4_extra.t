#
# Test for internation movies
#

use strict;

use Test::More tests => 19;
use IMDB::Film;

my %default_pars = (debug => 0, cache => 0);

#
# Check the status of loaded IMDB object for some internation movies
#
my $crit = 'delicatessen';
my %pars = (%default_pars, crit => $crit);
my $obj = new IMDB::Film(%pars);
is($obj->status, 2, 'Object status');
is($obj->code, '0101700', 'Movie code');
%pars = (cache => 0, debug => 0, crit => 'ben-hur');
$obj = new IMDB::Film(%pars);
is($obj->status, 2, 'Object status');
is($obj->code, '0052618', 'Movie code');

#
# Check parsing writers in case when there is an only one person
#
$obj = new IMDB::Film(%default_pars, crit => 'Stay');
is($obj->code, '0371257', 'Movie Code');
is($obj->status, 2, 'Object status');
is_deeply($obj->writers, [{id => '1125275', name => 'David Benioff'}], 'Modie Writes');

#
# Check retrieving movie by its title and year
#
$obj = new IMDB::Film(%default_pars, crit => 'Jack', year => 2003);
is($obj->code, '0379836', 'Movie Code');
is($obj->year, 2003, 'Movie Year');


$obj = new IMDB::Film(%default_pars, crit => '0068646');
my($rate, $num, $top_info) = $obj->rating;
like($rate, qr/\d+/, 'Movie rating');
like($num, qr/\d+/, 'Rated people');
ok($rate > 1, 'Rate is greater than 1');
ok($num >= 8, 'Votes greater than 8');
like($top_info->[0], qr/Top 250/, 'Top info');

$obj = new IMDB::Film(%default_pars, crit => 300);
is($obj->code, '0416449', 'Movie ID');
is($obj->title, 300, 'Movie Title');

# Check cover for the non-English movies
$obj = new IMDB::Film(%default_pars, crit => '0100263');
like($obj->cover, '/\.jpg/i', 'Non-English movie cover');

# Chek episodes
$obj = new IMDB::Film(%default_pars, crit => 'the office');
my $episodes = $obj->episodes();
is($obj->code, '0386676', 'Movie ID');
cmp_ok(scalar(@$episodes), '>', 0, 'Number of episodes')
