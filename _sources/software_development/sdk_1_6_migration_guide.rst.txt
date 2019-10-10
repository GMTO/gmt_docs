.. _sdk_1_6_migration_guide:

Migration guide to SDK 1.6
==========================

Introduction
------------

In the release 1.6 of the SDK there have been several changes in the
C++ DCS mapping. Some of the most relevant changes are:

- There are two classes per Component instead of two: a base
  class, with all the auto-generated code (i.e.: declaration of the State
  Variables, Inputs, Outputs, the ``setup`` method, etc), a class that derives
  from it that contains the user code, and finally the struct with the
  configuration.
- The file names are capitalized in CamelCase
- The signature of the methods called inside the ``setup`` are slightly
  changed
- There are some new auto-generated methods
- There is an Application class, that instantiates a Container class of
  Components

Most of the previous changes have been kept in the auto-generated code, so the
migration procedure is relatively simple.
As the changes to the code layout are significant, the best way to
proceed is to simply re-generate it, and then merge to the new code
the step function and the class attributes that were added by the user.

In this document, the steps to
migrate the pre-existing code will be explained. The instructions given here
will refer to a Component named ```MyComponent``` and a module named
```ocs_my_dcs``` as an example.

Update the model files
----------------------

First, we start by making some minor modifications to the model files,
as described in the next subsections.

Change the ``blocking_mode``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the previous SDK the sync/async behavior of the input and output
ports were not fully implemented, and therefore there was no difference
in using one or the other one. However, in the semantics defined by
the modeling guide, a ``sync`` port is read or written automatically
by the core framework in each step, whilst an ``async`` port is only written
upon user request, and a handler is invoked when there some data is
incoming. The typical expected behavior in controller/hw_adapter pairs is
the ``sync``, while for services or data oriented components the most
usual can be the ``async``. However, due to historical reasons all the ports
in the examples were defined as ``async``. Probably, the model files
of the module to be migrated will need to be changed to replace ``async``
into ``sync``.

Add the ``owner`` attribute
~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the SDK version 1.6 the ``owner`` attribute was added to the Inputs
and Outputs. This attribute controls whether the current Component is
the owner of the actual connection. I.e., in case of Nanomsg, if it
is the one that listens to the socket. In all the communication groups,
one must be the owner and the rest must have this attribute to false.

Typically, the following pattern can be used:

- In a push/pull pair, the push side has the owner attribute set to false,
  and the pull side has it to true.
- In a pub/sub pair, the pub side has the owner as true, and the sub as
  false.

However, in each particular case the needs can be different, so it is
the responsibility of the developer to set correctly the owner attribute
of each port.

As an example, this is an excerpt from the HDK HwAdapter model:

.. code-block:: coffeescript

    input_ports:
      operator_leds:    { type: 'hdk_hmi_leds',    protocol: 'pull', blocking_mode: 'sync', owner: true, max_rate: 1000, desc: 'Human Machine Interface (HMI) digital outputs' }

    output_ports:
      operator_buttons: { type: 'hdk_hmi_buttons', protocol: 'push', blocking_mode: 'sync', owner: false, max_rate: 1000, desc: 'Human Machine Interface (HMI) digital inputs' }

Update the connectors
~~~~~~~~~~~~~~~~~~~~~

In the new SDK, the connectors that are defined in the model must have the
following format (extracted from `ocs_isample_dcs/model/isample_ctrl_pkg/isample_ctrl_pkg.coffee`):

.. code-block:: coffeescript

    connectors:
            # Connectors from hardware adapter
            c9001: { id: 9001, from: { element: "isample_hw1_adapter",  port: "cryo_internal_temp"}, to: { element: "isample_cryo_internal_temp_ctrl", port: "temperatures"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }
            c9002: { id: 9002, from: { element: "isample_hw1_adapter",  port: "cryo_external_temp"}, to: { element: "isample_cryo_external_temp_ctrl", port: "temperatures"},        max_latency: 0.5, nom_rate: 100, on_fault: "", conversion: "", bus: "" }

As can be seen in the previous example, the previous vector of connectors must
be transformed to a dictionary, where the key is a unique identifier for
the connector.

Recompile model files
~~~~~~~~~~~~~~~~~~~~~

Finally, we must apply the previous changes by recompiling the model files:

.. code-block:: bash

    $ cd $GMT_LOCAL/modules/ocs_my_dcs/model
    $ webpack

Update the source files
-----------------------

1. **Rename the ``src/cpp`` directory**:

    .. code-block:: bash

        $ cd $GMT_LOCAL/modules/ocs_my_dcs/src
        $ mv cpp cpp.refactor


#. **Generate back the C++ code from the model**:

    .. code-block:: bash

        $ gds gen ocs_my_dcs

    The ``src/cpp`` directory will be created back, and it will contain the skeletons
    for the components defined in the model files. We will have two classes per
    each Component: one declared in the file `MyComponentBase.h``, with the component features
    defined in the model (State Variables, Inputs, Outputs, ...), and another one declared
    in the file ``MyComponent.h``, which is where the developer must add the application
    specific code.

#. **Add the step function**. The derived class, contained in the file
    ``MyComponent.h`` is the one that now implements the ``step`` function.
    The contents of the old step function, that are in the ``my_component_step.cpp``
    file under the appropriate subdirectory of ``src/cpp.refactor`` backup must
    be copied to the ``MyComponent::step()`` function in ``MyComponent.cpp``.

#. **Add the user declarations to the derived class**. Any member variable or
    method that were added by the developer in the component class, must be
    copied to the derived class, under ``MyComponent.h`` and ``MyComponent.cpp``.

#. **Async handlers**. If there are any ``async`` Data I/Os, then add the handlers
    in the ``MyComponent::setup()`` method.

#. **Recompile the code**:

    .. code-block:: bash

        $ cd src/cpp
        $ make clean
        $ make

Reinstall configurations
-----------------------

The configuration files must be reinstalled, as described in :ref:`Installing the configuration <compil_config>`.
