name 'nginx'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures nginx'
long_description 'Installs/Configures nginx'
version '0.1.0'

%w( build-essential java ).each do |cb|
  depends cb
end

# %w( ubuntu debian ).each do |os|
%w( centos ).each do |os|
  supports os
end
