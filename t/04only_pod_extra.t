use Test::Comprehensive
    tests => 2,
    only  => [ 'pod' ];
use Test::More;
ok(1, 'extra test');

# 1 * (1 module) + 2 extra
is(Test::Comprehensive::num_tests(), 3, 'number of tests');
