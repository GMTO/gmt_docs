

.. _services-networking_infrastructure:

*Networking Infrastructure Service*
...................................

A combination of multi-fiber trunks and breakout cables provides galvanic
isolation between the different equipment installed in the electronics room and
the telescope enclosure. The network layout is based on a switching fabric
layout common in High Performance Computing applications.

Logical networks (e.g., in the current baseline design, Infiniband) are used
to implement the low latency communication between components involved in the
"Fast-Control" AO loops, while 10/40 GbE is used to transport and store AO
telemetry data streams independently of control data.


.. table:: SWCS Networking System Requirements (Level 3)

  +------------------------+-----------------------------------------------------------------+
  |   Requirement          |   Statement                                                     |
  +========================+=================================================================+
  |   General Network      |   Provide low latency and control network.                      |
  +------------------------+-----------------------------------------------------------------+
  |   Service Connections  |   Provide the capability to connect a temporary computer in any |
  |                        |   serviceable location of the GMT observatory.                  |
  +------------------------+-----------------------------------------------------------------+
  |   Storage Network      |   Provide a high bandwidth storage network.                     |
  +------------------------+-----------------------------------------------------------------+
