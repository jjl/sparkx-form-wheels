package SparkX::Form::Wheel::Confirm;

use Moose;

require SparkX::Form::Field::Text;
extends 'SparkX::Form::Field::Text';

require SparkX::Form::Field::Validator::Confirm;
with qw(SparkX::Form::Field::Validator::Confirm);

sub _validate {1}

1;
__END__

=head1 DESCRIPTION

SparkX::Form::Field::Confirm - A confirm field for Spark::Form

=head1 ATTRIBUTES

=head1 COPYRIGHT AND LICENSE

(c) 2009 James Laver, Pedigree Consulting UK Ltd.

=cut