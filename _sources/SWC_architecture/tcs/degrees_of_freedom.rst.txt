
.. _tcs-degrees_of_freedom:

Degrees of Freedom
------------------

The table below shows an overview of the different elementary mechanical degrees
of freedom of the telescope subsystems (AO subsystems are not included in this
table). Axis groups are identified specifically.  The first column identifies
the name of the mechanism; the second column the number of instances; the Axes
column identifies the number of axes per instance; the DOF column identifies the
total number of degrees of freedom; the Controller Profile Mode column
identifies the motion control profile as defined in IEC 61800-7 [IEC61800-7-1]_; and the
Actuator Type column identifies the generic category of the actuator.

.. include:: table-degrees_of_freedom_inc.rst

There are a total of 77 different types of axes; some of them have multiple
instances, for a total of 3005 mechanical degrees of freedom. Despite this large
number, only 5 motion control profiles, based on the IEC 61800-7-201/301
[IEC61800-7-201]_ [IEC61800-7-301]_ standard, are necessary to implement the
elementary degrees of freedom. This enables the possibility of a standardized
motion platform.
