Vagrant.require_version ">= 2.4.0"

Vagrant.configure("2") do |config|

    # Use the Ubuntu LTS (24.04) box
    # https://app.vagrantup.com/bento/boxes/ubuntu-24.04
    config.vm.box = "bento/ubuntu-24.04"

    # Use virtualbox instead of Docker as we need to run Docker inside the VM
    config.vm.provider "virtualbox" do |v|
        v.name = "django_auxiliary_services"
        # Set to rather large for development speed
        v.memory = 8192
        v.cpus = 4
      end

    # This doesn't actually work because Ansible is in a Pipenv
    # so we call `pipenv run ansible-playbook` manually.
    # We include this year so it generates the
    # .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory file
    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "playbooks/provision.yaml"
    end
end