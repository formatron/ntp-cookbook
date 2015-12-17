version = node['formatron_ntp']['version']
servers = node['formatron_ntp']['servers']
listen_on = node['formatron_ntp']['listen_on']

# purge ntp and restart apparmor if present
# to avoid issue installing openntpd
package 'ntp' do
  action :purge
  notifies :restart, 'service[apparmor]', :immediately
end
service 'apparmor' do
  supports status: true, restart: true, reload: false
  ignore_failure true
  action :nothing
end

package 'ntpdate' do
  action :purge
end

package 'openntpd' do
  version version
end

template '/etc/openntpd/ntpd.conf' do
  variables(
    listen_on: listen_on,
    servers: servers
  )
  notifies :restart, 'service[openntpd]', :delayed
end

service 'openntpd' do
  supports status: true, restart: true, reload: false
  action [ :enable, :start ]
end
