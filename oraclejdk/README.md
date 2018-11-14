# Build docker container with ORACLE JDK

## Table of Contents
1. [JDK 10](#JDK 10)
2. [Alpine for JDK 10](#Alpine for JDK 10 IS NOT WORKING YET)

### Versions:

```
Linux flawor:		Alpine, CentOS, Debian-Slim
Linux version:	3.7
Oracle JDKs:		8u172-b11, 10.0.1+10
```

### How to build:
1. Download jdk release from Oracle site:
* [JDK 10](http://www.oracle.com/technetwork/java/javase/downloads/jdk10-downloads-4416644.html)
* [JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
2. Place it in folder with Dockerfile
3. Run docker build:

```bash
#!/usr/bin/env bash
JAVA_VERSION=$(head -1 ../version)
docker build --rm --build-arg JAVA_VERSION=${JAVA_VERSION} -t oracle-jdk:${JAVA_VERSION}-centos .
```

```bash
#!/usr/bin/env bash
JAVA_VERSION=$(head -1 ../version)
docker build --rm --build-arg JAVA_VERSION=${JAVA_VERSION} -t oracle-jdk:${JAVA_VERSION}-alpine .
```

## Alpine for JDK 10 IS NOT WORKING YET

```
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGSEGV (0xb) at pc=0x00007fa2ef482d48, pid=11, tid=12
#
# JRE version:  (10.0.1+10) (build )
# Java VM: Java HotSpot(TM) 64-Bit Server VM (10.0.1+10, mixed mode, aot, tiered, compressed oops, g1 gc, linux-amd64)
# Problematic frame:
# C  [libc.so.6+0x5ad48]  _IO_vfscanf+0xc8
#
# Core dump will be written. Default location: //core
#
# An error report file with more information is saved as:
# //hs_err_pid11.log
#
# If you would like to submit a bug report, please visit:
#   http://bugreport.java.com/bugreport/crash.jsp
#
Aborted (core dumped)
```
