#!/bin/bash
#
# Create a tar ball of the species sites for deployment.
# Ken Seal - NCGR
#

## Files to ignore ##
SCRIPT=`basename $0`
INFO="INFO"
COPY="utils.bash"

for dir in $(ls -d *)
do
    if [[ $dir == $SCRIPT || $dir == $INFO || $dir == $COPY ]]
    then
        continue
    else
        # Omitted:
        # log
        # startServer
        # tmp
        # .gitignore
        # .rspec
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
     fi
done

RELEASE="species-release.tar.gz"

tar czf $RELEASE *.gz

for tar in *.gz
do
    if [[ $tar != $RELEASE ]]
    then
        rm $tar
    fi
done

