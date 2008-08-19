package IMDB::Newest;

use strict;
use warnings;

use base qw(IMDB::BaseClass);

use vars qw($VERSION);

use Data::Dumper;

BEGIN {
	$VERSION = '0.01';
}

use constant FORCED		=> 1;
use constant CLASS_NAME => 'IMDB::Newest';

{
	my $_objcount = 0;

	sub get_objcount { $_objcount }
	sub _incr_objcount { ++$_objcount }
	sub _decr_objcount { --$_objcount }	

	my %_defaults = ( 
        host		=> 'indie.imdb.com',
        query		=> 'nowplaying',
        search 		=> 'nowplaying',		
		debug		=> 1,
		cache		=> 0,
	);

	sub _get_default_attrs { keys %_defaults }		
	sub _get_default_value {
		my($self, $attr) = @_;
		$_defaults{$attr};
	}
}

sub _init {
	my CLASS_NAME $self = shift;
	my %args = @_;

	$args{proxy} = $self->get_proxy() if !defined $args{proxy}; 	
	$self->SUPER::_init(@_);

	print Dumper $self;
}

sub now_playing {
	my CLASS_NAME $self = shift;
	my $parser = $self->_parser(FORCED);
	my($tag, $text);
	
	while($tag = $parser->get_tag('b')) {
		last if $parser->get_text =~ /CURRENT TOP TEN - IN THEATERS/i;
	}
	
	my($list, $title, $code);
	while($tag = $parser->get_tag()) {
		last if $tag->[0] eq '/table' or $tag->[0] eq '/html';

		if($tag->[0] eq 'a') {
			$text = $parser->get_text;
			warn "HREF TEXT: $text";
		
			if($text !~ /(Showtimes|Trailers|Photos)/i) {
				$title = $text;
				($code) = $tag->[1]{href} =~ /\/title\/tt(\d+)/;
				push @$list, [$code, $title];
			}		
		}		
	}

	return $list;
}

1;
