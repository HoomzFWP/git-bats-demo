#!/usr/bin/bash

# Extracts contents of a compressed tar archive specified as
# the first command line argument and counts the number of files
# that contain the string "SUCCESS" and the string "FAILURE"
# and reports the result

# Hoomz Damte
# University of Minnesota, Morris
# August 2020
tar_file=$1

scratch=`mktemp --directory`

tar zxf $tar_file --directory $scratch

numSuccesses=`grep -lr SUCCESS $scratch | wc -l`
numFailures=`grep -lr FAILURE $scratch | wc -l`

tar zxf $tar_file --directory $scratch

echo "There were $numSuccesses successes and $numFailures failures." 

rm -rf $scratch
