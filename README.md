## Provisioning of development macOS box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)

Run:

```
$ bin/provision_osx ## Lighter version of the command: `bin/provision_osx_lite`
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
* Teach Emacs to conditionally hide C ifdef
* Teach universal-ctags arity of Erlang functions. [POSIX ctags](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ctags.html) looks limited. Extended tags format by exuberant-ctags/universal-ctags appears to [support](https://github.com/universal-ctags/ctags/blob/e6ddf85268670732cd0792077e9d98bcf092c083/docs/format.rst#id6) arity. Other resource to explore: https://github.com/vim-erlang/vim-erlang-tags
* Log unknown files/dirs as warnings, hinting command for deletion
* Add OSX-specific script that opens tmux window (in already-opened tmux session) with all monitoring tools in OSX e.g. tmux-osx-mon running panes with `top -o cpu` `sudo iosnoop` .... Refs https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened/5752901#5752901 http://dtrace.org/blogs/brendan/2011/10/10/top-10-dtrace-scripts-for-mac-os-x/
* Block [domain name resolving](https://threatpost.com/patrick-wardle-breaks-and-bypasses-macos-firewalls/134784/). Done by other tools e.g. https://www.oneperiodic.com/products/handsoff/
* Hardening https://github.com/kristovatlas/osx-config-check https://github.com/drduh/macOS-Security-and-Privacy-Guide
