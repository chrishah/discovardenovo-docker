# discovardenovo-docker
Ubuntu 18.04 with DiscovarDenovo

The image contains a full install of [DiscovarDenovo](https://software.broadinstitute.org/software/discovar/blog/), including all necessary dependencies. I am not part of the developer team - I just made this image.

In detail, the image is set up with:
 - Ubuntu 18.04
 - samtools 1.9
 - DiscovarDenovo (52488)

To run the software you can do the following (this will mount the directory `/in` of the container to the current working directory on your local machine, and allow you to access files in this directory and any sub-directories):
```bash
$ docker run --rm -v $(pwd):/in -w /in chrishah/discovardenovo:52488 DiscovarDenovo
```

You can also enter the container environment and work within it. All executables should be in the `PATH`.
```bash
$ docker run -it --rm -v $(pwd):/in -w /in chrishah/discovardenovo:52488 /bin/bash
```
