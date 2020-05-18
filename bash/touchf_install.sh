#!/bin/bash

EX_FOLDER="/usr/local/bin"
SCRIPT_NAME="touchf"

function script_install() {
  if [ ! -d $EX_FOLDER ]
  then
    mkdir $EX_FOLDER
    log "o1"
  fi
    cp $SCRIPT_NAME $EX_FOLDER/$SCRIPT_NAME
    chmod +x $EX_FOLDER/$SCRIPT_NAME
    log "o2"
}

function log()  {
  case $1 in
  o1)
    msg="Directory $EX_FOLDER created."
    ;;
  o2)
    msg="Installation of $SCRIPT_NAME finished"
    ;;
  esac
  echo $msg
}

script_install
