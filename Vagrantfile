Vagrant.configure(2) do |config|
  config.vm.box = "generic/debian12"
  # config.vm.box_url = REDACTED
  config.vm.define "MathieuS" do |control|
    control.vm.hostname = "MathieuS"
    control.vm.network "private_network", ip: "192.168.121.110"
    control.vm.provider "libvirt" do |v|
      v.memory = 512
      v.cpus = 1
    end
    config.vm.provision :shell, inline: <<-SHELL
      curl -fsSL get.docker.com | sh
      curl -sfL https://get.k3s.io | sh -
    SHELL
  end
  config.vm.define "MathieuSW" do |control|
    control.vm.hostname = "MathieuSW"
    control.vm.network "private_network", ip: "192.168.121.111"
    control.vm.provider "libvirt" do |v|
      v.memory = 512
      v.cpus = 1
    end
    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      curl -fsSL get.docker.com | sh
      curl -sfL https://get.k3s.io | sh -
    SHELL
  end
end
