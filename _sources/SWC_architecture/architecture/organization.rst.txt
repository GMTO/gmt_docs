
.. _architecture-organization:

Organization
------------

The first phase in the SWCS development starts with the :ref:`process of domain
engineering <domain_engineering_process>` (clause 7.3.1 of [ISO12207]_)
which allows one to identify the main architectural components of the SWCS and
to group them into uniform categories of: subsystems, packages and components,
based on the cohesion of certain functionalities, timing requirements, and the
sizes of the interfaces.

.. _swcs-organization:

.. figure:: _static/swcs-organization.png

   SWCS Organization

The above figure illustrates how the SWCS organization hierarchy fits into the
project organization using the Unified Modeling Language (UML) diagram after the
process.  System, Domain, Subsystem and Packages are aggregations that make up
the hierarchy of the GMT SWCS, such that a system contains multiple domains, a
domain contains multiple subsystems, and so forth.  The Classifier class
provides basic naming and description attributes. The *ConfigurationItem* class
extends Product Breakdown Element (PBE) and Work Breakdown Element (WBE) classes
to enable mapping of the SWCS structure to the GMT project Product Breakdown
Structure and Work Breakdown Structure.

This section describes the SWCS architecture, while 
the :ref:`domain_engineering_process` as defined in ISO/IEC-12207 [ISO12207]_ is
discussed in the Section on :ref:`process-software_development`.
