
## Docker Instance for Edge Flow Manager UI

This docker instance will launch a EFM UI

1.  Git Clone
2.  Build a docker image
  * `docker build --no-cache -t efm .`
3.  Run the image (and set env variables in env.file or -e)
  * `docker run -e NIFI_REGISTRY_ENABLED=true --name efm -p 10080:10080 -d efm:latest`
  * `docker run --env-file ./env.file --name efm -p 10080:10080 -d efm:latest`

4.  UI available here
  * `http://localhost:10080/efm/ui`
