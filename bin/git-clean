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
            git branch -d "$branch"
            git push --delete origin "$branch"
        done
    else
        echo "Aborting"
        exit 1
    fi
fi
