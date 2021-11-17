Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian10"

  config.vm.provider "libvirt" do |v|
    v.memory = 8072
    v.cpus = 4
  end

  config.vm.define "cronos_env"

  $script = <<-SCRIPT
  echo I am provisioning...
  # enable ansible localhost in order to run ansible-playbook inside vagrant
  sed -i "s/.*PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config
  service ssh restart
  SCRIPT

  config.vm.provision "shell", inline: $script

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/deploy.yml"
    ansible.groups = {
      "matic" => ["cronos_env"],
    }
  end
end
