#!/usr/bin/perl

#
# Proportion of unique URLs that are in the known-events list
#

my $depth = $ARGV[2];
my %ke;
#open(KE, "nyt-known-events-2004.txt");
open(KE, $ARGV[0]);
while (<KE>) {
   chomp();
   $ke{$_} = 1;
}
close(KE);


my %fe;
open (EVENTS, $ARGV[1]);
while (<EVENTS>) 
{
   chomp();
   if ($_ =~ /^ID/) {
      my $id = $_;
      $id =~ s/ID\t//g;
      my $i = 0;
      while (<EVENTS>) {
         chomp();
         if ($_ =~ /^\s*$/) { last; }

         if ($_ =~ /^http/) {
             if ($i < $depth) {
   		my ($url, $rel) = split/\t/, $_;
                $fe{$url} = 1;
                #print "$id, $_\n";
             }
             $i++;
         }
      }
   }
}
#print "\n\n";

my $found = 0;
my $total = 0;
for $url (sort keys %fe) {
   if ($ke{$url} == 1) {
      # print "$url\n";
       $found++;
   } else {
      # print "$url\n";
   }
   $total++;
}
print "$depth $found/$total $found " . sprintf("%.4f", ($found/$total)) . "\n";
