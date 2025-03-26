#!/usr/bin/perl
use strict;
use warnings;

# her komut satırı argümanı için işlem yapar
foreach my $expr (@ARGV) {
    # sayı1 [boşluk] operatör [boşluk] sayı2 şeklinde eşleşmeleri arıyor
    if ($expr =~ m/(\d+)\s*([\+\-\*\/])\s*(\d+)/) {
        my ($a, $op, $b) = ($1, $2, $3);  # eşleşen değerleri a, b ve op değişkenlerine atar

        if ($op eq "+") { #toplama
            print "$a + $b = ", $a + $b, "\n";
        } elsif ($op eq "-") { #çıkarma
            print "$a - $b = ", $a - $b, "\n";
        } elsif ($op eq "*") { #çarpma
            print "$a * $b = ", $a * $b, "\n";
        } elsif ($op eq "/") { #bölme
            if ($b == 0) { #sıfıra bölme hatası
                print "Error: Division by zero\n";
            } else {
                print "$a / $b = ", $a / $b, "\n";
            }
        }
    } else {
        print "Syntax error in input: $expr\n";
    }
}
