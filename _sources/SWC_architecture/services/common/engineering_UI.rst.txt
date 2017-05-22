
.. _services-engineering_UI:

*Engineering User Interface Service*
.....................................

Engineering user interfaces provide a low level detailed graphical interface
to the GMT system. This interface is not optimized for scientific operations,
and is used in collaboration with the Command Line Interface (CLI) service
during the development, testing, integration, and commissioning phases of the
GMT subsystems.

.. figure:: _static/engineering_UI_product_tree.png

Engineering User Interface Product Tree overview

Like all of the GMT user interfaces, the main components are Panels and
Widgets. Widgets are grouped into Panels that are assigned to the GMT
operation display units. Engineering user interfaces are in most cases
generated according to UI specification files. The engineering Panels are
built using the standard Widgets provided by the UI framework (e.g., 2D plot,
scalar). In contrast, the Operation User Interface System includes additional
ad-hoc widgets designed to optimize the main high-level operator workflows.
The figure below shows and example of a scalar view widget.

.. figure:: _static/engineering-scalar-widget-example.png

  Engineering Scalar Widget Example

**Service Capabilities**

  The engineering user interface components provide the following capabilities:

     * Display of all the information relevant to a Subsystem or Component

     * Default Panel generation using engineering layouts

     * Subsystem view (e.g., alarms, logs, monitors, commands, properties)

     * Component view

     * System navigation (e.g., system tree widget)

     * Profile management

     * Integration with the Operations User Interface

