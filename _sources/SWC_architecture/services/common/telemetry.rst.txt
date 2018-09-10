
.. _services-telemetry:

*Telemetry Service*
...................

The telemetry service provides the ability to observe any data transmitted by
hardware or software subsystem available for monitoring. Telemetry data
usually consist of a continuous flow of scalar values at a certain rate. The
Telemetry Service allows one to select the quantities to monitor, and to start
or to stop collecting data.

The telemetry adapter provides an interface that allows:

  * Retrieval of quantities to be monitored in a given Subsystem or Component

  * Start/stop sampling and collecting of monitoring data

  * Specifying the rate at which the data are sampled.

Two categories of measurement data can be sampled:

  * Continuous: quantities that are continuous in values. For instance, a
    temperature sensor.

  * Discrete: quantities that are discrete in values. For instance, the state
    of a switch (ON, OFF), the position of a window within a range of three
    possible positions (CLOSED, HALF-OPEN, OPEN), etc. When monitoring
    discrete quantities, only the changes of value are sampled.


.. table:: SWCS Telemetry Service Requirements (Level 3)

  +---------------------------+----------------------------------------------------------------------+
  |   Requirement             |   Statement                                                          |
  +===========================+======================================================================+
  |   Telemetry               |   Provide the capability to sample, display, and correlate any       |
  |                           |   signal with the resolution and frequency required to               |
  |                           |   characterize the behavior of the signal.                           |
  +---------------------------+----------------------------------------------------------------------+
  |   Instrument and          |   Provide data storage facility with sufficient capacity to store at |
  |   Telemetry Data Storage  |   least 15 years (TBR) of an instrument data and telemetry logs and  |
  |                           |   essential data for the lifetime of the observatory.                |
  +---------------------------+----------------------------------------------------------------------+


The Table below shows the GMT estimated bandwidth including all subsystems
described in Table 10-5 plus AO. The total average bandwidth is 76.35 MBps, or
2.62 TB per night (considering a 10hr night), which defines the GMT storage
requirements.

.. _telemetry_bandwidth:

.. table:: Estimated Telemetry Bandwidth

  +---------------+-------------------+---------------+---------------------+--------------+
  |   Subsystem   |   Raw Bandwidth   |   Duty Cycle  |   Operational       |   Percentage |
  |               |   (MBps)          |   (%)         |   Bandwidth (MBps)  |   (%)        |
  +===============+===================+===============+=====================+==============+
  |   Telescope   |   22.95           |   100         |   22.95             |   30.1       |
  +---------------+-------------------+---------------+---------------------+--------------+
  |   AO-LTAO     |   174             |   20          |   34.80             |   45.6       |
  +---------------+-------------------+---------------+---------------------+--------------+
  |   AO-GLAO     |   21              |   50          |   10.50             |   13.7       |
  +---------------+-------------------+---------------+---------------------+--------------+
  |   AO-NGSAO    |   162             |   5           |    8.10             |   10.6       |
  +---------------+-------------------+---------------+---------------------+--------------+
  |   Total                                           |   76.35             |   100        |
  +---------------+-------------------+---------------+---------------------+--------------+


The telemetry service is implemented, like other infrastructure services, as a
distributed system.  The telemetry adapters allow any component of the system,
usually running in Device Control Computers, to send any telemetry data to the
telemetry supervisor through a common API.  Depending on the required
bandwidth the adapter may provide different transport strategies (e.g., a
circular buffer held in memory or Solid State Disk that is flushed
periodically) and fault tolerance capabilities (e.g., routing the outgoing
data to an alternative supervisor). The telemetry supervisor takes care of
storing the data in the telemetry database for further analysis or to relay
the streams of data for presentation in the user interface.

**Service Packages**

  *Service Package (server & adapter)* -

    A telemetry server system, deployed eventually in several machines takes
    care of receiving telemetry samples, storing them and forwarding them to
    the telemetry user interface panels or the telemetry analysis system.

    In addition to the handling of telemetry monitors, the telemetry server
    provides features that allow load balancing and fault tolerance. The
    telemetry system operation, as with any other component, can be monitored
    by the telemetry system itself specifying monitor features in its
    interface (e.g., number of components connected, number of active alarms,
    state of the server, instant alarm throughput).

  *Analytics Package* -

    The analytics package provides the following capabilities:

      * History reconstruction of any quantity monitored by the system
      * Real-time monitoring and telemetry analysis in streaming mode.
      * Export of time-stamped telemetry data samples to ASCII format (e.g., CSV files).

  *Visualization Package* -

    The visualization package provides custom panels that allow observatory
    operators to monitor and manage the telemetry of the system. This is done
    by implementing several optimized visualizations.

  .. table:: Telemetry Service Visualization Panels

    +---------------------------+-----------------------------------------------------------------------------------+
    |   Visualization Panel     |   Description                                                                     |
    +===========================+===================================================================================+
    |   Global Panel            |   Provides an overall view of the status of the telemetry system. The following   |
    |                           |   information will be displayed:                                                  |
    |                           |                                                                                   |
    |                           |    * State of each telemetry server component (e.g., RUNNING, STOPPED, FAULT)     |
    |                           |    * State of each telemetry adapter component (e.g., RUNNING, STOPPED, FAULT)    |
    |                           |    * List of active monitors                                                      |
    |                           |    * Overall view of the service health, one box per subsystem color coded:       |
    |                           |                                                                                   |
    |                           |       - green: No active monitors in fault state                                  |
    |                           |       - yellow: No serious active alarms                                          |
    |                           |       - red: The telemetry system is not working                                  |
    +---------------------------+-----------------------------------------------------------------------------------+
    |   Navigation Panel        |   Provides a way to navigate all the monitor servers and adapters. From the       |
    |                           |   navigation panel the state and detailed info of every server and adapter can be |
    |                           |   accessed.                                                                       |
    +---------------------------+-----------------------------------------------------------------------------------+
    |   Analytics Panel         |   Provides access to the runtime statistics of the telemetry service.             |
    |                           |   These should include at least.                                                  |
    |                           |                                                                                   |
    |                           |     * Number and state (running/stopped/fault)                                    |
    |                           |     * Instant throughput of the system                                            |
    |                           |     * Total and Subsystem Monitor samples/sec                                     |
    |                           |     * Total data bandwidth                                                        |
    |                           |     * Storage capacity (used/available)                                           |
    +---------------------------+-----------------------------------------------------------------------------------+


**Service Deployment**

  The most demanding use of the telemetry system will be for AO operations; a
  potential implementation is shown in the Figure below. Sampling the dense
  actuator subsystems at full rates and storing the data for follow-up
  analysis and diagnosis require large storage capacity, large bandwidth, and
  the ability to access the data efficiently.

  The :ref:`telemetry bandwidth estimate <telemetry_bandwidth>` table above
  presents the bandwidth requirements for telemetry service in the AO
  observing modes. The aggregated bandwidth required is just 260 MB/s due to
  the fact that it is not necessary to store the WFS pixel values. For
  follow-up diagnostic purposes, the AO System requirements document
  stipulates that the full rate telemetry should be stored for a minimum
  period of 10 min, with the goal of storing a full night of telemetry data.

  With the current generation, low cost, Infiniband network adapters and
  switches, bandwidth tests (see :ref:`Networking Section <networking>`) show
  that it is already possible to achieve an average of 3 GB/s. Readily
  available Solid State Drives (SSD) provide a data writing bandwidth in
  excess of 1 GB/s using a PCIExpress 3.0 interface, and more if they are
  combined in a RAID arrangement. Only 16 GB are necessary to hold 10 minutes
  of telemetry at full rate, a trivial amount now for current high-end solid
  state drives. As performance inevitably improves and the storage cost
  continues to decrease with time, storing a full night of telemetry data in a
  cost-effective way will be achievable.

.. figure:: _static/telemetry_service_implementation.png

  A Possible Telemetry Service Implementation
