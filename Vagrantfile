hosts = [
    { name: 'vm-webserv',   box: 'centos/7',	          mem: 4192,	netint: 1 },
    { name: 'vm-mysqlserv',  box: 'ubuntu/xenial64',		mem: 4192,	netint: 2 }
]




Vagrant.configure('2') do |config|
  hosts.each do |host|
    config.vm.define host[:name] do |node|
      node.vm.box = host[:box]
      node.vm.hostname = host[:name]
      node.vm.provider :virtualbox do |vm|
        vm.memory = host[:mem]
      end

      if host[:netint] == 1
        node.vm.network :public_network, bridge: 'enp6s0'
        node.vm.provision 'shell', path: 'bootstrap_centos.sh'
      end

      if host[:netint] == 2
        node.vm.network :public_network, bridge: 'enp6s0'
        node.vm.provision 'shell', path: 'bootstrap_ubuntu.sh'
       end


    end
   config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'
    Vagrant::Config.run do |config|
      config.vbguest.auto_update = false
      config.vbguest.no_remote = true
    end
  end
end
