.. _isample_filter_wheel_ctrl:

Filter Wheel Controller (*isample_filter_wheel_ctrl.coffee*)
............................................................

This file describes the filter wheel controller including
state variable and input/output ports.
State variables can be controllable or observable and can be
of different data types. The default value is used to initialize
the state at the beginning. The max and min values can be used
to trigger alarms on some limit conditions.

Data ports have a defined data type (simple or structured),
a protocol, a processing rate and a brief description.
The rate is related with the component step rate
(a value of of 10 means that the port is processed every 10 steps).

Note that several instances of the same controller can be created.
Each instance will have it's own configuration. The list of configuration
properties is defined at the end of the files.

.. literalinclude:: ../isample_filter_wheel_ctrl.coffee
   :caption:  Code: *isample_filter_wheel_ctrl.coffee*
   :language: coffeescript
