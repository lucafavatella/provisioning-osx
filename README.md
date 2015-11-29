## Provisioning of development Mac OS X box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)

```
$ bin/provision_osx
```

### TODO

* Whitelist folders. Refs: http://serverfault.com/questions/710020/ansible-whitelist-directory-contents http://stackoverflow.com/questions/16385507/ansible-delete-unmanaged-files-from-directory/18016700#18016700
* Add OSX-specific script that opens tmux window (in already-opened tmux session) with all monitoring tools in OSX e.g. tmux-osx-mon running panes with `top -o cpu` `sudo iosnoop` .... Refs https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened/5752901#5752901 http://dtrace.org/blogs/brendan/2011/10/10/top-10-dtrace-scripts-for-mac-os-x/

#### TODO Erlang/OTP

* Re-use deleted Erlang-related Ansible scripts
* Gather fact in Ansible depending on output of command line (e.g. kerl - see if build is already installed - new module in galaxy?) in order not to try to build OTP anytime but only if not built yet
* Compile Erlang/OTP using option re file descriptors at https://github.com/Homebrew/homebrew/issues/6143
* Re-evaluate Erlang/OTP OSX build options "./configure --with-dynamic-trace=dtrace --enable-darwin-64bit --disable-hipe"
