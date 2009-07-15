#
# Test POD in all IMDB modules
#

use Test::More tests => 6;
use Pod::Checker;

my $checker = new Pod::Checker('-quiet' => 0);
for my $module(qw(BaseClass Film Persons)) {
	my $filepath = 'lib/IMDB/' . $module . '.pm';
	$checker->parse_from_file($filepath, \*STDERR);
	
	is($checker->num_errors, 0, "POD errors in $module");
	is($checker->num_warnings, 0, "POD warnings in $module");
}

