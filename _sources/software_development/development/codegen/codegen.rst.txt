.. _dcs_code-example:

DCS code generation example: *isample_dcs*
------------------------------------------

The following sections detail the files which are generated from the model in the *isample_dcs* example.
In order to generate these files you have to

     1) create the model files for the DCS
     2) generate the code using the model tools

Most of the generated files do not need to be edited. The only files that need to be edited are:

    - **instance configuration** coffee files because each instance can have different property values
    - **$(component_name)_step.cpp** files because the step() method is the place for custom component functionality

Note that only the Filter Wheel Controller is documented here. All other controllers follow the same structure.

.. toctree::
   :maxdepth: 1

   isample_dcs/index.rst
   isample_dcs/isample_ctrl_pkg/index.rst
   isample_dcs/isample_ctrl_pkg/isample_ctrl_super/index.rst
   isample_dcs/isample_ctrl_pkg/isample_filter_wheel_ctrl/index.rst
   isample_dcs/isample_ctrl_pkg/isample_hw_adapter/index.rst
