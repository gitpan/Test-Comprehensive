use Test::Comprehensive
    tests => 2,
    only  => [ qw/pod versions/ ];
use Test::More;
ok(1, 'extra test');

# 3 * (1 module) + 2 extra
is(Test::Comprehensive::num_tests(), 5, 'number of tests');
