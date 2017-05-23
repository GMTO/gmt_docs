
.. _architecture-controls:

Controls Hierarchy
------------------

An example of the control hierarchy addressed by the SWC software modeling
process is shown in the :ref:`Figure below <control-hierarchy>`.  At the top
level, the Sequencer subsystem orchestrates the operational workflow of
high-level processes, such as telescope pointing and acquisition. At
intermediate levels, control and operational logic dictate how to carry out the
commanded operations.  At the lowest levels, control demands are sent to devices
that produce telescope axis motion. The purpose of the SWC software modeling
process is to enable physical control that accurately captures the operating
principles of the observatory.

.. _control-hierarchy:

.. figure:: _static/control-hierarchy.png

   Conceptual Control Hierarchy

The GMT Instruments Controls Subsystem follows the same architectural design as
other device control subsystems. Typically an Instrument Software and Controls
Subsystem will include most of the packages described :ref:`for control
<table-control_packages>` and will be developed following the standards and
guidelines described in the SWCS Handbook.  The operation of ICS, TCS and AO
subsystems will be coordinated by the GMT Sequencer in order execute automated
observation or calibration operations.  The ICS data pipeline packages are
integrated in the GMT Data Processing System so quick look and data products
management is operated in a uniform way across the observatory. Analogously
instrument specific user interface panels and observing tools are integrated in
the Observatory Operations System to ensure consistent and seamless
implementation of observatory workflows.
