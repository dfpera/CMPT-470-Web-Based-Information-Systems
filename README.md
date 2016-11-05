CMPT470 Final Project
Group 14

Notestack (tentative name) - A note taking app across your devices that is simple, effective and visual to fit your everyday needs.

Current dev configuration:

- clone project into local directory and cd into directory
- do vagrant up. This will install ruby and many of the libraries needed for ruby and rails as well as the rails "bundle" gem that takes care of all dependencies inside the project.
- do vagrant ssh to log into the vagrant virtual machine.
- the rails project directory is likely to be /project/notestack. Start developing!

Deployment configuration:

- cd into the rails project directory. This is likely to be /project/notestack/
- do /bin/rails server -b 0.0.0.0
- the deployed website is up at localhost:3000. This is forwarded out of the virtual machine and is accessable in the host machine's browser.
- ...
- profit!

To be updated...