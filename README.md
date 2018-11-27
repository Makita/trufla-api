# Setting up the Development Environment

## Getting the Container up and Running

Pull the git repo.

```
git clone git@github.com:Makita/trufla-api.git
```

Build the Docker container.

```
docker build . -t trufla-api:development
```

Run the Docker container.

```
docker run --rm -p 3000:3000 -t trufla-api:development
```

The API is now running and may be accessed via its routes (`rake routes`).

## Removing the Docker Image

First, make sure any containers running the image are dead.

```
docker ps
docker stop ID_OR_NAME
```

When all of these are dead, delete the image.

```
docker image rm ID_OR_NAME
```

## Running without Docker

1. `git clone git@github.com:Makita/trufla-api.git`
2. `cd trufla-api`
3. `bundle install`
4. `rake db:setup`
5. `rails s`