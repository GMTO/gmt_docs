
.. _persistence_framework:

Persistence Framework
---------------------

The Persistence Framework (PF) provides support for the storage of data
structures and files. It acts as a data access layer between the components and
the databases and file systems, and provides a mapping between application data
structures and the database.

The GMT uses and produces different types of data:

  * Time series data that are streamed by the telemetry, alarm and log services.
    These streams of data have to be stored with efficient use of space and
    adequate performance. These data collections need to be queried in order to
    support analysis.

  * Science instruments and WFS produce detector frames.

  * Several thousands of components are deployed in the runtime system; each one
    has its own configuration parameters. This data has to be accessed during
    the startup of the system and also during normal operation.

  * Observing programs, calibration pipeline parameters and observing sequences
    are stored and accessed by different applications during the lifecycle of an
    observation.

The table below shows the data persistence strategies:

.. table:: Data Persistence Strategies

  +--------------------------+----------------------------+-------------------+---------------------------+
  |   Data Type              |    Storage Strategy        |   Persistence     |   Data format             |
  +==========================+============================+===================+===========================+
  |   Science and WFS        |    Files +                 |   Permanent/      |   FITS + MongoDB          |
  |   frames                 |    metadata object store   |   Time partition  |                           |
  +--------------------------+----------------------------+-------------------+---------------------------+
  |   Telemetry streams      |    Files +                 |   Time partition  |   HDF5/BSON/MessagePack + |
  |                          |    metadata object store   |                   |   MongoDB                 |
  +--------------------------+----------------------------+-------------------+---------------------------+
  |   Alarm, Log streams     |    Object store            |   Time partition  |   NoSQL DB (MongoDB)      |
  +--------------------------+----------------------------+-------------------+---------------------------+
  |   Configuration          |    Object store            |   Permanent       |   NoSQL DB (MongoDB)      |
  +--------------------------+----------------------------+-------------------+---------------------------+
  |   Observing Programs     |    Object store            |   Permanent       |   NoSQL DB (MongoDB)      |
  +--------------------------+----------------------------+-------------------+---------------------------+
  |   Observing Sequences    |    Object store            |   Permanent       |   NoSQL DB (MongoDB)      |
  +--------------------------+----------------------------+-------------------+---------------------------+
  |   Recipe Parameters      |    Object store            |   Permanent       |   NoSQL DB (MongoDB)      |
  +--------------------------+----------------------------+-------------------+---------------------------+

The design of the Persistence Framework is based on the use of a High
Performance File System like `Lustre <http://www.opensfs.org/lustre>`_ in
combination with a `NoSQL <http://en.wikipedia.org/wiki/NoSQL>`_ database to
store component configurations and file metadata. High Performance File System
and NoSQL database technology is in constant evolution in order to address
BigData and large-scale web applications.  Although the outcome of some
prototypes using the `MongoDB <http://en.wikipedia.org/wiki/MongoDB>`_ database
to assess its feasibility as a metadata store has been very encouraging, it is
advisable to delay the adoption of a concrete technology until the detailed
design phase to take advantage of further technology developments. MongoDB is
been used meanwhile to develop the Application Programming Interface of the
Persistence Framework.
