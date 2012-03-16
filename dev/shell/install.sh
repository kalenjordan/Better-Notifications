#!/bin/bash
# Delete all of the directories / files and then symlink to them

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` /full/path/to/magento/install"
    exit 1
fi

if [[ $1 != /* ]] ; then
    echo "Please specify the full path to your Magento install. Path must start with '/'"
    exit 1
fi

function linkme()
{
    rm -rf $destination/$1
    ln -s $source/$1 $destination/$1
}

function makedir()
{
    mkdir -p $destination/$1
}

if [[ $(pwd) != */dev/shell* ]] ; then
    echo "You must run this installer from within dev/shell/"
    exit 1
fi

cd ../..

source=$(pwd)
destination=$1

linkme      "app/etc/modules/TBT_BetterNotifications.xml"

makedir     "app/code/community/TBT"
linkme      "app/code/community/TBT/BetterNotifications"
linkme      "app/design/adminhtml/default/default/layout/betternotifications.xml"
linkme      "app/design/adminhtml/default/default/template/betternotifications"

linkme      "skin/adminhtml/default/default/betternotifications"

cd dev/shell