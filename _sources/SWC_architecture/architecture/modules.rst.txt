
.. _architecture-modules:

Modules: Subsystem, Packages, Components
----------------------------------------

The SWCS domains (TCS, OPS, OSRV) are each composed of software subsystem
modules. As illustrated in the bottom row of the :ref:`swcs-organization`
figure, each subsystem is then made up of components organized into packages
according to their affinity or relationships. The SWC reference architecture
[Filg13b]_ defines a guide for organizing subsystem components into a set of
canonical packages.  Examples of packages and their components are shown in
Tables below on :ref:`table-control_packages` and :ref:`figure-core_components`.
Which packages exist in which subsystem depends on the specific functionality
(e.g., some subsystems do not require special calibration components, or do not
interface with hardware devices). The tables below describe this pattern, split
in two categories:

  * :ref:`Control Packages <table-control_packages>` – These packages are included in
    subsystems that involve the control of optomechanical hardware Devices.

  * :ref:`Operation Support Packages <operation-support-packages>` – These
    Packages include software components necessary to support health monitoring,
    automation, and proper operation of a Subsystem. Diagnosis and calibration
    packages are emphasized early on in the design. This is an area that is
    often overlooked despite the fact that they may take a significant amount of
    development effort, especially in the case of complex adaptive optics
    control subsystems.


.. include:: table-control_packages_inc.rst

.. include:: table-operation_support_packages_inc.rst

.. figure:: _static/m1-control-system-excerpt.png

   M1 Control System Package and Components Excerpt

The Figure above shows an example of the component organization for the M1
Control System. The structure of all the SWCS Subsystems has been analyzed and
developed following this pattern. As described above and later,
:ref:`framework-domain_engineering` helps to identify sets of common components
that are the elementary building blocks of the SWCS subsystems.  The figure on
:ref:`figure-core_components` below shows those core component classes.  Each
component is defined by a set of :ref:`figure-component_features` whose
definitions are detailed in :ref:`core_framework`.  In fact, all SWCS modules,
including subsystems, packages, and components are fully specified by a text
file containing their features, as shown in the example of
:ref:`BaseLinearAxisController <BaseLinearAxisController>`. The Section on
:ref:`subsystem_specification_and_modeling` explains the formal specification
process in more detail.

.. _figure-core_components:

.. figure:: _static/core-components.png

   Core Components

.. _figure-component_features:

.. figure:: _static/component-features.png

   Component Features

Each Component has been assigned to a class that defines its default behavior in
the corresponding specification file. :ref:`The following code-block excerpt
<BaseLinearAxisController>` shows an example of the specification file that
defines the interface and features of a *BaseLinearAxisController*
(:ref:`device_control_framework` provides an overview of common motion control
Components). This specification is based on the IEC 61800-7-201 [IEC61800-7-201]_
Standard. The standard is concrete, but at the same time is designed to cover a
majority of the motion control use cases. The design process captures when a
Component (e.g., *agws_radial_stage_ctrl*) fits this default behavior. This
approach provides several benefits:

  * The specification of the component captures performance data, interfaces,
    etc., all of which are used directly in the final implementation.
    Furthermore, the specification closely dovetails a well-developed and
    industrial standard, which significantly reduces the effort needed to
    capture all the information.  This is in sync with the way industrial
    companies specify their subsystems.  This often allows one to implement the
    controller in a standard off-the-shelf smart drive, relieving the computing
    platform of the responsibility to perform all the real-time functionality.
    As the control loops run in dedicated standardized controllers, it is then
    feasible to implement a layer that integrates the controller with the rest
    of the observatory services using more productive high-level languages
    (:ref:`software_development_platform`).

  * The mapping between specification and implementation is as direct as it
    gets, and greatly facilitates the traceability of requirements.

  * The interfaces of similar Components share the same detailed specification
    (e.g., the interfaces of all the linear stages are the same). This not only
    allows the development of common control Components, but the possibility to
    reuse common visualization or calibration Components, as well as testing
    procedures.

  * It is possible to specify accordingly the majority of the elementary degrees
    of freedom of the GMT as well as some Axis Groups (e.g.,
    *BaseLinearXYController* for a Cartesian linear stage), as discussed in
    :ref:`tcs_introduction`. It is also possible to incorporate fault
    management, and startup/shut down procedures in the same manner modeled
    using supervisor components.  Supervisors are usually more specific to the
    application and their implementation, thus require more customization. Other
    domains, like user interface components or data processing components have
    been subject to the same design process. :ref:`user_interface_framework` and
    :ref:`data_processing_framework` sections describe them respectively.

.. include:: BaseLinearAxisController_inc.rst
