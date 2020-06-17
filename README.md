# hub.docker.com/r/tiredofit/postfix

# Introduction

Dockerfile to build a Postfix image to support MTA functionality.

This is a work in progress and not stable for production use.

This Container uses Alpine:3.12 as a base.

[Changelog](CHANGELOG.md)

# Authors

- [Dave Conroy](daveconroy@selfdesign.org) [https://git.selfdesign.org/daveconroy]

# Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

# Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/postfix) and is the recommended method of installation.


```bash
docker pull tiredofit/postfix
```

# Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

# Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
|-----------|-------------|


### Environment Variables

Below is the complete list of available options that can be used to customize your installation.

| Parameter | Description |
|-----------|-------------|

# Maintenance
#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. postfix) bash
```

# References

* https://www.postfix.org


