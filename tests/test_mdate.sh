#!/bin/bash
#
# This is a test for the NCEPLIBS-prod_util project. This test runs
# the mdate utility.
#
# Alex Richert, 9/23
set -x
exe=${1:-mdate}

MDATE_REF_A=$(TZ=UT date +%Y%m%d%H%M)
MDATE_TEST_A=$($exe)
if [ "$MDATE_REF_A" -eq "$MDATE_TEST_A" ]; then
  pass=A
else
  echo "$exe (test 1) reference output '$MDATE_REF_A' does not match test output '$MDATE_TEST_A'"
fi

MDATE_REF_B=202309141214
MDATE_TEST_B=$($exe -20 202309141234)
if [ "$MDATE_REF_B" -eq "$MDATE_TEST_B" ]; then
  pass=${pass}B
else
  echo "$exe (test 2) reference output '$MDATE_REF_B' does not match test output '$MDATE_TEST_B'"
fi

if [ "$pass" != AB ]; then
  exit 1
fi
