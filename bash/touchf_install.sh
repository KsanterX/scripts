#!/bin/bash

EX_FOLDER="/usr/local/bin"
SCRIPT_NAME="touchf"

function script_install() {
  file_copy $SCRIPT_NAME $EX_FOLDER/$SCRIPT_NAME
  chmod +x $EX_FOLDER/$SCRIPT_NAME
  log "Installation of $SCRIPT_NAME finished."
}

function file_copy() {
  cp $1 $2
}

function log()  {
  echo $1
}

script_install
