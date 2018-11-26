# Setting up the Development Environment

## Getting the Container up and Running

Pull the git repo.

```
git clone git@github.com:Makita/trufla-api.git
```

Build the Docker container.

```
docker build . -t trufla-api
```

Run the Docker container.

```
docker run --rm -p 3000:3000 -t trufla-api
```

With the container running, it's time to create the database and populate it. So we'll need to get the container's ID or name.

```
docker ps
```

The above will return something like this:

```
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                    NAMES
861a369adcee        trufla-api          "sh docker-cmd.sh"   16 seconds ago      Up 14 seconds       0.0.0.0:3000->3000/tcp   optimistic_jepsen
```

In the above example, the ID is `861a369adcee` and the name is `optimistic_jepsen`. This will replace `ID_OR_NAME` below.

```
docker exec -it ID_OR_NAME bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed
```

With the databases created, the site may be accessed via http://localhost:3000/.

## Making Changes

If you plan to make a change to the project, you'll need to use this. Assuming you copy-pasted the above commands, the below will set up Docker volumes so the image does not need to be recreated each time a change is made. This assumes you are in the directory just above the project.

```
docker run -itP -v $(pwd)/trufla-api trufla-api
```