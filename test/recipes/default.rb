node.default['formatron_ntp']['servers'] = [
  '0.nl.pool.ntp.org',
  '1.nl.pool.ntp.org',
  '2.nl.pool.ntp.org',
  '3.nl.pool.ntp.org'
]
include_recipe 'formatron_ntp::default'
