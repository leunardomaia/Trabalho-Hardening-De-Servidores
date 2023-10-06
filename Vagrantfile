Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.synced_folder ".", "/vagrant"

  # Primeira máquina virtual
  config.vm.define "ana" do |ana|
    ana.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
    end
  
    ana.vm.network "forwarded_port", guest: 80, host: 8081
    ana.vm.network "public_network"

    ana.vm.provision "shell", path: "script_ana.sh"
  end

  # Segunda máquina virtual
  config.vm.define "leo" do |leo|
    leo.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
    end

    leo.vm.network "forwarded_port", guest: 80, host: 8082
    leo.vm.network "public_network"

    leo.vm.provision "shell", path: "script_leo.sh"
  end

end