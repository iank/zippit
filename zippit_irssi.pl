use strict;
use vars qw($VERSION %IRSSI);
 
use LWP::UserAgent;
use URI::Escape qw/uri_escape/;
 
use Irssi;
$VERSION = '0.01';
%IRSSI = (
    authors     => 'iank',
    contact     => 'iank@cpan.org',
    name        => 'zippit',
    description => 'Zippy it!',
    license     => 'WTFPL',
);
 
sub zippit {
    my ($msg,$server,$witem) = @_;
    my $ua = LWP::UserAgent->new();
    my $foo = $ua->get('http://I"M NOT VERY BRIGHT?txt='.uri_escape($msg));
    if ($foo->is_success) {
        $witem->command('say ' . $foo->content);
    } else {
        $witem->print($foo->status_line);
    }
}
 
Irssi::command_bind 'zippit' => \&zippit;
