
.. _tcs-wavefront_control:

Wavefront Control System
------------------------

The Wavefront Control System (WFCS) is the set of TCS software components that
implements all active and adaptive optics control for the GMT. It includes all
of the software and computing hardware necessary to determine the optical
aberrations detected by AO and telescope wavefront sensors and to convert them
into corrections applied to the AO and telescope optics. This integrated
wavefront control approach is different than that followed by many previous
telescope projects in which the AO control system was logically distinct from
the telescope control system. This approach, enabled by the concurrent
development of telescope and AO systems, avoids the duplication of
infrastructure components and facilitates the consistent design of different GMT
observing modes, especially when the boundary between telescope and AO becomes
fuzzy (e.g., AGWS wavefront sensors are used in some AO modes or the ASM is used
in natural seeing mode).

The wavefront control system involves hardware and software components developed
in several groups and organizations. A careful and systematic definition of
interfaces that evolve with the design is of paramount importance to ensure
that, once integrated, the system operates with the required performance and
robustness.

The GMT is required to support four observing modes: Natural Seeing, GLAO,
NGSAO, and LTAO. A different but overlapping set of wavefront sensors and
optical compensators is used to meet the optical performance requirements of
each. The WFCS must therefore be modular and reconfigurable, while providing the
high computing performance and low latency required for AO control. In the TCS,
each observing mode has a distinct wavefront controller, but all modes share
some common software components. Each wavefront controller is instantiated at
runtime; the connections between software components are established by a
wavefront control supervisor component specific to each observing mode. A
top-level wavefront control supervisor implements changes between observing
modes.

One type of component common to all observing modes is the optics controller.
The M1 Optics Controller converts wavefront residuals to segment rigid body
motions and bending modes, which are then passed on to the M1 System hardware
controllers. The M2 Optics Controller converts wavefront errors such as focus
and pointing-neutral tilt to rigid body motions of the M2 segments, which are
passed on to the M2 Positioner hardware controller.

A full description of the implementation of the wavefront controller for each of
the three AO observing modes is given in the AO Preliminary Design Report
[Bouc13]_.  Only an outline of the Natural Guide star Ground Layer AO observing
mode WFC is presented here, providing an example of the interaction between the
AO wavefront controller components and the Active Optics Wavefront Controller.

.. toctree::
    :maxdepth: 1

    wavefront_control/ns_obsmode
    wavefront_control/ngsao_obsmode
    wavefront_control/ltao_obsmode
    wavefront_control/nglao_obsmode
