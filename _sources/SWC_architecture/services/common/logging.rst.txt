
.. _services-logging:

*Logging Service*
.................

Logging records the history of events, whether normal or abnormal, surrounding
GMT operations, such as whether an user has logged on to the GMT, or an
observation has just been completed. Logging events are intended for view and
access on a console, and stored in a persistent database.

The *analysis package* provides the capability to visualize or display
specific information in the log database, e.g., automatically generate
periodic reports reflecting operator activity, command logs, instrument and
equipment activity.  Messages generated during an observation can be added to
the observation data bundle to enable provenance and quality monitoring.
Sometimes major errors can arise first from scattered and seemingly harmless
errors that are correlated in time. The supervisor service can define rules to
detect and decide whether such occurrences are symptomatic of something more
severe.

The following illustrates a log event specification:

.. include:: specification-logging_service_inc.rst

The figure below illustrates the Logging Service and the interactions between
the components involved in the creation and propagation of log events.
Adapters forward the log events to the log supervisor using push/pull sockets.
Usually a single Log Adapter is deployed for all the components of a Subsystem
that are collocated in the same computer. Although the interfaces are
different this arrangement is similar to the design other services.

.. figure:: _static/log-service-block-diagram.png

  Logging Service Block Diagram.  (1) A Component creates a log message and
  invokes the *log* method inherited from the *BaseComponent* or
  *BaseSupervisor* classes.  (2)  The Service Adapters forward the log events
  to the log supervisor using push/pull sockets. Usually a single Log Adapter
  is deployed for all the components of a Subsystem that are collocated in the
  same computer. Although the interfaces are different this arrangement is
  similar to the design other services. (3) The Service Supervisor forwards
  the event to the subscribed components using a pub socket.


