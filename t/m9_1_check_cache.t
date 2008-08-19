#
# Test cache
#
use strict;

use Test::More tests => 8;
use IMDB::Film;

my $cache_root = '/tmp/test_imdb_cache';

my $film = new IMDB::Film(crit => '0341266', cache => 1, cache_root => $cache_root, clear_cache => 1);

is($film->title, 'Bhoot', 'Movie title');
is($film->status, 2, 'Status');
is($film->status_descr, 'Fresh', 'Status Description');
is(-d $cache_root, 1, 'Cache Root Exists');
is(-d '/tmp/dummy_cache', undef, 'Dummy Cache Root');

$film = new IMDB::Film(crit => '0341266', cache => 1, cache_root => $cache_root);

is($film->title, 'Bhoot', 'Movie title');
is($film->status, 3, 'Status');
is($film->status_descr, 'Cached', 'Status Description');
