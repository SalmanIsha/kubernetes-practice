kube_node = 2
net = "192.168.3."
kube_node_start = 100

Vagrant.configure("2") do |config|

config.vm.box = "bento/centos-7.6"

config.vm.define "master" do |node|
		node.vm.provider "virtualbox" do |vb|
			vb.name = "master"
			vb.memory = 2048
			vb.cpus = 2
			end
		node.vm.hostname = "master"
        node.vm.network :private_network, ip: "192.168.3.106"
		end
config.vm.provision "shell", path: "setup.sh"
	

(1..kube_node).each do |i|
	config.vm.define "kube-#{i}" do |node|
		node.vm.provider "virtualbox" do |vb|
			vb.name = "kube-#{i}"
			vb.memory = 2048
			vb.cpus = 2
			end
		node.vm.hostname = "kube-#{i}"
        node.vm.network :private_network, ip: net + "#{kube_node_start + i}"
		end
	config.vm.provision "shell", path: "setup.sh"
	end



end
