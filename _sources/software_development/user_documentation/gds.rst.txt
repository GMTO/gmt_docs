.. _gds:

GDS
===
**GMT Development System (version1.3)**

A command line tool, used to interact with models, components and services
within the GMT framework.

.. code-block:: bash

  gds [options] command [args...]

Options
-------
**-m**, **--model**
  The **model** to use. This defaults to "model". Valid options include
  **metametamodel**, **metamodel**, **model** and **runtime**.

**-e**, **--element**
  The model **element** to use. This defaults to "swc_sys".
  ``How do we list valid options?``

help
----
  .. code-block:: bash

    gds -h

  Print the list of gds options and commands.

    **-h**, **--help**
      Print gds usage information.

  .. code-block:: bash

    gds [-m model] help

  Print the list of all available plugins, commands and renderers for the
  specified layer.

-------------------------------------------------------------------------------

log_service
-----------
  .. code-block:: bash

    gds log_service start

  Start the log_service server, using configuration
  properties from `gmt.runtime.log_server_1_config`.

  .. code-block:: bash

    gds log_service client <topic>

  Start the log_service client, using configuration properties
  from `gmt.runtime.log_server_1_config`.

    **topic**
      The topic to subscribe to. This will filter the content of the messages and
      only the messages containing the topic will be shown.
      To listen for events from a specific component, use the component name.
      Using topic "gmt" will show all log messages.

  .. code-block:: bash

    gds log_service query <key> <number>

  Query the log database for messages for a specific component.

    **key**
      The exact URI of the component that produced the messages.

    **number**
      The number of messages to show. The messages will be sorted from newest to
      oldest.

  .. code-block:: bash

    gds log_service test <message>

  Send a test message to the log service DEBUG, INFO, WARNING and ERROR channels.

    **message**
      A string message.

  Examples:

  ::

    gds log_service start
    gds log_service client gmt
    gds log_service query gmt://log_sys/test_log 10
    gds log_service test "This is a test message"

-------------------------------------------------------------------------------

telemetry_service
-----------------
  .. code-block:: bash

    gds telemetry_service start

  Start the telemetry_service server, using configuration
  properties from `gmt.runtime.telemetry_server_1_config`.

  .. code-block:: bash

    gds telemetry_service client <topic>

  Start the telemetry_service client, using configuration properties
  from `gmt.runtime.telemetry_server_1_config`.

    **topic**
      The topic to subscribe to. This will filter the content of the messages and
      only the messages containing the topic will be shown.
      To listen for events from a specific component, use the component name.
      Using topic "gmt" will show all telemetry messages.

  .. code-block:: bash

    gds telemetry_service query <key> <number>

  Query the telemetry database for data from a specific component.

    **key**
      The exact URI of the component that produced the data.

    **number**
      The number of data points to show. The data will be sorted from newest to
      oldest.

  .. code-block:: bash

    gds [-m model] [-e element] telemetry_service monitor

  Set up an adapter to monitor all output ports of a specified component.

  Examples:
  ::

    gds telemetry_service start
    gds telemetry_service client gmt
    gds telemetry_service query gmt://examples/simple_controller/temperature_monitor 10
    gds -m runtime -e isample_fw1_ctrl monitor

-------------------------------------------------------------------------------

skeleton
--------
  .. code-block:: bash

    gds [-m model] [-e element] skeleton [-t template] [-f FORMAT] [-l LEVEL]

  Generates a skeleton for an instance of the given model element, by default "swc_sys".

    **-t**, **--template**
      The template to use. This defaults to "Undefined".
      ``How do we list valid options?``

    **-f**, **--format**
      The format to use. This defaults to "txt". Valid options include *json*,
      *txt*, *csv* and *html*.

    **-l**, **--level**
      Numeric value. Defaults to 1.

.. note::
  This command is not functional in v1.2.

-------------------------------------------------------------------------------

codegen
-------
  .. code-block:: bash

    gds [-e element] codegen

  Generates runtime skeletons for sub-systems, components or packages in the model.

  Example:
  ::

    gds -e isample_dcs codegen

-------------------------------------------------------------------------------

setup
-----
  .. code-block:: bash

    gds [-m model] [-e element] setup

  Set up component instance properties, input ports and output ports using its
  configuration.

  Example:
  ::

    gds -m runtime -e isample_fw1_ctrl setup

-------------------------------------------------------------------------------

send_value
----------
  .. code-block:: bash

    gds [-m model] [-e element] send_value <port_name> <value>

  Send a value to an input port on the specified component instance. The model
  should always be "runtime", as values can only be sent to runtime instances of
  components.

    **port_name**
      The name of the input port to send the value to. The name must correspond with
      a valid port defined in the component.

    **value**
      An Integer or Float value.

  Examples:
  ::

    gds -m runtime -e isample_fw1_ctrl send_value position_goal 23
    gds -m runtime -e isample_cryo_internal_temp_ctrl send_value cryo_temp_goal 25.63

-------------------------------------------------------------------------------

process
-------
  .. code-block:: bash

    gds [-m model] [-e element] process -c <cmd> [-i input] [-o output] [args...]

  Run a command on the given model element.

    **-c**, **--cmd**
      The **command** to use for the specified element. The command is mandatory.
      Available commands depend on the model element on which it will be run.

    **-i**, **--input**
      The **input** file name to use as input to the process command. This file
      can be used in addition to command line arguments.

    **-o**, **--output**
      The **output** file name to use for output generated by the process command.
      If not specified, output will be written to the console.

  Example:
  ::

    gds process -c list_docs

.. warning::
  What is the difference between "process" and "exec"? Do we need both?

-------------------------------------------------------------------------------

exec
----
  .. code-block:: bash

    gds [-m model] [-o output] exec <target.cmd> [args...]

  Execute the given command on the target model element.

    **target.command**
      The **target element** to use and the **command** to use with it.
      This value is mandatory. Available commands depend on the model element on
      which it will be run.

    **-o**, **--output**
      The **output file name** to use for output generated by the process command.
      If not specified, output will be written to the console.

  Example:
  ::

    gds exec swc_sys.gen_documents
    gds -m runtime exec isample_fw1_ctrl.default

.. warning::
  What is the difference between "process" and "exec"? Do we need both?

-------------------------------------------------------------------------------

xml2js
------
  .. code-block:: bash

    gds xml2js -i <input_file> -o <output_file>

  Converts an xml file to JavaScript.

-------------------------------------------------------------------------------

xml2json
--------
  .. code-block:: bash

    gds xml2json -i <input_file> -o <output_file>

  Converts an xml file to JavaScript Object Notation (JSON) format.

-------------------------------------------------------------------------------

ecat
----
  .. code-block:: bash

    gds ecat -c download [vendor...]

  Runs the EtherCAT command line utility to download and extract EtherCAT modules
  from specified vendors.

    **vendor**
      The name of the vendor to use. Currently, the only valid option is "beckhoff".

  .. code-block:: bash

    gds ecat -c extract [vendor...]

  Runs the EtherCAT command line utility to extract EtherCAT modules from
  specified vendors. The modules need to be already downloaded.

    **vendor**
      The name of the vendor to use. Currently, the only valid option is "beckhoff".

  Examples:
  ::

    gds ecat -c download beckhoff
    gds ecat -c extract beckhoff

.. note::
  These commands are not functional in v1.2.

-------------------------------------------------------------------------------

ecat_config
-----------
  .. code-block:: bash

    gds [-e element] ecat_config

  Send ethercat configuration to an adapter.

.. note::
  This command is not functional in v1.2.
