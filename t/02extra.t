use Test::Comprehensive tests => 4;
use Test::More;
ok(1, 'extra test');

# 3 * (1 module) + 4 extra
is(Test::Comprehensive::num_tests(), 7, 'number of tests');

is_deeply(Test::Comprehensive::packages(), 'Test::Comprehensive',
    'packages found');
is_deeply(Test::Comprehensive::files(), 'blib/lib/Test/Comprehensive.pm',
    'files found');
