package SparkX::Form::Wheel::Email;

use Moose;

use Email::Valid;

require SparkX::Form::Field::Text;
extends 'SparkX::Form::Field::Text';

has mxcheck => (
    is => 'ro',
    isa => 'Str',
    required => 0,
    default => 0,
);

has tldcheck => (
    is => 'ro',
    isa => 'Str',
    required => 0,
    default => 0,
);

has fudge => (
    is => 'ro',
    isa => 'Str',
    required => 0,
    default => 0,
);

has fqdn => (
    is => 'ro',
    isa => 'Str',
    required => 0,
    default => 1,
);

has local_rules => (
    is => 'ro',
    isa => 'Str',
    required => 0,
    default => 0,
);

sub _validate {
    my $self = shift;

    my $res;
    eval {
	    #Run the validation, with the optional flags
	    $res = Email::Valid->address(
	        -address => $self->value,
	        -mxcheck => $self->mxcheck,
	        -tldcheck => $self->tldcheck,
	        -fudge => $self->fudge,
	        -fqdn => $self->fqdn,
	        -local_rules => $self->local_rules,
	    );
    };
    # If it returns something, it's a reformatted address
    if ($res) {
	    $self->value($res);
    } else {
        $self->error($self->human_name . " doesn't appear to be valid.");
    }
    #Forceful boolean
    !!$res;
}

1;
__END__

=head1 DESCRIPTION

SparkX::Form::Field::Email - An Email::Valid wrapper field for Spark::Form

=head1 ATTRIBUTES

=head2 mxcheck

-mxcheck flag from E::V, whether to check an appropriate MX record exists on the domain. default = 0

=head2 tldcheck

-tldcheck flag from E::V, whether to regex-check the TLD. default = 0

=head2 fudge

-fudge flag from E::V, whether to fudge basic mistakes people make in entering addresses before checking. default = 0

=head2 fqdn

-fqdn flag from E::V, whether the address must contain a fully qualified domain name. default = 1

=head2 local_rules

-local_rules flag from E::V, whether addresses should be tested for domain specific restrictions. Not really used. default = 0

=head1 COPYRIGHT AND LICENSE

(c) 2009 James Laver, Pedigree Consulting UK Ltd.

=cut