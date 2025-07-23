#!/bin/bash 
cp -rv phenix/ /opt/phenix-tmp
cp -rv sceptre-phenix /opt/sceptre-phenix

cd /opt/phenix; make clean
docker rmi -f $(docker images -aq)
yes | docker system prune 
docker rmi phenix

cd /opt
rm -rfv /opt/phenix
mv -vf /opt/phenix-tmp /opt/phenix
bash /opt/sceptre-phenix/build.sh
