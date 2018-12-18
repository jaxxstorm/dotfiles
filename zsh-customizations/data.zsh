#!/bin/zsh
#
function json2yaml() {
  yq r $1
}

function yaml2json() {
  yq r -j $1
}
