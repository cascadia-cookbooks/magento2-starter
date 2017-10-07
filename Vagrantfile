Vagrant.configure('2') do |config|

    # Base operating system
    config.vm.box = 'centos/7'

    # Virtualbox VM configuration
    config.vm.provider 'virtualbox' do |vb|
        vb.cpus   = 2
        vb.memory = '2048'
        vb.gui    = false
    end

    #--- Vagrant plugins ---#

    # Vagrant plugin 'berkshelf'
    if Vagrant.has_plugin?('berkshelf')
        config.berkshelf.enabled = true
        config.berkshelf.berksfile_path = './chef/Berksfile'
    else
        abort('Please install Vagrant plugin "vagrant-berkshelf"')
    end

    # Vagrant plugin 'vagrant-hostmanager' 
    if Vagrant.has_plugin?('vagrant-hostmanager')
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
        config.hostmanager.ignore_private_ip = false
        config.hostmanager.include_offline = true
    end

    #--- End Vagrant plugins ---#


    #--- Database VM configuration ---#
    config.vm.define 'data' do |data|
        data.vm.hostname = 'db.cascadia.local'
        data.vm.network 'private_network', ip: '10.17.0.10'

        if Vagrant.has_plugin?('vagrant-hostmanager')
            data.hostmanager.aliases = %w(
                cache.cascadia.local
            )
        end

        # Chef provisioner
        data.vm.provision 'chef_zero' do |chef|
            chef.install = true
            chef.version = 'latest'
            chef.cookbooks_path = 'chef/cookbooks'
            chef.data_bags_path = 'chef/data_bags'
            chef.encrypted_data_bag_secret_key_path = 'chef/.chef/secret_key'
            chef.environment = 'development'
            chef.environments_path = 'chef/environments'
            chef.nodes_path = 'chef/nodes'
            chef.roles_path = 'chef/roles'

            chef.add_role 'data'
        end
    end
    #--- End Database VM configuration ---#


    #--- Web VM configuration ---#
    config.vm.define 'web' do |web|
        web.vm.hostname = 'web.cascadia.local'
        web.vm.network 'private_network', ip: '10.17.0.20'

        if Vagrant.has_plugin?('vagrant-hostmanager')
            web.hostmanager.aliases = %w(
                shop.cascadia.local
            )
        end

        # Chef provisioner
        web.vm.provision 'chef_zero' do |chef|
            chef.install = true
            chef.version = 'latest'
            chef.cookbooks_path = 'chef/cookbooks'
            chef.data_bags_path = 'chef/data_bags'
            chef.encrypted_data_bag_secret_key_path = 'chef/.chef/secret_key'
            chef.environment = 'development'
            chef.environments_path = 'chef/environments'
            chef.nodes_path = 'chef/nodes'
            chef.roles_path = 'chef/roles'

            chef.add_role 'web'
        end
    end
    #--- End Web VM configuration ---#

end
