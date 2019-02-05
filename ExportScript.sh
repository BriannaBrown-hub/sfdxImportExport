#!/usr/bin/env bash

set -eou pipefail

# Boiler plate color functions.

# Prints some text in green.
function echo_green {
  echo
  echo -e "\\033[0;32m$*\\033[0m"
}

# Prints some text in yellow.
function echo_warning {
  echo -e "\\033[1;33m$*\\033[0m"
}

# Prints some text in red to stderr.
function echo_error {
  >&2 echo
  >&2 echo -e "\\033[0;31m$*\\033[0m"
}

ACCOUNT_TO_START_WITH="0015000000NApwz"

# Account
echo_green "Fetching Account"
sfdx force:data:soql:query -u DevHub --query "SELECT id, Name, Site  FROM Account WHERE Id="\'"${ACCOUNT_TO_START_WITH}"\'" LIMIT 1" --json > account.json
cat account.json | jq
ACCOUNT_ID=$(cat account.json | jq '.result.records[].Id' --raw-output)
echo_green Account Id is: "$ACCOUNT_ID"

# Opportunity
echo_green "Fetching Opportunity"
sfdx force:data:soql:query -u DevHub --query "SELECT id, AccountId, Name FROM Opportunity WHERE AccountId = "\'"${ACCOUNT_ID}"\'" LIMIT 1" --json > opportunity.json
cat opportunity.json | jq
OPPORTUNITY_ID=$(cat opportunity.json | jq '.result.records[].Id' --raw-output)
echo_green Opporunity Id is: "$OPPORTUNITY_ID"
# Opportunity line item

echo_green "Fetching Opportunity Line Item"
sfdx force:data:soql:query -u DevHub --query "SELECT id, OpportunityId, name FROM OpportunityLineItem WHERE OpportunityId = "\'"${OPPORTUNITY_ID}"\'" LIMIT 1" --json > opportunity-line-item.json
cat opportunity.json | jq

# Show contents of folder.
ls
