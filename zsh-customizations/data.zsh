#!/bin/zsh
#
function json2yaml() {
  yq r $1
}

function yaml2json() {
  yq r -j $1
}

function sortyaml() {
  yq r --tojson $1 | jq . | yq r -
}
