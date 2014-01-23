Vagrant.configure("2") do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    config.vm.network :public_network
    config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true

    config.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.customize [
            "modifyvm", :id,
            "--memory", "384",
            "--name", 'jenkins-ci-php'
        ]
    end

    config.vm.provision :shell, :path => "provision.sh"
end
