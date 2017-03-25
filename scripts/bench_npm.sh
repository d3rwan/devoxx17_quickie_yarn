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
cleanCache() {
    npm cache clear
}
cleanWorkspace() {
    rm -rf node_modules
}
install() {
    time npm install
}
warm_install() {
    cleanWorkspace
    install
}
cold_install() {
    cleanCache
    cleanWorkspace
    install
}

rm -rf react-kickstart
git clone https://github.com/vesparny/react-kickstart
cd react-kickstart
echo
echo "-- Cold --"
repeat 5 cold_install
echo
echo "-- Warm --"
repeat 5 warm_install
echo
echo "-- Update --"
repeat 5 install
