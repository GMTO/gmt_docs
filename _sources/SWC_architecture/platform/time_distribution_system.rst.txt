
.. _time_distribution_system:

Time Distribution System
------------------------

While individual subsystems often provide their own internal clock(s), quality
and accuracy of (crystals) varies vastly between systems. A time distribution
system allows a heterogeneous set of controllers to reference and to synchronize
to the same master clock, and to share the same notional measure of time within
a distributed framework. Time systems are commonly layered into strata,
referring to how far each clock is located from the reference clock. For
telescope applications, a GPS clock (stratum 1) heads the hierarchy and acts as
the grand master clock.

A time system is particularly relevant for the GMT Telescope where time
synchronization plays an important role in many areas. In calculating a
telescope slew trajectory, for example, the telescope kernel pointing
coordinates must be computed using the GPS time; or for calculating continuous
drive demands, where it is necessary to interpolate between time stamps; or for
telemetry case, where uniform timestamps must be used to correlate real-time and
archive data.

.. table:: SWCS Time Distribution Requirements (Level 3)

  +--------------------+-----------------------------------------------------------+
  |   Requirement      |   Statement                                               |
  +====================+===========================================================+
  |   Synchronization  |   Provide the capability to coordinate the operations of  |
  |   Time Budget      |   subsystems during operations to within time budgets     |
  |                    |   allotted by the SLR.                                    |
  +--------------------+-----------------------------------------------------------+
  |   Time Reference   |   Provide the capability to obtain and distribute a time  |
  |                    |   reference accurate to 1ms (TBR).                        |
  +--------------------+-----------------------------------------------------------+


*Time Distribution Protocols*
.............................

The most popular time distribution protocols are the Network Time Protocol
(NTP), the Inter-range Instrumentation Group code B (IRIG-B) and the Precision
Time Protocol (PTP). Their main characteristics are described in the following
list:

  * NTP is the de-facto standard for computer clusters. NTP assets include:
    platform independence, availability on all operating systems, and simple
    deployment relying on ubiquitous Ethernet connection. NTP precision is
    limited by unaccounted network transmission delays, and susceptibility to
    changes in the network topology.

  * IRIG-B is commonly used by 8-10m class telescopes and other major
    experimental physics control systems. More accurate synchronization is
    achieved in this case using a dedicated hardware clock and connection.
    IRIG-B effectively builds a time bus concept that features specialized
    components (hardware, software drivers, etc.) making it somewhat cumbersome
    and often time-consuming to implement, adding extra burden to the deployment
    (dedicated networks of coaxial cables are needed) and increasing the
    implementation cost (specialized hardware for all sub-systems is required).

  * PTP emerged more recently in the distributed cluster world. It addresses
    deficiencies of NTP, offering more accurate timestamps (thanks to
    synchronization packets) and accounting for transmission delays in the
    network. The second revision of the protocol achieves further accuracy by
    using specialized network interface cards (NICs) and transparent clocks. The
    NICs can provide hardware timestamp, so the nearer to the hardware the
    timestamps are generated the higher the precision.

The main features of the relevant time protocols are summarized in the Table
below:

.. table:: Time Protocols Comparison

  +-----------+---------------------+---------------+-------------------------------------------------------------+
  | Protocol  |  Sync. Accuracy     | Interconnect  |  Properties                                                 |
  +===========+=====================+===============+=============================================================+
  | NTP       |  ~ 2 ms             | LAN/WAN       |  Subject to network delays, affected by topology changes    |
  +-----------+---------------------+---------------+-------------------------------------------------------------+
  | Protocol  |  Sync. Accuracy     | Interconnect  |  Properties                                                 |
  +-----------+---------------------+---------------+-------------------------------------------------------------+
  | IRIG-B    |  1-10 us            | Coaxial       |  Needs dedicated hardware and software drivers              |
  +-----------+---------------------+---------------+-------------------------------------------------------------+
  | PTP       |  5-50 us (software) | LAN           |  Measure and compensate transmission delays                 |
  +           +---------------------+---------------+-------------------------------------------------------------+
  |           |  < 1 us (hardware)  |               |  Better accuracy using dedicated NICs and switches          |
  +-----------+---------------------+---------------+-------------------------------------------------------------+

*Precision Time Protocol*
.........................

A growing number of industrial and power utility tasks require the use of
time-synchronized networks. Traditionally, timing information was distributed
via a dedicated network separate from the main application, such as real-time
distribution protocols, of which IRIG-B is perhaps the best known. More
recently, the market has shifted to a single converged data and distributed
timing network based on standard Ethernet running IEEE1588 Precision Time
Protocol as part of the application layer. The protocol can achieve
sub-microsecond synchronization performance over distributed networks. The
IEEE15888 Standard is currently in its 2nd revision.


*PTP Software Stacks for Linux*
...............................

Several open source (e.g., ptpd-2, ptppd-phc) and commercial (e.g., IXXAT,
FSMLabs) software stacks are available for Linux, including network drivers
with hardware timestamp (e.g., Blackfin on-chip Ethernet MAC driver, Intel
Gigabit Ethernet Network Driver). Refer to the report IEEE- 1588 PTP
Evaluation [Bec12d]_ for a detailed list and analysis on the software stacks for
Linux.


*Lab Evaluation*
................

Several PTP topologies to measure synchronization accuracy have been tested at
the GMT lab67. A common arrangement is shown in Figure below:

.. figure:: _static/PTP-master-slaves.png

   PTP Master with 2 Slaves Arrangement using a Switched Network and a Dedicated
   NIC.

Two slave computers were synchronized with PTP and each was generating a
digital pulse over the serial communications port at 10 Hz. The test was
carried out over a private LAN using one dedicated NIC isolated from the
intranet and another NIC that was running the EtherCAT master in the
background. The daemon used for the test was the ptpd-2 open source stack.

Synchronization accuracy was measured with an oscilloscope, capturing the
delay and variation between the two independently generated pulses as shown in
the Figure below. Over one million samples – which at 10 pulses per second
translates roughly into 27 hours – the standard deviation is less than 2.5us
and representative of PTP stability. The min/max outliers amplitude at < 25us
falls within the technology accepted published figures.

.. figure:: _static/PTP-synchronization-accuracy.png

   Lab PTP Synchronization Accuracy Tests

During the tests a couple of disturbances were introduced to evaluate the
synchronization robustness. First some network traffic was initiated,
essentially copying the entire file system from the master machine to an
external computer outside the PTP LAN (directing the traffic to the general
LAN). The accuracy in this case did not seem to be affected. Next, the
machine was artificially loaded at lower priority, leaving the non-isolated
CPU with 100% effective load. No evident effect on timing accuracy was
observed.

A summary with all the measured quantities using a ptpd-2 implementation of
the Linux PTP Software Stack is presented in the following Table:

.. table:: ptpd-2 Implementation Measured Accuracy

  +--------------------+--------------+
  | Statistic          | Value        |
  +====================+==============+
  | Samples (pulses)   | > 1 million  |
  +--------------------+--------------+
  | Mean offset        | 1.70 us      |
  +--------------------+--------------+
  | Standard deviation | 2.48 us      |
  +--------------------+--------------+
  | Min/Max amplitude  | 24 us        |
  +--------------------+--------------+

The PTP network tested before was reconfigured to work over the common LAN,
using now the same NIC for PTP synchronization and general networking. The
table below shows the statistics obtained over the common LAN case, and as
expected, the performance is slightly worse (about 60%) than using a dedicated
LAN.

.. table:: ptpd-2 Measured Accuracy over a Common LAN

  +--------------------+--------------+
  | Statistic          | Value        |
  +====================+==============+
  | Samples (pulses)   | 278 k        |
  +--------------------+--------------+
  | Mean offset        | 5.60 us      |
  +--------------------+--------------+
  | Standard deviation | 4.21 us      |
  +--------------------+--------------+
  | Min/Max amplitude  | 35.4 us      |
  +--------------------+--------------+

For optimal performance with EtherCAT, a patched driver for the fieldbus
enabled NIC was used. During the tests, some interactions between the PTP
daemon and the driver were observed, right when the EtherCAT master was
started and the patched driver for the NIC got loaded. The issue can be
addressed by sequencing the access to the NIC, for example by stopping the PTP
daemon while EtherCAT initializes and then running it again after EtherCAT has
started.

In summary, PTP has several advantages for time distribution and
synchronization in a widely distributed system as GMT:

  * Easy and inexpensive to implement using a LAN infrastructure

  * Common and proven technology

  * Guaranteed long time support

However, a pure software solution may not be enough for a system requiring
very high timing resolution stability. The numbers collected during these
tests are consistent with the literature and leave no reason to doubt hardware
solutions could bring sub-microsecond accuracy. For the GMT Telescope Control,
a more detailed system analysis should be carried out if 5-50 microsecond
accuracy is necessary.
