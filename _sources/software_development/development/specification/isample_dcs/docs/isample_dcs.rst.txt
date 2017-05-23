.. _isample_dcs:

DCS description *isample_dcs.coffee*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the DCS architecture each subsystem includes several :ref:`packages <dcs_product_structure_modeling>`.
This file is a description of these packages and
the connectors of the different components inside the package.

Each connector includes an id (related with the network port)
and then defines two properties "from" and "to" which are used
to indicate the component and the ports to be connected on each side.

.. literalinclude:: ../isample_dcs.coffee
   :caption:  Code: *isample_dcs.coffee*
   :language: coffeescript
