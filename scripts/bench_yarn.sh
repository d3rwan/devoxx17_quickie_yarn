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
    yarn cache clean
}
cleanWorkspace() {
    rm -rf node_modules
}
cleanLock() {
    rm -rf yarn.lock
}
install() {
    time yarn
}
install_wo_lock() {
    cleanLock
    install
}
warm_install_wo_lock() {
    cleanLock
    cleanWorkspace
    install
}
warm_install() {
    cleanWorkspace
    install
}
cold_install_wo_lock() {
    cleanCache
    cleanLock
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
cleanWorkspace
cd react-kickstart
echo
echo "-- Cold (w/o) lock --"
repeat 5 cold_install_wo_lock
echo
echo "-- Cold --"
repeat 5 cold_install
echo
echo "-- Warm (w/o) lock --"
repeat 5 warm_install_wo_lock
echo
echo "-- Warm --"
repeat 5 warm_install
echo
echo "-- Update (w/o) lock --"
repeat 5 install_wo_lock
echo
echo "-- Update --"
repeat 5 install
