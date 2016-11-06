CMPT470 Final Project
Group 14

Noted (tentative name) - A note taking app across your devices that is simple, effective and visual to fit your everyday needs.

Current dev configuration:

- clone project into local directory and cd into directory
- do vagrant up. This will install ruby and many of the libraries needed for ruby and rails as well as the rails "bundler" gem that takes care of all dependencies inside the project.
- do vagrant ssh to log into the vagrant virtual machine.
- the rails project directory is likely to be /project/noted. Start developing!

Server deployment configuration:

- cd into the rails project directory. This is likely to be /project/noted/
- do /bin/rails server -b 0.0.0.0
- the deployed website is up at localhost:3000. This is forwarded out of the virtual machine and is accessable in the host machine's browser.
- ...
- profit!

Things to note:

- do vagrant halt to shut down VM but not deleting the entire environment. Resume by vagrant up.
- do vagrant destroy to completely delete dev environment and roll back vagrant up. If you deploy a new VM after a vagrant destroy, go into /project/noted and do bundler install. This will let Rails install all dependencies within the VM that is deleted when we do vagrant destroy.
- currently sqlite3 is installed as the default database to go with Rails. If we are going with MySQL the Chef recipe will have to be modified to swap the database package, and possibly some gem packages installed to handle MySQL (not yet looked into this).

To be updated...