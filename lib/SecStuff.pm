use strict;
use warnings;

package SecStuff;

# https://stackoverflow.com/questions/32719078/load-regex-from-file-and-match-groups-with-it-in-perl

my $filename = '/etc/sec.d/suppress';
open ( my $pattern_fh, '<:encoding(UTF-8)', $filename) or die "Could not open file '$filename': $!";
my $regex = join( '|', map { chomp; $_ }  <$pattern_fh>  );

my $local_filename = '/etc/sec.d/suppress.local';
if (-e $local_filename) {
  open ( my $local_pattern_fh, '<:encoding(UTF-8)', $local_filename) or die "Could not open file '$local_filename': $!";
  my $local_regex = join( '|', map { chomp; $_ }  <$local_pattern_fh>  );
  $regex = "$regex|$local_regex";
}

$regex = qr/$regex/;
#print "Using regex of: $regex\n";

sub my_match {
  my ( $line ) = @_;
  return $line =~ m/$regex/;
}
