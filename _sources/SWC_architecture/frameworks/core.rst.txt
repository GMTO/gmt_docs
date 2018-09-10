
.. _core_framework:

Core Framework
--------------

The GMT SWCS architecture is based on a distributed component design.
Distributed Components have been used in the design of different telescope
projects like GTC, ALMA, ATST [CuHW13]_ and is considered by next generation
projects [KaKD11]_.  In the past, this architecture has been implemented using
object-oriented middleware, most commonly based on the `OMG CORBA standard
<http://www.omg.org/spec/CCM/>`_.  Although CORBA provides several
benefits, it also has some limitations, especially when trying to implement
robust communication patterns other than Remote Procedure Calls (RPC). Still, a
distributed component model is valid and provides high-level entities that can
be mapped into object-oriented designs.

A *Component* is the basic building block in the SWCS architecture; it is a
Metamodel class (MKlass). Instances of Components are used in the GMT SWCS Model
to represent the concrete architecture of the system.  Components are used to
represent the main elements of a system and the relations between them. A
Component is specified and defined by a set of Features in the following Table:

.. table:: Component Features

  +----------------+-----------------------------------------------------------------------+
  |  Feature       |    Description                                                        |
  +================+=======================================================================+
  |  Name          |    Unique component identifier. Allows unambiguous identification     |
  |                |    of each individual component in the system (e.g.,                  |
  |                |    ngws_xpatrol_ctrl).                                                |
  +----------------+-----------------------------------------------------------------------+
  |  Requirements  |    A list of requirements that can be associated with any type of     |
  |                |    component, allowing the allocation and traceability of             |
  |                |    requirements.                                                      |
  +----------------+-----------------------------------------------------------------------+
  |  Notes         |    Arbitrary notes can be added to any component to capture           |
  |                |    information during the design process. This information can be     |
  |                |    useful for communication between different developers, but is      |
  |                |    not part of the specification of the component.                    |
  +----------------+-----------------------------------------------------------------------+
  |  State Machine |    A state machine represents the operational state of a component.   |
  |                |    The Component state machine includes states to address the         |
  |                |    distributed nature of the component and its life cycle             |
  |                |    management.                                                        |
  +----------------+-----------------------------------------------------------------------+
  |  Properties    |    Properties capture the persistent state of a component between     |
  |                |    different execution runs. The properties of a component are        |
  |                |    grouped into Component Configurations. Several configuration       |
  |                |    versions can be defined for a given component (e.g., diagnosis,    |
  |                |    engineering) and can be applied as a unit.                         |
  +----------------+-----------------------------------------------------------------------+
  | State Variables|    State variables allow continuous or episodic sampling of the       |
  |                |    phisical state of the Component. State variables are transported   |
  |                |    as a stream of time-stamped data. State variables are the source   |
  |                |    of the telemetry service. Telemetry communication is kept          |
  |                |    separated from control data.                                       |
  +----------------+-----------------------------------------------------------------------+
  |  Alarms        |    Alarms represent fault conditions that may affect the nominal      |
  |                |    behavior of the Component. The occurrence of an alarm is always    |
  |                |    reported.                                                          |
  +----------------+-----------------------------------------------------------------------+
  |  Input Ports   |    Data inputs use communication ports that support low               |
  |                |    latency, synchronous and asynchronous control data flow. Data      |
  |                |    inputs and data outputs are specified with the data types and      |
  |                |    the maximum rate that they support. Data inputs and data output    |
  |                |    are linked with Connectors. Different operation modes may          |
  |                |    require different Quality of Service (QoS) between the same        |
  |                |    ports. Connectors include the QoS specification corresponding      |
  |                |    with connection configuration and the fault management strategy.   |
  +----------------+-----------------------------------------------------------------------+
  |  Output Ports  |    Data outputs are defined analogously to Data input features.       |
  +----------------+-----------------------------------------------------------------------+
  |  Elements      |    Aggregated components in the case of a composite Component.        |
  +----------------+-----------------------------------------------------------------------+
  |  Files         |    Auxiliary information that can be associated to complete the       |
  |                |    description of the Component.                                      |
  +----------------+-----------------------------------------------------------------------+

The semantics of the Component Features (see example below for the
:ref:`Property<code-property>` feature) are specified in Model Definition Files
(MDF).  MDFs use the same syntax as the SDFs, but their intent is to define the
concrete semantics of model elements. The Features of a Component define the
component interface as they express the external view of the Component. See
:ref:`subsystem_specification_and_modeling` for a description of MDFs and SDFs.

One of the essential aspects of components is that it provides a way to address
`cross-cutting concerns <http://en.wikipedia.org/wiki/Cross-cutting_concern>`_.
The :ref:`observatory_services` is a :ref:`domain
<architecture-control_domains>` that interfaces multiple domains: Observatory
Operations, Instrument Control System, Telescope Control System (see
:ref:`Figure<figure-domains_of_control>`).  There, the *BaseComponent* class
addresses cross-cutting concerns by providing features to interface
:ref:`Service Adapters<section-service_adapters>`.  When a new component extends
the *BaseComponent* class it gains access to all the observatory services
through a small set of inherited methods.

.. _code-property:

.. code-block:: coffeescript

  MKlass "Property",
      extends:    ["Port"]
      abstract:   false
      desc:       "Properties are the basic unit for component configuration"
      features:
          units:
          kind:   "reference"
          lower:  -1
          upper:  1
          type:   "UnitType"
          desc:   "Units"
      type:
          kind:   "attribute"
          lower:  1
          upper:  1
          type:   "BaseDataType"
          desc:   "Type of the Property"
      min:
          kind:   "attribute"
          lower:  -1
          upper:  1
          type:   "ValueType"
          desc:   "Minimum value of the property"
      max:
          kind:   "attribute"
          lower:  -1
          upper:  1
          type:   "ValueType"
          kind:   "Maximum value of the property"
      default:
          kind:   "attribute"
          lower:  1
          upper:  1
          type:   "ValueType"
          desc:   "Default value of the property"


.. _distributed_communication:

*Distributed Communication*
...........................

The Core Framework supports different communication patterns, connection ports
and transports. The following two tables provide an overview.

.. table:: Communication Pattern Overview

  +-------------------------+----------------------------------------------------------------+
  | Communication Pattern   |   Description                                                  |
  +=========================+================================================================+
  | Request-Reply           |   The request-reply pattern is used for sending requests from  |
  |                         |   a REQ client to one or more REP services, and receiving      |
  |                         |   subsequent replies to each request sent.                     |
  +-------------------------+----------------------------------------------------------------+
  | Publish-Subscribe       |   The publish-subscribe pattern is used for one-to many        |
  |                         |   distribution of data from a single publisher to multiple     |
  |                         |   subscribers in a fan out fashion.                            |
  +-------------------------+----------------------------------------------------------------+
  | Pipeline                |   The pipeline pattern is used for distributing data to nodes  |
  |                         |   arranged in a pipeline. Data always flow down the pipeline,  |
  |                         |   and each stage of the pipeline is connected to at least one  |
  |                         |   node. When a pipeline stage is connected to multiple nodes   |
  |                         |   data is “round-robin”-ed among all connected nodes.          |
  +-------------------------+----------------------------------------------------------------+
  | Exclusive Pair          |   The exclusive pair pattern is used to connect a peer to      |
  |                         |   precisely one other peer. This pattern is used for           |
  |                         |   inter-thread communication across the *inproc* transport.    |
  +-------------------------+----------------------------------------------------------------+

GMT distributed component features are accessible through the control network.
The table below shows how different features require different communication
patterns and fault management or optimization strategies.  In the Table below,
High Water Mark (HWM) is the size of he incoming or outgoing buffer.

.. table:: Communication Pattern:  Fault Management & Optimization Strategies

  +-----------------+-------------------+----------------------+------------------+-------------------+
  |   Feature Type  |   Communication   |   On Fault           |   High Water     |   Serialization   |
  |                 |   Pattern         |                      |   Mark (HWM)     |                   |
  +=================+===================+======================+==================+===================+
  |   Properties    |   Request/Reply   |   retry              |   > 1            |   MessagePack     |
  +-----------------+-------------------+----------------------+------------------+-------------------+
  |   Commands      |   Request/Reply   |   retry              |   > 1            |   MessagePack     |
  +-----------------+-------------------+----------------------+------------------+-------------------+
  |   Monitors      |   PUSH/PULL       |   Buffer to HWM      |   > 1            |   MessagePack/Raw |
  |                 |   PUB/SUB         |                      |                  |                   |
  +-----------------+-------------------+----------------------+------------------+-------------------+
  |   Data I/O      |   PUSH/PULL       |   discard            |   no             |   MessagePack     |
  +-----------------+-------------------+----------------------+------------------+-------------------+
  |   Alarms        |   PUSH/PULL       |   Buffer to HWM      |   no  (?)        |   MessagePack     |
  +-----------------+-------------------+----------------------+------------------+-------------------+
  |   Logs          |   PUSH/PULL       |   Buffer to HWM      |   > 1            |   MessagePack     |
  +-----------------+-------------------+----------------------+------------------+-------------------+

GMT distributed components support two operation modes, standalone and integrated:

  * In integrated mode, components will try to connect with the observatory
    services. If the services are not available the component will stop its
    startup sequence. This is the default operation mode when components are
    integrated and deployed in the observatory or integration simulator.

  * In standalone mode, components do not try to connect to the observatory
    services (e.g., log and alarms send their messages to the console). This
    operation mode is intended to be used during initial component development.

*Framework Implementation*
..........................

The Core Framework hides the implementation details, like the middleware
software used or the transport protocol. The implementation of the framework
is based on the ZeroMQ middleware. ZeroMQ does not include a serialization
mechanism; this provides the flexibility to use different serialization
formats depending on the use case (e.g., `ProtocolBuffers
<http://en.wikipedia.org/wiki/Protocol_Buffers>`_, `MessagePack
<http://en.wikipedia.org/wiki/MessagePack>`_, raw bytes, JSON, hdf5). The
Section on :ref:`platform` provides an overview of the ZeroMQ middleware. The
table below describes several communication patterns implemented by means of
several socket types, based on ZeroMQ Socket Types.

.. table::  Communication Pattern Implementation:  Socket Types

  +-----------------+------------------------------------------------------------------------+
  |   Socket Type   |    Description                                                         |
  +=================+========================================================================+
  |   REQ           |    Used by a client to send requests and receive replies from a        |
  |                 |    service. Each request sent is round-robined among all services,     |
  |                 |    and each reply received is matched with the last issued request.    |
  +-----------------+------------------------------------------------------------------------+
  |   REP           |    Used by a service to receive requests from and sent replies to a    |
  |                 |    client. Each request received is fair-queued from among all         |
  |                 |    clients.                                                            |
  +-----------------+------------------------------------------------------------------------+
  |   DEALER        |    Used for extending request/reply sockets. Each message sent is      |
  |                 |    "round-robin"-ed among all connected peers, and each message        |
  |                 |    received is fair- queued from all connected peers.                  |
  +-----------------+------------------------------------------------------------------------+
  |   ROUTER        |    Used for extending request/reply sockets. When receiving            |
  |                 |    messages a ROUTER socket shall prepend a message part containing    |
  |                 |    the identity of the originating peer to the message before          |
  |                 |    passing it to the application. Messages received are fair-queued    |
  |                 |    from among all connected peers.                                     |
  +-----------------+------------------------------------------------------------------------+
  |   PUB           |    Used by a publisher to distribute data.  Messages sent are          |
  |                 |    distributed in a fan out fashion to all connected peers.            |
  +-----------------+------------------------------------------------------------------------+
  |   SUB           |    Used by a subscriber to subscribe to data distributed by a          |
  |                 |    publisher.                                                          |
  +-----------------+------------------------------------------------------------------------+
  |   XPUB          |    Same as PUB except that the socket can receive subscriptions        |
  |                 |    from the peers in form of incoming messages.                        |
  +-----------------+------------------------------------------------------------------------+
  |   XSUB          |    Same as SUB except that the socket can subscribe by sending         |
  |                 |    subscription messages to the socket.                                |
  +-----------------+------------------------------------------------------------------------+
  |   PUSH          |    Used by a pipeline node to send messages to downstream pipeline     |
  |                 |    nodes. Messages are "round-robin"-ed to all connected downstream    |
  |                 |    nodes.                                                              |
  +-----------------+------------------------------------------------------------------------+
  |   PULL          |    Used by a pipeline node to receive messages from upstream           |
  |                 |    pipeline nodes. Messages are fair-queued from among all             |
  |                 |    connected upstream nodes.                                           |
  +-----------------+------------------------------------------------------------------------+
  |   PAIR          |    Can only connect to a single peer at any one time. No message       |
  |                 |    routing or filtering is performed over a PAIR socket.               |
  +-----------------+------------------------------------------------------------------------+

ZeroMQ also provides various transports like in-process, inter-process, TCP and
multicast and has a small memory footprint, making it a good candidate to be
used as a concurrency framework.

The Table below gives an overview of available communication transports.

.. table:: Available Communication Transports

  +------------+----------------------------------------------------------+
  | Transport  | Description                                              |
  +============+==========================================================+
  | tcp        | Unicast transport using TCP                              |
  +------------+----------------------------------------------------------+
  | ipc        | Local inter-process communication transport              |
  +------------+----------------------------------------------------------+
  | inproc     | Local in-process (inter-thread) communication transport  |
  +------------+----------------------------------------------------------+
  | pgm, epgm  | Reliable multicast transport using PGM                   |
  +------------+----------------------------------------------------------+
