use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'		=> 'Test::Comprehensive',
    'VERSION_FROM'	=> 'lib/Test/Comprehensive.pm',
    'PREREQ_PM'		=> {
	Test::More       => 0.45,
    	Test::Pod        => 0.62,
	File::Find::Rule => 0.03,
    },
);
