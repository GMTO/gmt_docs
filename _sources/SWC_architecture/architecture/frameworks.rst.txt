
.. _architecture-frameworks:

Frameworks
----------

The hardware and software components required for operations derive from a
process of domain engineering.  This result in a set of categories around which
to design a framework that implements architectural patterns (e.g., Controller,
Pipeline) and common components.  The domain engineering process shows that many
subsystems share common architecture and many components share similar
solutions.

:ref:`component_frameworks` provide a collection of reusable building blocks
that solve recurrent problems in different domains (e.g., control systems,
distributed services, data processing, hardware interfaces) and that allow
developing observatory applications. At the same time, they provide an isolation
mechanism from the underlying layers. The use of these component frameworks is
key for constructing a cost effective system and provides the following
benefits:

  * Improved external reuse – Component frameworks implement wrappers for
    external software Packages. Wrappers help to reduce the dependency between
    Subsystems and external software, minimizing the propagation of changes
    though interfaces.

  * Improved internal reuse – Component frameworks are articulated around a set
    of recurrent design patterns [Gamm94]_ (e.g., Controller, Pipeline, Panel,
    Workflow, Sequence, Wrapper). A set of base classes implements these design
    patterns by means of composition/delegation or specialization.

  * Improved consistency of designs and compliance with standards.

  * Improved robustness – Components that are reused in multiple scenarios and
    different

  * Subsystems are tested in more diverse conditions.

  * Reduced maintenance cost – Knowing about fewer types of Components is
    required.

Ideally it should not be necessary to develop any domain independent framework,
as they address problems that are common to a large family of applications;
examples of those are middleware libraries, database management systems, etc.
The :ref:`Component Framework <component_frameworks>` includes the following
elements:  :ref:`core_framework`, :ref:`device_control_framework`,
:ref:`data_processing_framework`, :ref:`time_distribution_framework`,
:ref:`user_interface_framework`,  :ref:`IO_framework`.

