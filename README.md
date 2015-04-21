# Go debian package

## How to install

    wget https://github.com/fclairamb/golang-debian-package/releases/download/1.4.2/golang-alt_1.4.2_amd64.deb -O /tmp/golang.deb.tmp && mv /tmp/golang.deb.tmp /tmp/golang.deb
    sudo dpkg -i /tmp/golang.deb
    go-prepare-env

This last command should be issued for any user using the environment.

## What does it do ?

* Install the go files in /opt/go
* Create some symbolic links from /opt/go/bin to /usr/bin
* Add a specific go-prepare-env script to make it simpler for users to set their GOPATH environment variable

## Target

Works on any amd64/i386 debian based distribution (Debian 5+, Ubuntu 12+).

## Why ?

Packages are great. We should use them for everything.

## Doesn't it already exist ?

Debian packages indeed exist but they are outdated (even the rc-buggy one) and
they enforce the debian packaging rules. Which implies not providing the official
golang binaries.
