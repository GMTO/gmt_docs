
.. _time_distribution_framework:

Time Distribution Framework
---------------------------

The Precision Time Protocol is a method by which a cluster of computers,
communicating over a Local Area Network, can keep their local clock synchronized
to a better time source, commonly referred to as a Master Clock.

The protocol is defined by the `IEEE 1588 standard
<https://www.nist.gov/el/intelligent-systems-division-73500/ieee-1588>`_, and
enables heterogeneous systems that include clocks of various inherent precision,
resolution, and stability to synchronize to a grandmaster clock. The protocol
supports system-wide synchronization accuracy in the sub-microsecond range
requiring minimal network and local clock computing resources.

Different implementations are available from open-source projects and commercial
vendors. Prototyping activities have shown PTP to be a suitable time
distribution framework for GMT, capable of microseconds synchronization.
Different vendors offer cost effective IEEE 1588 Grandmaster Clock with GPS
(Global Positioning System) reference that supports the latest PTP version 2
protocol. Additional IEEE 1588 enabled Ethernet switches can be deployed for
improved performances.

Similarly to NTP, deployment is straightforward and just requires a daemon to be
running,. The daemon adjusts the system-wide real-time clock of the computer,
and is thus transparent to users or applications using standard calls.
