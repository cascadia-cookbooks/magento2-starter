name 'base'
description 'Basic CentOS system and package configuration'

run_list(
    'recipe[selinux::permissive]',
    'recipe[user::data_bag]',
    'recipe[sudo]',
    'recipe[cas_cron]',
    'recipe[yum-epel]',
    'recipe[packages]'
)

default_attributes(
    # Supermarket cookbook 'packages'
    'packages-cookbook': %w(
        htop
    ),
    # Supermarket cookbook 'sudo'
    authorization: {
        sudo: {
            users: ['vagrant'],
            passwordless: true,
            custom_commands: {
                groups: [{
                    group: 'magento',
                    passwordless: true,
                    command_list: [
                        '/bin/su magento'
                    ]
                }]
            }
        }
    },
    # Supermarket cookbook 'user'
    users: %w(
        magento
    )
)
