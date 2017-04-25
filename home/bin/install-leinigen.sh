#!/bin/bash

if ! (command -v lein >/dev/null 2>&1)
then
    url=https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

    curl $url > ~/bin/lein

    chmod a+x ~/bin/lein

    lein
fi
