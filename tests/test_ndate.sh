#!/bin/bash
set -x
exe=${1:-ndate}

NDATE_REF_A=$(TZ=UT date +%Y%m%d%H)
NDATE_TEST_A=$($exe)
if [ "$NDATE_REF_A" -eq "$NDATE_TEST_A" ]; then
  pass=A
else
  echo "$exe (test 1) reference output '$NDATE_REF_A' does not match test output '$NDATE_TEST_A'"
fi

NDATE_REF_B=2023010206
NDATE_TEST_B=$($exe 12 2023010118)
if [ "$NDATE_REF_B" -eq "$NDATE_TEST_B" ]; then
  pass=${pass}B
else
  echo "$exe (test 2) reference output '$NDATE_REF_B' does not match test output '$NDATE_TEST_B'"
fi

if [ "$pass" != AB ]; then
  exit 1
fi
