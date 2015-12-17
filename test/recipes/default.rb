node.default['formatron_ntp']['servers'] = [
  'servers 0.nl.pool.ntp.org',
  'servers 1.nl.pool.ntp.org',
  'servers 2.nl.pool.ntp.org',
  'servers 3.nl.pool.ntp.org',
]
node.default['formatron_ntp']['listen_on'] = ['*']
include_recipe 'formatron_ntp::default'
