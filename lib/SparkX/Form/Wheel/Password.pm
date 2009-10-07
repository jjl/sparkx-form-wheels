package SparkX::Form::Wheel::Password;

use Moose;
use Data::Password qw(IsBadPassword);

require SparkX::Form::Field::Password;
extends 'SparkX::Form::Field::Password';

has 'dictionary_length' => (
    isa => 'Int',
    is => 'rw',
    required => 0,
    default => 0,
);

has 'following_chars' => (
    isa => 'Int',
    is => 'rw',
    required => 0,
    default => 0,
);

has 'groups' => (
    isa => 'Int',
    is => 'rw',
    required => 0,
    default => 0,
);

has 'min_length' => (
    isa => 'Int',
    is => 'rw',
    required => 0,
    default => 6,
);

has 'max_length' => (
    isa => 'Int',
    is => 'rw',
    required => 0,
    default => 0,
);

has 'dictionaries' => (
    isa => 'ArrayRef[Str]',
    is => 'rw',
    required => 0,
    default => sub {[]},
);

sub _validate {
    my $self = shift;

    my $res;
    eval {
        $Data::Password::DICTIONARY = $self->dictionary_length;
        $Data::Password::FOLLOWING = $self->following_chars;
        $Data::Password::GROUPS = $self->groups;
        $Data::Password::MINLEN = $self->min_length;
        $Data::Password::MAXLEN = $self->max_length;
        @Data::Password::DICTIONARIES = @{$self->dictionaries} if @{$self->dictionaries};
        $res = IsBadPassword($self->value);
    };

    # If it returns something, it's a new address in Mail::Address format
    $self->error($res) if $res;
    
    !$res;
}

1;
__END__

=head1 DESCRIPTION

SparkX::Form::Field::Password

=cut