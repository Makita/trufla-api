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
docker exec -it ID_OR_NAME bundle exec rake db:setup
```

With the databases created, the site may be accessed via http://localhost:3000/.

## Making Changes

If you plan to make a change to the project, you'll need to use this. Assuming you copy-pasted the above commands, the below will set up Docker volumes so the image does not need to be recreated each time a change is made. This assumes you are in the directory just above the project.

```
docker run -itP -v $(pwd)/trufla-api trufla-api
```

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

# Deployment to AWS

1. Set up an EC2 instance.
2. Set two variables in Settings > CI / CD. `PRIVATE_KEY` = The key received when the EC2 instance was created. `PROD_SERVER` = The DNS (IPv4) of the EC2 instance.
3. SSH into the EC2 instance and run `sudo yum install git` and `gem install bundler`.
4. Push into the project on Gitlab. If you want to run this yourself, replace the repo link in deploy/updateAndRestart.sh with your own and push or import the repo onto Gitlab.