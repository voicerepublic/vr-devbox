#!bin/bash

url=https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

curl $url > ~/bin/lein

chmod a+x ~/bin/lein

lein
