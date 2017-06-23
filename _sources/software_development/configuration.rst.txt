
Developer Info and Release Configuration
========================================

.. note::

  If the installation is done via the USB drive, one can bypass the manual setup
  and configuration on this page.

Before establishing the services, there is a small amount of basic
configuration.  If the installation is done via the kickstart USB drive, basic
services and network configurations would have already been established and one
can move on to the next page.  However, if the release is installed manually or
locally by an user downloading from *GitHub*, this page will show the steps
for service configuration.


To communicate, components send message packets to a network of conduits, i.e.
ports, where the messages follow the *tcp/udp* protocol.  For this to work, each
component has a unique URI identifier address, while each communication port,
has an URL.  A component may have multiple ports that serve different purposes,
described below.

In addition to providing a communication service, two other services, logging
and telemetry, are essential for controlling hardware and software.  The logging
service uses *mongoDB* as the backend database, with each service having its
own, independent, database.

Services Configuration
----------------------

Currently we use only one unique server per service. Each server is a distributed component with the following ports:

- one port to receive data (logs, monitored values, etc) from external distributed components
- one port to publish data to subscribers
- one port to receive queries and send answers from/to clients
- one local connection to the database server

Also, each service has an internal schedule to perform periodic checks or other tasks at certain rates.
This is the configuration:

::

  log_server_1:
      name      : 'log_server_1'
      rate      : 600000                                   # periodic loop rate to perform checks, stats, etc.
      url       : 'tcp://127.0.0.1:9998'                   # to receive log messages from components
      pub_url   : 'tcp://127.0.0.1:9995'                   # to publish logs to subscribers
      query_url : 'tcp://127.0.0.1:9994'                   # to receive querys from clients
      db_url    : 'mongodb://127.0.0.1:27017/gmt_test_logs_1' # db to store log messages


Note: The *pub_url* value shall be the same used in the GMT_LOG_URL environment var.
This variable is only required for the C++ components.

::

  telemetry_server_1:
      name      : 'telemetry_server_1'
      rate      : 600000                                   # periodic loop rate to perform checks, stats, etc.
      url       : 'tcp://127.0.0.1:9997'                   # to receive monitored values from components
      pub_url   : 'tcp://127.0.0.1:9993'                   # to publish monitors to subscribers
      query_url : 'tcp://127.0.0.1:9992'                   # to receive queries from clients
      db_url    : 'mongodb://127.0.0.1:27017/gmt_test_telemetry_1' # db to store monitors

Databases and Logs
------------------

The Data Archive uses *mongoDB* as backend data base. Each service keeps an
independent database.

Each service daemon stores output and error messages on `${GMT_ROOT}/var/log`,
where `GMT_ROOT` is an environment variable indicating the path to the GMT root
directory. This variable is typically an empty string when installed in a linux
test environment, placing the log files in `/var/log`.

Please check these files if services failed to start or an error is shown while
checking their status


Firewall and Network Ports
---------------------------

The GMT software is networked system. The following instructions assume that the
used ports are open for tcp/udp communications.  With root/admin permissions
it's possible to disable the whole firewall or specific ports can be open like
this:

::

  $ sudo firewall-cmd --add-port=$PORT/tcp --permanent --zone=public
  $ sudo firewall-cmd --add-port=$PORT/udp --permanent --zone=public

URIs and URLs
-------------

GMT Components use an unique URI in the following scheme

  *Usage:* ``gmt://subsystem/component:port``

The port number is used to send the component setup (rates, ports, etc).
Example:

::

  gmt://examples/basic_controller:8001

GMT Ports have an url using the *nanomsg* scheme:

  *Usage:* ``transport://host:net_port``

Example:

::

  tcp://127.0.0.1:9001

Environment vars
----------------

Some UNIX environment variables are required and they should be automatically applied. See this file:

                `${GMT_ROOT}/etc/gmt_env_vars`
