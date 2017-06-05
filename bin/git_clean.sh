#!/bin/bash

BRANCHES="$(git branch --merged | egrep -v '(^\*|master|staging|dev)')"

if [[ -n "$BRANCHES" ]]; then
    echo "About to delete:"
    echo "$BRANCHES"

    echo "Proceed? [y/N]"
    read -r input
    if [[ "$input" =~ ^[Yy] ]]; then
        echo "$BRANCHES" | while read branch; do
            echo "$branch"
            echo git branch -d "$branch"
            echo git push --delete origin "$branch"
        done
    else
        echo "Aborting"
        exit 1
    fi
fi
