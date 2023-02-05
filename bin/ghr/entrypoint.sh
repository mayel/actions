#!/bin/sh
set -ex

gh_user=`echo $GITHUB_REPOSITORY | sed -e 's/\/.*//g'`
gh_repo=`echo $GITHUB_REPOSITORY | sed -e 's/.*\///g'`

version=v`grep -m 1 'version:' mix.exs | cut -d '"' -f2`

ghr -v
sh -c "ghr -t $GITHUB_TOKEN -u $gh_user -r $gh_repo -n $version $version $ASSETS"
