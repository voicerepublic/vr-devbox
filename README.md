Welcome to Devbox
=================

Install virtualbox & vagrant.

Run

`vagrant up`

Inside the running terminal of the devbox run `setup-vr.sh`.


Development
-----------

Update the image

```
git pull && vagrant provision
```

If you just want to update the prepared files

```
rsync -avz -e "ssh -p 2222" home/ vagrant@localhost:
```


TODO
----

- [x] enable shared clipboard by default
- [x] add an optical drive & install virtualbox guest additions -> this can be easily done with https://github.com/dotless-de/vagrant-vbguest
