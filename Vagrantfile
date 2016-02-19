Vagrant.configure("2") do |config|

    config.vm.define :terraform do |node|
        node.vm.box = "box-cutter/ubuntu1404-desktop"
        node.ssh.insert_key = false

        node.vm.hostname = :terraform
        node.vm.network :private_network, ip: "192.168.66.57"

        node.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", 1024]
            vb.customize ["modifyvm", :id, "--cpus", 1]
        end

        node.vm.synced_folder "../environment", "/environment"

        node.vm.provision :shell, inline: <<-eos
            sudo apt-get update -y
            sudo apt-get -y install python-pip unzip

            sudo pip install -U pip
            sudo pip install awscli troposphere commandr termcolor awacs pyyaml

            wget https://releases.hashicorp.com/terraform/0.6.11/terraform_0.6.11_linux_amd64.zip
            unzip terraform/0.6.11/terraform_0.6.11_linux_amd64.zip
        eos
    end

end
