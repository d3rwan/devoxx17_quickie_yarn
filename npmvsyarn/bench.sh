#!/bin/bash

benchLibrary() {
    library=${1}
    echo "*** Bench de la librairie ${library} ***"
    npmvsyarn ${library}
}

benchProject() {
    project=${1}
    cd /tmp
    project_name=`basename ${project}`
    echo "*** Bench du projet ${project_name} ***"
    if [ ! -d "/tmp/${project_name}" ];
    then
        git clone ${project}
    fi
    cd /tmp/${project_name}
    npmvsyarn
}

benchAllLibraries() {
    if [[ ! -z "${LIBRARIES}" ]];
    then
        echo "---------------------------------------------"
        echo "Bench sur quelques librairies représentatives"
        echo "---------------------------------------------"
        for library in ${LIBRARIES};
        do
            benchLibrary ${library}
        done
        echo "---------------------------------------------"
        echo
    fi
}

benchAllProjects() {
    if [[ ! -z "${PROJECTS}" ]];
    then
        echo "---------------------------------------------"
        echo "Bench sur quelques projets représentatifs"
        echo "---------------------------------------------"
        for project in ${PROJECTS};
        do
            benchProject ${project}
        done
        echo "---------------------------------------------"
        echo
    fi
}

benchAllLibraries
benchAllProjects
