AMQ 7 Broker Disaster Recovery allows messaging applications using the Broker to continue after a major service outage 
to a data centre.

A typical broker topology would have HA broker pairs running in a single data centre with each brokers messaging journal 
replicated to another data centre. Idle brokers would be configured on the second data centre waiting for manual 
intervention after a data centre failure.

>Note:  Disaster Recovery is not a replacement for HA message broker redundancy within a data center. Message broker 
redundancy provides automatic protection against a single message broker failure. Disaster Recovery protects against 
more catastrophic events in the data center and requires manual intervention to affect a fail over.

The Journal is replicated between data centres using Ceph.
