#!/bin/bash
mkdir ~/bin
PATH=~/bin:$PATH
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git config --global user.name "kiam001"
git config --global user.email "blablatupfen@gmail.com"
touch PROCESSRUNNING
mkdir -p builds
mkdir crdroid
cd crdroid
repo init -u git://github.com/crdroidandroid/android.git -b 10.0 --depth=1
mkdir .repo/local_manifests
cd .repo/local_manifests
wget https://raw.githubusercontent.com/Sohamlad7/android_development_manifest/local_manifests/lineage-17.1.xml
cd ../../
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
. build/envsetup.sh
brunch cedric
scp out/target/product/cedric/crDroidAndroid-10.0* "kiam001@frs.sourceforge.net:/home/frs/project/kiam001-build-roms/Device\ Cedric\ \(Moto\ G5\)/android10"
cp out/target/product/cedric/crDroidAndroid-10.0* ../builds
cd ../
rm -rf crdroid
rm PROCESSRUNNING
echo done
