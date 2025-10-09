Vagrant.configure(2) do |config|
  config.vm.box = "generic/debian12"
  # config.vm.box_url = REDACTED
  config.vm.define "MathieuS" do |control|
    control.vm.hostname = "MathieuS"
    control.vm.network "private_network", ip: "192.168.121.110"
    control.vm.provider "libvirt" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    control.vm.provision :shell, inline: <<-SHELL
      apt-get update
      apt-get install -y curl ca-certificates iptables iproute2 conntrack socat

      curl -sfL https://get.k3s.io | K3S_TOKEN="12345" INSTALL_K3S_EXEC="server --node-ip=192.168.121.110" sh -
    SHELL
  end
  config.vm.define "MathieuSW" do |control|
    control.vm.hostname = "MathieuSW"
    control.vm.network "private_network", ip: "192.168.121.111"
    control.vm.provider "libvirt" do |v|
      v.memory = 512
      v.cpus = 1
    end
    control.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y curl ca-certificates iptables iproute2 conntrack socat

      curl -sfL https://get.k3s.io | K3S_URL="https://192.168.121.110:6443" K3S_TOKEN="12345" INSTALL_K3S_EXEC="agent --node-ip=192.168.121.111" sh -
    SHELL
  end
end
