## Provisioning of development macOS box
[![Build Status](https://travis-ci.org/lucafavatella/provisioning-osx.svg?branch=master)](https://travis-ci.org/lucafavatella/provisioning-osx)

### Prerequisites for provisioning wiping macOS installation

Reinstall macOS.
This may require [creating a bootable installer](https://support.apple.com/en-us/HT201372).
If you require a [recent version of macOS](https://support.apple.com/en-us/HT201222) and your device is unsupported,
you may consider a patched installer e.g. [Catalina](http://dosdude1.com/catalina/) ([sources](https://github.com/dosdude1/macos-catalina-patcher/)):
beware of potential inability to find security updates and to support certain hardware e.g. Bluetooth.

Prefer encrypted case-sensitive file system.

Prefer keeping the network disabled initially,
enable the firewall denying all inbound connections
then connect to the network.

Poke macOS to find updates (`softwareupdate --list`)
and install them,
rebooting if required.

Run `git --version`
in order to poke macOS to call `xcode-select --install`
that installs the command line developer tools.

Clone this repository in `~/dev`.

### Steps

Open the terminal and run:

```
$ bin/provision_osx
```

Ensure the terminal uses shell `bash`, so that it uses the installed profile.

Open a distinct terminal tab and re-run the command, as instructed:

```
$ bin/provision_osx
```

Finally optionally:
```
$ brew install --cask lulu ## If pre-Catalina macOS, consult the homepage (`brew homepage --cask lulu`). After installation may require restart.
```

### Notable software

```
#brew install --cask iterm2 || exit 1 ## Mainly for configuring only left Option as Meta key, so to keep ability to insert `#` on UK keyboard (without losing `£`) while simplifying shell shortcuts (e.g. Alt+D).  Also for: implicitly copying text select with pointer; making clickable links in text by pressing a key. ## Some Sixel support (VT340) - [ref](https://gitlab.com/gnachman/iterm2/issues/3240).

#brew install --cask spectacle || exit 1

#brew install --cask android-platform-tools || exit 1 ## adb
#brew install --cask android-studio || exit 1 ## From [IntelliJ IDEA and Android Studio FAQ](http://blog.jetbrains.com/idea/2013/05/intellij-idea-and-android-studio-faq/): "If I’m already a user of IntelliJ IDEA, do I need to switch to Android Studio for Android development? No. Android Studio is focused specifically on Android development and provides streamlined environment and project setup, but otherwise all of its features are available in IntelliJ IDEA."
brew install autoconf || exit 1
#brew install --cask intellij-idea-ce || exit 1
#brew install saitoha/sixel/mlterm || exit 1 ## Refs https://en.wikipedia.org/wiki/VT340 https://en.wikipedia.org/wiki/Sixel
brew install p7zip || exit 1 ## `7z x` works as a compression-agnostic archive extractor command better than BSD `tar -x` e.g. for `gzip` compression.
#brew install plantuml || exit 1
```

Requiring administrator priviledges:
```
brew install --cask wireshark || exit 1
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
* Log unknown files/dirs as warnings, hinting command for deletion
* Block [domain name resolving](https://threatpost.com/patrick-wardle-breaks-and-bypasses-macos-firewalls/134784/). Done by other tools e.g. https://www.oneperiodic.com/products/handsoff/
* Hardening https://github.com/kristovatlas/osx-config-check https://github.com/drduh/macOS-Security-and-Privacy-Guide
* Consider further automation in https://github.com/geerlingguy/mac-dev-playbook https://github.com/ricbra/mac-dev-playbook https://github.com/ricbra/dotfiles/blob/master/bin/setup_osx
