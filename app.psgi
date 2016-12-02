use strict;
use warnings;

my $app = sub {
    my $env = shift;
    
    return [
        200,
        [ 'Content-Type' => 'text/html'],
        [ 'Hello PSGI world! v0.4']
    ];
}
