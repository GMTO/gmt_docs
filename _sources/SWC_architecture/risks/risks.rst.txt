
.. _risks:

Software and Control Risks
==========================

The GMTO Risk Management Plan [Rayb13]_ identifies how the project identifies,
evaluates and tracks risks to ensure that the project handles them in an
appropriate manner. The Risk Management Plan does not include risks associated
with safety concerning personnel or equipment that is covered by the Design
Safety Process Plan[Sawy13b]_ being executed by the Systems Engineering Group.


Risk Mitigation Plans
---------------------

The risk mitigations identified in the risk register generally fall under
categories that include: Agile development, prototyping, simulation, continuous
integration and delivery, scenarios, interfaces, user involvement, development
staff, operations staff, de-scoping design, standard software practices and
collaboration. Examples of how some of the SWC risks will be mitigated are
listed for these categories in the following sections.


Agile Development
-----------------

A continuous stream of requirement changes could delay the development of some
subsystems. Agile techniques provide an efficient way to adapt projects to
changes in the requirements.

Unrealistic schedule, cost estimation and staffing plans can all be addressed by
an Agile process deployment that will help to identify issues early on in the
project. Performance metrics should be used systematically. An Agile process
that enforces a predictable development model can forecast or mitigate the
likelihood of delays in software delivery.

Incorrect priorities can exhaust resources and deplete the contingency budget.
Therefore user scenarios need to be prioritized according to realistic
end-values so that critical scenarios are implemented first.


Prototyping and Simulation
--------------------------

Sometimes an incorrect requirement can lead to the development of a wrong
functionality that then wastes observatory resources, or may lead to unforeseen
risks. Activities like prototyping, early integration and simulations are ways
to mitigate cost and improve safety, efficiency, and performance.

Extensive tests that simulate M1 cell and supports should be carried out before
installing the real mirror, so as to protect the primary mirror from damage in
case of an M1 Control System malfunction.

The ultra-low latency bus is critical for the AO/AcO system performance. To
minimize unforeseen effects of the low latency bus on AO performance, it is
essential to prototype the hardware-software combination early on and to conduct
a thorough analysis on the performance.


Continuous Integration and Delivery
-----------------------------------

The M1 Control System is a complex software component that needs to be fully
tested under realistic conditions. Performing the integration with a dummy
primary mirror, and implementing a safety system independently and in parallel
with the main controller will mitigate risks when testing the control
algorithms.

Poor software and hardware that are procured externally can result in additional
rework. It is therefore necessary to establish an adequate acceptance procedure,
and to enforce timely delivery of software components to permit quality and
performance assessment.

A poor architectural design adversely compounds and confounds a system’s
complexity. To mitigate this issue, it is necessary to deliver complete,
end-to-end, functionalities early on, with enough slack time in the schedule to
allow for architectural changes (e.g., refactoring components) when excessive
complexities start to develop.

Poor documentation impacts the operational efficiency and maintenance.
Documentation is an integral part of the product that will be integrated into
the Semantic Model, so that it may stay current at all times. It is also
necessary to require external contractors to provide quality documentation.


Interfaces
----------

Large/complex interfaces require significant effort to define and manage. The
number of interfaces must be optimized to be as few as necessary and be short in
breadth.


User Involvement
----------------

Early integration of stakeholders into the development team reduces the
likelihood for producing incorrect or unstable requirements, wrong
functionalities, or delays in the subsystem development.


Development and Operations Staff
--------------------------------

The departure of key staff members affects team productivity, so competitive
employment conditions need to be provided. For the same reason, some level of
redundancy between members of the development team must be allowed and to avoid
code ownership.

Poor operations staff involvement during the design phase results in knowledge
gap that may impact operations efficiency. Operations staff involvement should
start early on in the project.

The lack of maintainability results in efficiency losses during design and
operation phases. To counteract those inefficiencies operation staff must be
involved early on in the project.


De-scope Design or Relax Requirements
-------------------------------------

Incorrect priorities exhaust resources and deplete the contingency budget. Low
priority scenarios ought to be de-scoped in those cases.


Standard Software Practices
---------------------------

Peer review of software code is common in software development, especially in
critical areas. The GMT primary mirror control system is an area that can
benefit from peer reviews. A project of this scale must have configuration
control for establishing and maintaining consistency in: telescope software
performance, functional adherence to requirements, design, and operational
information throughout its life. Diagnostic tools should be implemented
throughout to correct poor maintainability, which results in efficiency losses
during design and operation phases.


Collaboration
-------------

Establishing a strong software community for the project plays an important role
to remedy the lack of support to external groups, which results in poor
implementation and delays.


Standards Adoption
------------------

The platform technologies, when acquired from a single vendor, can end up
placing the project in a lock-in situation, which may result in a lack of
support and eventually may require the cleanroom implementation of some
components. In this case, the use of open standards and the ability to
encapsulate product dependencies can mitigate risks.

During the course of the project, the technology adopted might become obsolete,
compromising support and maintainability. To mitigate that risk, the use of
commercial-off-the-shelf products based on open standards should be adopted.
Furthermore, acquisition can be delayed if the integration plan for a component
allows for it. The goal is also to use open source components with excellent
community support. Finally, it is necessary to keep enough backup spares to
allow the observatory to operate for the duration of its lifecycle.


.. include:: risk-register_inc.rst


