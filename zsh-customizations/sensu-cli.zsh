# Some custom functions for sensu-cli
function sensu_get_hosts_failing () {

local jq=$(which jq)

  if [[ -n "$1" ]]; then
    if [[ -n "$jq" ]]; then
      sensu-cli event list -i name,$1 -f single | awk '{print $3}' | egrep -v '(client|items)' | uniq
    else
      sensu-cli event list -i name,$1 -f json | $jq -r '.[].client.name' | uniq
    fi
  else
    echo "Must pass a check name, eg: puppet-running"
  fi

}
