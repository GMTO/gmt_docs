.. _model_definition_files:

DCS Development
===============


This section describes an example of the :ref:`development <dcs_development>`
of a Device Control System (DCS). DCS are developed in
a :ref:`three step process <system_definition_files>`.
First the definition of a formal specification of the DCS.
Second, the generation of code skeletons that take
care of repetitive tasks and specialization of the
:ref:`Core Framework <core_framework>` components that provide base
infrastructure functionality to DCS components.
A third step shall include the coding of the application specific
functions.


.. figure:: _static/dcs_implementation_strategy.png

   DCS Implementation Strategy


.. toctree::
   :maxdepth: 1

   development/introduction/introduction
   development/specification/specification
   development/codegen/codegen

