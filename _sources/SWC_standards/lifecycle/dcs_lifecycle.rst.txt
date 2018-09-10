
.. _lifecycle:

DCS Life Cycle
==============

System Life Cycle View
----------------------

This chapter specifies the DCS life cycle and development process. The DCS
lifecycle is divided in four main phases as illustrated in :numref:`Figure %s
<lifecycle_phases>`. Each phase is characterized by the definition of its inputs
and outputs. The outputs for one phase are used as inputs to the next phase with
the addition of other applicable GMTO documents. These phases shall be connected
with the controlled plant milestones.

.. _lifecycle_phases:

.. figure:: _static/lifecycle_phases.png

    Lifecycle Phases

The life cycle phases are:

  * Requirements Phase – During this phase the team performs the initial
    requirement analysis, the organization of the DCS in Packages and Components
    and the creation of the initial product backlog. Product backlog is a common
    term used in Agile management to refer to the functionality, e.g., user
    stories or features, that have to be developed. The requirements phase
    generally starts after the preliminary design of the CSS.  However, the
    requirements phase may start earlier to support preliminary design of the
    CSS if the necessary requirements to do so are sufficiently developed.

  * Design Phase – During this phase the team designs and implements the high
    priority and high value, DCS features.  The assignment of priorities to
    features takes into account which ones are likely to provide: better
    feedback about the design of the DCS, important information that help to
    identify and mitigate risks in designs (e.g., a particular algorithm that
    requires computing power at the limit of the proposed hardware platform), or
    a higher business value. DCS features also include hooks necessary to
    support eventual hardware prototypes.

  * Construction Phase – During this phase the team implements the bulk of the
    DCS features backlog.  At the end of this phase all the features necessary
    to perform the Factory Acceptance Testing (FAT) of the system under control
    have been developed, integrated, tested and deployed.

  * Assembly and Integration (AIT) Phase – During this phase the rest of the
    product backlog is implemented.  AIT sprint includes the development of
    features that require most of the DCS Components to be already implemented.
    It also includes potential changes as a result of the FAT. The AIT phase
    includes the DCS installation on site followed by the site acceptance test
    and integrated commissioning.

Phasing of Systems and Software Reviews (draft)
-----------------------------------------------

The  ESA Software Engineering Handbook ECSS-E-HB-40A issued in December 2013,
identifies the relations between system and the software reviews:

"The SWRR is a non-mandatory review anticipating the Software PDR addressing the
software technical specification. It takes place between the Software SRR and
the Software PDR. If possible, it should take place before the System PDR..."

"The subs system design can only start after the complete system design has
preliminarily baselined at System PDR. For this reason, the Software PDR
follows the System PDR."

"In case the ground segment software development is based on the reuse of an
infrastructure based on a reference architecture, the SRR and the QR are not
always conducted."

.. figure:: _static/reviews_stages1.png

    Review Stages: Relation between Ground Segment and Ground Software Reviews

.. figure:: _static/reviews_stages2.png

    Review Stages: Relation between System and Flight Software Reviews


Life Cycle Activities
---------------------

The following activities shall be performed for all the DCS Components:

  * Specification
  * Development
  * Verification
  * Continuous integration

Add list of DCS development workflows (Perhaps move to another document)

  * Specify plant

  * Specify terminal block

  * Specify I/O

  * Specify connection maps:

    - Specify device map (connectors between Devices and Terminal Blocks)

    - Specify terminal block map (connectors between Terminal Blocks and IO
      Modules)

    - Specify field map (connectors between component data_io and IO Modules)

  * Identify state variables

  * Identify safety functions

  * Map canonical input/output sequences to state variable states. Elaborate
    Mealy state machine.

.. _dcs_development:

DCS Development
---------------

Operation support functions are provided by components that implement a
specialized plugin interface. (e.g. observing tool plugins or quality monitoring
plugins). The GMT Observatory Frameworks are intended to be used by specializing
a set of base classes. A set of tools provides the capability to generate the
skeleton o a component implementation from the specification of its interface.

Table 4‑1 describes three common framework use cases and the functionality
provided by the frameworks involved.

.. _framework_use_cases:

.. table:: Framework Typical Use Cases

  +------------------+-------------------+--------------------+-------------------------------+
  |   Use Case       |   Framework       |   Base Classes     |   Function                    |
  +==================+===================+====================+===============================+
  |   Create a new   |   Core Framework  |   BaseComponent    |   Provides access to          |
  |   Controller     |                   |                    |   observatory services        |
  |                  +-------------------+--------------------+-------------------------------+
  |                  |   Device Control  |   BaseController   |   Provide reusable control    |
  |                  |   Framework       |                    |   building blocks             |
  |                  +-------------------+--------------------+-------------------------------+
  |                  |   I/O Framework   |   IOAdapter,       |   Provides access to the      |
  |                  |                   |   Device           |   hardware                    |
  +------------------+-------------------+--------------------+-------------------------------+
  |   Create a new   |   Core Framework  |   BaseComponent    |   Provides access to the      |
  |   Pipeline       |                   |                    |   observatory services        |
  |                  +-------------------+--------------------+-------------------------------+
  |                  |   Data Processing |   BasePipeline,    |   Defines a reference         |
  |                  |   Framework       |   BaseFilter,      |   architecture for data       |
  |                  |                   |   BaseRecipe       |   processing pipelines        |
  |                  +-------------------+--------------------+-------------------------------+
  |                  |   Persistence     |   ObjectStore,     |   Provides persistence to     |
  |                  |   Framework       |   FileStore        |   files and data structures   |
  +------------------+-------------------+--------------------+-------------------------------+
  |   Create a new   |   Core Framework  |   BaseComponent    |   Provides access to          |
  |   Panel          |                   |                    |   observatory services        |
  |                  +-------------------+--------------------+-------------------------------+
  |                  |   UI Framework    |   BasePanel,       |   Provices reusable           |
  |                  |                   |   BaseWidget       |   visualization components    |
  +------------------+-------------------+--------------------+-------------------------------+

GSC Simulator
-------------

The GCS Simulator is a system supplied by GMTO as part of the development kit in
order to provide the DCS with a subset of the GMT Software and Controls Core
Subsystems before the CSS is integrated into the GMT system on-site. The subset
of functions implemented by the GCS Simulator enables the development and test
of the DCS before integration. The main functions of GCS Simulator are:

  * Development and test of the DCS specific user interface components.

  * Visualization of DCS detailed status using the generated engineering user
    interface components

  * Handling and visualization of the alarms generated by the DCS.

  * Handling and visualization of the logging messages generated by the DCS.

  * Handling and visualization of the telemetry data generated by the DCS.

  * Management and storage of the configuration properties for the DCS.

  * Execution of DCS commands and sequences (e.g. calibration or diagnostic
    sequences) from the GCS.

  * Integration of Operation Support Packages components (e.g. Observing tool
    plugins, calibration pipelines) with the GCS

  * Storage of the data generated by the DCS and access to this data.

  * Development and testing of the supervisory functions to be integrated in the
    GCS system.

Life-Cycle Requirements
-----------------------

GMTO follows an Agile development process with emphasis in early continuous integration of DCS software. DCS software shall be delivered regularly to the GMTO Software Repository. The following requirements define the integration strategy for DCS components.

**SWC-DCS-0001: DCS release plan**

  Each DCS shall include a release plan and a product backlog, which shall be
  delivered to GMTO.

**SWC-DCS-0001: Software Deliverables**

  All software components and updated System Definition Files (SDF) shall be
  delivered to the GMTO Software Repository.

  Note: See Section on :ref:`system_definition_files` for an introduction to
  SDF.

**SWC-DCS-0002: Software Continuous Integration**

  All software components shall be delivered periodically during the execution
  of each phase to enable early and continuous integration of all the GMTO
  software.

  Note: Each phase shall be divided in a set of periodic iterations aligned with
  the GMT master release plan [ref]. The frequency and number of iteration shall
  be approved by GMTO.

**SWC-DCS-0003: Test Versioning**

  For every test (unit testing; system and integration testing; acceptance
  testing) the version of the equipment being tested, the version of the test
  specifications being used and the version of the specification being tested
  against shall be logged.

**SWC-DCS-0004: Standard compliance**

  Standard compliance shall be assessed on a continuous basis as part of the
  continuous integration process.

  Note: SDF files shall be tested against the reference architecture
  well-formedness rules. Continuous integration and testing facilitates early
  error identification and reduce the time for factory and site acceptance
  testing.

**SWC-DCS-0005: FAT testing**

  During Factory Acceptance testing the goal will be to test DCS performance and
  functionality in order to support the testing of the controlled system of
  which the DCS is a part.

**SWC-DCS-0006: FAT environment**

  The GCS Simulator shall be used for Factory Acceptance Testing.

**SWC-DCS-0006: Site testing (draft)**

  Define scope of site testing....

**SWC-DCS-0006: Site testing environment**

  For Final Site Acceptance Testing the real Core Systems software will used.

**SWC-DCS-0007: Automated testing**

  Acceptance tests will be generated automatically from the specifications
  contained in System Definition Files.

  Note: The use of generated tests enables automated traceability from
  implementation to specifications.

**SWC-DCS-0008: Standards applicable version**

  The latest version available of these standards shall be applicable.

**SWC-DCS-0009: Documentation standards**

  The DCS documentation shall comply with the GMT Documentation Standards
  document (GMT-SE-DOC-00003)

**SWC-DCS-0010: Documentation for 3rd party and COTS components**

  For every item (including 3rd party and COTS) of the DCS the original
  documentation shall be delivered.


.. _system_definition_files:

System Definition Files
-----------------------

:ref:`System Definition Files <subsystem_specification_and_modeling>` (SDF) capture
the formal specification of a DCS. SDF are writen in a Domain Specific Language.
The GMT Software and Controls documenation contains an :ref:`example <dcs_spec_example>`
of a DCS specification.

**SWC-DCS-0078: SDF lifecycle**

  The following diagram describes the DCS implementation strategy:

.. figure:: _static/dcs_implementation_strategy.png

   DCS Implementation Strategy
