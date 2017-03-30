
{ :hostname => 'cli-centos5', :ip => '10.100.0.10', :mac => '525400010010', :box => '', :ram => 512 , :script => 'provisioning/rear/centos5.sh' },
{ :hostname => 'cli-centos6', :ip => '10.100.0.11', :mac => '525400010011', :box => '', :ram => 512 , :script => 'provisioning/rear/centos6.sh' },
{ :hostname => 'cli-centos7', :ip => '10.100.0.12', :mac => '525400010012', :box => '', :ram => 512 , :script => 'provisioning/rear/centos7.sh' },
{ :hostname => 'cli-osuse13', :ip => '10.100.0.13', :mac => '525400010013', :box => '', :ram => 512 , :script => 'provisioning/rear/.sh' },
{ :hostname => 'cli-osuse42', :ip => '10.100.0.14', :mac => '525400010014', :box => '', :ram => 512 , :script => 'provisioning/rear/.sh' },
{ :hostname => 'cli-ubuntu14', :ip => '10.100.0.15', :mac => '525400010015', :box => '', :ram => 512 , :script => 'provisioning/rear/.sh' },
{ :hostname => 'cli-ubuntu16', :ip => '10.100.0.16', :mac => '525400010016', :box => '', :ram => 512 , :script => 'provisioning/rear/.sh' },
{ :hostname => 'cli-debian6', :ip => '10.100.0.17', :mac => '525400010017', :box => '', :ram => 512 , :script => 'provisioning/rear/.sh' },
{ :hostname => 'cli-debian7', :ip => '10.100.0.18', :mac => '525400010018', :box => '', :ram => 512 , :script => 'provisioning/rear/.sh' },
{ :hostname => 'cli-debian8', :ip => '10.100.0.19', :mac => '525400010019', :box => '', :ram => 512 , :script => 'provisioning/rear/.sh' },
{ :hostname => 'srv-ubuntu', :ip => '10.100.0.20', :mac => '525400010020', :box => '', :ram => 512 , :script => 'provisioning/drlm/ubuntu.sh' },
{ :hostname => 'srv-debian', :ip => '10.100.0.21', :mac => '525400010021', :box => '', :ram => 512 , :script => 'provisioning/drlm/debian.sh' },

## force MACs
## http://serverfault.com/questions/40712/what-range-of-mac-addresses-can-i-safely-use-for-my-virtual-machines
## https://github.com/vagrant-libvirt/vagrant-libvirt/issues/426

# ReaR boxes definition
declare -A rear
#rear[$distro.$param]=''

#debian8 client
rear[debian8.hostname]=
rear[debian8.ip]=
rear[debian8.mac]=
rear[debian8.box]=
rear[debian8.ram]=
rear[debian8.script]=
rear[debian8.gport]=

#ubuntu16 client
rear[ubuntu16.hostname]=
rear[ubuntu16.ip]=
rear[ubuntu16.mac]=
rear[ubuntu16.box]=
rear[ubuntu16.ram]=
rear[ubuntu16.script]=
rear[ubuntu16.gport]=

# DRLM boxes definition
declare -A drlm
#drlm[$distro.$param]=''

#debian8 server
drlm[debian8.hostname]=
drlm[debian8.ip]=
drlm[debian8.mac]=
drlm[debian8.box]=
drlm[debian8.ram]=
drlm[debian8.script]=
drlm[debian8.gport]=

#ubuntu16 server
drlm[ubuntu16.hostname]=
drlm[ubuntu16.ip]=
drlm[ubuntu16.mac]=
drlm[ubuntu16.box]=
drlm[ubuntu16.ram]=
drlm[ubuntu16.script]=
drlm[ubuntu16.gport]=
