Vagrant.configure(2) do |config|
  config.vm.box = "generic/debian12"

  config.vm.define "MathieuS" do |control|
    control.vm.hostname = "MathieuS"
    control.vm.network "private_network", ip: "192.168.122.110"
    control.vm.synced_folder "./vagrant", "/mnt", create: true, nfs_udp: false
    control.vm.provider "libvirt" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    
    control.vm.provision :shell, path: "k3s-install.sh"
  end
  
  config.vm.define "MathieuSW" do |control|
    control.vm.hostname = "MathieuSW"
    control.vm.network "private_network", ip: "192.168.122.111"
    control.vm.synced_folder "./vagrant", "/mnt", create: true, nfs_udp: false
    control.vm.provider "libvirt" do |v|
      v.memory = 512
      v.cpus = 1
    end
    control.vm.provision "shell", path: "k3s-agent-install.sh"
  end
end
