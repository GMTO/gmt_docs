.. _release_1:

Release 1
=========

Contents of release 1.4
-----------------------

- Release distribution and installation

  - The OCS Software Release is no longer distributed as a fully configured ISO file with multiple RPM packages to be installed. The Software Development Kit (SDK) is now distributed as a single TAR file. The Operating System must be installed independently.
  - Instructions are provided to install the Operating System, set up the development platform, configure applicable system services, install external dependencies, install the SDK and use the Development Tools for software development.
  - Dependency management is built into the SDK platform instead of being managed by external tools in order to maintain control of specific versions used.

- Development Framework

  - The single repository containing model files and development tools has been reorganized into individual modules according to the new Work Breakdown Structure (WBS). The SDK supports the full life-cycle of each module independently.
  - Folder organization and tools and processes for working within the development environment have been standardized across all modules.
  - Development tools have been added to configure the development environment, integrate modules and build/deploy software in a standardized way.
  - The build system is improved and simplified.
  - The code generator supports c++ and coffee targets, with python planned on subsequent releases.
  - The code generator includes now support for scalar, structured and multidimensional array types.
  - A preliminary test automation framework is included with this release.

- Core Frameworks

  - An improved version of the c++ implementation of the core frameworks is included. The major improvements are the correct handling of the configuration properties, the possibility to define default values for the input and output ports and the standardization of the telemetry generation.
  - A new nodejs implementation of the core frameworks is included and provides the foundation for the Core Services.

- Core Services

  - A new improved implementation of the core services is included —currently, logging, telemetry, alarm and supervisory services are included.
  - All the services provide event consumer filtering.
  - The server and test client applications support new command line options and help.

- Implementation examples

  - Two reference Device Control System implementations are included: hdk_dcs and isample_dcs.
  - The model specifications of both subsystem have been updated
  - The code generated from the specification can be compiled and executed.
  - Both examples are distributed directly from git

- Documentation: Software Development

  - ``Installation`` page rewritten to reflect new OCS Software Release procedure:

    - Install the Operating System and configure system functions
    - Configure the Development Platform

  - Install the Software Development Kit (SDK)
  - ``Upgrade`` page rewritten to provide instructions for upgrading from version 1.3 to 1.4.
  - ``Installing a Virtual Machine`` page changed with instructions and images for installing a standard Fedora server instead of a distributed GMT iso file.
  - ``ISample Example`` page updated to reflect new Development Procedure using the SDK.

- Known Issues

  - A new implementation of the EtherCAT IO framework is included and has some stability problems while loading the fieldbus configuration.
  - The persistent functionality of the core services has been revised and it is disabled in this release.
  - The project is working in the known issues and the release will be updated once a patch is available.

Follow the :ref:`upgrade procedure <upgrade>`.

Contents of release 1.3
-----------------------

- Upgraded OS to Fedora 26
- Improvements to port communication mechanism using msgpack and nanomsg
- Added support for float and double data objects in the Ethercat Adapter
- Fully implemented testing port push/pull using gds
- Fixed known issues with code generation
- Defined the development environment file structure and added commands and scripts for easy configuration
- Added Module Configuration Management
- Added dynamic loading of submodules into gds/gmt
- Made significant improvements to the code generator, including automatic port assignments based on the model
- Moved ISample Example DCS to a new GitHub repository
- Updated :ref:`ISample Example <Isample_example>` documentation to reflect the new development workflow


Contents of release 1.2
-----------------------

- Minor bug fixes.
- The code generation tools now support c++14.
- Improved :ref:`ISample Example <Isample_example>` documentation.
- New guide on setting up a :ref:`Virtual Machine <virtual_machine>` development environment.

Contents of release 1.1
-----------------------

- Miscellaneous fixes and improvements. Follow the :ref:`upgrade procedure <upgrade>`.

Contents of release 1.0
-----------------------

- A set of common frameworks that provide software components that address similar
  problems with a :ref:`unified architecture <dcs_reference_architecture>`. The common frameworks encapsulate the implementation
  details allowing the developers to focus in the solving the domain specific programming tasks.
  These release includes a first implementation of the following frameworks:

   - The :ref:`Core Framework <core_framework>` implements a component model and distributed
     real-time communication protocols between components. Software components
     may be deployed in the same execution thread, different processes or different machines.

   - The :ref:`IO framework<IO_framework>` provides adapter components that enable GMT software components
     to communicate with external control and data acquisition hardware.
     In this release the IO framework provides adapters for EtherCAT and OPC UA.

   - The :ref:`Control Framework<device_control_framework>` includes the main building blocks of a control system.
     These real-time control components address the problems of state estimation,
     goal estimation and state control and define a set of standard state variables
     and associated state machines (e.g. operation state, simulation mode and control mode).

   - The :ref:`Persistence Framework<persistence_framework>` provides a way to store telemetry data streams. The
     current implementation uses MongoDB.

- A set of :ref:`Core Services<observatory_services>` that allows subsystem developers to test their software/hardware
  components in an environment similar to the one they will find at the observatory.
  This release includes an initial implementation of the telemetry, configuration,
  persistence and logging services.

- An :ref:`example instrument control system implementation (ISample) <dcs_spec_example>`. This example provides
  a template that instrument developers can use as a model.

- A formal specification and modeling language for the description of software interfaces.
  Interface test programs will be generated automatically from this specification to
  guarantee consistency between specification and implementation and to facilitate
  continuous integration and testing through the life of the project.

- A set of code generation tools that create subsystem scaffolds that conform to
  the reference architecture. These scaffolds reduce dramatically the time necessary
  to have an initial working system by generating automatically repetitive and tedious
  parts of code. They also provide a way to separate application logic from infrastructure
  logic. The code generation tools support c++11, python and `Coffeescript <http://coffeescript.org>`_ (Javascript dialect).

- The documentation of the GMT control reference architecture and the corresponding
  development tools.


.. note::

  The scope of v1.0 development documentation is currently limited to
  describing how to configure, start and monitor services (using logging and
  telemetry as examples), how to establish a communication network, and finally,
  how to setup a device control system. Future versions of this document will add
  other information as the development progresses.
