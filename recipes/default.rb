#
# Author:: Sebastiaan van Parijs (<office@refactory.it>)
# Cookbook Name:: typo3flow
# Attributes:: default
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

include_recipe "nginx"
include_recipe "mysql::server"
include_recipe "database::mysql"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "php::module_apc"
include_recipe "php::module_gd"
include_recipe "php-fpm"
include_recipe "composer"


# ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----

#site_docroot = "#{node['apache']['docroot_dir']}/site-#{node['typo3']['site_name']}"
#typo3_source_directory = "#{site_docroot}/typo3_src-#{node['typo3']['version']}"

include_recipe "typo3flow::_database"
include_recipe "typo3flow::_config"

#if !node['typo3']['package'].empty?
#  include_recipe "typo3::_package"
#else
#  include_recipe "typo3::_source"
#end

# create actual directories, set permissions
#%w{
#  fileadmin
#  typo3conf
#  typo3conf/ext
#  typo3temp
#  uploads
#}.each do |directory|
##  directory "#{site_docroot}/#{directory}" do
#    owner node['apache']['user']
#    group node['apache']['group']
#    mode "0755"
#    recursive true
#  end
#end

# enable install tool
#file "#{site_docroot}/typo3conf/ENABLE_INSTALL_TOOL" do
#  owner node['apache']['user']
#  group node['apache']['group']
#  mode "0755"
#  action :touch
#end

# create TYPO3 site / web app
Chef::Log.info "Setting up TYPO3 site \"#{node['typo3']['site_name']}\""
#web_app node['typo3']['site_name'] do
#  template "typo3-web_app.conf.erb"
#  docroot site_docroot
#  server_name node['typo3']['server_name']
#  server_aliases node['typo3']['server_aliases']
#end
