#
# Author:: Sebastiaan van Parijs (<office@refactory.it>)
# Cookbook Name:: typo3flow
# Attributes:: _config
#
# Copyright 2014, Sebastiaan van Parijs
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# prepare php.ini config
cookbook_file "/etc/php5/conf.d/php_custom.ini" do
	source "php_custom.ini"
	mode 0655
end

cookbook_file "/etc/php5/fpm/pool.d/www.conf" do
	source "www.conf"
	mode 0644
end

template "upstream_php-fpm.conf" do
  path "#{node['nginx']['dir']}/conf.d/fpm.conf"
  source "upstream_php-fpm.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

# enable host and disable default host
nginx_site "000-default" do
	enable false
end

service "php5-fpm" do
  action :start
end