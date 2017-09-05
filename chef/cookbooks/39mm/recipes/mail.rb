#
# common
#

cookbook_file '/etc/aliases' do
  source 'mail/aliases'
end
execute 'newaliases'

#
# SMTP
#

package 'exim4' do
  action :purge
end
package 'postfix'
cookbook_file '/etc/postfix/main.cf' do
  source 'mail/postfix_main.cf'
end
service 'postfix' do
  action :restart
end
