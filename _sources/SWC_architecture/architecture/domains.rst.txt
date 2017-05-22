
.. _architecture-control_domains:

Domains of Control
------------------

One perspective of the software architecture is based on the functional
decomposition of the observatory.  In this view, there are four major domains of
software control, based on a clear separation of concerns: the
:ref:`tcs_introduction` (TCS), Observatory Operations System (OPS),
:ref:`observatory_services` (OSRV), and Instrument Control System (ICS), as
shown in the figure below. The components within each domain are partitioned in
a way to facilitate modular software design.  Modularity allows different
components to evolve independently through the life of the project, to address
new scalability needs (e.g., new hardware subsystems require higher performance
telemetry), or to address different optimization strategies.

.. _figure-domains_of_control:

.. figure:: _static/application-layer.png

   Application Layer: Domains of Control

In brief, the four domains and some underlying considerations are:

  * :ref:`tcs_introduction` – The TCS domain comprises subsystems that are in
    charge of controlling the telescope optomechanical devices. The hierarchy of
    the TCS architecture follows a functional decomposition or breakdown that
    closely mirrors the physical organization of the telescope hardware
    subsystem.  In this scheme, *Device Control Subsystems* (italicized to
    emphasize a model component by that name in the software architecture) take
    care of the elementary and aggregated mechanical degrees of freedom of the
    telescope, whereas the *Wavefront Control* and *Pointing Kernel Subsystems*
    take care of the integrated behavior of the telescope. The benefit of this
    structure is that it is likely to be very stable once the project is
    baselined. While new hardware will be developed and integrated during the
    life of the project, the core optomechanical design will remain unchanged.

    Most of the software subsystems of the TCS can be designed to share a common
    architecture, which is presented in :ref:`device_control_framework`.  Doing
    so facilitates the reuse of common designs among subsystems, communication
    among groups due to having common "vocabularies" and concepts, development
    of a common body of experience, and a more efficient operation and
    maintenance due to the commonalities shared between subsystems. It also
    facilitates the creation of common development tools and artifacts (files,
    (meta)data, schedules, code skeleton, etc.) in the process.

  * Observatory Operations -- The OPS groups the software subsystems that provide
    the capabilities to support efficient operations and workflows of the
    observatory.  This domain architecture follows a functional decomposition
    based on the core observatory operation workflows. As such the structure of
    the observatory operation subsystems more closely mirrors the different
    stages in the operation of an observatory: proposal preparation and
    planning, observation execution, final data processing, quality control, and
    archiving of the scientific data.

    The detailed specification of workflows and tools will evolve during the
    project construction phase and likely also during the operations phase as
    the project gains better understanding of the system and identifies areas
    where productivity can be improved. The goal is to develop a system that
    remains flexible and, at the same time, that efficiently supports the
    operational workflows without constraining the introduction of new ones.

  * :ref:`observatory_services` -- The OSRV groups the subsystems that provide
    common infrastructure service components. Each observatory services
    subsystem (engineering user interface, logging, telemetry, configuration,
    etc.) addresses a specific structural function. Structural functions are
    systemic in nature and they provide interfaces for any component in the
    system (e.g., fault management, telemetry). The OSRV components allow
    developers to focus on writing application specific code without worrying
    about low-level infrastructure implementation details.

  * Instrument Control System -- The ICS groups the software and hardware
    subsystems in charge of controlling instruments for science observations.
    In general, the ICS follows the same architectural design as other device
    control subsystems.


