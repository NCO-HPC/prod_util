#!/bin/bash
set -x
exe=${1:-nhour}

# nhour rounds to the nearest hour, so if the current time is half or more past
# the hour (xx:30 to xx:59 range), we need to adjust the expected answers for
# the first two tests, where we are testing the one-argument version of nhour
# (i.e., it is using the current system time).
if [ $(date +%M) -ge 30 ]; then
  offset=1
else
  offset=0
fi

NHOUR_REF_A=$((00-$offset))
NHOUR_TEST_A=$($exe $(TZ=UT date +%Y%m%d%H))
if [ "$NHOUR_REF_A" -eq "$NHOUR_TEST_A" ]; then
  pass=A
else
  echo "$exe (test 1) reference output '$NHOUR_REF_A' does not match test output '$NHOUR_TEST_A'"
fi

NHOUR_REF_B=$((27-$offset))
NHOUR_TEST_B=$($exe $(TZ=UT date -d 'now +27hours' +%Y%m%d%H))
if [ "$NHOUR_REF_B" -eq "$NHOUR_TEST_B" ]; then
  pass=${pass}B
else
  echo "$exe (test 2) reference output '$NHOUR_REF_B' does not match test output '$NHOUR_TEST_B'"
fi

NHOUR_REF_C=20
NHOUR_TEST_C=$($exe $(TZ=UT date -d 'now +27hours' +%Y%m%d%H) $(TZ=UT date -d 'now +7hours' +%Y%m%d%H))
if [ "$NHOUR_REF_C" -eq "$NHOUR_TEST_C" ]; then
  pass=${pass}C
else
  echo "$exe (test 3) reference output '$NHOUR_REF_C' does not match test output '$NHOUR_TEST_C'"
fi

if [ "$pass" != ABC ]; then
  exit 1
fi
