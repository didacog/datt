
{ :hostname => 'rear-centos', :fport => 22210 , :ip => '10.100.0.10', :mac => '080027010010', :net => 'vboxnet1', :nic => 2 , :box => 'minimal/centos7', :ram => 512 , :script => 'shell/rear_centos.sh' },
{ :hostname => 'rear-suse', :fport => 22211 , :ip => '10.100.0.11', :mac => '080027010011', :net => 'vboxnet2', :nic => 2 , :box => 'opensuse/openSUSE-42.1-x86_64', :ram => 512 , :script => 'shell/rear_suse.sh' },
{ :hostname => 'rear-ubuntu', :fport => 22212 , :ip => '10.100.0.12', :mac => '080027010012', :net => 'vboxnet2', :nic => 2 , :box => 'minimal/xenial64', :ram => 512 , :script => 'shell/rear_ubuntu.sh' },
{ :hostname => 'rear-debian', :fport => 22213 , :ip => '10.100.0.13', :mac => '080027010013', :net => 'vboxnet1', :nic => 2 , :box => 'minimal/jessie64', :ram => 512 , :script => 'shell/rear_debian.sh' },
{ :hostname => 'drlm-ubuntu', :fport => 22250 , :ip => '10.100.0.50', :mac => '080027010050', :net => 'vboxnet1', :nic =>  2 , :ip2 => '10.200.0.50', :mac2 => '080027020050', :net2 => 'vboxnet2', :nic2 => 3 , :box => 'minimal/xenial64', :ram => 512 , :script => 'shell/drlm_ubuntu.sh' },
{ :hostname => 'drlm-debian', :fport => 22260 , :ip => '10.100.0.60', :mac => '080027010060', :net => 'vboxnet1', :nic =>  2 , :ip2 => '10.200.0.60', :mac2 => '080027020060', :net2 => 'vboxnet2', :nic2 => 3 , :box => 'minimal/jessie64', :ram => 512 , :script => 'shell/drlm_debian.sh' },

## force MACs
## http://serverfault.com/questions/40712/what-range-of-mac-addresses-can-i-safely-use-for-my-virtual-machines
## https://github.com/vagrant-libvirt/vagrant-libvirt/issues/426
