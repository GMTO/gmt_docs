.. _Isample_example:

ISample Example
===============

:ref:`ISample DCS <dcs_spec_example>` is an instrument control system example that provides
a template that instrument developers can use as a model.

Retrieve the sample model files from `here <../_static/isample_dcs.tgz>`_ or execute:

.. code-block:: bash

   $ curl -O http://52.52.46.32/_static/isample_dcs.tgz
   $ tar xvfz isample_dcs.tgz
   $ cd isample_dcs

For relative and absolute paths, it will be assumed that the tar file was downloaded to the current user's home directory (~/).

Model Files
-----------
isample_def.coffee
  High-level definition file, representing the WBS for the submodule. It lists the components and how many instances of each are required.

isample_dcs.coffee
  Lists the connectors between the supervisor layer and the component layer. For this example, these are limited to monitoring the heartbeat of each component.

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

   $ gds codegen -e isample_dcs

This will generate the basic framework of source code and configuration files for each component. The files will be located in the `src/` folder.
To see the generated folders and files, navigate to:

.. code-block:: bash

  $ cd src/runtime/src/idcs/isample_dcs/
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

Configuration
-------------
All component instances require a unique setup port, used to send configuration parameters to the running instance.
The port on which the component instance listens for configuration parameters is defined in the corresponding *\*_run.cpp* file.
The port to which configuration parameters will be sent (using gds) for each component is defined in the corresponding *\*_config.coffee* configuration file.

.. note::

  The examples use the text editor *vim*, which is included in almost all Linux distributions,
  but any other text editor can be used.

  To edit a file while viewing it in vim, type ``i``. To save and exit, hit ``esc``, then type ``:wq``.

C++ Executables
~~~~~~~~~~~~~~~

For each component, ensure that the setup ports specified in the C++ files that instantiates components are unique, and matches the setup port specified in the corresponding *\*_config.coffee* files.

For example, the file *isample_filter_wheel_ctrl_run.cpp* instantiates the two filter wheel controllers, each on its own setup port.
These setup ports need to be unique within the executable and match the setup port numbers defined in the *\*_config.coffee* files, which we'll edit next.

  .. code-block:: bash

    $ cd isample_ctrl_pkg/isample_filter_wheel_ctrl/cpp/
    $ vim isample_filter_wheel_ctrl_run.cpp

When executed, this file will create the two Filter Wheel controller instances.
Ensure that they listen for configuration parameters on the correct setup ports
by creating *isample_fw1_ctrl* on port 8000 and *isample_fw2_ctrl* on port 8001.

At first, we'll use the *run_isample_filter_wheel_ctrl* executable (created
using the isample_filter_wheel_ctrl_run.cpp file) to test the Filter Wheel controllers
in isolation. To run all components at the same time, the same concept applies
to the *run_isample_ctrl_pkg_main* executable using *isample_ctrl_pkg_main_run.cpp*.

Coffee Config Files
~~~~~~~~~~~~~~~~~~~

Edit the coffee file containing the configuration for each component instance

For example, for the two Filter Wheel Controller instances:

  .. code-block:: bash

    $ cd ../coffee/
    $ vim isample_fw1_ctrl_config.coffee
    $ vim isample_fw2_ctrl_config.coffee

Instance duplicates
```````````````````
For components with multiple instances, such as the filter wheel controller and
the temperature controller, the *\*_config.coffee* files contain all instances
in all files. Remove the duplicate instance configurations from each file.

This is a known issue caused by the code generator.

To clean up the files, the configuration for the *isample_fw2_ctrl* component
should be removed from *isample_fw1_ctrl_config.coffee* and the configuration
for the *isample_fw1_ctrl* component should be removed from
*isample_fw2_ctrl_config.coffee*.

Setup Ports
```````````
Under the **Properties** sections, set **Port** to 8000 for *isample_fw1_ctrl*
and 8001 for *isample_fw2_ctrl*. This will ensure that when the component is
configured during runtime, the parameters will be sent to the correct ports,
as configured above.

Max Rate Value
``````````````
Ensure that all input and output ports have their **max_rate** value set to 1.
In some cases the max_rate value is set to *undefined*, which will cause an
error when running and using the component.

This is a known issue caused by the code generator and will be fixed in
subsequent versions.

Input and Output Port Assignments
`````````````````````````````````
Assign a unique port number for all input and output ports, with the exception
of connections where the port number for an output port on one component needs
to correspond to the port number for the corresponding input port on another
component.

For example, the *motor_control* output port on *isample_fw1_ctrl* should have
the same port number as the *fw1_motor_control* input port on *isample_hw_adapter*.

Here is an example of the port assignments for the filter wheel components (not all ports are listed):

.. code-block:: bash

                 Filter Wheel                              Hardware
               Control 1 (8000)                           Adapter (8030)
           +---------------------+                   +---------------------+
      9011 |                     |                   |                     |
  <--------| heartbeat_out       |                   |                     |
           |                     |       8007        |                     |
           |       motor_control |------------------>| fw1_motor_control   |
           |                     |       8002        |                     |
           |         motor_state |<------------------| fw1_motor_status    |
           |                     |                   |                     |
           |                     | 8003              |                     |
           |       position_goal |<--------          |                     |
      8009 |                     |                   |                     |
  <--------| position_value      |                   |                     |
           +---------------------+                   |                     |
                                                9011 |                     |
                                            <--------| heartbeat_out       |
                 Filter Wheel                        |                     |
               Control 2 (8001)                      |                     |
           +---------------------+                   |                     |
      9011 |                     |                   |                     |
  <--------| heartbeat_out       |                   |                     |
           |                     |       8018        |                     |
           |       motor_control |------------------>| fw2_motor_control   |
           |                     |       8013        |                     |
           |         motor_state |<------------------| fw2_motor_status    |
           |                     |                   |                     |
           |                     | 8014              |                     |
           |       position_goal |<--------          |                     |
      8020 |                     |                   |                     |
  <--------| position_value      |                   |                     |
           +---------------------+                   +---------------------+

Defining component behavior
----------------------------
The core component behavior is specified in the \*_step.cpp file. The component has a periodic thread that reads input from the input ports, runs the step function and then writes output to the output ports. Initially, the generated step function will check whether the component is correctly configured and if so, will log the current step counter value.

For more information, and in relation to a simpler example, see :ref:`Running Examples <running_examples>`

In the following examples we will replace the basic step functionality with common controller commands.

To edit the *Filter Wheel Controller* step file:

.. code-block:: bash

   $ cd ~/isample_dcs/src/runtime/src/idcs/isample_dcs/
   $ cd isample_ctrl_pkg/isample_filter_wheel_ctrl/cpp/
   $ vim isample_filter_wheel_ctrl_step.cpp

The following example step function for the filter wheel controller validates positional input and increments or decrements the position value.

   .. code-block:: cpp

    void IsampleFilterWheelCtrl::step(bool setup_ok) {
        if(setup_ok) {                     // this will be executed only if port setup has been received
            if (is_step_rate(1000)) {

                if (position_sv.value < position_sv.goal) {
                    // check range
                    if (position_sv.value >= position_sv.max) {
                        log_warning("Position is at or exceeding maximum value: " + std::to_string(position_sv.max));
                        // prevent further movement
                        position_sv.goal = position_sv.max;
                    } else {
                        // move in positive direction
                        position_sv.value += 0.1;
                    }
                }

                if (position_sv.value > position_sv.goal) {
                    // check range
                    if (position_sv.value <= position_sv.min) {
                        log_warning("Position is at or exceeding minimum value: " + std::to_string(position_sv.min));
                        // prevent further movement
                        position_sv.goal = position_sv.min;
                    } else {
                        // move in negative direction
                        position_sv.value -= 0.1;
                    }
                }

                // report value
                log_info(position_sv.name + " = " + std::to_string(position_sv.value)
                         + " -> " + std::to_string(position_sv.goal));
            }
        }
    }

Compilation
-----------

To compile the code, run gmake:

.. code-block:: bash

   $ cd ~/isample_dcs/src/runtime/src/idcs/isample_dcs/
   $ gmake -j`nproc` install
   $ ls install/bin

The executables will be located in `src/runtime/src/idcs/isample_dcs/install/bin`.

Running the Example
-------------------
First, ensure that the GMT_LOG_POLICY and GMT_LOG_URL environment variables have been set. For quick testing, the following commands can be used to set the variables for the current session:

.. code-block:: bash

   $ export GMT_LOG_POLICY=1
   $ export GMT_LOG_URL=tcp://127.0.0.1:9998

This may need to be done in all open sessions, if multiple sessions are used, for example to monitor logging.

To permanently set the environment variables, edit the ~/.bash_profile file:

.. code-block:: bash

   $ vim ~/.bash_profile

Add the two variables at the bottom of the file, save and exit. Log out and back in to load the new environment variables.

Start the logging and telemetry services:

.. code-block:: bash

   $ gds log_service start &
   $ gds telemetry_service start &

In a separate terminal (for example `tty2`), start the logging service client from within the isample_dcs folder.

.. code-block:: bash

   $ cd ~/isample_dcs/src/runtime/src/idcs/isample_dcs/isample_ctrl_pkg/coffee
   $ gds log_service client gmt

In the first terminal (`tty1`), run the Filter Wheel Controller application

.. code-block:: bash

   $ ./install/bin/run_isample_filter_wheel_ctrl &

The application is running in the background and will not provide any console output. All output will be directed to the logging service after the components have been successfully set up.

To initialize the Filter Wheel Controllers, run `gds setup` from within the isample_dcs folder.

.. code-block:: bash

   $ cd isample_ctrl_pkg/coffee
   $ gds setup -m runtime -e isample_fw1_ctrl
   $ gds setup -m runtime -e isample_fw2_ctrl

Switch to the session running the logging service client (`tty2`), and confirm that the component is logging step info.

.. note::

  In this version isample includes the specification of a control package.
  All :ref:`DCS Packages <table-control_packages>` follow the same development principles with the difference
  that the Component base classes add specialized interfaces (e.g. Controller vs Pipeline). The next
  incremental release of the GMT software will include examples of user interface
  and data processing packages.

Sending a Value to the Input Port
---------------------------------
In order to see the step function in action, we can write a value to an input port and see the component react to it.
While using the step function defined above, run 'gds send_value' with a port name and new value.

For example:

.. code-block:: bash

   $ gds send_value position_goal 23 -m runtime -e isample_fw1_ctrl

where **position_goal** is the name of the input port, **23** is the new value to send and **isample_fw1_ctrl** is the component instance to send it to.

The log client should show messages indicating that the component is stepping from its current position to the new goal value.

:ref:`[back to top] <isample_example>`
