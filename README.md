# nifskope-in-a-docker

Is your system Qt too new to build Nifskope?  Is the Qt online installer utterly broken?

If your answer to either querstion is "yes", or if you simply want to run Nifskope in a docker container, this image is for you!

## Usage

Assuming `docker` and `make` are installed and working, all that's needed:

    cd ~/path/to/nifskope-in-a-docker
    sudo make  # sudo required to run 'docker build' and/or 'docker run'

The image will be built and than ran, after some setup is done to ensure the app can reach your X session.

The default behavior is to just build `develop`.

Also by default, a directory called `out` in the root of this repository will be used to share files with the running container.
