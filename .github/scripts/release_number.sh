#!/usr/bin/env bash

repo_link="https://github.com/GDSCParulUniversity/Habit-Tracker-App"

current_verision=$(git -c 'versionsort.suffix=-' ls-remote --tags --sort='v:refname' \
    $repo_link | tail -n1 | cut -d / -f 3 | cut -d V -f 2-)

[[ -z $current_verision ]] && {
    echo "NO release found?"
    echo "Fallback to V0000"
    current_verision=00
}

new_release="V$(($current_verision + 1))"
echo "VERSIONTAG=$new_release"
