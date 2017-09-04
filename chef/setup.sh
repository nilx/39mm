#! /bin/sh

# run rasp cookbook from default recipe
sudo chef-client -z -c client.rb -r "recipe[39mm]"
