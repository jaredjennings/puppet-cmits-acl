# no_ext_acl

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with no_ext_acl](#setup)
    * [What no_ext_acl affects](#what-no_ext_acl-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with no_ext_acl](#beginning-with-no_ext_acl)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This custom resource type removes extended access control lists (ACLs)
from files and directories. It should work on any GNU/Linux operating
system, and on OS X.


## Module Description

Extended ACLs provide access control for files and directories that is
more complicated than the usual user-group-other Unix ownership and
permissions scheme. ("ACLs" in general, as opposed to "extended ACLs"
in specific, subsume the original Unix permissions.)  Most system
files do not need this added complication, and accordingly some
security policies require for some system files that they not have
extended ACLs.

The way to access extended ACL functionality varies by operating
system. GNU/Linux offers the `getfacl` and `setfacl` commands, while
OS X extends the `ls` and `chmod` utilities with capabilities to show
and change ACLs. This module of course insulates you from these
platform variations.

## Setup

### What no_ext_acl affects

* Whatever you tell it to.
* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements **OPTIONAL**

On Debian and Ubuntu you may need the optional `acl` package
installed. On CentOS this package appears to be part of the base
install. You should turn on pluginsync, to get the `no_ext_acl` code
out to your nodes.


### Beginning with no_ext_acl

Put the following in your manifest:

```
    no_ext_acl { '/some/file/i/dont/want/to/have/an/extended/acl': }
    no_ext_acl { '/likewise/with/some/dir': recurse => true }
```

## Reference

Resources of the `no_ext_acl` type are named for a file or directory;
the named file or directory will have its extended and/or default ACL
entries removed, leaving only Unix permissions. ("Default" ACL entries
on a directory are extended ACL entries which are applied to new files
or directories created in that directory.) If the parameter `recurse
=> true` is given, directories will be recursed into.

There are two providers, `getsetfacl` and `macosx`. The latter is the
default under the `darwin` operating system (i.e., OS X). The former
has no operating system constraints, but only requires
`/usr/bin/getfacl` and `/usr/bin/setfacl` to exist.

## Limitations

You need either OS X, or a Linux where `getfacl` and `setfacl` can be
run. The `acl` package which provides these appears to be optional
under Debian and Ubuntu. Busybox does not appear to provide these
utilities.

## Development

Please file issues and fork and send pull requests at
https://github.com/jaredjennings/puppet-cmits-no_ext_acl.


## Release Notes/Contributors/Etc

-
