# Go debian package

## How to install

 wget https://github.com/fclairamb/nsq-debian-package/releases/download/1.4.2/golang_1.4.2_amd64.deb -O /tmp/golang.deb.tmp && mv /tmp/golang.deb.tmp /tmp/golang.deb
 sudo dpkg -i /tmp/golang.deb

Then for each user using go, you should issue the command:

 go-prepare-env

## What does it do ?

* Install the go files in /opt/go
* Create some symbolic links from /opt/go/bin to /usr/bin
* Add a specific go-prepare-env script to make it simpler for user to set their go environment

## Target

Works on any amd64 debian based distribution (Debian 5+, Ubuntu 12+).

## Why ?

Go installation page is not very hard but confusing enough for people to give up on it.

## Doesn't it already exist ?

Debian packages indeed exist but they are outdated (even the rc-buggy one) and
they enforce the complex debian packaging rules. Which implies providing completely
recompiled binaries.

Here, it's the official golang binaries.
