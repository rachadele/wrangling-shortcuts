#!/bin/bash

for i in $(find SRR*/SRR*/* -type d); do 
cd $i; f=$(echo $i | sed -E s,SRR.{9},, | sed s,/,_,); ls | while read line; do mv $line $(echo $line | sed "s,bamtofastq,$f,"); done; cd ../../../; done
