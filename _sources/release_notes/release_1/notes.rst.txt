.. _release_1:

Release 1
=========

Contents of release 1.2
-----------------------

- Minor bug fixes.
- The code generation tools now support c++14.
- Improved :ref:`ISample Example <Isample_example>` documentation.
- New guide on setting up a :ref:`Virtual Machine <virtual_machine>` development environment.

Follow the :ref:`upgrade procedure <upgrade>`.

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
