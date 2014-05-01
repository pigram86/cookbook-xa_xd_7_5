# xd7.5 cookbook
Cookbook for installing Citrix XenApp and XenDesktop 7.5

# Requirements
Chef - Depends on Windows Cookbook

# Usage
Use when installing XenApp o XenDesktop 7.5

# Attributes
default['xa_xd_7_5']['url']  - URL for media download
default['xa_xd_7_5']['dir']  - Location of media
default['ctrl']['srv']  - Location of Controller Software
default['director']['dir']  - Location of Director Software
default['licsrv']['dir'] - Location of License Software
default['stfr']['dir'] - Location of Storefront Software
default['studio']['dir'] - Location of Studio Software
default['vda']['dir'] - Location of VDA Software

# Recipes
all_in_one.rb - Installs all components 
controller.rb - Installs Controller component with SQL Express
ctrl_nosql.rb - Installs Controller component w/o SQL
default.rb
director.rb - Installs Desktop Director component
license.rb - Installs Citrix License component
prof_mgmnt.rb - Installs Profile Mgmnt component
storefront.rb - Installs Citrix Storefront component
studio.rb - Installs Desktop Studio component
vda_hosted.rb - Installs VDA for XenApp
vda_hosted_master.rb - Installs VDA for XenApp and sets as master image.

# Author

Author:: Todd Pigram (<todd@toddpigram.com>)
