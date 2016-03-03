# Some custom functions for sensu-cli
sensucli=$(which sensu-cli)
jq=$(which jq)

# Gets all the hosts failing a check
function sensu_get_hosts_failing () {
  if [[ -n "$1" ]]; then
    if [[ -n "$jq" ]]; then
      $sensucli event list -i name,$1 -f single | awk '{print $3}' | egrep -v '(client|items)' | uniq
    else
      $sensucli event list -i name,$1 -f json | $jq -r '.[].client.name' | uniq
    fi
  else
    echo "Must pass a check name, eg: puppet-running"
  fi
}

# Returns all the hosts with a stash
function sensu_get_stashed_hosts () {
  if [[ -n "$jq" ]]; then
    $sensucli stash list -f json -i expire,-1 | jq -r '.[].path' | cut -d/ -f 2
  else
    $sensucli stash list -f single expire,-1 | awk {'print $2'} | egrep -v '(total|path)' | cut -d/ -f 2
  fi
}

# Returns a list of sensu clients that have a stash
# but are no longer pingable
function sensu_get_stashed_orphans () {
  orphans=($(sensu_get_stashed_hosts))
  for orphan in "${orphans[@]}"
  do
    echo $orphan | fping -u -c 1 -q &> /dev/null
    rc=$?; if [[ $rc != 0 ]]; then echo ${orphan}; fi
  done
}
