#My set of awk one-liners
#Can contain multi-liners aswell

#Licence: MIT
#Author:  Jakub Olizarowicz

#TABLE OF CONTENTS / SPIS TRESCI
#
#  1. PRINTING RECORD WITHOUT 1-ST FILED
#     WYSWIETLANIE REKORDU BEZ 1-SZEGO POLA

# ISSUE   1:  PRINTING RECORD WITHOUT 1ST FILED
# PROBLEM 1:  WYSWIETLANIE REKORDU BEZ 1-SZEGO POLA

#1.1
{ for ( i=2;i<=NF;i++) printf("%s%s",$i,(i==NF)?ORS:OFS) } 
# Does not keep length of field separator
# Nie zachowuje dlugosci odstepow miedzy polami

#1.2
{$1=""}1
# Adds leading field separator, does not keep length of field separator
# Dodaje Field Separator na poczatku, nie zachowuje dlugosci odstepow miedzy polami

#1.2.2
{$1=""}{print substr($0,2)}
# Same as above but gets rid of leading space
# To co powyżej, ale usuwa poczatkowy separator pol (FS).

#1.3
NF>1 {print (substr($0,index($0,$2)))}
# Doesn't work when $2 is substring of / equal to $1
# Nie dziala, jezeli pole 2 jest podlancuchem pola 1

#1.4
NF>1{print substr($0,index(substr($0,length($1)+1),$2)+length($1)) } 
# Overcomplicated but should work everywhere :)
# Przekombinowane, ale dziala wszedzie i zachowuje oryginalne odstepy.

#1.5
NF>1 && ! index($1,$2){ print (substr($0,index($0,$2))); next} NF>1 {print substr($0,index(substr($0,length($1)+1),$2)+length($1)) } 
# Even more overcomplicated (and not oneliner) but should work everywhere and faster :)
# Strasznie przekombinowane ale powinno dzialac trochę szybciej dla dowolnych plików
