#!/bin/bash

su - vagrant -c "curl -s get.gvmtool.net | bash"
su - vagrant -c 'source "/home/vagrant/.gvm/bin/gvm-init.sh"'
su - vagrant -c "gvm i grails 2.5.0"
su - vagrant -c "gvm d grails 2.5.0"
