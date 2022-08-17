#!/bin/bash

module load cpe-intel
module load intel/19.1.3.304
module load w3nco/2.4.1

for dir in fsync_file.cd  mdate.fd  ndate.fd  nhour.fd; do
  cd $dir
  exe=${dir/.*/}
  rm -f $exe
  make
  if [ $? -eq 0 ]; then
    mv -v $exe ../../exec/.
  fi
  cd ..
done
