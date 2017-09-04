#template '/etc/apt/sources.list' do
#  source 'sources.list.erb'
#end

# update, upgrade
execute 'package_update' do
  command 'apt-get update'
end
execute 'package_upgrade' do
  command 'apt-get upgrade --yes'
end
