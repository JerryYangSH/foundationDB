# foundationDB 

## Build foundationDb from sourcecode in Linux and deploy.

* 1. mkdir ~/foundationdb; cd ~/foundationdb
* 2. Clone foundationdb code from https://github.com/apple/foundationdb
git clone https://github.com/apple/foundationdb.git
* 3. run into docker container, ubuntu image is preferred.
docker run -it -v '/root/foundationdb:/etc/foundationdb' 07480d0ef528 /bin/bash
* 4. cd /etc/foundationdb; build
* 5. after build successfully, you can see these binaries are generated in bin/ and packaging/.
fdbmonitor executable is used to help to spaw fdbserver which is core part of foundationdb.
* 6. prepare fdb.cluster and foundationdb.conf.
* 7. run ./start.sh
* 8. check cluster status by ./bin/fdbcli


Below is an example of successfully deployment output.

rTime="1532575549.825919" Severity="10" LogGroup="default" Process="fdbmonitor": Watching conf file /etc/foundationdb/foundationdb.conf
Time="1532575549.825987" Severity="10" LogGroup="default" Process="fdbmonitor": Watching conf dir /etc/foundationdb (2)
Time="1532575549.826062" Severity="10" LogGroup="default" Process="fdbmonitor": Loading configuration /etc/foundationdb/foundationdb.conf
Time="1532575549.835775" Severity="10" LogGroup="default" Process="fdbmonitor": Starting fdbserver.4500
Time="1532575549.867407" Severity="10" LogGroup="default" Process="fdbmonitor": Starting fdbserver.4501
Time="1532575549.868791" Severity="10" LogGroup="default" Process="fdbmonitor": Starting fdbserver.4502
Time="1532575549.869593" Severity="10" LogGroup="default" Process="fdbserver.4501": Launching /usr/sbin/fdbserver (64) for fdbserver.4501
Time="1532575549.869664" Severity="10" LogGroup="default" Process="fdbserver.4500": Launching /usr/sbin/fdbserver (63) for fdbserver.4500
Time="1532575549.869685" Severity="10" LogGroup="default" Process="fdbserver.4502": Launching /usr/sbin/fdbserver (65) for fdbserver.4502
Time="1532575550.009242" Severity="10" LogGroup="default" Process="fdbserver.4502": FDBD joined cluster.
Time="1532575550.050309" Severity="10" LogGroup="default" Process="fdbserver.4501": FDBD joined cluster.
Time="1532575550.063793" Severity="10" LogGroup="default" Process="fdbserver.4500": FDBD joined cluster.

root@2fba3e366c37:/etc/foundationdb# ./bin/fdbcli
Using cluster file `fdb.cluster'.

The database is available.

Welcome to the fdbcli. For help, type `help'.
fdb> status

Using cluster file `fdb.cluster'.

Configuration:
  Redundancy mode        - single
  Storage engine         - memory
  Coordinators           - 3

Cluster:
  FoundationDB processes - 3
  Machines               - 1
  Memory availability    - 1.1 GB per process on machine with least available
                           >>>>> (WARNING: 4.0 GB recommended) <<<<<
  Fault Tolerance        - 0 machines
  Server time            - 07/26/18 03:26:16

Data:
  Replication health     - (Re)initializing automatic data distribution
  Moving data            - unknown (initializing)
  Sum of key-value sizes - unknown
  Disk space used        - 1 MB

Operating space:
  Storage server         - 1.0 GB free on most full server
  Log server             - 1.0 GB free on most full server

Workload:
  Read rate              - 5 Hz
  Write rate             - 0 Hz
  Transactions started   - 4 Hz
  Transactions committed - 0 Hz
  Conflict rate          - 0 Hz

Backup and DR:
  Running backups        - 0
  Running DRs            - 0

Client time: 07/26/18 03:26:16


