# Why ?
In some cases developers wish to debug legacy code on specific machines because they are integrating their code with legacy compiled files.
For example , compiled C/C++ code (from `.c`) into `.so` file and whoever compiled it , unfourntley, `.so` files can't be used for mac users or windows, therefore spinning up an ubuntu/debian/whatever distros is an option.

# How ?

## Prequisites
 - Docker
 - Socat 
 - XQuartz
## Building it (Not needed unless you want to build image locally)
```
./build.sh
```
## Running it

```
./run.sh
```


 ## Windows users 
 You may follow this guide in order to find how to get Xquartz+Socat on your machine/s:
 https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde
 