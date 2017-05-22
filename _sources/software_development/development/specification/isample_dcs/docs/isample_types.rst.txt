.. _isample_types:


DCS own Data Types (*isample_types.coffee*)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Input and output ports of the components can use any kind of
data type. Usually it's convenient to group several simple data types
into structured types to move data between components.

This file includes the specific structured data types required
for the data input and output ports of the DCS components.
Each structured type includes a brief description and the list of single types.
Per each single type there is also a description,
the implementation data type and the units used for
this value if required.

.. literalinclude:: ../isample_types.coffee
   :caption:  Code: *isample_types.coffee*
   :language: coffeescript
