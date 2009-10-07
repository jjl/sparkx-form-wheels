#!perl -T

use Test::More tests => 2;

BEGIN {
	use_ok( 'SparkX::Form::Wheel::Email' );
	use_ok( 'SparkX::Form::Wheel::Password' );
}

diag( "Testing SparkX::Form::Wheels $SparkX::Form::Wheels::VERSION, Perl $], $^X" );
