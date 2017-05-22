
.. _architecture-development:

Software Development
--------------------

From a development standpoint, the software architecture has the following
hierarchy (see Figure below on :ref:`layered-software-architecture`).  The
application layer (:ref:`architecture-control_domains`) residing at the top
contains services and tools that run the observatory (via services and
operations), telescope control system (TCS), and the instrument control system
(ICS).  Below the application layer are frameworks, packages, and the operating
system on which the applications depend or build.  A layered development
architecture addresses the problem of Package development, dependencies and
platform evolution. In this arrangement, layers of software are built up from
low-level service software, like operating systems and network stacks, to
high-level applications (see Figure below). Intermediate layers provide domain
independent and dependent frameworks that help contain changes of platform or
APIs.  Circular dependencies are not allowed as the system is built bottom-up.

.. _layered-software-architecture:

.. figure:: _static/layered-architecture.png

   Layered Software Architecture

A software framework is a universal, reusable software platform used to develop
applications, products and solutions.  It is an abstraction whereby software
that deliver generic functionalities can be used by custom code to produce new
applications.  Software frameworks include support programs, compilers, code
libraries, tool sets, and APIs.  Frameworks contain key distinguishing features
that separate them from normal libraries:

  * Inversion of control – In a framework, unlike libraries or normal user
    applications, the overall program’s flow of control is not dictated by the
    caller, but by the framework.

  * Default behavior – A framework has default behavior. This default behavior
    must be some useful behavior and not a series of no-ops.

  * Extensibility – A framework can be extended by the user usually by selective
    overriding or specialized by user code to provide specific functionality.

  * Non-modifiable framework code – The framework code, in general, should not
    be modified, except regarding extensibility. Users can extend the framework,
    but cannot change its code.

The *Domain of SWCS Control* forms the Application Layer, and is discussed in
:ref:`architecture-control_domains`, while the :ref:`architecture-frameworks`
form the Domain Specific Layer.


