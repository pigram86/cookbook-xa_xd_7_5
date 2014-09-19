#
# Cookbook Name:: xd7.5
# Recipe:: vda_vdi_base
#
# Copyright (C) 2014 Todd Pigram
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
windows_zipfile "xa_xd_7_5" do
  source node['xa_xd_7_5']['url']
  action :unzip
  not_if {::File.exists?(node['xa_xd_7_5']['dir'])}
  not_if {reboot_pending?}
end

batch "vda_hosted" do
  code <<-EOH
  c:\\xa_xd_7_5\\x64\\XenDesktopSetup\\XenDesktopVdaSetup.exe /quiet /controllers "mai-xenbroker1.maiwealth.local" /enable_hdx_ports /optimize /masterimage /enable_remote_assistance
  EOH
  not_if {::File.exists?(node['vda']['dir'])}
  not_if {reboot_pending?}
end

windows_reboot 60 do
  reason 'Chef said to'
  only_if {reboot_pending?}
end