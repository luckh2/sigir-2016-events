#!/usr/bin/perl

#
# Proportion of unique URLs that are in the known-events list
#

my $depth = $ARGV[2];
my %ke;
open(KE, $ARGV[0]);
while (<KE>) {
   chomp();
   $ke{$_} = 1;
}
close(KE);


my %fe;
my %seen;
open (EVENTS, $ARGV[1]);
my $mrr = 0;
my $events =0;
while (<EVENTS>) 
{
   chomp();
   if ($_ =~ /^ID/) {
      my $id = $_;
      $id =~ s/ID\t//g;
      $id =~ s/\([^)]*\)//g;
      my $i = 1;
      my $mrr = 0;
      my $first = 0;
      while (<EVENTS>) {
         chomp();
         if ($_ =~ /^\s*$/) { last; }

         if ($_ =~ /^http/) {
             if ($i < $depth+1) {
   		my ($url, $rel) = split/\t/, $_;
                if ($ke{$url} == 1 && $seen{$url} != 1) {
                   $seen{$url} = 1;
                   $mrr += 1/$i;
                   $first = $url;
                   last;
                }
                $i++;
             }
         }
      }
      #print "$id\t$first\t$mrr\n";
      print "$mrr\n";
      $events++;
   }
}

#print "$mrr $events " . ($mrr/$events) . "\n";
