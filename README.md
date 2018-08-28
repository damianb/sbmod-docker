# sbmod-docker

A docker image template for building Starbound mods with Docker, [sbpak](https://github.com/damianb/sbpak), and [sbtool](https://github.com/damianb/sbtool).

### Usage

* Ensure you have Docker or Docker for Windows installed

* Open a new powershell or git bash instance

* Clone the repo with `git clone https://github.com/damianb/sbmod-docker.git`

* Copy your `packed.pak` file from your Starbound installation into your `sbmod-docker` checkout.

* Run `./build.ps1` if using powershell, or `./build.sh` if using git bash.

Your image should start building afterwards.  Please note, due to the size of the build context (due to relying on the packed.pak file for sbtool usage).

After the image is built, it should be available as "sbmod-docker" with unpacked assets available at `/opt/StarboundAssets/`.

*For example usage, check `example.Jenkinsfile` in the repository.*

#### Why isn't this available on Dockerhub?

The Starbound asset file, `packed.pak`, is not licensed for redistribution - ergo, the entire image cannot legally be provided on Dockerhub.
If enough demand occurs, a smaller Docker image may be made available *sans `packed.pak`*.

### License

Licensed under the MIT license.  See ./LICENSE for the license text.
