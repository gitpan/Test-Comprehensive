use Test::Comprehensive
    tests => 2,
    only  => [ qw/pod use/ ];
use Test::More;
ok(1, 'extra test');

# 2 * (1 module) + 2 extra
is(Test::Comprehensive::num_tests(), 4, 'number of tests');
