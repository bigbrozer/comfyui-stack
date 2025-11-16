#!/bin/bash

set -eu

next_version="$(git cliff --bumped-version)"
tag_body="$(git cliff --bump --unreleased --strip header)"

# Checks
if [[ -n $(git status --porcelain) ]]
then
  echo "Repo is dirty. Commit all changes first !"
  exit 1
fi

git tag -a "${next_version}" -m "${tag_body}"
