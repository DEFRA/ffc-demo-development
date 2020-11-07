# FFC Demo Development

Development environment for the FFC demo service.

## Pre-requisites

- Docker
- Docker Compose

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

The start script will check for existing services or volumes associated with this project and abort if any are found. Flags may be passed to force a restart, either destroying or retaining volumes. For more information, pass the `--help` or `-h` flag:

```
scripts/start --help
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

## Licence

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

<http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3>

The following attribution statement MUST be cited in your products and applications when using this information.

>Contains public sector information licensed under the Open Government license v3

### About the licence

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
