package Test::Comprehensive;

use strict;
use warnings;
use File::Find::Rule;
use Test::Pod;
use Test::More;

our $VERSION = '1.00';

our @files = File::Find::Rule->file()->name('*.pm')->in('blib/lib');
our @classes = map {
    (my $x = $_) =~ s|^blib/lib/||;
    $x =~ s|/|::|g;
    $x =~ s|\.pm$||;
    $x } @files;

plan tests => 3 * @files;

for my $file (@files) { pod_ok($file) }

for my $class (@classes) { use_ok($class) }

for my $class (@classes) {
	our $version;
	my $this_version = do { no strict 'refs'; ${"$class\::VERSION"} };
	unless (defined $version) {
		$version = $this_version;
		ok(defined($version), "$class defines a version");
		next;
	}
	is($this_version, $version, "$class version matches");
}

1;

__END__

=head1 NAME

Test::Comprehensive - perform tests on all modules of a distribution

=head1 SYNOPSIS

  $ cat t/01comprehensive.t
  use Test::Comprehensive;
  $ make test
  ...

=head1 DESCRIPTION

When using this module in a test script, it goes through all the modules
in your distribution, checks their POD, checks that they compile ok and
checks that they all define the same $VERSION.

It defines its own testing plan, so you can't use it in conjunction with
other C<Test::*> modules in the same file. Therefore it's recommended that
you just create a one-line test script as shown in the SYNOPSIS above.

=head1 BUGS

If you find any bugs or oddities, please do inform the author.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 VERSION

This document describes version 1.00 of C<Test::Comprehensive>.

=head1 AUTHOR

Marcel GrE<uuml>nauer <marcel@cpan.org>

=head1 COPYRIGHT

Copyright 2002 Marcel GrE<uuml>nauer. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

perl(1), Test::More(3pm), Test::Pod(3pm).

=cut

