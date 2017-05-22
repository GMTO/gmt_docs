.. _level_3_SWCS_requirements:

Level 3 SWCS Requirements
-------------------------

The Level 3 SWCS Requirements Document [Mait13]_ is broadly divided into
Functional & Performance Requirements, and General Requirements, as prescribed
by Systems Engineering. Functional & Performance Requirements address telescope
operations (e.g., pointing, guiding, calibration, and thermal control),
observations, and observatory operations (e.g., data management, networking, and
common services).  In comparison, General Requirements address standards,
environment, health and safety, power services, maintenance, reliability, and
documentation of the observatory systems.

Before delving more specifically into Level 3 SWCS requirements, the following
Table presents an overview of the key System Level Requirements and their
flow-down to the SWCS:

.. table:: Principle Level 2 to Level 3 Requirements that Impact SWCS Design Considerations

  +-------------------------------------+--------------------------------------------------+
  | | Level 2 Requirements Summary      | | Level 3 Requirements Flowdown Summary          |
  +=====================================+==================================================+
  | | Lifetime -  Design for a 50-year  | | Communication Standards -  Define a set        |
  | | lifetime, assuming routine        | | of physical communication protocols.           |
  | | maintenance and periodic          +--------------------------------------------------+
  | | upgrades of components and        | | Electronics Standards –  Comply with the       |
  | | subsystems.                       | | electronics standards specifications per       |
  | |                                   | | GMT-SE-REF-00191.                              |
  | |                                   +--------------------------------------------------+
  | |                                   | | Permanent Storage –  Implement permanent       |
  | |                                   | | data storage and backup system at the          |
  | |                                   | | observatory.                                   |
  | |                                   +--------------------------------------------------+
  | |                                   | | Critical Spares –  Provide spares for critical |
  | |                                   | | subsystem and instrument components as         |
  | |                                   | | defined in the GMT Critical Spares Document    |
  | |                                   | | (GMT-SE-DOC-00277).                            |
  +-------------------------------------+--------------------------------------------------+
  | | Efficiency -  Optimize on-sky     | | Efficient Operations -  Identify and define    |
  | | observing efficiency.             | | sequences for instruments, telescope, and      |
  | |                                   | | science, operations to optimize on-sky         |
  | |                                   | | observing efficiency and comply with GMT       |
  | |                                   | | Efficiency Budget (GMT-SE-REF-00593).          |
  | |                                   +--------------------------------------------------+
  | |                                   | | User Command Sequencing -  Provide             |
  | |                                   | | capability to arrange commands in a way        |
  | |                                   | | that allows users to automate the execution    |
  | |                                   | | of complex operations.                         |
  +-------------------------------------+--------------------------------------------------+
  | | Operation Modes -  Enable         | | Operation Modes –  Provide classical, queue,   |
  | | classical, queue, interrupt, and  | | interrupt, and remote observer operation       |
  | | remote observer modes.            | | modes.                                         |
  | |                                   +--------------------------------------------------+
  | |                                   | | Scheduling and Planning -  Provide software    |
  | |                                   | | for advanced planning, scheduling, and         |
  | |                                   | | management of observing programs,              |
  | |                                   | | observatory workflows, and tasks.              |
  +-------------------------------------+--------------------------------------------------+
  | | Observing Modes –  Provide        | | Observing Modes –  Provide capability to       |
  | | natural seeing, NGSAO, LTAO,      | | operate the telescope in natural seeing,       |
  | | and GLAO observing capabilities.  | | GLAO, NGSAO, and LTAO observing modes.         |
  | |                                   +--------------------------------------------------+
  | |                                   | | Mode Switching –  Provide the capability to    |
  | |                                   | | switch from one observing mode to another.     |
  | |                                   +--------------------------------------------------+
  | |                                   | | Observing Conditions Monitoring –  Provide     |
  | |                                   | | the capability to monitor the required         |
  | |                                   | | observing conditions.                          |
  | |                                   +--------------------------------------------------+
  | |                                   | | Incomplete Segmentation –  Provide ability     |
  | |                                   | | to operate with incomplete segmentation.       |
  +-------------------------------------+--------------------------------------------------+
  | | Direct Gregorian (DG) Ports       | | Focal Stations –  Provide the capability to    |
  | | Folded Port (FP) Stations, and    | | operate the telescope using any of the eight   |
  | | Gravity Invariant Stations (GIS)  | | focal stations or future expansion ports.      |
  | | -  Provide standardized locations +--------------------------------------------------+
  | | in the Gregorian Instrument       | | Configuration –  Provide the capability to     |
  | | Rotator (GIR), on the top         | | switch from one telescope optical              |
  | | surface of the GIR, and on the    | | configuration to another in an automated       |
  | | Azimuth Structure, for mounting,  | | way for active instruments.                    |
  | | DG, FP, and GIS, Science          +--------------------------------------------------+
  | | Instruments, respectively.        | | Instruments –  Provide capability to automate  |
  | |                                   | | switching of active instruments, initiated     |
  | |                                   | | and monitored by the operator.                 |
  | |                                   +--------------------------------------------------+
  | |                                   | | Pointing Models -  Provide the ability to      |
  | |                                   | | store and switch between different pointing    |
  | |                                   | | models for all the focal stations.             |
  +-------------------------------------+--------------------------------------------------+
  | | FP Pupil Stability -  Maintain    | | Active Correction -  Actively control the      |
  | | the position of the exit pupil    | | optical system to obtain the best image        |
  | | at the FP focus to less than or   | | quality performance.                           |
  | | equal to 0.25% peak to valley     | |                                                |
  | | of the pupil diameter.            | |                                                |
  +-------------------------------------+--------------------------------------------------+
  | | Pointing Accuracy -  Provide:     | | Pointing Accuracy -  Provide capability to:    |
  | | blind pointing with error less    | | blind point with accuracies that comply with   |
  | | than 5 arcsec rms over the full   | | error budgets in document GMT-SE-REF-00477;    |
  | | range of telescope motion after   | | point relative to a guide star under natural   |
  | | initialization; relative          | | seeing with accuracies that comply with        |
  | | pointing to a guide star with     | | error budgets in document GMT-SE- REF-00477.   |
  | | accuracy better than 0.2 arcsec   +--------------------------------------------------+
  | | at the center of the science      | | Differential Flexure Correction -  Provide     |
  | | field for DG science instruments  | | capability to correct differential flexure     |
  | | under natural seeing.             | | between the AGWS and/or AO Wavefront Sensors   |
  | |                                   | | and the Science Instruments, using internal    |
  | |                                   | | guide sensors provided by the Science          |
  | |                                   | | Instruments, so as to comply with GMT          |
  | |                                   | | Pointing Budget (GMT-SE-REF-00477).            |
  +-------------------------------------+--------------------------------------------------+
  | | Automation of Start-up/           | | Automated Start-up/Shutdown Procedures -       |
  | | Shutdown –  provide automated     | | Provide the capability to execute start-up     |
  | | start-up / shutdown sequences,    | | and shutdown processes that are initiated      |
  | | procedures, and processes that    | | and monitored under operator control.          |
  | | are initiated, monitored, and     +--------------------------------------------------+
  | | controlled by the operator.       | | Standard State Machine –  The control          |
  | |                                   | | subsystem components shall implement a         |
  | |                                   | | SWCS standard state machine.                   |
  +-------------------------------------+--------------------------------------------------+
  | | Operation Support –  Provide      | | Astronomers’ Tools –  Provide software tools   |
  | | software tools to support         | | to assist astronomers in the proposal          |
  | | proposal preparation, program     | | process, observing program definition,         |
  | | definition, execution planning,   | | and execution planning.                        |
  | | execution, and quality            +--------------------------------------------------+
  | | assessment.                       | | Observatory Operations –  Provide software     |
  | |                                   | | tools to schedule and manage observatory       |
  | |                                   | | workflows and tasks, and to execute            |
  | |                                   | | observing programs.                            |
  | |                                   +--------------------------------------------------+
  | |                                   | | Quality Assessment –  Provide software tools   |
  | |                                   | | to assess the validity of observation data     |
  | |                                   | | products.                                      |
  | |                                   +--------------------------------------------------+
  | |                                   | | On-line Assistance –  Provide centralized      |
  | |                                   | | on-line tools to inform, search, and execute   |
  | |                                   | | user commands, and software components.        |
  +-------------------------------------+--------------------------------------------------+
  | | Observing Support -  Provide      | | Condition Monitoring -  Provide capabilities   |
  | | software, with integrated and     | | to monitor the required observing conditions.  |
  | | consistent user interfaces, to    +--------------------------------------------------+
  | | support observing and operation   | | Automated Reconfiguration –  Provide           |
  | | modes.                            | | capability to switch from one telescope        |
  | |                                   | | optical configuration and instrument to        |
  | |                                   | | another in an automated way for any active     |
  | |                                   | | instruments.                                   |
  | |                                   +--------------------------------------------------+
  | |                                   | | Graphical User Interface -  Provide an         |
  | |                                   | | integrated and consistent graphical user       |
  | |                                   | | interface.                                     |
  | |                                   +--------------------------------------------------+
  | |                                   | | Feature Discovery/Navigation -  Provide        |
  | |                                   | | capability to discover, navigate, and access   |
  | |                                   | | efficiently any feature provided by any        |
  | |                                   | | software component.                            |
  +-------------------------------------+--------------------------------------------------+
  | | Centralized Operation -           | | Centralized Control Functions –  Provide       |
  | | Critical systems for operations   | | central control capabilities for every control |
  | | shall be controlled from          | | subsystem.                                     |
  | | centralized operator              +--------------------------------------------------+
  | | workstations.                     | | Control Room -  The GMT observatory shall      |
  | |                                   | | be operated centrally from the control room.   |
  | |                                   +--------------------------------------------------+
  | |                                   | | Operators -  Design for operation by telescope |
  | |                                   | | operators, instrument specialists, and AO      |
  | |                                   | | specialists.                                   |
  +-------------------------------------+--------------------------------------------------+
  | | Data Archive and Access -         | | Science and Engineering data access -          |
  | | Provide data archive system for   | | provide the capability to uniformly store,     |
  | | collecting, storing, retrieving,  | | query, retrieve, and access: all data (raw and |
  | | and accessing all raw science     | | processed) during an observation, engineering  |
  | | and engineering data acquired     | | data from all subsystems, system logs and      |
  | | during observations, including    | | documentation, electrical and electronic       |
  | | relevant metadata.                | | schematics.                                    |
  | |                                   +--------------------------------------------------+
  | |                                   | | On-Line Documentation –  Provide users         |
  | |                                   | | with online help, guides, and manuals for all  |
  | |                                   | | equipment and facility instrumentation used    |
  | |                                   | | during routine operations, in a contextual     |
  | |                                   | | manner.                                        |
  +-------------------------------------+--------------------------------------------------+
  | | System Health -  Provide          | | System Health Assessment -  Provide            |
  | | continuous performance, status,   | | capability to assess the overall health        |
  | | and system health monitoring.     | | of the system.                                 |
  | |                                   +--------------------------------------------------+
  | |                                   | | Engineering Data System –  Provide             |
  | |                                   | | engineering data system to monitor the         |
  | |                                   | | health and performance of all subsystems       |
  | |                                   | | critical to the functioning of the observatory.|
  | |                                   +--------------------------------------------------+
  | |                                   | | Telemetry -  provide capability to sample,     |
  | |                                   | | display, and correlate any signal with the     |
  | |                                   | | resolution and frequency required to           |
  | |                                   | | characterize the behavior of the signal.       |
  | |                                   +--------------------------------------------------+
  | |                                   | | Log System -  provide a method to detect,      |
  | |                                   | | store, and notify the occurrence of relevant   |
  | |                                   | | operation events.                              |
  | |                                   +--------------------------------------------------+
  | |                                   | | Alarm System –  provide the capability to      |
  | |                                   | | manage alarm conditions.                       |
  +-------------------------------------+--------------------------------------------------+
  | | Code Compliance and Design        | | Overall Safety -  Comply with GMT              |
  | | Safety -  Design and construct    | | standards and procedures to insure the safety  |
  | | in accordance with building,      | | of the GMT facility, equipment, and personnel  |
  | | occupational, and electrical      | | at all times (GMT-SE-REF- 00229).              |
  | | safety codes defined in GMT       +--------------------------------------------------+
  | | Compliance to Regulations,        | | Interlock Safety System (ISS) –  Interface     |
  | | Codes and Standards               | | with the ISS to ensure the safe operation of   |
  | | (GMT-SE-REF-00229); adopt         | | the system.                                    |
  | | design safety practices to        +--------------------------------------------------+
  | | reduce risk to personnel and      | | Enhancing Safety via Software –  Provide       |
  | | equipment.                        | | software to enhance the safety and integrity   |
  | |                                   | | of the System.                                 |
  | |                                   +--------------------------------------------------+
  | |                                   | | Safety Limits Redundancy –  Include redundant  |
  | |                                   | | software limits on all systems with moving     |
  | |                                   | | parts that present an over-travel hazard risk. |
  | |                                   +--------------------------------------------------+
  | |                                   | | Non-interference of Manual Override –  The     |
  | |                                   | | SWCS shall not interfere with the protected    |
  | |                                   | | manual overrides on interlocks.                |
  | |                                   +--------------------------------------------------+
  | |                                   | | Time-outs –  Critical subsystems shall have    |
  | |                                   | | built-in time-outs to ensure correct           |
  | |                                   | | operation in case of central control failure.  |
  +-------------------------------------+--------------------------------------------------+
  | | Standards -  SWCS defines         | | Architecture -  Establish architecture for     |
  | | Software and Controls             | | instrument software and control subsystems.    |
  | | (GMT-SWC-REF-00029), and          +--------------------------------------------------+
  | | complies with Laser Safety        | | Software/Hardware Standards – Establish a      |
  | | (GMT-SE-REF-00229) Standards.     | | set of Software/Hardware standards             |
  | |                                   | | (GMT-SWC-REF-00029) for the project.           |
  | |                                   +--------------------------------------------------+
  | |                                   | | Communication Standards – Define a set of      |
  | |                                   | | physical communication protocols.              |
  | |                                   +--------------------------------------------------+
  | |                                   | | Electronics Standards – Comply with the        |
  | |                                   | | electronics standards specifications per       |
  | |                                   | | GMT-SE-REF-00191.                              |
  +-------------------------------------+--------------------------------------------------+

The subsections below present the Level 3 SWCS Requirements in more detail.
Functional, Performance and General Requirements are further subdivided into
other sub-categories, as summarized in subsections below.

.. toctree::
    :maxdepth: 1

    functional_performance_requirements
    general_requirements

