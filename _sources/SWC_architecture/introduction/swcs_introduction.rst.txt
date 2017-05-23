.. _Software_and_Controls_Introduction:

Introduction
============

The GMT Software and Controls System (SWCS) encompasses the software and
hardware components necessary to control and monitor the GMT optical and
electromechanical subsystems and to safely and efficiently operate the GMT
observatory.

Design Considerations
---------------------

When specifying the platforms or designing the software system, there are
several important factors that the SWCS considers:

  * Long project lifespan.  The 50 year development, construction and operation,
    times of the GMT will render some existing technologies obsolete.  This will
    require a delicate balance between choosing technologies early enough to
    provide a common framework, enabling distributed and organized software
    development among partners, yet late enough to take advantage of new
    developments that may enable or simplify the implementation or provide a
    more cost-effective solution.

  * Development processes.  Large science facility projects often
    follow a `Stage-Gate model <http://en.wikipedia.org/wiki/Phase–gate_model>`_
    of development, where the process is divided into stages separated by
    assessment points or formal reviews, i.e.  "gates." This model, inherently
    waterfall (i.e., sequential flowing from one phase down to the next), is
    adequate for traditional projects.  However, in recent years there has been
    a significant evolution, especially in software, towards employing `Agile
    <http://en.wikipedia.org/wiki/Agile_software_development>`_ development
    process (i.e., iterative and incremental development process that encourages
    flexibility and adapts rapidly to changing needs and requirements). This
    process has demonstrated an ability to achieve significant gains in
    productivity and product quality. The development process shall be able to
    take advantage of applying Agile processes to software and controls
    components that are embedded in a larger and more conventional Stage-Gate
    project structure.

  * Distributed, collaborative development.  The GMT project is developed by a
    partnership that can take advantage of the breadth and depth of expertise in
    telescope and instrumentation development, and operations. Different
    optomechanical subsystems will include software developed in a distributed
    manner by different partner institutions or vendors. Those subsystems have
    to work coherently as a single unit once integrated.

  * Hierarchical system of systems.  The GMT project is organized as a System of
    Systems to address its complexity. The software is no different in this
    respect. A system of systems often requires a more elaborate process than a
    monolithic one to ensure coherence and consistency.

  * Multi- and cross-disciplinary systems.  Modern telescopes are large
    optomechatronics machines that span across different disciplines: optics,
    mechanics, electronics, controls and software.  Identifying and defining the
    right interfaces are of paramount importance.  However, due to the size and
    complexity of the project, it is difficult to create a small team that
    guarantees the full coverage of global knowledge.  Adequate communication
    and interaction of the different disciplines are critical to the success of
    the project. 

  * Complexity.  The GMT, with its integrated adaptive optics and segmented
    primary mirror design with wide inter-mirror gaps, make wavefront control
    and target acquisition strategies more complex and novel than previous
    generations of telescopes.  The GMT will operate in different adaptive
    optics modes (GLAO, LTAO, NGS).  In each mode, a large number of optical and
    mechanical degrees of freedom (involving over 20 independent control
    subsystems) must coordinate to acquire all the targets needed to phase the
    telescope, close the wavefront control loops, and maintain image quality.


.. _key-principles:

General Principles and Guidelines
---------------------------------

Every major project of science has stringent budgetary constraints and the GMT
is no exception. The right choice of a technology framework and processes may
significantly impact the development of the SWCS in cost.

Three general key principles: **reliability**, **maintainability**, and
**cost-effectiveness**, underly all decisions and choices made on the
architectural platform and process. To enforce these principles, the design of
the SWCS follows a set of guidelines:

  * Use industry components and open standards to improve the cost-effectiveness
    and maintainability of the system.

  * Implement an architecture based on tried-and-true practices and design
    patterns.

  * Validate technical platform and architecture through prototyping and
    incremental delivery.

  * Integrate a model-based development approach [Schm06]_ integrated with an
    Agile [Beck10]_ management process.

  * Facilitate collaboration with the parties involved in the development of the
    different subsystems.

The principles and guidelines imply that all the software and hardware, together
and individually, possess finer qualities below that follow standard industry
practices [Meye00]_: correctness, robustness, extensibility, reusability,
compatibility, efficiency, portability, ease of use, verifiability, integrity,
and reparability.

This documentation presents a system architecture design that identifies the
elements of the SWCS and that meets the defined requirements.  First we present
an overview of the key functional and performance :ref:`system requirements
<requirements_overview>`, and the corresponding flow down to the SWCS.  Then we
discuss the :ref:`main architectural principles <Overall_Architecture>` that
provide the rationale for the architectural design.  At the highest level,
:ref:`observatory_operations` supports users during observatory operations; it
interacts with the :ref:`tcs_introduction` to control the telescope
optomechanical devices.  The SWCS is divided into subsystems and each subsystem
is divided into :ref:`packages and components <architecture-modules>`.  The most
relevant packages and components are highlighted for each subsystem. A complete
product definition with the detailed list of packages and components for each
subsystem is documented in the SWCS Product Breakdown Structure [Filg13a]_.  The
architecture enforces consistency and traceability between subsystem
requirements and architecture design due to benefits of using formal
specification files. The internal and external interfaces of each subsystem are
identified and the most relevant ones are defined using the same formal method.
The section on :ref:`component_frameworks` also describes the design of a set of
common frameworks that improve and capitalize on software reuse and
maintainability of the system.  The section on :ref:`platform` presents the
technological platform proposed for developing the SWCS and how the use of
commercial and open source Off-The-Shelf components based on open standards
provides a cost-effective solution that also significantly improves the
maintainability of the system.  The section on :ref:`process` provides an
overview of the SWCS Agile development process and how the use of formal
specification methods, based on Model-Based Development, helps to maintain
consistency between subsystem specifications and their implementation, testing,
and integration.

In this documentation, the use of software-specific terminology is intentionally
kept at a low level in the interest of a wider audience. Nevertheless,
occasional remarks are necessary to specifically inform domain engineers or
software architects about some of the more formal approaches.
