
.. _dcs_reference_architecture:

DCS Reference Architecture
==========================

This chapter gives a description of the GMT Device Control Subsystems (DCS)
terminology and architecture, its design philosophy and its main functions.  The
:ref:`Software and Controls Architecture and Design <SLPDR>` provides an
extended description of the overall Software and Controls System that
illustrates how the different DCS fit in the overall software architecture.

Device Control Subsystems (e.g. primary mirror control system, adaptive
secondary control system, instrument control system, etc.) command mechanical
degrees of freedom or read from optical and other sensors. Degrees of freedom
are represented by a set of state variables that define the observed and desired
state of the system and are often updated in an arrangement of nested control
loops. Although the primary function of a Device Control Subsystem is the
control of hardware devices, an efficient and robust operation requires the
development of: 

  * Calibration software that is required to produce error maps or models that
    allow the control system to achieve the required performance; 

  * Diagnosis software that provides the capability to observe and verify the
    behavior of some, quite complex, hardware and software subsystems,
    especially during the commissioning phase; 

  * Safety functions that prevent the engagement of the interlock and safety
    system, which acts usually in a more ‘dramatic way’; and 

  * Supervision software that coordinates several components or subsystems to
    guarantee their correct states and that implements fault management
    strategies that enable the graceful degradation of performance in
    non-nominal scenarios.

.. include:: context_inc.rst

.. include:: component_architecture_inc.rst

.. include:: product_structure_modeling_inc.rst

.. include:: instrument_swc_integration_inc.rst

.. include:: deployment_inc.rst

