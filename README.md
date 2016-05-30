## Provisioning of development Mac OS X box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)
[![Issue Count](https://codeclimate.com/github/lucafavatella/provisioning-osx/badges/issue_count.svg)](https://codeclimate.com/github/lucafavatella/provisioning-osx)

Run:

```
$ bin/provision_osx
```

... then:

```
$ sbin/provision_osx_as_admin
```

... finally optionally:
```
$ bin/provision_osx_otp
```

### Tests

Run tests:
```
$ bats tests/
```

### TODO

* Move away from `set -e` in non-trivial shell scripts
* Consider installing in `/usr/local/bin` (rather than `~/homebrew-cask/bin`) binaries of casks installed using sudo
* Teach Emacs to conditionally hide C ifdef
* Teach universal-ctags arity of Erlang functions
* Log unknown files/dirs as warnings, hinting command for deletion
* Move `.osx` as separate git repo, fork of main one
* Add OSX-specific script that opens tmux window (in already-opened tmux session) with all monitoring tools in OSX e.g. tmux-osx-mon running panes with `top -o cpu` `sudo iosnoop` .... Refs https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened/5752901#5752901 http://dtrace.org/blogs/brendan/2011/10/10/top-10-dtrace-scripts-for-mac-os-x/
