package SecStuff;

# https://stackoverflow.com/questions/32719078/load-regex-from-file-and-match-groups-with-it-in-perl

my $filename = '/etc/sec.d/suppress';
open ( my $pattern_fh, '<:encoding(UTF-8)', $filename) or die "Could not open file '$filename': $!";

my $regex = join( '|', map { chomp; $_ }  <$pattern_fh>  );
$regex = qr/$regex/;
#print "Using regex of: $regex\n";


#if ( my ($match) = $example_str =~ m/$regex/ ) {
#print "Matched: $match\n";
#}

sub my_match {
  my ( $line ) = @_;
  return $line =~ m/$regex/;
}

#my $example_str = 'Jan 18 15:25:06 uza kernel: grsec: (myusers:U:/usr/bin/anki) denied socket(inet,stream,ip) by /usr/bin/python2.7[QThread:8856] uid/euid:1000/1000 gid/egid:1000/1000, parent /usr/lib/systemd/systemd[systemd:1] uid/euid:0/0 gid/egid:0/0';
#if ( my_match( $example_str ) ) {
#print "Matched\n";
#}
