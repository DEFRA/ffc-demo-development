# Mine Support Development

Digital service mock to claim public money in the event property subsides into mine shaft. This repository provides a complete development environment for the ficitious Mine Support service.

## Pre-requisites

- Docker
- Docker Compose

## Setup

Scripts are provided to set up repositories for all the Mine Support services as subdirectories of [`./services/`](./services).

```
# Clone Mine Support repositories
scripts/install

# Build container images
scripts/build
```

## Running the application

Scripts are provided to conveniently run the entire Mine Support stack in development. These rely on the equivalent scripts in each service repository, which should bind-mount application code from the host file system and enable hot reloading where possible.

```
# Start the complete Mine Support stack
scripts/start

# Stop the Mine Support stack, removing Docker networks and volumes
scripts/stop
```

It may be convenient to run a subset of the application stack connected to shared core services (such as message queues). For this purpose, scripts are provided to start the core services without the rest of the stack. Each additional service may be run using the scripts provided in their repositories (`./services/<repository>`).

```
# Start supporting services without the Mine Support stack
scripts/start-core

# Stop supporting services
scripts/stop-core
```

### Volume mounts on Windows Subsystem for Linux

For the volume mounts to work correct via WSL it is necessary to either set up automounting of `/mnt/c`, or change the mount point for the shared drive from `/mnt/c` to `/c`. For a well-explained write-up, see [this blog post](https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly) by Nick Janetakis.

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
