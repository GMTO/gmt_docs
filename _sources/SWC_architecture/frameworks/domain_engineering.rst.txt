
.. _framework-domain_engineering:

Domain Engineering
------------------

*Process*
.........

The Domain Engineering Process is one of the Software Reuse Processes as
defined in ISO/IEC 12207 [ISO12207]_. As stated in the standard, domain
engineering is a reuse-based approach to defining the scope (i.e., domain
definition), specifying the structure (i.e., domain architecture), and
building the assets (e.g., requirements, designs, software code,
documentation) for a class of systems, subsystems or applications.

The Reuse Asset Management Process and the Reuse Program Management Process
complete the Software Reuses Processes. In the case of the GMT SWCS reuse assets
are implemented as component frameworks and specification files that capture
domain specific architectures and as a library of reusable components. All of
them are available in the GMT Software Repository.

A domain defines a set of common requirements, terminology and functionality for
any software program constructed to address a particular category of problems.
In software engineering, domain analysis, or product line analysis, is the
process of analyzing related software systems in a domain to find their common
and variable parts. The GMT domain analysis process creates a set of domain
object-oriented models using domain specific languages (DSL) [Fowl10]_.

Software developers can use these models as a basis for the implementation of
the SWCS subsystems architectures and applications. This approach to domain
analysis is also called model- driven engineering. Model-driven engineering
(MDE)* is a software development methodology that focuses on creating and
exploiting domain models (that is, abstract representation of the knowledge and
activities that govern a particular application domain).

The MDE approach is meant to increase productivity by maximizing compatibility
between systems (via reuse of standardized models), simplifying the process of
design (via models of recurring design patterns in the application domain), and
promoting communication between individuals and teams working on the system (via
standardization of the terminology and the best practices used in the
application domain).

The domain model is created in order to represent the vocabulary and key
concepts of the problem domain. It also identifies the relationships among all
the entities within the scope of the problem domain. In the SWCS the domain
model is captured as a set of System Definition Files (SDF) written in a DSL.
SDFs are text files that capture the specification of a Subsystem, Package or
Component.


*Quantitative Results*
......................

As described in the previous section, the software necessary to operate and
control an observatory can be modeled and explained using a set of essential
concepts that spans several domains of knowledge (e.g., observatory operation,
device control, data processing, process sequencing, and hardware I/O). The
results from the domain engineering process have been used to identify the
categories and number of components in each SWCS subsystems. Where a large
number of components of the same category has to be developed, a framework takes
care of providing the implementation of a reference architecture and a set of
common base components that are ready for use.

.. table::  Most Frequent Component Categories

  +--------------------+---------+-----------+
  | Component Category | Classes | Instances |
  +====================+=========+===========+
  | Controller         | 225     | 6665      |
  +--------------------+---------+-----------+
  | Pipeline           | 133     | 139       |
  +--------------------+---------+-----------+
  | Server             | 75      | 75        |
  +--------------------+---------+-----------+
  | Panel              | 298     | 302       |
  +--------------------+---------+-----------+

The above table shows the distribution of Component classes found during the
domain analysis process. The first column of the table names the most common
components. The second column identifies the number of different classes found
for each component. The classes define the number of different behaviors and
interface specifications (e.g., *m1_support_act_ctrl*). The third column lists
the number of individual component instances. This is relevant as the number
of instances defines the number of different configurations for each class;
enables one to estimate the amount of telemetry data generated; and gives a
measurement of the effort necessary for assembly, integration and testing, as
each instance has to go through those processes individually.

The following list summarizes the list of common frameworks, while the next
sections describes them in more detail:

  * *Core Framework* - Provides support for the development of a distribute
    component system with an interface to the observatory services that is
    independent of how these are implemented.

  * *Device Control Framework* - Provides support for the development of
    real-time and non- real time device control applications.

  * *Persistence Framework* - Provides support for the persistent storage of data
    structures and files.

  * *Data Processing Framework* - Provides support for the development of data
    processing applications.

  * *Time Distribution Framework* - Allows applications to obtain absolute
    time, set up timers and run synchronous tasks.

  * *User Interface Framework* - Provides a set of common graphical components
    and widgets for the development of graphic components. The use of the
    framework ensures look and feel consistency between different subsystems.

  * *Device Driver Framework* - Provides support for the development of
    hardware device drivers. The implementation of a driver that allows
    communicating with EtherCAT I/O modules is included in the framework.

.. table:: Overview of Analysis Domains

  +--------------------+-----------------------------+--------------------+-----------------------------+
  |   Analysis Domains |   Subsystem Packages        |   Domain Entities  |   Frameworks                |
  +====================+=============================+====================+=============================+
  |   Control and Data |   Device Controller Package |   Controller       |   Device Control Framework  |
  |   Acquisition      |   Hardware Package          |   Supervisor       |   IO Framework              |
  |                    |   Data Acquisition Package  |   Fieldbus         |   Core Framework            |
  |                    |                             |   IOModule         |                             |
  |                    |                             |   Device           |                             |
  |                    |                             |   Pipeline         |                             |
  |                    |                             |   Host             |                             |
  +--------------------+-----------------------------+--------------------+-----------------------------+
  |   Operation Support|   Services Package          |   Workflow         |   Data Processing Framework |
  |                    |   Sequencing Package        |   Sequence         |   Device Control Framework  |
  |                    |   Diagnosis Package         |   Pipeline         |   Core framework            |
  |                    |   Calibration Package       |   Server           |                             |
  |                    |                             |   Program          |                             |
  +--------------------+-----------------------------+--------------------+-----------------------------+
  |   Data Processing  |   Data Processing Package   |   Sequence         |   Data Processing           |
  |                    |                             |   Pipeline         |   Framework                 |
  |                    |                             |   Filter           |   Storage Framework         |
  |                    |                             |   Workflow         |                             |
  +--------------------+-----------------------------+--------------------+-----------------------------+
  |   Visualization    |   Visualzation Package      |   Panel            |   UI Framework              |
  |                    |                             |   Widget           |                             |
  +--------------------+-----------------------------+--------------------+-----------------------------+
  |   Safety           |   Safety Package            |   Controller       |   Device Control Framework  |
  |                    |                             |   Supervisor       |   Core Framework            |
  |                    |                             |   Sequence         |                             |
  +--------------------+-----------------------------+--------------------+-----------------------------+
  |   Management       |   Management Package        |   Plan             |                             |
  |                    |                             |   Iteration        |                             |
  +--------------------+-----------------------------+--------------------+-----------------------------+

The above table shows the different domains identified in the GMT SWC domain
analysis activity. The first column identifies the studied domain. The column
Subsystem Packages identifies the software packages inside a subsystem that have
components related to the domain. The column Domain Entities list the main
domain entities used in the reference architecture of the domain model. Finally
the column named Frameworks lists the frameworks that facilitate developing
application components in the corresponding subsystem packages.
