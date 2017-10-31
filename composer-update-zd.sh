#!/bin/bash
composer="${COMPOSER_CMD:-/usr/local/bin/composer}"
if [ ! -x $composer ]
then
    echo "Composer cmd \"$composer\" not found!"
    exit 1
fi
today=`date +%Y%m%d%H%M%S`
vendorDir="vendor-$today"
mkdir -p $vendorDir
if [ -d "vendor" ]
then
    /usr/bin/rsync -zrptl vendor/* $vendorDir
fi

COMPOSER_VENDOR_DIR=$vendorDir $composer update --no-progress $@
if [ $? = 0 ]
then
    if [ ! -L "vendor" ] && [ -d "vendor" ]; then rm -rf vendor; fi
    ln -sfn $vendorDir vendornew;mv -fT vendornew vendor
    export lineCount=`expr $(ls -1 -d vendor-* | wc -l) - 3`
    if [ $lineCount -gt 0 ]; then ls -1 -d vendor-*| head -n $lineCount | xargs rm -rf; fi
else
        echo "Composer update failed!"
        exit 1
fi