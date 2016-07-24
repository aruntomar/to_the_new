name 'base'
description 'Base role for all the nodes'
run_list(
  'recipe[chef-client]',
  'recipe[ntp]',
  'recipe[git]'
)
default_attributes()
override_attributes()
