# Some custom functions for the JIRA API
jq=$(which jq)

# Expects a var $JIRA_URL
source ~/.jira

function jira_api_get_customfield () {
  if [[ -n "$1" ]]; then
    curl -u lbriggs -X GET -H "Content-Type: application/json" ${JIRA_URL}/rest/api/2/issue/createmeta\?projectKeys\=OPS\&issuetypeNames\=OPS%20Ticket\&expand\=projects.issuetypes.fields | jq ".projects[] | .issuetypes[] | .fields | .${1} | .name,.allowedValues[]"
  else
    echo "Must pass custom field name"
  fi
}
