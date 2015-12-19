## Provisioning of development Mac OS X box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)

Run:

```
$ bin/provision_osx
```

... then:

```
$ sbin/provision_osx_as_admin
```

### TODO

* Move building OTP out of main script as it requires java installed - that is installed as root
* Teach Emacs to conditionally hide C ifdef
* Teach universal-ctags arity of Erlang functions
* Log unknown files/dirs as warnings, hinting command for deletion
* Move `.osx` as separate git repo, fork of main one
* Add OSX-specific script that opens tmux window (in already-opened tmux session) with all monitoring tools in OSX e.g. tmux-osx-mon running panes with `top -o cpu` `sudo iosnoop` .... Refs https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened/5752901#5752901 http://dtrace.org/blogs/brendan/2011/10/10/top-10-dtrace-scripts-for-mac-os-x/
