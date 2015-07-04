# social-grails
Social Grails App

#How to use Vagrant

Vagrant is a tool for building and distributing development environments.

Documentation is located in: [https://docs.vagrantup.com/v2/](https://docs.vagrantup.com/v2/ "Vagrant Documentation")

You need to install Chef-dk (https://downloads.chef.io/chef-dk) and vagrant-berkshelf:

```
vagrant plugin install vagrant-berkshelf
```

## Run Vagrant 

```
cd /path/to/social-grails/
vagrant up
vagrant ssh
```

## Seed create database and seed data (first time):

```
vagrant ssh
cd /social-grails/

```

## Start local server:

Visit URL
```
http://192.168.33.19:3004/
```

# PROBLEMS?

## Restart services MySQL and Redis Server
```
sudo service mysql restart
sudo service redis-server restart
```

