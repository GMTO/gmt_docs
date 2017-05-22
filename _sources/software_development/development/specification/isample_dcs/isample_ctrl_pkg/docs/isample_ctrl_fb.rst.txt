.. _isample_ctrl_fb:

Fieldbus description (*isample_ctrl_fb.coffee*)
...............................................

The fieldbus description specified the list of IO modules
and data objects. The following examples shows a complete EtherCAT
fieldbus description with one master a 1KHz and two domains: one at 1Khz
and the second at 1s. The list of modules is based on the HDK list of modules.
Per each data object its necessary to specify the direction (rx/tx) and type (pdo/sdo)
The std_name property is a string that correspond to a string extracted
from the EtherCAT standard XML files.

.. literalinclude:: ../isample_ctrl_fb.coffee
   :caption:  Code: *isample_ctrl_fb.coffee*
   :language: coffeescript
