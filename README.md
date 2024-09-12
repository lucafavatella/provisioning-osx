## Provisioning of development macOS box

### Prerequisites for provisioning wiping macOS installation

Reinstall macOS.
This may require [creating a bootable installer](https://support.apple.com/en-us/HT201372).

If you require a [recent version of macOS](https://support.apple.com/en-us/HT201222) and your device is unsupported,
you may consider a patched installer.
E.g. [Catalina](http://dosdude1.com/catalina/) ([sources](https://github.com/dosdude1/macos-catalina-patcher/)):
beware of potential inability to find security updates and to support certain hardware e.g. Bluetooth.
A [recent recommendation](https://github.com/dosdude1/macos-catalina-patcher/issues/150#issuecomment-1000781162)
seems to be [OCLP](https://github.com/dortania/OpenCore-Legacy-Patcher).

Consider creating an extra partition for installing an extra OS (Linux?) in the future.

Prefer encrypted case-sensitive file system.

If the file system is not encrypted,
enable FileVault.

Prefer keeping the network disabled initially,
enable the firewall denying all inbound connections
then connect to the network.

Poke macOS to find updates (`softwareupdate --list`)
and install them,
rebooting if required.

Run `git --version`
in order to poke macOS to call `xcode-select --install`
that installs the command line developer tools.

### Steps

Clone this repository in `~/dev`.

Ensure the terminal [uses](https://support.apple.com/en-gb/guide/terminal/trml113/mac) shell `bash`.

Open the terminal and run:

```
$ bin/clone_homebrew ## Alternatively you may install Homebrew using the procedure at https://brew.sh
$ bin/provision_osx link_bash_profile ## Alternatively you may keep the current HEAD of the dotfiles running rather `DOTFILES_VERSION="HEAD" bin/provision_osx link_bash_profile`.
```

(If using a custom Homebrew installation, you may need to add `BREW_PREFIX=/usr/local` in `~/.bash_extra_pre`.)

Open a distinct terminal tab and re-run the command, as instructed:

```
$ bin/provision_osx
```

Set requesting account password immediately
at System Preferences > Security & Privacy > General
(programmatically is tricky - see [issue 809](https://github.com/mathiasbynens/dotfiles)).
Test that when closing then reopening the laptop lid the account is locked.

Set Safari search engine to DuckDuckGo
at Safari > Preferences > Search
(programmatically [is not possible](https://stackoverflow.com/questions/12855168/mac-os-x-safari-6-default-search-engine-change-between-possible-values)).

Finally optionally:
```
brew install --cask cryptomator ## Version 1.12 dropped support for macOS 10.x: `brew install --cask https://raw.githubusercontent.com/Homebrew/homebrew-cask/45a23a9719849dacbe96cef7e9629036d35e33d7/Casks/c/cryptomator.rb`.

# -- 8< ----
# Requiring administrator priviledges.
$ brew install --cask lulu ## If pre-Catalina macOS, consult the homepage (`brew homepage --cask lulu`). After installation may require restart.
```

### Notable software

```
#brew install --cask iterm2 || exit 1 ## Mainly for configuring only left Option as Meta key, so to keep ability to insert `#` on UK keyboard (without losing `£`) while simplifying shell shortcuts (e.g. Alt+D).  Also for: implicitly copying text select with pointer; making clickable links in text by pressing a key. ## Some Sixel support (VT340) - [ref](https://gitlab.com/gnachman/iterm2/issues/3240).

#brew install --cask spectacle || exit 1

#brew install --cask --binaries android-platform-tools || exit 1 ## adb
#brew install --cask android-studio || exit 1 ## From [IntelliJ IDEA and Android Studio FAQ](http://blog.jetbrains.com/idea/2013/05/intellij-idea-and-android-studio-faq/): "If I’m already a user of IntelliJ IDEA, do I need to switch to Android Studio for Android development? No. Android Studio is focused specifically on Android development and provides streamlined environment and project setup, but otherwise all of its features are available in IntelliJ IDEA."
brew install autoconf || exit 1
#brew install --cask intellij-idea-ce || exit 1
#brew install saitoha/sixel/mlterm || exit 1 ## Refs https://en.wikipedia.org/wiki/VT340 https://en.wikipedia.org/wiki/Sixel
brew install p7zip || exit 1 ## `7z x` works as a compression-agnostic archive extractor command better than BSD `tar -x` e.g. for `gzip` compression.
#brew install plantuml || exit 1
#brew install radare2 || exit 1
#brew install --cask wine-stable || exit 1 ## [Because of bug 52354](https://github.com/Homebrew/homebrew-cask/blob/af7d61d581/Casks/wine-stable.rb#L14), prefer < 6.17 e.g. latest earlier stable [6.0.2](https://github.com/Gcenx/macOS_Wine_builds/releases/tag/6.0.2): `curl -fsSO https://raw.githubusercontent.com/Homebrew/homebrew-cask/0135678b133002123db42db0556eab3efd3e6597/Casks/wine-stable.rb && brew install ./wine-stable.rb`. Actually you shall prefer >= 8.1 [because of fix for bug 52354](https://bugs.winehq.org/show_bug.cgi?id=52354#c55), and = 8.10 as most recent packaged version [not](https://github.com/Gcenx/macOS_Wine_builds/releases/tag/8.10) requiring Catalina, but not present as historical cask.
```

Requiring administrator priviledges:
```
#brew install --cask vagrant || exit 1 ## ( VTmpDir="$(mktemp -d)" && ( curl -fsS https://raw.githubusercontent.com/Homebrew/homebrew-cask/3a4bcb843227eec3b25aad3605bda50f00190230/Casks/vagrant.rb | sed 's/65a5fee8bcfa4bbd3be444efbcd997110a49f5ccc1fffc4457c0110ab51adecb/dfcb08ee37a197c091d0d13f52a4cf55b98d24466063934032530959259fcd89/g' > "${VTmpDir:?}"/vagrant.rb; ) && brew install "${VTmpDir:?}"/vagrant.rb && rm -rf "${VTmpDir:?}"; ) || exit 1 # It seems vagrant v2.3.1 introduced somehow load command 0x80000034 [i.e. LC_DYLD_CHAINED_FIXUPS](https://stackoverflow.com/questions/70375459/golang-build-error-0x80000034-2147483700/70375558#70375558), introduced in [Xcode 13(https://developer.apple.com/documentation/xcode-release-notes/xcode-13-release-notes): "All programs and dylibs built with a deployment target of macOS 12 or iOS 15 or later now use the chained fixups format. This uses different load commands and LINKEDIT data, and won’t run or load on older OS versions. (49851380)".
brew install --cask wireshark || exit 1
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
