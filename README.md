## Provisioning of development macOS box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)

### Prerequisites for provisioning wiping macOS installation

Reinstall macOS.
This may require [creating a bootable installer](https://support.apple.com/en-us/HT201372).
If you require a [recent version of macOS](https://support.apple.com/en-us/HT201222) and your device is unsupported,
you may consider a patched installer e.g. [Catalina](http://dosdude1.com/catalina/) ([sources](https://github.com/dosdude1/macos-catalina-patcher/)):
beware of potential inability of finding security updates and hardware support e.g. Bluetooth.

Prefer encrypted case-sensitive file system.

Prefer keeping the network disabled initially,
enable the firewall denying all inbound connections
then connect to the network.

Poke macOS to find updates (`softwareupdate --list`)
and install them,
rebooting if required.

### Steps

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

### Provisioning of wake up

Assumptions:
- TG La7 news at 7:30am Italian time.
- macOS computer one hour behind Italy.
- La7 page-to-play process (i.e. click on button with known id) unchanged.
- Browser allows audio autoplay (in Firefox:
  `about:preferences#privacy`, "Autoplay", "Allow Audio and Video").

```
$ sudo sbin/set_wake_up 6 25 Weekdays
```

```
$ printf '%s %s * * %s l() { logger -p user.${1:?} -t %s ${2:?}; }; S="https://tg.la7.it/dirette-tv#player_tgla7_init"; l info "opening URL ${S:?}"; open -a firefox --args --private-window "${S:?}"\n' "29" "6" "1,2,3,4,5" LA7 | crontab
```

### Tests

Run tests:
```
$ bats tests/
```

### TODO

* Review considering other macOS setup projects:
  - https://github.com/mathiasbynens/dotfiles/compare/master...lucafavatella:dev
  - https://github.com/atomantic/dotfiles/blob/c2a0e4eff8328bdc6c2266c6e689e35f91a556a5/README.md
  - https://github.com/atomantic/dotfiles/blob/c2a0e4eff8328bdc6c2266c6e689e35f91a556a5/install.sh
  - https://github.com/ashishb/dotfiles/blob/c7f6b26713ab3d853bd8e3509b22ae52fcab4d3f/setup/_macos
  - https://github.com/ashishb/dotfiles/blob/c7f6b26713ab3d853bd8e3509b22ae52fcab4d3f/setup/setup_new_mac_machine.sh
  - https://github.com/rootbeersoup/dotfiles/blob/153c21ab9fa223d82a9a2fd403d4ef3367e31e15/macos/defaults.sh
* Move away from `set -e` in non-trivial shell scripts
* Teach Emacs to conditionally hide C ifdef
* Teach universal-ctags arity of Erlang functions. [POSIX ctags](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/ctags.html) looks limited. Extended tags format by exuberant-ctags/universal-ctags appears to [support](https://github.com/universal-ctags/ctags/blob/e6ddf85268670732cd0792077e9d98bcf092c083/docs/format.rst#id6) arity. Other resource to explore: https://github.com/vim-erlang/vim-erlang-tags
* Log unknown files/dirs as warnings, hinting command for deletion
* Add OSX-specific script that opens tmux window (in already-opened tmux session) with all monitoring tools in OSX e.g. tmux-osx-mon running panes with `top -o cpu` `sudo iosnoop` .... Refs https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened/5752901#5752901 http://dtrace.org/blogs/brendan/2011/10/10/top-10-dtrace-scripts-for-mac-os-x/
* Block [domain name resolving](https://threatpost.com/patrick-wardle-breaks-and-bypasses-macos-firewalls/134784/). Done by other tools e.g. https://www.oneperiodic.com/products/handsoff/
* Hardening https://github.com/kristovatlas/osx-config-check https://github.com/drduh/macOS-Security-and-Privacy-Guide
* Consider further automation in https://github.com/geerlingguy/mac-dev-playbook https://github.com/ricbra/mac-dev-playbook https://github.com/ricbra/dotfiles/blob/master/bin/setup_osx
