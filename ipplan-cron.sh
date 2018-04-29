#!/bin/bash

PATH=/bin:/usr/bin:/usr/local/bin

cat << _EOF_ > $HOME/.netrc
machine doc.tech.dreamhack.se
login $IPPLAN_USERNAME
password $IPPLAN_PASSWORD
_EOF_

while [ true ];
do
  date
  echo "Refreshing ipplan"
  curl --silent -n --max-time 15 \
    https://doc.tech.dreamhack.se/stuff/ipplan.db.xz | unxz > \
      /etc/ipplan/ipplan.db.new

  curl --silent -n --max-time 15 \
    https://doc.tech.dreamhack.se/svn/allevents/services/manifest > \
      /etc/ipplan/manifest.new

  mv /etc/ipplan/ipplan.db.new /etc/ipplan/ipplan.db
  mv /etc/ipplan/manifest.new /etc/ipplan/manifest

  echo "Done"
  sleep 60
done
