#!/bin/bash
#UNMDP - HEMO Team
INPUT="$1"
RNDFILE=$(mktemp)
#remove the first 3 lines of the CRN file
cat $INPUT | sed -e "1,3d" | sed -e "s/ /#/g"> $RNDFILE
#get the first interval
INIT=$(cat $INPUT| head -5 | tail -1| cut -c7-10)
let INIT=INIT-10
c=0;
while read line
do
    if [ $c -eq 0 ]; then
        let YEAR=INIT
        let c=1
    else
        YEAR=$(echo $line | cut -c7-10)
    fi
    
    r1=$(echo $line | cut -c11-14 | sed -e "s/#//g")
    echo $YEAR $r1
    let YEAR=YEAR+1
    r2=$(echo $line | cut -c18-21| sed -e "s/#//g")
    echo $YEAR $r2
    let YEAR=YEAR+1

    r3=$(echo $line | cut -c25-28| sed -e "s/#//g")
    echo $YEAR $r3
    let YEAR=YEAR+1

    r4=$(echo $line | cut -c32-35| sed -e "s/#//g")
    echo $YEAR $r4
    let YEAR=YEAR+1

    r5=$(echo $line | cut -c39-42| sed -e "s/#//g")
    echo $YEAR $r5
    let YEAR=YEAR+1

    r6=$(echo $line | cut -c46-49| sed -e "s/#//g")
    echo $YEAR $r6
    let YEAR=YEAR+1

    r7=$(echo $line | cut -c53-56| sed -e "s/#//g")
    echo $YEAR $r7
    let YEAR=YEAR+1

    r8=$(echo $line | cut -c60-63| sed -e "s/#//g")
    echo $YEAR $r8
    let YEAR=YEAR+1

    r9=$(echo $line | cut -c67-70| sed -e "s/#//g")
    echo $YEAR $r9
    let YEAR=YEAR+1

    r10=$(echo $line | cut -c74-77| sed -e "s/#//g")
    echo $YEAR $r10
    let YEAR=YEAR+1
    
done <"$RNDFILE"

rm -f $RNDFILE
