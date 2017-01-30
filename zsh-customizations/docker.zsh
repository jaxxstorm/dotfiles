# Some docker based functions
#

function docker_get_dangling_images () {
  /usr/local/bin/docker images -q --filter "dangling=true"
}

function docker_remove_dangling_images () {
  /usr/local/bin/docker rmi $(/usr/local/bin/docker images -q --filter "dangling=true")
}

function docker_get_stopped_containers () {
  /usr/local/bin/docker ps -a -q
}

function docker_remove_stopped_containers () {

 /usr/local/bin/docker rm $(/usr/local/bin/docker ps -a -q)
 
}
