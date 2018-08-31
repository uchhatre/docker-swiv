#!/bin/sh
cd /
git clone https://github.com/yahoo/swiv.git
cd swiv
git checkout 233e32a3005249da31c6b4fd75bc3037d8131970
npm i -g gulp
npm install
gulp
