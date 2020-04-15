# Simple InSpec profile for a Frontend

The idea of this profile is to test the basic requeriments for a Docker image
of a Frontend developed on Node.

It will check some basic properties of the image itself and then some internal
specs (ports, processes, etc).

First we need to create a container from that image with the name: **frontend**:

```
docker run -it --rm --name frontend juanje/angular-template:latest
```

Then we pass the first specs (from outside the container):
```
inspec exec test_image.rb --input-file attributes.yaml 

```

And the second ones (inside the container):
```
inspec exec . -t docker://frontend
```

Although we run the specs inside the container, we run it from the host. We don't need to get inside the container or intall anything there.

