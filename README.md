# webserver Cookbook

Provisions a LAMP server on CentOS 7.2 with Apache, PHP 7.0, and Percona Server 5.7. This cookbook was written for 
personal use as both a development enviroment and a production server, and also for experimenting with
Chef and Terraform.

To bring up locally first install VirtualBox and Vagrant
then copy the `.kitchen.yml.example` file into `.kitchen.yml` and
run `kitchen converge`. Be sure to specify the location of your code in 
the `synced_folders` option.

A small integration test will check for the appropriate ports and services upon 
a `kitchen verify` run

## Requirements

This cookbook is specifically built to not depend on any public cookbooks.

### Platforms

- CentOS 7.2
- VirtualBox (for local VMs)
- Vagrant (with the vagrant-vbguest plugin)

### Chef

- Chef 12.0 or later

## Attributes

### webserver::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['php']['phalcon']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Enable the Phalcon framework. Will grab the latest stable version.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['mysql']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Enable MySQL. Will grab the latest stable version of Percona 5.7</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### webserver::default

Just include `webserver` in your node's `run_list`. Only the `default` recipe is required.

## License and Authors

Authors: Richard Naik (richardnaik@gmail.com)
