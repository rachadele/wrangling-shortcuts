#!/bin/bash
for file in ./*; do zcat $file | head -2 | while read line; do if [[ ! $line =~ ^@ ]]; then echo ${#line}; fi; done; done
