#!/usr/bin/bash

echo "Build Starting"

rm -rf ./docs
rm -rf ./node_modules
rm -rf ./peersocial.io

git clone https://github.com/PeerSocial-io/PeerSocial.io.git ./peersocial.io

cd ./peersocial.io
npm install

cd ../
mv ./peersocial.io/node_modules ./node_modules
cd ./node_modules
ln -s ../peersocial.io ./peersocial.io
cd ../peersocial.io

ln -s ../node_modules ./node_modules

npm run build-dev

cp -a ./build ../docs

cd ..

rm -rf ./node_modules
rm -rf ./peersocial.io

git checkout -b build
git add docs
git commit -m "update"
git push origin build -f


echo "Build Done"

