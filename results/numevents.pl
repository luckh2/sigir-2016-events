#!/usr/bin/perl


my $depth = $ARGV[2];
my %knownEvents;
#open(KE, "nyt-known-events-2004.txt");
open(KE, $ARGV[0]);
while (<KE>) {
   chomp();
   $knownEvents{$_} = 1;
}
close(KE);


open (EVENTS, $ARGV[1]);
my $numFoundEvents = 0;
my %foundEvents;
my $numEventsAtRank = "";
while (<EVENTS>) 
{
   chomp();
   if ($_ =~ /^ID/) {
      my $id = $_;
      $id =~ s/ID\t//g;
      $id =~ s/ .*//g;
      my $i = 0;
      my $fe = 0;
      while (<EVENTS>) {
         chomp();
         if ($_ =~ /^\s*$/) { last; }

         if ($_ =~ /^http/) {
             if ($i < $depth) {
   		my ($url, $rel) = split/\t/, $_;
 		if ($knownEvents{$url} == 1) {
                   $fe++;
                   $foundEvents{$id}{$url} = 1; 
                }
             }
             $i++;
         }
      }
      if ($fe > 0) { $numFoundEvents++};
      $numEventsAtRank .= $numFoundEvents . ",";
      #print $id . "," . $fe . "\n";
   }
}
print "$numFoundEvents found at depth $depth\n";
#print "$numEventsAtRank\n";


for $id (sort {$a <=> $b} keys %foundEvents) {
#print "$id\n";
    for $url (keys %{$foundEvents{$id}}) {
#print "\t$url\n";
    }
}
