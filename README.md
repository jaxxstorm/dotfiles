# Personal dotfiles

## Installation

### CentOS 6 Specific 

You need python-argparse install

```
yum install python-argparse
```

Should be okay on Ubuntu and OS X

Then do

```
git clone --recursive
bash install
```

## Adding files

There's lots of submodules here, need to make sure they're tracked.

To add a new submodule do:

```
git submodule add <gitrepo>
```
