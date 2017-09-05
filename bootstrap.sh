#! /bin/sh
# 39mm bootstrap script
# wget -q -O- https://github.com/nilx/39mm/raw/master/bootstrap.sh | sh

set -e
set -x

# require git and chef
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install --quiet --yes --no-install-recommends git chef
# get 39mm recipes
git clone https://github.com/nilx/39mm.git
# run 39mm recipes
cd 39mm/chef
./setup.sh
#reboot
