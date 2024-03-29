#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Path::Class;

my $lib = file($0)->parent->parent->subdir('lib');
my @files = $lib->children;

while ( my $file = shift @files ) {
    if ( -d $file ) {
        push @files, $file->children;
    }
    elsif ( $file =~ /[.]pm$/ ) {
        require_ok $file;
    }
}

diag( "Testing Group::Git::Cmd::Ivan $Group::Git::Cmd::Ivan::VERSION, Perl $], $^X" );
done_testing();
