# Go debian package

## How to install

    wget https://github.com/fclairamb/golang-debian-package/releases/download/1.4.2/golang-alt_1.4.2_amd64.deb -O /tmp/golang.deb.tmp && mv /tmp/golang.deb.tmp /tmp/golang.deb
    sudo dpkg -i /tmp/golang.deb
    go-prepare-env

This last command should be issued for any user using the environment.

## Why ?

This allows to install go very quickly.

[Godeb](https://github.com/niemeyer/godeb) might be a better fit than this tool but it doesn't provide DEB files as-is.

## What does it do ?

* Install the go files in /opt/go
* Create some symbolic links from /opt/go/bin to /usr/bin
* Add a specific go-prepare-env script to make it simpler for users to set their GOPATH environment variable
