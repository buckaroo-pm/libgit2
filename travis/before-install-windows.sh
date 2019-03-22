#!/bin/bash

c++ --version
g++ --version
gcc --version

mkdir -p bin

wget -c https://github.com/njlr/buck-warp/releases/download/v0.2.0/buck-2019.01.10.01-windows.exe -O bin/buck
chmod +x ./bin/buck
./bin/buck --version

wget -c https://github.com/LoopPerfect/buckaroo/releases/download/$BUCKAROO_VERSION/buckaroo-windows.exe -O bin/buckaroo
chmod +x ./bin/buckaroo
./bin/buckaroo version
