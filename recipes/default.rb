version = node['formatron_ntp']['version']
servers = node['formatron_ntp']['servers']
listen_on = node['formatron_ntp']['listen_on']

package 'ntp' do
  action :remove
end

package 'ntpdate' do
  action :remove
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
