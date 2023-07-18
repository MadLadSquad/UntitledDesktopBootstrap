# UntitledDesktopBootstrap
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)
[![trello](https://img.shields.io/badge/Trello-UDE-blue])](https://trello.com/b/HmfuRY2K/untitleddesktop)
[![Discord](https://img.shields.io/discord/717037253292982315.svg?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/4wgH8ZE)

A repository containing the tools needed to bootstrap the UntitledDesktopEnvironment

## Documentation
### setup
The `setup` script should be run when first installing the desktop. The script creates all required directories, copies `xinitrc`
and `Xft.xrdb` to `$XDG_CONFIG_DIRS[0]` as well as the `ude-setup-user-dirs` and `ude-setup-xdg-global` to `/usr/bin`. It also
runs `ude-setup-xdg-global`.

The first CLI argument is an installation prefix that can be used by a package manager to install to a sandboxed temporary root,
like portage's `$ED`

### ude-setup-xdg-global
Creates and exports global 
[XDG Base directories environment](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) variables.

### ude-setup-user-dirs
Updates the XDG User directories, creates legacy home directories like `.themes` and `.icons` and exports the home 
[XDG Base directories environment](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) variables.

### Xft.xrdb
Fallback resource settings for X11 applications, `.Xresources` overrides them

### xinitrc
Sets desktop session environment variables, runs `ude-setup-xdg-global` and `ude-setup-user-dirs`, loads X11 resources, user
keyboard layouts and launches the UDE session(currently not implemented)
