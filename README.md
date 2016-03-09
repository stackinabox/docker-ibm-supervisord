# Base Docker Image for ssh and supervisord

This docker image will configure ssh and supervisord to run in a docker container. This
image is intended to provide a foundation for other docker images which follow this pattern. 

## Build the docker image

    docker build -t "stackinabox/supervisord" .
    
## Use the docker image from your own Dockerfile

	FROM stackinabox/supervisord
	...

	CMD ["/bin/bash"]
	
## References

See [Best practices for writing Dockerfiles](https://docs.docker.com/articles/dockerfile_best-practices/)
for tips on creating easy to read and consume Dockerfiles.