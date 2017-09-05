#
# SSL certs
#

package 'dehydrated'
cookbook_file '/etc/dehydrated/domains.txt' do
  source 'www/dehydrated_domains.txt'
end
cookbook_file '/etc/dehydrated/hook.sh' do
  source 'www/dehydrated_hook.sh'
  mode '0755'
end
# run now ...
execute 'dehydrated' do
  command 'dehydrated --cron'
end
# ... and every day
cron 'dehydrated' do
  command 'dehydrated --cron --hook /etc/dehydrated/hook.sh'
  time    :daily
end

#
# HTTP
#

package 'nginx-light'

directory '/srv/www'
directory '/srv/www/mail.39mm.net'
file '/srv/www/mail.39mm.net/index.txt' do
  content '''
EHLO
'''
end

cookbook_file '/etc/nginx/sites-available/mail.39mm.net' do
  source 'www/nginx_mail.39mm.net'
end
link '/etc/nginx/sites-enabled/00_mail.39mm.net' do
  to '/etc/nginx/sites-available/mail.39mm.net'
end

service 'nginx' do
  action :restart
end
