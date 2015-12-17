version = node['formatron_ntp']['version']
servers = node['formatron_ntp']['servers']

package 'ntp' do
  version version
end

template '/etc/ntp.conf' do
  variables(
    servers: servers
  )
  notifies :restart, 'service[ntp]', :delayed
end

service 'ntp' do
  supports status: true, restart: true, reload: false
  action [ :enable, :start ]
end
