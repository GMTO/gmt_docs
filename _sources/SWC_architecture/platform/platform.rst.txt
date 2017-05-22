
.. _platform:

Platform
========

This section provides a description of the technologies used in the development
of the GMT SWC System.  It is the responsibility of the SWCS to define the
platform that can meet operational requirements, thus most of the
platform-related requirements are located in Hardware and Software Standard
documents.

Several criteria play an important role in evaluating the platform technologies:
technical, long-term availability, commercial and community support, and cost
effectiveness. Fortunately, several choices are available both in the commercial
and open source world to address the requirements of the GMT Software and
Controls, making feasible several architecture platforms that will provide an
adequate implementation. The SWCS platform is based on the use of
well-established industrial standards, commercial off-the-shelf, and open source
products while custom-built solutions are strongly discouraged. Design choices
and prescribed standards come about through prototyping, benchmarking and
evaluations. Other guidelines considered include:

  * Avoiding proprietary or vendor lock-in options when several solutions based
    on open standards or even open source already exist,

  * Avoiding niche market solutions when alternatives exist from competitive
    markets, especially where economy of scale plays an important role (e.g.,
    industrial automation).

The GMT project office has evaluated [Filg12]_ several technologies as part of
its preliminary design work, ranging from mature to more emergent. Preliminary
evaluations show that a design based on widely available industrial open
standards and open source products is capable of meeting the GMT Control System
requirements. A set of guidelines and requirements regarding the use of these
technologies in the project is included in the Software and Controls Handbook
[Filg13b]_.

.. table:: Requirements Flow Down from Level 1 and Level 2

  +----------------------------+-------------------------------------------------------------------+
  | | Requirement              | | Statement                                                       |
  +============================+===================================================================+
  | | Software and Controls    | | The GMT shall establish a set of Software and Controls          |
  | | Standards                | | Standards (GMT-SWC-REF-00029).                                  |
  +----------------------------+-------------------------------------------------------------------+
  | | GMT System Health        | | The GMT shall provide continuous performance, status and        |
  | |                          | | system health monitoring.                                       |
  +----------------------------+-------------------------------------------------------------------+
  | | Scheduled Maintenance    | | The SWCS shall be designed to facilitate maintenance and to     |
  | | Time                     | | comply with GMT Maintenance Time Budget (GMT-SE-DOC-            |
  | |                          | | 00420).                                                         |
  +----------------------------+-------------------------------------------------------------------+
  | | Critical Spares          | | The GMT shall provide spares for critical subsystem and         |
  | |                          | | instrument components as defined in the GMT Critical Spares     |
  | |                          | | Document (GMT-SE-DOC-00277).                                    |
  +----------------------------+-------------------------------------------------------------------+
  | | Field Bus Standard       | | The GMT standard field bus shall be EtherCAT                    |
  +----------------------------+-------------------------------------------------------------------+
  | | Field Device Profiles    | | GMT device shall meet the standards defined in GMT-SWC-         |
  | |                          | | REF-00029.                                                      |
  +----------------------------+-------------------------------------------------------------------+
  | | Electronics Standards    | | The GMT shall comply with the Electronics Standards (GMT-       |
  | |                          | | SE-REF-00191) for the project.                                  |
  +----------------------------+-------------------------------------------------------------------+
  | | GIR / OSS InfiniBand     | | GMT shall provide TBD redundant sets of InfiniBand lines that   |
  | | Lines                    | | run from the control building electronics room (data center)    |
  | |                          | | to junction boxes on the GIR/M2 using independent and           |
  | |                          | | separate cable routings.                                        |
  +----------------------------+-------------------------------------------------------------------+
  | | Telecommunications       | | The GMT shall provide telecommunications between the            |
  | |                          | | facilities on the summit, the support site, the base            |
  | |                          | | facility, and connection to external commercial providers.      |
  +----------------------------+-------------------------------------------------------------------+
  | | Computer Network         | | The GMT shall provide a computer network infrastructure on      |
  | |                          | | the summit to support telescope operation, the specified        |
  | |                          | | Operating Modes, required data transfer rates, and connection   |
  | |                          | | to the commercial provider.                                     |
  +----------------------------+-------------------------------------------------------------------+
  | | Communication            | | The GMT shall define a standard set of software protocols and   |
  | | Protocols                | | APIs that allow the communication with the required             |
  | |                          | | performance between different components.                       |
  +----------------------------+-------------------------------------------------------------------+
  | | GIR / OSS / Azimuth      | | GMT shall provide a redundant set of fiber trunk lines that     |
  | | Disk Fiber Trunk         | | run from the control building electronics room (data center)    |
  | | Lines                    | | to junction boxes on the GIR / OSS / azimuth disk using         |
  | |                          | | independent and separate cable routings.                        |
  +----------------------------+-------------------------------------------------------------------+
  | | ASM Maximum Update       | | The ASM shall have a maximum update rate in the Field           |
  | | Rate                     | | Stabilization and Adaptive Optics modes of no less than 1 kHz.  |
  +----------------------------+-------------------------------------------------------------------+
  | | ASM Actuator             | | The ASM actuator response time to a 1 micron step (reaching     |
  | | Response Time            | | 80% of the commanded step size) shall be less than 0.5 ms.      |
  +----------------------------+-------------------------------------------------------------------+
  | | NGWS Maximum             | | The NGW shall operate at a minimum frame rate of 1.0 kHz        |
  | | Frame rate               | | [2.0 kHz goal].                                                 |
  +----------------------------+-------------------------------------------------------------------+
  | | LTWS Detector            | | The LTWS Detector shall have a full frame rate (or equivalent)  |
  | | Maximum Frame Rate       | | of greater or equal to 1000 frames per second.                  |
  +----------------------------+-------------------------------------------------------------------+
  | | AOS Embedded Control     | | The AOS shall provide embedded Control Systems to control       |
  | | System                   | | individual AOS component / devices.                             |
  +----------------------------+-------------------------------------------------------------------+

.. table:: General SWCS Platform Requirements (Level 3)

  +-----------------------------+---------------------------------------------------------------+
  | | Requirement               | | Statement                                                   |
  +=============================+===============================================================+
  | | Connections to            | | Provide standardized connections to science instruments per |
  | | Instruments               | | the SWC Standards document (GMT-SWC-DOC-00029)              |
  +-----------------------------+---------------------------------------------------------------+
  | | Electronics Standards     | | Comply with the electronics standards specifications per    |
  | |                           | | GMT-SE-REF-00191.                                           |
  +-----------------------------+---------------------------------------------------------------+
  | | Software/Hardware         | | Establish a set of software/hardware standards              |
  | | Standards                 | | (GMT-SWC-REF-00029) for the project.                        |
  +-----------------------------+---------------------------------------------------------------+
  | | Software Standards        | | Follow the standards as stated in "SWC Software Standards"  |
  | |                           | | document (GMT-SWC-REF-00029).                               |
  +-----------------------------+---------------------------------------------------------------+
  | | Hardware Standards        | | Follow the standards as stated in "SWC Hardware Standards"  |
  | |                           | | document (GMT-SWC-REF-00029).                               |
  +-----------------------------+---------------------------------------------------------------+
  | | Communication Standards   | | Define a set of physical communication protocols to         |
  | |                           | | integrate its different components.                         |
  +-----------------------------+---------------------------------------------------------------+
  | | Critical Spares           | | Provide spares for critical subsystem and instrument        |
  | |                           | | components as defined in the GMT Critical Spares Document   |
  | |                           | | (GMT-SE-DOC-00277).                                         |
  +-----------------------------+---------------------------------------------------------------+

.. toctree::
    :maxdepth: 1

    computing
    field_device_interface_technology
    time_distribution_system
    distributed_communications
    networking
    software_development
