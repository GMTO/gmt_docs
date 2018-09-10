.. _observatory_services:

Observatory Services
====================

The GMT software and controls system is highly distributed: the control
components are deployed in computers distributed across different locations of
the observatory and connected by networking infrastructure. This scheme makes it
possible to optimize digital and analog signal paths, thermal conditioning, and
maintenance accessibility.

A set of *common services* provides the basic infrastructure that enables the
*telescope control system* (TCS) and *observatory operations* (OOP) components
to communicate and collaborate in order to perform high-level control and
monitoring. Additionally, some of these services have components that allow
self-monitoring of their own operation.  The Figure below shows the
Observatory Services Product Tree:

.. figure:: _static/observatory_services_overview.png

  Observatory Services Product Tree

The set of common services available to
subsystems and components being controlled include:

  * Command Execution
  * Alarm events transport and management
  * Logging events transport
  * Telemetry sampling, transport and filtering
  * Component configuration
  * System health supervision
  * Engineering user interface
  * Command line access to all the registered components
  * Component and subsystem on line documentation (metadata)
  * Network infrastructure management
  * Data flow service (Low latency/ high bandwidth / synchronous)

.. table:: SLR Requirements Governing Observatory Services (Level 2)

  +------------------------------+-------------------------------------------------------------------+
  |   Requirement                |   Statement                                                       |
  +==============================+===================================================================+
  |   Communication              |   The GMT shall define a standard set of software protocols and   |
  |   Protocols                  |   APIs that allow the communication with the required             |
  |                              |   performance between different components.                       |
  +------------------------------+-------------------------------------------------------------------+
  |   GMT System Health          |   The GMT shall provide continuous performance, status and        |
  |                              |   system health monitoring.                                       |
  +------------------------------+-------------------------------------------------------------------+
  |   Engineering Data           |   The GMT shall provide an engineering data system to monitor     |
  |   System                     |   the health of all subsystems critical to the functioning        |
  |                              |   and performance of the observatory.                             |
  +------------------------------+-------------------------------------------------------------------+
  |   Diagnostic Software        |   The GMT shall provide software tools for displaying real-time   |
  |                              |   and long term trends in the performance of individual           |
  |                              |   components/subsystems and to correlate that information with    |
  |                              |   time-stamped data from other subsystems.                        |
  +------------------------------+-------------------------------------------------------------------+
  |   Engineering Mode           |   The GMT control software shall include an engineering mode      |
  |                              |   that allows low-level control of components and subsystems.     |
  +------------------------------+-------------------------------------------------------------------+
  |   Integrated User Interface  |   The GMT shall provide an integrated and consistent user         |
  |                              |   interfaces.                                                     |
  +------------------------------+-------------------------------------------------------------------+
  |   Telecommunications         |   The GMT shall provide telecommunications between the            |
  |                              |   facilities on the summit, the support site, the base facility,  |
  |                              |   and connection to external commercial providers.                |
  +------------------------------+-------------------------------------------------------------------+
  |   Computer Network           |   The GMT shall provide a computer network infrastructure on      |
  |                              |   the summit to support telescope operation, the specified        |
  |                              |   Operating Modes, required data transfer rates, and connection   |
  |                              |   to the commercial provider.                                     |
  +------------------------------+-------------------------------------------------------------------+

.. table:: General SWCS Requirements on Observatory Services (Level 3)

  +-----------------------------+----------------------------------------------------------------------+
  |   Requirement               |   Statement                                                          |
  +=============================+======================================================================+
  |   Engineering Data          |   Provide an engineering data system to monitor the health of all    |
  |   System                    |   subsystems critical to the functioning and performance of the      |
  |                             |   observatory.                                                       |
  +-----------------------------+----------------------------------------------------------------------+
  |   Engineering Data          |   Provide an archive system that can be extended to store essential  |
  |   Archive                   |   engineering data for the 50-year lifetime of the GMTO Observatory. |
  +-----------------------------+----------------------------------------------------------------------+
  |   Engineering Data Access   |   Provide the capability to query and retrieve engineering data      |
  |                             |   from all subsystems in a uniform way.                              |
  +-----------------------------+----------------------------------------------------------------------+
  |   Central Control Functions |   Provide central control capabilities for every control subsystem.  |
  |                             |                                                                      |
  +-----------------------------+----------------------------------------------------------------------+
  |   Centralized Command       |   Provide centralized, on-line, tools to inform, search, and         |
  |   Information and           |   execute, user commands and software components.                    |
  |   Execution                 |                                                                      |
  +-----------------------------+----------------------------------------------------------------------+
  |   Software Features         |   Provide the capability to discover, navigate, and access           |
  |   Navigation                |   efficiently, any feature provided by any software component.       |
  +-----------------------------+----------------------------------------------------------------------+
  |   SWC Integrated User       |   Provide an integrated and consistent user interface.               |
  |   Interface                 |                                                                      |
  +-----------------------------+----------------------------------------------------------------------+
  |   Data Bundle               |   Provide a method to generate a data bundle that includes all       |
  |                             |   raw and processed science and engineering data obtained during     |
  |                             |   an observation.                                                    |
  +-----------------------------+----------------------------------------------------------------------+
  |   Local Safety and          |   Provide status information for common operating states, alarm      |
  |   Status Information        |   conditions, trip conditions, and corrective actions control system |
  |                             |   set point, and power supply status information that is required to |
  |                             |   operate the subsystem from the control room.                       |
  +-----------------------------+----------------------------------------------------------------------+
  |   Diagnosis Software        |   Provide software tools for displaying real-time and long-term      |
  |                             |   trends in the performance of individual components/subsystems      |
  |                             |   and to correlate that information with time-stamped data from      |
  |                             |   other subsystems.                                                  |
  +-----------------------------+----------------------------------------------------------------------+

.. toctree::
    :maxdepth: 1

    architecture.rst
    common.rst
