.. _release1:

Release 1
---------

1.0
...

Version 1.0 is out! The purpose of v1.0 documentation is currently limited to
showing how to configure, start and monitor services (using logging and
telemetry as examples), how to establish a communication network, and finally,
how to setup a device control system. Future versions of this document will add
other information as the development progresses.

- A set of common frameworks that provide software components that address common
  problems with a unified architecture.
   - The Core Framework implements a component model and distributed
     real-time communication protocols between components. Software components
     may be deployed in the same execution thread, different processes or different machines.

   - The IO framework provides adapter components that enable GMT software components
     to communicate with external control and data acquisition hardware.
     In this release the IO framework provides adapters for EtherCAT and OPC UA.

   - The Control Framework includes the main building blocks of a control system.
     These real-time control components address the problems of state estimation,
     goal estimation and state control and define a set of standard state variables
     and associated state machines (e.g. operation state, simulation mode and control mode).
     The data processing framework includes the basic components for data processing
     subsystems, like instrument data reduction packages.

- A set of core services that allow subsystem developers to test their software/hardware
  components in an environment similar to the one they will find at the observatory.
  This release includes an initial implementation of the telemetry, configuration,
  persistence and logging services.

- An example instrument control system implementation (ISample). This example provides
  a template that instrument developers can use as a model.

- A formal specification and modeling language for the description of software interfaces.
  Interface test programs are generated automatically from this specification to
  facilitate continuous integration and testing through the life of the project.

- A set of code generation tools that create subsystem scaffolds that conform to
  the reference architecture. These scaffolds reduce dramatically the time necessary
  to have an initial working system. The code generation tools support c++11, 
  python and Coffeescript (Javascript dialect).

- A detailed documentation of the GMT control reference architecture and the
  corresponding development tools.
