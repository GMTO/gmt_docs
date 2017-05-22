
.. _services-architecture:

Service Architecture
--------------------

The implementation of the common services follows a distributed architecture
(see following figure) in which service adapters allow distributed components to
access the service bus, while service supervisors coordinate services.  Service
adapters define the low-level interface between components and observatory
services. Communication between adapters and supervisors may follow different
communication patterns (e.g., publish/subscribe, push/pull, request/reply). The
Section on :ref:`core_framework` describes the different communication patterns
that are available.

.. _section-service_adapters:

.. figure:: _static/common-services-architecture.png

  Common Services Architecture.  (1) Components access the service through the
  adapter API when an event is generated (e.g., alarm detected). (2) The
  "payload" (e.g. alarm event, telemetry sample) is transported from adapter to
  supervisor through the :ref:`service_bus`.  (3) :ref:`service_supervisors`
  coordinate services, and process the service payload when received.  (4) The
  service payload is stored and/or forwarded to components that subscribe to the
  service.  (5)  Operators can filter or cross-correlate any persistent data
  stream for further analysis.  .. _service_adapters:

.. table:: SWCS Service Architecture Requirements (Level 3)

  +---------------------+------------------------------------------------------------------+
  | | Requirement       | | Statement                                                      |
  +=====================+==================================================================+
  | | Architecture      | | Establish an architecture for instrument software and control  |
  | |                   | | subsystems.                                                    |
  +---------------------+------------------------------------------------------------------+
  | | Reference Model   | | Provide a reference model to design control subsystems in a    |
  | |                   | | consistent way.                                                |
  +---------------------+------------------------------------------------------------------+
  | | Semantic Model    | | Provide a method to specify formally the features and          |
  | |                   | | capabilities provided by every subsystem.                      |
  +---------------------+------------------------------------------------------------------+
  | | Software/Hardware | | Establish a set of software/hardware standards (GMT_SWC-       |
  | | Standards         | | REF-00029) for the project.                                    |
  +---------------------+------------------------------------------------------------------+


*Service Adapters*
..................

Service adapters enable every distributed component in the system to access
infrastructure common services.  They serve as the low level interface between
hardware and software components and observatory services.  Service adapters
help to:

  *  Isolate distributed components from service implementation.  This
     helps to manage obsolescence in hardware and software.

  *  Focus application developers on developing applications (e.g. control,
     data processing).  Application developers should not need to solve
     infrastructure problems that are common to all subsystems.

  *  Standardize base implmentation. A base component (in an object oriented
     sense) implementation provides a template for all service adapters
     to bootstrap from. 

  *  Simplify interaction and deployment.  Software components need to only
     know about the service native API, and not how the service or
     distributed communication are implemented.  They hide details like
     how to manage connection, service threads, marshaling and de-marshaling
     of events and data streams, time stamps, middleware configuration,
     optimal communication pattern, how to register component services
     in runtime database.

Base classes in the Core Component Framework wrap these low-level interfaces
in a simplified high-level application-programming interface (API), reducing
the overhead necessary to integrate a software component into the GMT system.
When a component is deployed and its service adapters setup and bootstrapped,
all the component service features become available system-wide. Service
adapters can be shared between components depending on the performance
requirements.

The adapter hides from the component service implementation details like:

  *  Connection management
  *  Service Thread management
  *  Marshaling and de-marshaling of event and data streams
  *  Time stamping of events
  *  Specific middleware setup
  *  Implementation of optimal communication patterns
  *  Registering of component service functions in the runtime database

Communication between adapters and supervisors may follow different
communication patterns (e.g., publish/subscribe, push/pull, request/reply).
The Section on :ref:`core_framework` describes the different communication
patterns that are available. 

.. _service_supervisors:

*Service Supervisors*
.....................

Service supervisors coordinate and maintain the health status of the services.
Some services may require several servers running in a cluster, or may connect
to a high performance file system for persistent high throughput events or
data streams. The service supervisor provides the following capabilities:

  * Archiving of the data and event streams coming from service adapters

  * Implementation of optimal communication pattern

  * Archiving of the service configuration data

  * Service analytics and reporting

  * Monitoring the health of the service adapters (the System Supervisor is
    responsible for monitoring the health of the different Service Supervisors)

  * Publish/subscribe access to the data and event streams

  * Load balancing

  * Fault tolerance

  * Scaling due to bandwidth or growing storage demands (e.g., new systems
    added to the observatory)

  * Visualization of service data

  * Cross filtering of multidimensional datasets.

The implementation of the service supervisors is not monolithic. Depending
on the prevailing communication patterns, it is possible to implement
different ways to distribute the process workload (e.g., broker, fan-out).
This allows the efficient use of computing resources and elastic adaptation
to the load. 

.. _service_bus:

*Service Bus*
.............

A dedicated service bus connects Service Adapters and Service Supervisors.
Each service bus provides a logical network connection that addresses the
specific throughput, bandwidth and latency requirements of the service.  The
Section on the :ref:`networking platform <networking>` provides a description
of the GMT networking infrastructure.

