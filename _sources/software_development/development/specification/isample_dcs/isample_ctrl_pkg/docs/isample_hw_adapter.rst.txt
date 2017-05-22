.. _isample_hw_adapter:

*isample_hw_adapter.coffee*
...........................

Hardware adapters are a special type of component to
interface with hardware devices. A hardware adapter provides
an standard port interface to specific hardware.
In this case we have an EtherCAT Adapter with a list of ports.
Each port can include several EtherCAT communication objects
described in the data object map.

.. literalinclude:: ../isample_hw_adapter.coffee
   :caption:  Code: *isample_hw_adapter.coffee*
   :language: coffeescript
