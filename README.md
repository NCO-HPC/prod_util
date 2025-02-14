#### Checkout Branch
git clone -b generic_v2.1.0 https://github.com/NCO-HPC/prod_util.git .
cd prod_util/

#### WCOSS2 - build with w3emc and bacio modules loaded
module load w3emc/2.12.0    
module load bacio/2.4.1
mkdir build 
cd build
cmake ../ -DCMAKE_INSTALL_PREFIX=$(pwd)/../
make 
make install

#### SPACK work in progress ....
