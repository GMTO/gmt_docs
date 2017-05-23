.. _component_frameworks:

Frameworks
==========

Frameworks provide a collection of reusable building blocks that solve recurrent
problems in specialized domains (e.g., control systems, distributed services,
data processing, hardware interfaces) and facilitate developing observatory
applications. At the same time, they provide an isolation mechanism from
underlying software layers. The use of these component frameworks is key to
building a cost effective system [Youn10]_ and provides the following benefits:

  * Improved internal reuse. The design of the component frameworks is based on
    set of recurrent design patterns [Gamm94]_ (e.g., Controller, Pipeline,
    Panel, Workflow, Sequence, Wrapper). A set of base classes implements
    these design patterns by means of composition/delegation or specialization.

  * Improved consistency of designs and compliance with standards.

  * Improved robustness. Components that are reused in multiple scenarios and
    different Subsystems are tested in more diverse conditions.

  * Reduced maintenance cost, since knowing about fewer types of Components is
    required.

  * Improved external reuse. Component frameworks implement wrappers for
    external software packages. Wrappers help reduce dependencies between
    subsystem implementation code and external software packages and minimize
    the propagation of changes through interfaces.

Frameworks have key distinguishing features compared to normal libraries:

  * Inversion of control. In a framework, unlike libraries or normal user
    applications, the overall program’s flow of control is not dictated by the
    caller, but by the framework.

  * Extensibility. A framework can be extended by the user usually by selective
    overriding or specialized by user code to provide specific functionality.

  * Non-modifiable framework code. The framework code, in general, should not be
    modified, except regarding extensibility. Users can extend the framework,
    but cannot change its code.

This section presents the design of the GMT common frameworks, from the domain
engineering process to identify common building blocks, to the design and
intended usage of each individual framework.

.. toctree::
    :maxdepth: 1

    domain_engineering
    code_generation
    core
    device_control
    persistence
    data_processing
    time_distribution
    user_interface
    IO
