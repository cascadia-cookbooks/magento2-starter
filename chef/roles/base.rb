name 'base'
description 'Basic CentOS system and package configuration'

run_list(
    'recipe[selinux::permissive]',
    'recipe[yum-epel]',
    'recipe[packages]'
)

default_attributes(
    # Supermarket cookbook 'packages'
    'packages-cookbook': %w(
        htop
    )
)
