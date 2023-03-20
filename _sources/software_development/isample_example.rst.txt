.. _Isample_example:

ISample Example
===============

:ref:`ISample DCS <dcs_spec_example>` is an instrument control system example that provides
a template that instrument developers can use as a model.

.. note::
  The following instructions assume that the SDK has been installed and the Development Environment configured correctly according to the instructions in :ref:`installation` or :ref:`upgrade`.

Configure git to access GMTO's repositories
-------------------------------------------

In order to access private repositories on Github, an account with access permissions should be set up.

1. Log in in github and check if your user has access to the ISample repository: https://github.com/GMTO/ocs_isample_dcs
   If a 404 error is shown when entering the ISample webpage, please contact us to solve the permission issues.

   https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh
2. Configure your GitHub account to access using a ssh a token:
   https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token

Clone the isample_dcs repository
--------------------------------

On the development machine, clone the repository in the development folder:

.. code-block:: bash

  $ cd $GMT_LOCAL/modules
  $ git clone git@github.com:GMTO/ocs_isample_dcs.git

where the ``-d option`` defines the git repository owner. The output from the command
will be:

.. code-block:: bash

  $ git clone git@github.com:GMTO/ocs_isample_dcs.git
    Cloning into 'ocs_isample_dcs'...
    remote: Enumerating objects: 1049, done.
    remote: Counting objects: 100% (100/100), done.
    remote: Compressing objects: 100% (60/60), done.
    remote: Total 1049 (delta 53), reused 78 (delta 37), pack-reused 949
    Receiving objects: 100% (1049/1049), 166.06 KiB | 1.14 MiB/s, done.
    Resolving deltas: 100% (620/620), done.


Model Files
-----------
The model files can be found in the **$GMT_LOCAL/modules/ocs_isample_dcs/model/** folder.

isample_dcs.coffee
  Lists the connectors between the supervisor layer and the component layer, also lists the types to be generated during code generation.

isample_dcs_def.coffee
  High-level definition file, representing the WBS for the submodule. It lists the components and how the code will be generated.

isample_dcs_types.coffee
  Definitions of structs and data types used by the isample components.

isample_ctrl_pkg/isample_ctrl_fb.coffee
  Fieldbus definitions for the isample control package.

isample_ctrl_pkg/isample_ctrl_pkg.coffee
  Describes the control package and lists the connectors between components of the package.

isample_ctrl_pkg/isample_ctrl_super.coffee
  Definition of the *Control Supervisor* component. State variables, input and output ports are specified here. A single instance called **isample_ctrl_super** will be created.

isample_ctrl_pkg/isample_filter_wheel_ctrl.coffee
  Definition of the *Filter Wheel Controller* component. State variables, input and output ports are specified here. Two instances, called **isample_fw1_ctrl** and **isample_fw2_ctrl** will be created.

isample_ctrl_pkg/isample_focus_ctrl.coffee
  Definition of the *Focus Controller* component. State variables, input and output ports are specified here. A single instance called **isample_focus1_ctrl** will be created.

isample_ctrl_pkg/isample_hw_adapter.coffee
  Definition of the *Hardware Adapter* component used to interface with the isample Actuators and Sensors. State variables, input and output ports are specified here. A single instance called **isample_hw1_adapter** will be created.

isample_ctrl_pkg/isample_temp_ctrl.coffee
  Definition of the *Temperature Controller* component. State variables, input and output ports are specified here. Two instances, called **isample_cryo_internal_temp_ctrl** and **isample_cryo_external_temp_ctrl** will be created.

.. code-block:: bash

        Control                   Internal                     Hardware
       Supervisor               Temp Control                    Adapter
      +--------------+         +-------------+             +---------------+
      |              |<--------|             |             |               |
      |              |         |             |             |               |
      |              |         |  temperature|<------------|int temp       |
      |              |         +-------------+             |               |
      |              |                                     |               |
      |              |             External                |               |
      |              |           Temp Control              |               |
      |              |         +-------------+             |               |
      |              |<--------|             |             |               |
      |              |         |             |             |               |
      |              |         |  temperature|<------------|ext temp       |
      |              |         +-------------+             |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |           Filter Wheel              |               |
      |              |            Control 1                |               |
      |              |         +--------------+            |               |
      |              |<--------|              |            |               |
      |              |         |              |            |               |
      |              |         | motor control|----------->|fw1 control    |
      |              |         |   motor state|<-----------|fw1 state      |
      |              |         +--------------+            |               |
      |              |                                     |               |
      |              |           Filter Wheel              |               |
      |              |            Control 2                |               |
      |              |         +--------------+            |               |
      |              |<--------|              |            |               |
      |              |         |              |            |               |
      |              |         | motor control|----------->|fw2 control    |
      |              |         |   motor state|<-----------|fw2 state      |
      |              |         +--------------+            |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |           Focus Control             |               |
      |              |         +--------------+            |               |
      |              |<--------|              |            |               |
      |              |         |              |            |               |
      |              |         |    hmi output|----------->|LEDs           |
      |              |         | motor control|----------->|focus control  |
      |              |         |     hmi input|<-----------|buttons        |
      |              |         |   motor state|<-----------|focus state    |
      |              |         +--------------+            |               |
      |              |                                     |               |
      |              |                                     |               |
      +--------------+                                     +---------------+



Code Generation
---------------

To generate the code skeleton from the model files, execute:

.. code-block:: bash

   $ cd $GMT_LOCAL/modules/ocs_isample_dcs/model
   $ webpack
   $ gds gen isample_dcs

This will generate the basic framework of source code and configuration files for each component.
The generated source files will be located in the `src/` folder. Gds may output some warnings because there are missing modules which are defined in the
local bundle (in particular, the hdk). This is
not a problem, and the code will be successfully generated.

To see the generated folders and files, navigate to:

.. code-block:: bash

  $ cd $GMT_LOCAL/modules/ocs_isample_dcs/src/
  $ ls -la

Component Attributes
--------------------

Components are defined by their state variables, input ports, output ports and step function.

The Filter Wheel component has the following attributes:

State Variables
~~~~~~~~~~~~~~~

  +------------------+-----------------+--------------------------------------+------------+
  | Type             | Name            | Range                                | Default    |
  +==================+=================+======================================+============+
  | float            | position        | min: 5, max: 40                      | 20         |
  +------------------+-----------------+--------------------------------------+------------+
  | OperationalState | op_state        |   OFF, STARTING, ON, INITIALIZING,   | OFF        |
  |                  |                 |   RUN, HALTING, SHUTTING_DOWN,       |            |
  |                  |                 |   FAULT, RESETTING, DISABLED         |            |
  +------------------+-----------------+--------------------------------------+------------+
  | SimulationMode   | sim_mode        | SIMULATION, ON_LINE                  | ON_LINE    |
  +------------------+-----------------+--------------------------------------+------------+
  | ControlMode      | control_mode    | STANDALONE, INTEGRATED               | STANDALONE |
  +------------------+-----------------+--------------------------------------+------------+

*OperationalState, SimulationMode and ControlMode are enums with their respective values shown in the "Range" column above.*

Inputs
~~~~~~~~~~~

  +----------------------+-------------------+----------------------+
  | Type                 | Name              | Internal variable    |
  +======================+===================+======================+
  | isample_motor_status | motor_state       | motor_state          |
  +----------------------+-------------------+----------------------+
  | float                | position_goal     | position.goal        |
  +----------------------+-------------------+----------------------+
  | OperationalState     | ops_state_goal    | ops_state.goal       |
  +----------------------+-------------------+----------------------+
  | SimulationMode       | sim_mode_goal     | sim_mode.goal        |
  +----------------------+-------------------+----------------------+
  | ControlMode          | control_mode_goal | control_mode.goal    |
  +----------------------+-------------------+----------------------+

where the struct `isample_motor_status` is defined as:

  .. code-block:: cpp

    struct isample_motor_status {
        bool             ready;                   // Axis Ready
        bool             enabled;                 // Axis Enabled
        bool             warning;                 // Axis Warning
        bool             error;                   // Axis Error
        bool             moving_positive;         // Axis Moving +
        bool             moving_negative;         // Axis Moving -
        MSGPACK_DEFINE_MAP(ready, enabled, warning, error, moving_positive, moving_negative)
    };

Outputs
~~~~~~~~~~~~

    +-----------------------+--------------------+-----------------------+
    | Type                  | Name               | Internal Variable     |
    +=======================+====================+=======================+
    | isample_motor_control | motor_control      | motor_control         |
    +-----------------------+--------------------+-----------------------+
    | float                 | position_value     | position.value        |
    +-----------------------+--------------------+-----------------------+
    | OperationalState      | ops_state_value    | ops_state.value       |
    +-----------------------+--------------------+-----------------------+
    | SimulationMode        | sim_mode_value     | sim_mode.value        |
    +-----------------------+--------------------+-----------------------+
    | ControlMode           | control_mode_value | control_mode.value    |
    +-----------------------+--------------------+-----------------------+

where the struct `isample_motor_control` is defined as:

    .. code-block:: cpp

      struct isample_motor_control {
          bool             enable;                  // Axis Enable
          bool             reset;                   // Axis Reset
          int16_t          velocity;                // Velocity
          MSGPACK_DEFINE_MAP(enable, reset, velocity)
      };


(Optional) Defining component behavior
--------------------------------------
The core component behavior is specified in the component cpp file. The component
has a periodic thread that reads input from the input ports, runs the step
function and then writes output to the output ports. Initially, the generated
step function will check whether the component is correctly configured and, if
so, will log the current step counter value.

In the following examples, we will replace the basic step functionality with
simulated controller behavior.

To edit the *Filter Wheel Controller* step function:

.. code-block:: bash

   $ cd $GMT_LOCAL/modules/ocs_isample_dcs/src/cpp/
   $ cd isample_ctrl_pkg/isample_filter_wheel_ctrl
   $ vi IsampleFilterWheelCtrl.cpp

The following example step function for the filter wheel controller validates
positional input and immediately sets the position value to the new goal, if possible.

   .. code-block:: cpp

    void IsampleFilterWheelCtrl::step()
    {
        if (is_step_rate(1000))
        {
            if (position.goal != position.value)
            {
                // check range
                if (position.goal >= position.max)
                {
                    log_warning("Position is at or exceeding maximum value: " + std::to_string(position.max));
                    // prevent further movement
                    position.value = position.max;
                }
                else if (position.goal <= position.min)
                {
                    log_warning("Position is at or exceeding minimum value: " + std::to_string(position.min));
                    // prevent further movement
                    position.value = position.min;
                }
                else
                {
                    // achieve target position immediately
                    position.value = position.goal;
                }
                // report value
                log_info(position.name + " = " + std::to_string(position.value));
            }
        }
    }

Compilation
-----------

To compile the C++ Control Package code, edit the module.mk file to contain the correct library definitions:

.. code-block:: bash

   $ vi $GMT_LOCAL/modules/ocs_isample_dcs/src/cpp/isample_ctrl_pkg/module.mk

Ensure that the following lines are defined:

.. code-block:: bash

   # Add in this file the compile flags for the package, eg:
   MOD_BUILD_LDFLAGS += -lcore_core_pkg -lio_core_pkg -lctrl_core_pkg

Run **make** to compile the code:

.. code-block:: bash

   $ cd $GMT_LOCAL/modules/ocs_isample_dcs/src/cpp
   $ make

Installing the configuration
----------------------------

.. _compil_config:

The configuration files are autogenerated in the `$GMT_LOCAL/modules/ocs_isample_dcs/src/etc/conf` directory,
but they need to be installed to `$GMT_LOCAL/etc/conf` to be used by
the application.

To install the configuration files, execute the following commands:

.. code-block:: bash

   $ gds install isample_dcs
   $ grs compile isample_dcs

Running the Example
-------------------
Start the logging and telemetry services:

.. code-block:: bash

   $ log_server &
   $ tele_server &

Start the ISample Control Package application in the background.

.. code-block:: bash

   $ isample_ctrl_app &

The application is running in the background and will not provide any console output.
All output will be directed to the logging service after the components have been successfully set up.

Log Service
~~~~~~~~~~~

In a separate terminal (for example, `tty2`), **start the logging service client**.

.. code-block:: bash

   $ log_client listen


Telemetry Service
~~~~~~~~~~~~~~~~~

In a separate terminal, **start the telemetry service client**.

.. code-block:: bash

   $ tele_client listen

In this example, we don't filter to show data for all monitors.
The output can be filtered on substrings of the monitor name by specifying the
topic to be a specific component type (``filter_wheel_ctrl``) or an output port
name, such as ``position``. For example,

.. code-block:: bash

    $ tele_client listen --topic=isample_focus1_ctrl/hmi_outputs

will show only the values of the ``hmi_outputs`` monitor from ``isample_focus1_ctrl``.

Interacting with a component
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The `grs` command-line application can be used to interact with Components.
Some of the functionalities provided by this application are querying the
current value of a given Component feature (property, state variable, input
or output), setting a value or inspecting the whole Component state.

The `grs get` subcommand allows us to query the current value of a feature. The
syntax is

.. code-block:: bash

    $ grs get <instance> -f <feature>

For example, to read the value of the `position` state variable of the
`isample_fw1_ctrl` instance, execute:

.. code-block:: bash

    $ grs get isample_fw1_ctrl -f state_vars/position/value

To set a value, the `grs set` subcommand can be used:

.. code-block:: bash

    $ grs set <instance> -f <feature> -v <value>

For example, to set the goal of the `position` state variable of the
`isample_fw1_ctrl` instance, execute:

.. code-block:: bash

    $ grs set isample_fw1_ctrl -f state_vars/position/goal -v 2.0

Finally, to inspect the whole state, use the `grs inspect` command:

.. code-block:: bash

    $ grs inspect <instance>

As before, to inspect the state of the `isample_fw1_ctrl` instance, execute:

.. code-block:: bash

    $ grs inspect isample_fw1_ctrl

:ref:`[back to top] <isample_example>`
