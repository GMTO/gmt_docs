.. _Overall_Architecture:

Overall Architecture
====================

A complex system like the GMT has many parts and behaviors that require control.
The overall architecture of the GMT Software and Controls System (SWCS) has to
capture many essential aspects of the observatory as a whole: from the system
organization, physical and behavioral properties of the systems and subsystems,
their control hierarchy, communication and interaction of the subcomponents
under control, runtime operations, to how human operators would use the
telescope.  Together, they provide a coherent yet still schematic narrative of
the overall system.  They further filter down and are refined into technical and
operational requirements that become the basis around which detailed designs of
the control software may begin.  The software architecture is a process that
captures decisions to best meet the requirements at the system level, while
optimizing over parameters to meet the :ref:`key-principles`, in particular,
performance, reliability, maintainability, and cost.  The discussion below gives
a summary of the overall SWCS architecture from several different top-level
perspectives, i.e. from the standpoint of the SWCS organization, :ref:`the
global SWCS domains <architecture-control_domains>`, :ref:`software development
layers <architecture-development>`, :ref:`software deployment layers
<architecture-deployment>`, :ref:`control hierarchy <architecture-controls>`,
:ref:`system health and supervision <architecture-health_supervision>`,
:ref:`software frameworks <architecture-frameworks>`, and :ref:`the subsystem
modules <architecture-modules>`.

.. toctree::
    :maxdepth: 1

    organization.rst
    domains.rst
    development.rst
    deployment.rst
    controls.rst
    health_supervision.rst
    frameworks.rst
    modules.rst
    integration.rst


