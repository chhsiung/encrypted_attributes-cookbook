#
# Cookbook Name:: encrypted_attributes
# Recipe:: users_data_bag
#
# Copyright 2014, Onddo Labs, Sl.
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

include_recipe 'encrypted_attributes::default'

chef_users = Chef::DataBagItem.load(node['encrypted_attributes']['data_bag']['name'], node['encrypted_attributes']['data_bag']['item']).to_hash
chef_users.delete('id')
chef_users.delete('chef_type')
chef_users.delete('data_bag')
Chef::Log.debug("Chef users data bag content: #{chef_users.inspect}")

user_keys = chef_users.map do |user, public_key|
  public_key.kind_of?(Array) ? public_key.join("\n") : public_key
end
Chef::Log.debug("Admin users able to read Encrypted Attributes: #{user_keys.inspect}")

Chef::Config[:encrypted_attributes][:keys] = Array.new unless Chef::Config[:encrypted_attributes][:keys].kind_of?(Array)
Chef::Config[:encrypted_attributes][:keys] |= user_keys
