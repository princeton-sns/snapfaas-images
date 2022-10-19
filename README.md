Note before archiving this repo:
master branch was imported with history into faasten/faasten master branch
yue/wip/faasten branch was imported with history into faasten/faasten feat/faasten branch.

## rootfs
`rootfs` contains four subdirectories, namely `common`, `fullapp`, `regular`, and `snapfaas`.

Directory `common` contain files that are common to the rest three directories each of which represents
a style of booting a guest VM.

Directory `fullapp` contains code and scripts to generate root file systems each of which contains
**both** a language runtime and an application. All wrapper scripts contain one snapshotting point.

Directory `regular` contains code and scripts to generate root file systems each of which contains
**both** a language runtime and an application. The **difference** between `regular` and `fullapp`
is that `regular` runtime wrapper scripts contain no snapshotting point. Otherwise, the two
are the same.

Directory `snapfaas` contains code and scripts to generate root file systems each of which contains
just one language runtime and **no** application code. `snapfaas` runtime wrapper scripts expects
a second file system, i.e. appfs, which contains application code and mounts it to `/srv`. All wrapper
scripts contain two snapshotting point. The first is for generating language snapshot and the second
is for generating diff snapshot.

**Note** that `snapfaas` contains some special runtimes that are only intended for special measurements.
See `snapfaas/README.md`.

## appfs
Directory `appfs` contains serverless functions:
1. Python3 functions are under `appfs/python3`.
2. Node.js functions are under `appfs/nodejs`.

Each directory in `appfs/$runtime` is a serverless function containing files and a `Makefile` to build
the filesystem for the function.

Each app directory that begins with "." are apps that snapfaas/microbenchmark will skip.
