#!/bin/bash -e
#
# Create a tar ball of the species sites for deployment.
# Alex Rice, Ken Seal - NCGR
#

# list only the subdirectories (these happen to be all species names for the site)
for dir in $( ls -d */ | sed 's/\/$//' ) 
do
  echo $dir
  # Omitted files: log, startServer, tmp, .gitignore, .rspec
  tar czf $dir-release.tar.gz \
  $dir/app \
  $dir/config \
  $dir/config.ru \
  $dir/db \
  $dir/doc \
  $dir/Gemfile \
  $dir/Gemfile.lock \
  $dir/lib \
  $dir/public \
  $dir/Rakefile \
  $dir/README.rdoc \
  $dir/script \
  $dir/spec \
  $dir/vendor
done

RELEASE="species-release.tar.gz"
tar czf $RELEASE *.gz
echo "*created $RELEASE*"
for tar in *.gz
do
  if [[ $tar != $RELEASE ]]
    then
    echo "removing $tar"
    rm $tar
  fi
done
