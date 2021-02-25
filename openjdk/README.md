# Open JDK

### Use
```
docker pull dkivanov/jdk:<version>
```

### Versions
```
8u161-alpine
11-alpine
```

### Build
```sh
#!/usr/bin/env bash
JAVA_VERSION=$(head -1 version)
JAVA_ALPINE_VERSION=$(head -2 version | tail -1)
docker build \
  --rm \
  --build-arg JAVA_VERSION=${JAVA_VERSION} \
  --build-arg JAVA_ALPINE_VERSION=$JAVA_ALPINE_VERSION \
  --tag dkivanov/jdk:$JAVA_VERSION-alpine .

```

```ps1
#!/usr/bin/env pwsh
$JAVA_VERSION = $(Get-Content version -First 1)
$JAVA_ALPINE_VERSION = $(Get-Content version -First 2)[-1]
docker build `
  --rm `
  --build-arg JAVA_VERSION=$JAVA_VERSION `
  --build-arg JAVA_ALPINE_VERSION=$JAVA_ALPINE_VERSION `
  --tag dkivanov/jdk:$JAVA_VERSION-alpine .
```
