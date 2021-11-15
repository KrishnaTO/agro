#!/bin/bash

# Note: run `chmod u+x ./github_issues_builder.sh` in linux (Permission denied error)

repo=$1
if [[ $repo =~ "agro" ]]
then repo_site="AgriculturalSemantics/agro"
elif [[ $repo =~ "envo" ]]
then repo_site="EnvironmentOntology/envo"
fi

if [ -z "$2" ] # if var is unset
then
    echo '"issue", "title", "creator", "state", "comments", "created", "body"' >> touch "${repo}_issues.csv"
    echo "ran unset var"
    curl \
        -H "Accept: application/vnd.github.v3+json" \
        -s "https://api.github.com/repos/$repo_site/issues?per_page=10000" | \
    jq -r '["issue", "title", "creator", "state", "comments", "created", "body"], (.[] | [.number,.title, .user.login, .state, .comments, .created_at, .body]) | @csv' > "${repo}_issues.csv"
else
    echo '"issue", "title", "creator", "state", "comments", "created", "body"'' >> touch "${repo}_issues.csv" 
    echo "ran set var"
    echo "ISSUES UNFIXED: WILL FIX LATER" #TODO
    for i in $2
    do
        curl 
            -H "Accept: application/vnd.github.v3+json" \
            -s "https://api.github.com/repos/$repo_site/issues/$2" |
        jq -r ''.[] | {number, title} as $index | {state, comments, created_at, body} as $list | .user as $use | [$index[], $use.login, $list[]] | @tsv' | tee -a "${repo}_issues.csv" || break
    done
fi
