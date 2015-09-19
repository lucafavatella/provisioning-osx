## Provisioning of development Mac OS X box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)

```
$ ./provision_osx
```

### TODO

* Re-organize files in repo following FHS
* Add OSX-specific script that opens tmux window (in already-opened tmux session) with all monitoring tools in OSX e.g. tmux-osx-mon running panes with `top -o cpu` `sudo iosnoop` .... Refs https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened/5752901#5752901 http://dtrace.org/blogs/brendan/2011/10/10/top-10-dtrace-scripts-for-mac-os-x/
* Gather fact in Ansible depending on output of command line (e.g. kerl - see if build is already installed - new module in galaxy?) in order not to try to build OTP anytime but only if not built yet
* Compile Erlang/OTP using option re file descriptors at https://github.com/Homebrew/homebrew/issues/6143
* Re-evaluate Erlang/OTP OSX build options "./configure --with-dynamic-trace=dtrace --enable-darwin-64bit --disable-hipe"
