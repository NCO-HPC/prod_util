#!/bin/bash
##############################################################
#  Created on 20210722
#  Purpose: Script searches forward or backward in time to 
#  generate either a sequence of dates or a date corresponding 
#  to the last day in a sequence of dates. The current scipt 
#  uses Linux's built-in date function so handles any date with 
#  the format YYYYMMDD as well as leap years.
#  Usage:
#  1) For a sequence of 10 days in the future from YYYYMMDD
#	finddate.sh YYYYMMDD s+10
#  2) For a sequence of 10 days in the past from YYYYMMDD
#       finddate.sh YYYYMMDD s-10
#  3) For a date 10 days in the future from YYYYMMDD
#       finddate.sh YYYYMMDD d+10
#  4) For a date 10 days in the past from YYYYMMDD
#       finddate.sh YYYYMMDD d-10
##############################################################
set +x
arg1=$1
arg2=$2
sod=`echo ${arg2} | cut -c1`
dir=`echo ${arg2} | cut -c2`
num=`echo ${arg2} | cut -c3-`

##############################################################
## Input error handling
if [ $# != 2 ]; then
   echo "Number of input must equal 2"
   exit 1
fi
if [ ${#arg1} != 8 ]; then
   echo "Length of first input must be 8, formatted as YYYYMMDD"
   exit 1
fi
if ! [[ $(date -d "${arg1}") ]]; then
   exit 1
fi
if [ ${sod} != 's' -a ${sod} != 'd' ]; then
   echo "First argument of second input must be 's' or 'd'. You use ${sod}."
   exit 1
fi
if [ ${dir} != '+' -a ${dir} != '-' ]; then
   echo "Second argument of second input must be '+' or '-'. You use ${dir}."
   exit 1
fi
if ! [[ "${num}" =~ ^[0-9]+$ ]]; then
   echo "Third argument of second input must be an integer. You use ${num}."
   exit 1
fi

##############################################################
# Create date or sequence of dates based on input arguments
if [ ${sod} == 's' ]; then
for p in $(seq ${num}); do
   pdstr+=$(date -d "${arg1} ${dir}${p} days" +"%Y%m%d ") 
done
elif [ ${sod} == 'd' ]; then
   pdstr=$(date -d "${arg1} ${dir}${num} days" +"%Y%m%d")
fi
echo $pdstr

