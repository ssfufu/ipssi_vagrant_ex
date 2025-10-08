Vagrant.configure(2) do |config|
  config.vm.box = "generic/debian12"
  # config.vm.box_url = REDACTED
  config.vm.define "mathieuS" do |control|
    control.vm.hostname = "mathieuS"
    control.vm.network "private_network", ip: "192.168.121.110"
    control.vm.provider "libvirt" do |v|
      v.memory = 512
      v.cpus = 1
    end
    config.vm.provision :shell, inline: <<-SHELL
      ls
    SHELL
  end
  config.vm.define "mathieuSW" do |control|
    control.vm.hostname = "mathieuSW"
    control.vm.network "private_network", ip: "192.168.121.111"
    control.vm.provider "libvirt" do |v|
      v.memory = 512
      v.cpus = 1
    end
    config.vm.provision "shell", inline: <<-SHELL
      ls
    SHELL
  end
end
