## Provisioning of development Mac using Linux

### Vanilla OS on MacBookPro7,1

Prepare a bootable USB stick
with [Vanilla OS](https://docs.vanillaos.org/handbook/en/installation)
and boot from it,
[pressing and holding the Option key
as you press the power button
to start up your Mac](https://support.apple.com/en-gb/guide/mac-help/mchlp1034/mac).

Install keeping wired Internet connection.
(The network is used towards the end of the installation process,
and seems not working
even when the Wi-Fi network connection is reported as working
at the beginning of the installation process.)

After the installation,
[`abroot status`](https://abroot.vanillaos.org/) shows:

> Device Specifications:
> * CPU: Intel(R) Core(TM)2 Duo CPU P8600 @ 2.40GHz
> * GPU: [NVIDIA Corporation MCP89 [GeForce 320M] (rev a2)]
> * Memory: 7685 MB
>
> ABImage:
> * Digest: sha256:9326...
> * Timestamp: 2026-10-17 ...
> * Image: ghcr.io/vanilla-os/gnome:latest

The Wi-Fi network adapter is `14e4:432b` i.e. Broadcom BCM4322.

The Wi-Fi driver loaded is `b43` (see `/proc/modules`).

The GPU driver loaded is `nouveau` (see `/proc/modules`).

### Known issues

If the desktop background looks corrupted,
change background (Tube map style?)
then reboot.

The camera colours are garbled.
