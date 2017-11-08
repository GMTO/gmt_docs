.. _Isample_example:

ISample Example
===============

:ref:`ISample DCS <dcs_spec_example>` is an instrument control system example that provides
a template that instrument developers can use as a model.

**Short Reference**
The following sequence of commands can be used on the Virtual Machine to
initialize the environment, checkout the repository,
generate the source code from the model and compile the code:

.. code-block:: bash

  $ mkdir /home/gmto/gmt_dev
  $ vi .bashrc
  $ export GMT_LOCAL=/home/gmto/gmt_dev
  $ source /opt/gmt/etc/gmt_env.sh
  $ cd /home/gmto/gmt_dev
  $ gds init_env
  $ git clone https://github.com/GMTO/isample_dcs.git
  $ cp isample_dcs/model/local.coffee install/etc
  $ cd isample_dcs
  $ gds codegen -e isample_dcs
  $ cd src
  $ make -j`nproc` install

Below, each step is explained in more detail.

Configure your Development Environment
--------------------------------------
1. Create a folder for GMT development

.. code-block:: bash

  $ mkdir ~/gmt_dev

All GMT modules being developed should be checked out underneath this folder.

2. Add the following two lines to your .profile (or .kshrc .bashrc depending on the shell)

.. code-block:: bash

  export GMT_LOCAL=/home/gmto/gmt_dev
  source /opt/gmt/etc/gmt_env.sh

This will ensure that the environment variables are correctly configured when
opening a new terminal. To configure the environment variables for the current shell,
run the commands manually.

Check the values of the environment variables with the command:

.. code-block:: bash

  $ gmt_env

3. Initialize the development environment with the following command:

.. code-block:: bash

  $ cd $GMT_LOCAL
  $ gds init_env

The correct folders will be created in the $GMT_LOCAL directory for use when
compiling and running modules.

Clone the isample_dcs repository
--------------------------------
1. On the development machine, clone the repository in the development folder:

.. code-block:: bash

  $ cd $GMT_LOCAL
  $ git clone https://github.com/GMTO/isample_dcs.git

2. Copy Module Configuration file to the development folder. The Module
Configuration file will list the modules to load when running gmt and gds.

.. code-block:: bash

  $ cp isample_dcs/model/local.coffee install/etc

Model Files
-----------
The model files can be found in the **model/** folder.

isample_core_if.coffee
  Lists the connectors between the isample and GMT core systems

isample_dcs.coffee
  Lists the connectors between the supervisor layer and the component layer. For this example, these are limited to monitoring the heartbeat of each component.

isample_def.coffee
  High-level definition file, representing the WBS for the submodule. It lists the components and how many instances of each are required.

isample_types.coffee
  Definitions of structs and data types used by the isample components.

isample_ctrl_pkg/isample_ctrl_fb.coffee
  Fieldbus definitions for the isample control package.

isample_ctrl_pkg/isample_ctrl_pkg.coffee
  Lists the connectors between components.

isample_ctrl_pkg/isample_ctrl_super.coffee
  Definition of the *Control Supervisor* component. State variables, input and output ports are specified here. A single instance called **isample_ctrl_super** will be created.

isample_ctrl_pkg/isample_filter_wheel_ctrl.coffee
  Definition of the *Filter Wheel Controller* component. State variables, input and output ports are specified here. Two instances, called **isample_fw1_ctrl** and **isample_fw2_ctrl** will be created.

isample_ctrl_pkg/isample_focus_ctrl.coffee
  Definition of the *Focus Controller* component. State variables, input and output ports are specified here. A single instance called **isample_focus_ctrl** will be created.

isample_ctrl_pkg/isample_hw_adapter.coffee
  Definition of the *Hardware Adapter* component, used to interface with the isample Actuators and Sensors. State variables, input and output ports are specified here. A single instance called **isample_hw_ctrl** will be created.

isample_ctrl_pkg/isample_temp_ctrl.coffee
  Definition of the *Temperature Controller* component. State variables, input and output ports are specified here. Two instances, called **isample_cryo_internal_temp_ctrl** and **isample_cryo_external_temp_ctrl** will be created.

.. code-block:: bash

        Control                   Internal                     Hardware
       Supervisor               Temp Control                    Adapter
      +--------------+         +-------------+             +---------------+
      |              |<--------|heartbeat    |             |               |
      |              |         |             |             |               |
      |              |         |  temperature|<------------|int temp       |
      |              |         +-------------+             |               |
      |              |                                     |               |
      |              |             External                |               |
      |              |           Temp Control              |               |
      |              |         +-------------+             |               |
      |              |<--------|heartbeat    |             |               |
      |              |         |             |             |               |
      |              |         |  temperature|<------------|ext temp       |
      |              |         +-------------+             |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |           Filter Wheel              |               |
      |              |            Control 1                |               |
      |              |         +--------------+            |               |
      |              |<--------|heartbeat     |            |               |
      |              |         |              |            |               |
      |              |         | motor control|----------->|fw1 control    |
      |              |         |   motor state|<-----------|fw1 state      |
      |              |         +--------------+            |               |
      |              |                                     |               |
      |              |           Filter Wheel              |               |
      |              |            Control 2                |               |
      |              |         +--------------+            |               |
      |              |<--------|heartbeat     |            |               |
      |              |         |              |            |               |
      |              |         | motor control|----------->|fw2 control    |
      |              |         |   motor state|<-----------|fw2 state      |
      |              |         +--------------+            |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |                                     |               |
      |              |           Focus Control             |               |
      |              |         +--------------+            |               |
      |              |<--------|heartbeat     |            |               |
      |              |         |              |            |               |
      |              |         |    hmi output|----------->|LEDs           |
      |              |         | motor control|----------->|focus control  |
      |              |         |     hmi input|<-----------|buttons        |
      |              |         |   motor state|<-----------|focus state    |
      |              |         +--------------+            |               |
      |              |                                     |               |
      |              |<------------------------------------|heartbeat      |
      +--------------+                                     +---------------+


Code Generation
---------------

To generate the code skeleton from the model files, execute:

.. code-block:: bash

   $ cd $GMT_LOCAL/isample_dcs
   $ gds codegen -e isample_dcs

This will generate the basic framework of source code and configuration files for each component. The files will be located in the `src/` folder.
To see the generated folders and files, navigate to:

.. code-block:: bash

  $ cd $GMT_LOCAL/isample_dcs/src/
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
  | float            | position_sv     | min: 5, max: 40                      | 20         |
  +------------------+-----------------+--------------------------------------+------------+
  | OperationalState | ops_state_sv    | | OFF, STARTING, ON, INITIALIZING,   | OFF        |
  |                  |                 | | RUN, HALTING, SHUTTING_DOWN,       |            |
  |                  |                 | | FAULT, RESETTING, DISABLED         |            |
  +------------------+-----------------+--------------------------------------+------------+
  | SimulationMode   | sim_mode_sv     | SIMULATION, ON_LINE                  | ON_LINE    |
  +------------------+-----------------+--------------------------------------+------------+
  | ControlMode      | control_mode_sv | STANDALONE, INTEGRATED               | STANDALONE |
  +------------------+-----------------+--------------------------------------+------------+

*OperationalState, SimulationMode and ControlMode are enums with their respective values shown in the "Range" column above.*

Input Ports
~~~~~~~~~~~

  +----------------------+-------------------+----------------------+
  | Type                 | Name              | Internal variable    |
  +======================+===================+======================+
  | isample_motor_status | motor_state       | motor_state          |
  +----------------------+-------------------+----------------------+
  | float                | position_goal     | position_sv.goal     |
  +----------------------+-------------------+----------------------+
  | OperationalState     | ops_state_goal    | ops_state_sv.goal    |
  +----------------------+-------------------+----------------------+
  | SimulationMode       | sim_mode_goal     | sim_mode_sv.goal     |
  +----------------------+-------------------+----------------------+
  | ControlMode          | control_mode_goal | control_mode_sv.goal |
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

Output Ports
~~~~~~~~~~~~

    +-----------------------+--------------------+-----------------------+
    | Type                  | Name               | Internal Variable     |
    +=======================+====================+=======================+
    | isample_motor_control | motor_control      | motor_control         |
    +-----------------------+--------------------+-----------------------+
    | HeartBeatEvent        | heartbeat_out      | heartbeat_out         |
    +-----------------------+--------------------+-----------------------+
    | float                 | position_value     | position_sv.value     |
    +-----------------------+--------------------+-----------------------+
    | OperationalState      | ops_state_value    | ops_state_sv.value    |
    +-----------------------+--------------------+-----------------------+
    | SimulationMode        | sim_mode_value     | sim_mode_sv.value     |
    +-----------------------+--------------------+-----------------------+
    | ControlMode           | control_mode_value | control_mode_sv.value |
    +-----------------------+--------------------+-----------------------+

where the struct `isample_motor_control` is defined as:

    .. code-block:: cpp

      struct isample_motor_control {
          bool             enable;                  // Axis Enable
          bool             reset;                   // Axis Reset
          int16_t          velocity;                // Velocity
          MSGPACK_DEFINE_MAP(enable, reset, velocity)
      };

and the struct `HeartBeatEvent` is defined as:

    .. code-block:: cpp

      struct HeartBeatEvent {
          struct timeval   timestamp;               // Time stamp
          MSGPACK_DEFINE_MAP(timestamp)
      };

(Optional) Defining component behavior
--------------------------------------
The core component behavior is specified in the \*_step.cpp file. The component
has a periodic thread that reads input from the input ports, runs the step
function and then writes output to the output ports. Initially, the generated
step function will check whether the component is correctly configured and if
so, will log the current step counter value.

For more information, and in relation to a simpler example, see :ref:`Running Examples <running_examples>`

In the following examples we will replace the basic step functionality with
simulated controller behavior.

To edit the *Filter Wheel Controller* step file:

.. code-block:: bash

   $ cd $GMT_LOCAL/isample_dcs/src
   $ cd isample_ctrl_pkg/isample_filter_wheel_ctrl/cpp
   $ vim isample_filter_wheel_ctrl_step.cpp

The following example step function for the filter wheel controller validates
positional input and immediately sets the position value to the new goal, if possible.

   .. code-block:: cpp

    void IsampleFilterWheelCtrl::step(bool setup_ok) {
        if(setup_ok) {                     // this will be executed only if port setup has been received
            if (is_step_rate(1000)) {
                if (position_sv.goal != position_sv.value) {
                    // check range
                    if (position_sv.goal >= position_sv.max) {
                        log_warning("Position is at or exceeding maximum value: " + std::to_string(position_sv.max));
                        // prevent further movement
                        position_sv.value = position_sv.max;
                    } if (position_sv.goal <= position_sv.min) {
                        log_warning("Position is at or exceeding minimum value: " + std::to_string(position_sv.min));
                        // prevent further movement
                        position_sv.value = position_sv.min;
                    } else {
                        // achieve target position immediately
                        position_sv.value = position_sv.goal;
                    }
                    // report value
                    log_info(position_sv.name + " = " + std::to_string(position_sv.value));
                }
            }
        }
    }

Compilation
-----------

To compile the code, run make:

.. code-block:: bash

   $ cd $GMT_LOCAL/isample_dcs/src
   $ make -j`nproc` install

The executables will be located in `src/install/bin/`.

Running the Example
-------------------
Start the logging and telemetry services:

.. code-block:: bash

   $ gds log_service start &
   $ gds telemetry_service start &

Start the ISample Control Package application in the background

.. code-block:: bash

   $ install/bin/run_isample_ctrl_pkg_main &

The application is running in the background and will not provide any console output.
All output will be directed to the logging service after the components have been successfully set up.

Log Service
~~~~~~~~~~~

In a separate terminal (for example `tty2`), **start the logging service client**.

.. code-block:: bash

   $ gds log_service client gmt

In this example, we use the topic ``gmt`` to show logs for all components.
The output can be filtered on substrings of the component URI by specifying
topics such as ``fw``, ``hw1``, ``super`` or ``temp``.

In the first terminal (`tty1`), **initialize all components** by running ``gds setup``.

.. code-block:: bash

   $ gds setup -m runtime -e isample_ctrl_super
   $ gds setup -m runtime -e isample_fw1_ctrl
   $ gds setup -m runtime -e isample_fw2_ctrl
   $ gds setup -m runtime -e isample_focus1_ctrl
   $ gds setup -m runtime -e isample_cryo_external_temp_ctrl
   $ gds setup -m runtime -e isample_cryo_internal_temp_ctrl
   $ gds setup -m runtime -e isample_hw1_adapter

Switch to the session running the logging service client (`tty2`), and confirm
that the expected components are logging step info.

Telemetry Service
~~~~~~~~~~~~~~~~~

In a separate terminal (for example `tty3`), **start the telemetry service client**.

.. code-block:: bash

   $ gds telemetry_service client gmt

In this example, we use the topic ``gmt`` to show data for all monitors.
The output can be filtered on substrings of the monitor name by specifying the
topic to be a specific component type (``filter_wheel_ctrl``) or an output port
name, such as ``position`` or ``heartbeat``.

In the first terminal (`tty1`), **start the monitors** on all components by
running ``gds telemetry_service monitor``.

.. code-block:: bash

   $ gds telemetry_service monitor -m runtime -e isample_ctrl_super
   $ gds telemetry_service monitor -m runtime -e isample_fw1_ctrl
   $ gds telemetry_service monitor -m runtime -e isample_fw2_ctrl
   $ gds telemetry_service monitor -m runtime -e isample_focus1_ctrl
   $ gds telemetry_service monitor -m runtime -e isample_cryo_external_temp_ctrl
   $ gds telemetry_service monitor -m runtime -e isample_cryo_internal_temp_ctrl
   $ gds telemetry_service monitor -m runtime -e isample_hw1_adapter

Switch to the session running the logging service client (`tty3`), and confirm
that the expected telemetry output is shown.

A query can also be sent to the telemetry service:

  *Usage:*  ``gds telemetry_service query monitor_name num``

For example, the following will list the last 12 positional values
(from newest to oldest) for the ``isample_fw1_ctrl`` and ``isample_fw2_ctrl`` components:

.. code-block:: bash

  $ gds telemetry_service query gmt://isample_dcs/isample_filter_wheel_ctrl//position_value 12

All telemetry queries have to be done using the full URI of the monitor,
which can be seen when running a telemetry_service client, as described above.

Sending a Value to the Input Port
---------------------------------
In order to see the step function in action, we can write a value to an input port and see the component react to it.
While using the step function defined above, run 'gds send_value' with a port name and new value.

For example:

.. code-block:: bash

   $ gds push_value position_goal 23 -m runtime -e isample_fw1_ctrl

where **position_goal** is the name of the input port, **23** is the new value to send and **isample_fw1_ctrl** is the component instance to send it to.

The log client should show messages indicating that the component moved from its current position to the new goal value.

.. note::

  In this version, ISample includes the specification of a control package.
  All :ref:`DCS Packages <table-control_packages>` follow the same development principles with the difference
  that the Component base classes add specialized interfaces (e.g. Controller vs Pipeline). The next
  incremental release of the GMT software will include examples of user interface
  and data processing packages.

:ref:`[back to top] <isample_example>`
