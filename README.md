## Provisioning of development macOS box
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
* Teach Emacs to conditionally hide C ifdef
* Teach universal-ctags arity of Erlang functions. [POSIX ctags](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ctags.html) looks limited. Extended tags format by exuberant-ctags/universal-ctags appears to [support](https://github.com/universal-ctags/ctags/blob/e6ddf85268670732cd0792077e9d98bcf092c083/docs/format.rst#id6) arity. Other resource to explore: https://github.com/vim-erlang/vim-erlang-tags
* Log unknown files/dirs as warnings, hinting command for deletion
* Add OSX-specific script that opens tmux window (in already-opened tmux session) with all monitoring tools in OSX e.g. tmux-osx-mon running panes with `top -o cpu` `sudo iosnoop` .... Refs https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened/5752901#5752901 http://dtrace.org/blogs/brendan/2011/10/10/top-10-dtrace-scripts-for-mac-os-x/
* LS C
  * From https://github.com/MaskRay/ccls/wiki/Emacs : https://melpa.org/#/ccls that depends on that depends on https://melpa.org/#/lsp-mode
  * https://melpa.org/#/lsp-ui ? ([linked by lsp-mode](https://github.com/emacs-lsp/lsp-mode/blame/6eadc0c2a0762b35440a2f6eb6ba27a528334b22/README.md#L16))
  * install ccls?
  * install bear for build instructions?
  * remove tags ... ?