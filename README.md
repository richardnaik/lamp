# lamp Cookbook

Provisions a LAMP server on CentOS 7.2 with Apache, PHP 7.0, and MariaDB Server 10.1. This cookbook was written for 
personal use as both a development enviroment and a production server, and also for experimenting with
Chef and Terraform.

A small integration test will check for the appropriate ports and services upon 
a `kitchen verify` run

## Requirements

This cookbook is specifically built to not depend on any public cookbooks.

### Platforms

- CentOS 7
- VirtualBox (for local VMs)
- Vagrant (with the vagrant-vbguest plugin)

### Chef

- Chef 12.0 or later

## Attributes

### lamp::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['httpd']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Enable Apache. Will grab the latest stable version.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['php']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Enable PHP. Will grab the latest stable version of PHP 7.1.</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['mariadb']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Enable MySQL. Will grab the latest stable version of MariaDB 10.1</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['mysql']['postgres']</tt></td>
    <td>Boolean</td>
    <td>Enable PostgreSQL. Will grab the latest stable version of PostgreSQL 9.6</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### lamp::default

Just include `lamp` in your node's `run_list`. Only the `default` recipe is required. Use the `enabled` attributes above to specify what to install.

## License and Authors

Authors: Richard Naik (richardnaik@gmail.com)
