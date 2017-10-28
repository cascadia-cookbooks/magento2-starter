name 'development'
description 'Local development environment configuration'

override_attributes(
    # Cascadia Cookbook: 'magento'
    cas_magento: {
        directories: {
            owner: 'vagrant',
            group: 'vagrant'
        }
    }
)
