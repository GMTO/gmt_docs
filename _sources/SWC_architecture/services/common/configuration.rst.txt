
.. _services-configuration:

*Configuration Service*
.......................

The properties/behaviors of all controlled Subsystems and Components are
stored as sets of static properties or metadata in a Configuration Database.
Operators or subsystem specialists need to change these properties, so it is
not convenient to have them hardcoded. Instead, configuration service manages
and modifies the behavior of the subsystems and components. Configurations can
be changed as a whole, depending on the operation mode (e.g., different values
on limits may be used for testing and calibration than during nominal
operation). These properties are loaded during startup, but may be changed
individually during the execution of the system (e.g., using a new look-up
table to apply error mapping correction in a motion control system).

The GMT SWC is composed of a large number of Subsystems and several thousand
Component instances. Some Components are identical, such as the 6 positioners
of the seven M2 segments. The behavior of the Controller of each positioner is
the same and is implemented as a class, which is a specialization of
*BaseController*. However, the configuration properties of each segment position
Controller are different for each instance. As a result, the configuration
service has to be able to manage efficiently a large number of configuration
properties. As a general rule, there will be at least a default configuration
for each component instance. It would be possible to create new configuration
snapshots on-the-fly once a property is changed interactively.

Each Subsystem is required to implement a Configuration Adapter, which is a
specialization of the *BaseConfigurationAdapter*. The Configuration Adapter
interfaces with the Configuration Service to receive new configuration requests
and implements the configuration strategy sequence. The change in configuration
Properties of a Component depends on the state of the component, and not all the
Properties can be changed in any state. For example, servo gain cannot be
changed when a Controller is performing a motion in normal operation mode or the
readout gain of a detector cannot be changed in the middle of a readout
operation.

The SWCS requirements on Configuration Services are shown in the following Table:

.. table:: SWCS Configuration Service Requirements (Level 3)

  +-----------------------------+---------------------------------------------------------------+
  | | Requirement               | | Statement                                                   |
  +=============================+===============================================================+
  | | SWC Observing Mode        | | Provide the capability to switch from one observing mode    |
  | | Switching                 | | to another.                                                 |
  +-----------------------------+---------------------------------------------------------------+
  | | SWC Telescope Optical     | | Provide capability to switch from one telescope optical     |
  | | Configuration Switching   | | configuration to another in an automatic way for any        |
  | |                           | | active instruments.                                         |
  +-----------------------------+---------------------------------------------------------------+
  | | SWC Automated             | | Provide capability to automate the switching of the active  |
  | | Instrument Switching      | | instrument set during the night initiated and monitored by  |
  | |                           | | the operator.                                               |
  +-----------------------------+---------------------------------------------------------------+
  | | Software Component        | | Provide the capability to associate a set of configuration  |
  | | Configuration             | | parameters with any software component.                     |
  | | Parameters                | |                                                             |
  +-----------------------------+---------------------------------------------------------------+


**Service Features and Properties**

  The Configuration Service provides the ability to store properties, to group
  them into sets called configurations, to view the current properties used by
  a Subsystem, and to consult the available configuration for a Subsystem
  (e.g., default configuration, calibration configuration).

  At least one predefined configuration for each GMT subsystem must exist,
  named the *default*. This configuration is loaded when a subsystem starts
  and enters the state setup (The Section on :ref:`controller_state_machine`
  explains the different states of a component). Although the Configuration
  Service checks to see if the value of a property is the correct range, it is
  the responsibility of the Subsystem or Component to check the correctness
  and consistency with predefined configurations before is applied. Individual
  property changes are allowed, but can only be saved as part of an existing
  or new configuration if the user has the appropriate permission.
  Configuration and Property changes are always logged to facilitate debugging
  in case of a malfunction.

  Properties that represent physical magnitudes must specify their units and
  the data type. Only units defined as *UnitType*, and data types defined as
  *DataTypes* in the metamodel can be used in the definition of a property
  metadata.

**Service Packages**

  *Service Package* -

    A configuration server system, deployed in several machines, takes care of
    receiving configuration request and updates, storing or sending them to
    components that made the requests.

    In addition to handling configuration properties, the configuration server
    provides features that allow the management of load balancing and fault
    tolerance. The configuration service operation, as any other component can
    be monitored by the telemetry system by specifying monitoring

  *Visualization Package* -

    The visualization package provides custom panels that allow observatory
    operators to monitor and manage the configuration service, shown in the
    following table:

      .. table:: Configuration Service Visualization Panels

        +---------------------------+-----------------------------------------------------------------------------------+
        | | Visualization Panel     | | Description                                                                     |
        +===========================+===================================================================================+
        | | Global Panel            | | Provides an overall view of the status of the configuration service. The        |
        | |                         | | following information will be displayed:                                        |
        | |                         | |                                                                                 |
        | |                         | |   * State of each server component                                              |
        | |                         | |     (e.g., RUNNING, STOPPED, FAULT)                                             |
        | |                         | |   * State of each adapter component                                             |
        | |                         | |     (e.g., RUNNING, STOPPED, FAULT)                                             |
        | |                         | |   * Overall view of the system health, one box per subsystem color coded:       |
        | |                         | |     - green: No active alarms                                                   |
        | |                         | |     - yellow: No serious active alarms                                          |
        | |                         | |     - red: Critical alarm active                                                |
        +---------------------------+-----------------------------------------------------------------------------------+
        | | Navigation Panel        | | Provides a way to navigate all the configuration servers and adapters. From the |
        | |                         | | navigation panel the state and detailed info of every server and adapter can be |
        | |                         | | accessed. The Navigation Panel allows also browsing efficiently all             |
        | |                         | | configurations of the GMT software components.                                  |
        +---------------------------+-----------------------------------------------------------------------------------+
        | | Guide Panel             | | Displays the on line documentation of the configuration service. Allows access  |
        | |                         | | to the user guide as well as the metadata (model information) of the runtime    |
        | |                         | | objects.                                                                        |
        +---------------------------+-----------------------------------------------------------------------------------+
        | | Analytics Panel         | | Provides access to the runtime statistics of the configuration service.         |
        | |                         | | These should include at least.                                                  |
        | |                         | |   * Number and state (running/stopped/fault)                                    |
        | |                         | |   * Instant throughput of the system                                            |
        | |                         | |   * Configuration changes/sec                                                   |
        | |                         | |   * Total data bandwidth                                                        |
        | |                         | |   * Storage capacity (used/available)                                           |
        +---------------------------+-----------------------------------------------------------------------------------+
        | | Service Editor Panel    | | The Configuration Editor Panel provides the capability to edit the values of    |
        | |                         | | the properties of a configuration. It also enables to save, copy, or delete the |
        | |                         | | configuration of any given component.                                           |
        +---------------------------+-----------------------------------------------------------------------------------+

**Service Deployment**

  The Configuration Supervisor is deployed in one of the SCC in the electronic
  room. The Supervisor has access to a permanent store and is available to all
  runtime components through the service bus.
