# FFC Demo Development

Development environment for the FFC demo service.

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

Scripts are provided to conveniently run the entire application stack in development. 

```
# Start the application stack
scripts/start

# Stop the application stack, removing Docker networks and volumes
scripts/stop
```

The application is exposed on port 3000 by default so may be accessed via a web browser on [localhost:3000](http://localhost:3000).

The start script will check for existing services or volumes associated with this project and abort if any are found. Flags may be passed to force a restart, either destroying or retaining volumes. For more information, pass the `--help` or `-h` flag:

```
scripts/start --help
```

## Running a subset of services

It may be convenient to run a subset of the application stack connected to shared core services (such as message queues). For this purpose, scripts are provided to start the core services without the rest of the stack. Each additional service may be run using the docker-compose files found in their respective repository.

```
# Start supporting services without the application stack
scripts/start-core

# Stop supporting services
scripts/stop-core
```

## Dependency changes

By default, services run bind-mounted code in development so local changes are applied automatically without needing to restart. However, changes to dependencies do necessitate rebuilding the affected service since these are not mounted for performance reasons.

```
# Build services
scripts/build
```

## Pulling updates

Since dependency changes necessitate a rebuild of the affected service, it is recommended to rebuild each service after pulling remote updates or switching/merging branches. For convenience, a script is provided to pull remote updates on the current branch of each service and rebuild all services to ensure that any updates are applied correctly.

```
# Pull remote updates and build services
scripts/update
```

This will not handle any merge conflicts during the `git pull` operations so check the output carefully and deal with any conflicts within each service repository.

## Contributing to this project

Please ensure that all contributions meet the standards set out in the [DDTS Future Farming Developer Guide](https://dev.azure.com/defradev/DEFRA_FutureFarming/_git/defra-ff-documentation?path=%2Fdeveloper-guide%2Findex.md&version=GBmaster&createIfNew=true) before submitting a pull request.

Contributions to each service should be made in their individual repositories.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and applications when using this information.

>Contains public sector information licensed under the Open Government license v3

### About the license

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
