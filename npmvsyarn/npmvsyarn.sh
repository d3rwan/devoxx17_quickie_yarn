#!/bin/bash

repeat() {
    number=${1}
    shift
    for n in $(seq ${number});
    do
        echo "[run=${n}]"
        $@
    done
}

build() {
    docker build -t bench ./bench/
}

run() {
    docker run -e LIBRARIES="" -e PROJECTS=$1 --rm bench
}


build
repeat 5 run https://github.com/vesparny/react-kickstart
