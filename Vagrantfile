hosts = [
  { name: 'vm-lamp',      box: 'centos/7',	        mem: 4192,	netint: 1 },
	{ name: 'vm-elk',       box: 'centos/7',		      mem: 4192,	netint: 2 },
	{ name: 'vm-elk1',       box: 'zeab/ub-16.04-64x-elk',		      mem: 4192,	netint: 3 }
	
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
        node.vm.network :public_network, bridge: 'Intel(R) Ethernet Connection (2) I219-LM'
        node.vm.provision 'shell', path: 'bootstrap_lamp.sh'
      end

	   if host[:netint] == 2
        node.vm.network :public_network, bridge: 'Intel(R) Ethernet Connection (2) I219-LM'
        node.vm.provision 'shell', path: 'bootstrap_elk.sh'
       end
	   
	   if host[:netint] == 3
        node.vm.network :public_network, bridge: 'Intel(R) Ethernet Connection (2) I219-LM'
        
       end

    end
   config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'
    Vagrant::Config.run do |config|
      config.vbguest.auto_update = false
      config.vbguest.no_remote = true
    end
  end
end
