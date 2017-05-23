
Using the Services
==================

Starting and Stopping Services
------------------------------

The mongoDB daemon runs as a system service under *systemd*.

.. code-block:: bash

     $ sudo systemctl [enable|disable] mongod
     $ sudo systemctl [status|start|restart|stop] mongod

This daemon is required to run the log and telemetry services.

The other services can be started as follows:

.. code-block:: bash

    $ gds log_service start &

    $ gds telemetry_service start &

Checking the Log Service
------------------------

In order to check if the simple communication is working the following test can be performed.

Open 2 unix terminals. We will call them terminal_1 and terminal_2.

In terminal_1 verify that the log_service is running:

.. code-block:: bash

    $ ps -fea | grep log_service

If the process is not running then start the log service:

.. code-block:: bash

        $ gds log_service start

and check the status again. In case of error verify that the mongoDB service is started (see previous section).
If another error is shown please report this issue.

If the log service is started with no error we'll use terminal_1 to show the log messages that we'll create later.
We can run a log client with this command:

    *Usage:*  ``gds log_service client [topic]``

The *topic* parameter can be included in the command line and it will filter the content of the messages and only the messages containing the topic will be shown.
In case is not used the client will subscribe to all log messages.

.. code-block:: bash

    $ gds log_service client gmt
    gmt(1.0): Loading models...
    log client subscribed at port tcp://127.0.0.1:9995
    subscription topic: gmt

This means that the log_service client is waiting for new log messages which include 'gmt'. Let's produce some log messages.
The simplest test is this command:

    *Usage:*  ``gds log_service test message``

This command will produce 4 log messages (DEBUG, INFO, WARNING, ERROR) with the text specified in the *message* parameter:

.. code-block:: bash

    $ gds log_service test "this a log service test"

After this command the log_service client in terminal_1 should show something like this:

.. code-block:: bash

    $ gds log_service client gmt
    log client subscribed at port tcp://127.0.0.1:9995
    subscription topic: gmt
    [DBG] 2016-01-01T00:24:32.769Z [gmt://tools/test_log] this a log service test
    [INF] 2016-01-01T00:24:32.769Z [gmt://tools/test_log] this a log service test
    [WRN] 2016-01-01T00:24:32.769Z [gmt://tools/test_log] this a log service test
    [ERR] 2016-01-01T00:24:32.769Z [gmt://tools/test_log] this a log service test

each message type using a different color. If messages are not shown please report the error.
To exit the log_service client just use CTRL-C.

Multiple log clients can be started at the same time in different terminals and with different subscription topics.
Each client subscribes to the log service independently.

In case messages are not shown please verify the following environment variables:

.. code-block:: bash

    export GMT_LOG_POLICY=1
    export GMT_LOG_URL=tcp://127.0.0.1:9998

Starting example components
---------------------------

The main use of the log service is inside the GMT components. To check the log service with the simple example components we can start them in terminal_2:

.. code-block:: bash

    $ run_example_components

and then in terminal_1 we can see:

.. code-block:: bash

    $ gds log_service client gmt
    log client subscribed at port tcp://127.0.0.1:9995
    subscription topic: gmt
    [INF] 2016-09-01T23:34:00.157Z [gmt://examples/my_app:7000] app step num = 0
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_sum1:8004] sum = 3
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_inc3:8003] x1 = 1
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_inc1:8001] x1 = 1
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/component_inc2:8002] x1 = 1
    [INF] 2016-09-01T23:34:00.158Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_sum1:8004] sum = 3
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_inc3:8003] x1 = 2
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_inc1:8001] x1 = 2
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/component_inc2:8002] x1 = 2
    [INF] 2016-09-01T23:34:01.158Z [gmt://examples/simple_component:8000] hello, component world
    [INF] 2016-09-01T23:34:02.157Z [gmt://examples/my_app:7000] app step num = 1
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_sum2:8005] sum = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_sum1:8004] sum = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_inc3:8003] x1 = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_inc1:8001] x1 = 3
    [INF] 2016-09-01T23:34:02.158Z [gmt://examples/component_inc2:8002] x1 = 3

Messages are produced periodically while the components are running. To kill the components just use CTRL-C in terminal_2.
If you have the process in background like this:

.. code-block:: bash

    $ run_example_components &

then the components will keep running and using the network ports so, if you run again the same command, some errors will be shown:

.. code-block:: bash

    ERROR: unable to connect Port <examples/my_app:setup> (tcp://0.0.0.0:7000) : Address already in use
    ERROR: unable to connect Port <examples/simple_component:setup> (tcp://0.0.0.0:8000) : Address already in use
    ERROR: unable to connect Port <examples/component_inc1:setup> (tcp://0.0.0.0:8001) : Address already in use
    ERROR: unable to connect Port <examples/component_inc2:setup> (tcp://0.0.0.0:8002) : Address already in use
    ERROR: unable to connect Port <examples/component_inc3:setup> (tcp://0.0.0.0:8003) : Address already in use
    ERROR: unable to connect Port <examples/component_sum1:setup> (tcp://0.0.0.0:8004) : Address already in use
    ERROR: unable to connect Port <examples/component_sum2:setup> (tcp://0.0.0.0:8005) : Address already in use

This means that the example components are already running and using the networks addresses.
To avoid this you need to kill the run_example_components process before to start a new one:

.. code-block:: bash

    $ ps -fea | grep run_example_components
    user     15209 31894  0 19:40 pts/0    00:00:00 run_example_components
    user     15365 31894  0 19:43 pts/0    00:00:00 grep --color=auto run_example_components

    $ kill -9 15209
    [1]-  Killed            run_example_components

We'll see this example in much more detail later.

Making a query to the Log Service
---------------------------------

The log service stores all received messages in a local database. In order to query this database the log service shall be started and then in any terminal we can use:

     *Usage:*  ``gds log_service query uri num``

For example, the following will show the last 10 messages (from newest to oldest) created by the test_log tool:

.. code-block:: bash

    $ gds log_service query gmt://log_sys/test_log 10
    starting log query at tcp://127.0.0.1:9994
    [ERR] 2016-11-09T00:32:18.367Z [gmt://log_sys/test_log] welcome
    [WRN] 2016-11-09T00:32:18.367Z [gmt://log_sys/test_log] welcome
    [INF] 2016-11-09T00:32:18.367Z [gmt://log_sys/test_log] welcome
    [DBG] 2016-11-09T00:32:18.364Z [gmt://log_sys/test_log] welcome
    [ERR] 2016-11-09T00:32:02.350Z [gmt://log_sys/test_log] welcome
    [WRN] 2016-11-09T00:32:02.350Z [gmt://log_sys/test_log] welcome
    [INF] 2016-11-09T00:32:02.349Z [gmt://log_sys/test_log] welcome
    [DBG] 2016-11-09T00:32:02.347Z [gmt://log_sys/test_log] welcome
    [ERR] 2016-11-07T23:34:42.625Z [gmt://log_sys/test_log] hello
    [WRN] 2016-11-07T23:34:42.625Z [gmt://log_sys/test_log] hello

All queries have to be done on the exact **URI** of the component that produces the messages. More queries will be provided in future releases.

It's also possible to explore the log messages stored in the database or manage the databases using the *mongo* command line tool. Please check the mongoDB documentation in this case.
