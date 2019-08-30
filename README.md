# Mine Support Development

Digital service mock to claim public money in the event property subsides into mine shaft. This repository provides a complete development environment for the ficitious Mine Support service.

## Pre-requisites

- Docker
- Docker Compose

### Warning for users of Windows Subsystem for Linux

This project relies on services which use volume mounts in Docker Compose. Windows Subsystem for Linux (WSL) requires some customisation to work with Docker volume mounts. The simplest option is to set up automounting of `/mnt/c` via [/etc/wsl.conf](https://devblogs.microsoft.com/commandline/automatically-configuring-wsl/). For a well-explained write-up, see [this blog post](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly) by Nick Janetakis.

## Setup

A script is provided to clone and prepare repositories for developing all the services which make up this application. Services will be cloned to [`./services/<repository>`](./services).

```
# Clone repositories and build services
scripts/install
```

## Running the application

Scripts are provided to conveniently run the entire application stack in development. These rely on the equivalent scripts in each service repository, which should bind-mount application code from the host file system and enable hot reloading where possible.

```
# Start the application stack
scripts/start

# Stop the application stack, removing Docker networks and volumes
scripts/stop
```

The application is exposed on port 3000 by default so may be accessed via a web browser on

> http://localhost:3000

## Running a subset of services

It may be convenient to run a subset of the application stack connected to shared core services (such as message queues). For this purpose, scripts are provided to start the core services without the rest of the stack. Each additional service may be run using the scripts provided in their repositories (`./services/<repository>`).

```
# Start supporting services without the application stack
scripts/start-core

# Stop supporting services
scripts/stop-core
```

## Rebuilding and updating services

Scripts are provided to conveniently apply updates to services. The build script simply rebuilds all the services managed by this project. The update script first pulls any available updates and then rebuilds each service to ensure that any updates are applied correctly.

```
# Build services
scripts/build

# Update and build services
scripts/update
```

## Contributing to this project

Please read the [contribution guidelines](/CONTRIBUTING.md) before submitting a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and applications when using this information.

>Contains public sector information licensed under the Open Government license v3

### About the license

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
