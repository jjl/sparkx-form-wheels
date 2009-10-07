use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'SparkX::Form::Wheels',
    license             => 'perl',
    dist_author         => 'James Laver <printf(qw(%s@%s.com cpan jameslaver))>',
    dist_version_from   => 'lib/SparkX/Form/Wheels.pm',
    build_requires => {
        'Test::More' => 0,
        'Data::Password' => 0,
        'Email::Valid' => 0,
    },
    add_to_cleanup      => [ 'SparkX-Form-Wheels-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
