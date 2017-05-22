
.. _architecture-integration:

Instrument Software and Controls Integration
--------------------------------------------

The GMT instruments software and controls follow the same architectural design
as other device control subsystems. Typically an Instrument Software and
Controls Subsystem (ICS) will include most of the packages described in
:numref:`Table %s <table-control_packages>` and :numref:`Table %s
<operation-support-packages>` and will be developed following the standards and
guidelines described in the SWCS Handbook [Filg13b]_. The operation of ICS, TCS
and AO subsystems will be coordinated by the GMT Sequencer in order execute
automated observation or calibration operations. The ICS data pipeline packages
are integrated in the GMT Data Processing System so quick look and data products
management is operated in a uniform way across the observatory. Analogously
instrument specific user interface panels and observing tools are integrated in
the Observatory Operations System to ensure consistent and seamless
implementation of observatory workflows.
