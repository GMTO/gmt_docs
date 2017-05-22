
.. _standards-introduction:

Introduction
============

The GMT Software and Controls System (SWC) encompasses the software and hardware
components necessary to control and monitor the GMT optical and
electromechanical subsystems and to safely and efficiently operate the GMT
observatory. Its design is driven by a set of general guidelines: to use
industry components and standards that improve the cost-effectiveness of the
system; to design an architecture around well-established practices and design
patterns; to validate the technical platform and architecture by prototyping and
incremental delivery and integration; to use a model-based development approach
integrated with an Agile and lean based management process; and to efficiently
support and collaborate with the parties involved in the development of the
different GMT subsystems.

The GMT Software and Controls System includes a significant number of Device
Control Subsystems (DCS). Some of them are developed in house, while others are
procured by the partner institutions or commercial vendors located around the
world. In order to facilitate the specification, development, integration and
standardization of common design aspects, DCS subsystems follow a reference
component architecture that ensures the internal consistency of subsystems,
minimizes the interfaces between them and facilitates the composition of
individually tested subsystems.

This document defines rules for the design of each DCS in order to guarantee the
integration, interoperability, maintainability and cost efficiency of the
Software and Controls system.

*Scope*

  This Section gives a brief introduction.  Later Sections cover:

    * :ref:`Applicable definitions and references <references>`

    * :ref:`DCS reference architecture <dcs_reference_architecture>`

    * :ref:`DCS development process and life cycle <lifecycle>`

    * :ref:`DCS Specifications <specifications>`

    * :ref:`Policies on non-conformance <non_conformances>`

    * :ref:`"Well-formedness" rules <appendix>` of the reference
      architecture (Appendix).

.. include:: dcs_definition_inc.rst
.. include:: terminology_inc.rst


