name 'development'
description 'Local development environment configuration'

override_attributes(
    # Cascadia Cookbook: 'cron'
    cas_cron: {
        jobs: {
            magento_cron_run: {
                environment: {
                    HOME: '/vagrant/magento'
                    PATH: '/usr/bin',
                },
                predefined_value: '* * * * *',
                user: 'vagrant',
                command: "php bin/magento cron:run | grep -v 'Ran jobs by schedule' >> var/log/magento.cron.log"
            }
        }
    },
    # Cascadia Cookbook: 'magento'
    cas_magento: {
        directories: {
            owner: 'vagrant',
            group: 'vagrant'
        }
    }
)
