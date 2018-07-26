#!/bin/sh
if [ ! -f /var/lib/foundationdb/fdb.cluster ]
then
    if [ "$1" = "" ]
    then
        echo "Configure new cluster."
        /etc/foundationdb/packaging/make_public.py
        cp /etc/foundationdb/fdb.cluster /var/lib/foundationdb/fdb.cluster
        (sleep 1 && /etc/foundationdb/bin/fdbcli --no-status --exec "configure new single memory" &)
    else
        echo "Replace $FDB_CLUSTER_FILE with $1 to join."
        echo $1 > /var/lib/foundationdb/fdb.cluster
    fi
fi

if [ ! -f /usr/sbin/fdbserver ]
then
    ln -s /etc/foundationdb/bin/fdbserver /usr/sbin/fdbserver
fi
if [ ! -d /var/lib/foundationdb/data ]
then
    mkdir -p /var/lib/foundationdb/data
    chmod a+w /var/lib/foundationdb/data
fi


if [ ! -d /var/log/foundationdb ]
then
    mkdir -p /var/log/foundationdb
    chmod a+w /var/log/foundationdb
fi

exec /etc/foundationdb/bin/fdbmonitor
