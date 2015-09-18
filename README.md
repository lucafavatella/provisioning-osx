## Provisioning of development Mac OS X box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)

```
$ ./provision_osx
```

### TODO

* Gather fact in Ansible depending on output of command line (e.g. kerl - see if build is already installed - new module in galaxy?) in order not to try to build OTP anytime but only if not built yet
* Compile Erlang/OTP using option re file descriptors at https://github.com/Homebrew/homebrew/issues/6143
* Re-evaluate Erlang/OTP OSX build options "./configure --with-dynamic-trace=dtrace --enable-darwin-64bit --disable-hipe"
