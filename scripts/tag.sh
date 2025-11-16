#!/bin/bash

set -eu

next_version="$(git cliff --bumped-version)"

# Checks
if [[ -n $(git status --porcelain) ]]
then
  echo "Repo is dirty. Commit all changes first !"
  exit 1
fi

git cliff --bump --unreleased --strip header | git tag --cleanup=verbatim -a "${next_version}" -F -
