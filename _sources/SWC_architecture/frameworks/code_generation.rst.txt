.. _framework-code_generation:

Framework Usage / Code Generation
---------------------------------

GMT frameworks are intended to be extensible by specializing a set of base
classes. A set of tools provides the capability to generate the skeleton of a
component implementation from the specification of its interface.  :ref:`The
Figure below (Component Skeleton Generation)<figure-code_generation>` shows the
relation between generated skeletons and the GMT modeling framework.

The skeleton generation tools are available for every layer of the modeling
framework, i.e. they can generate the skeleton of a model element from the
metamodel or generate the skeleton of a runtime component from the model
specification.

.. _figure-code_generation:

.. figure:: _static/component-skeleton-generation.png

   Component Skeleton Generation.  The GMT modeling framework is based in the
   `OMG Meta Object Facility specification <http://www.omg.org/mof/>`_. The
   group on the left shows the main entities in the layered modeling
   architecture. A set of modular plugins allows one to generate skeletons and
   instances from layer to layer. The gen_skeleton function (1) allows the
   generation of the skeleton of a model element. The gen_instance function (2)
   allows the capability to generate the skeleton of an instance of a model
   element. Instances are created in the next model layer and they inherit the
   behavior of some of the framework base classes.

The table below describes three common framework use cases and the functionality
provided by the frameworks involved.

.. table::  Framework Typical Use Cases

  +----------------+-------------------+------------------------+-------------------------------+
  |   Use Case     |   Framework       |   Base Classes         |   Function                    |
  +================+===================+========================+===============================+
  |   Create a new |   Core Framework  |   Base Component       |   Provides access to          |
  |   Controller   |                   |                        |   observatory services        |
  +----------------+-------------------+------------------------+-------------------------------+
  |                |   Device Control  |   BaseDeviceController |   Provides usable control     |
  |                |   Framework       |                        |   building blocks             |
  +----------------+-------------------+------------------------+-------------------------------+
  |                |   I/O Framework   |   IOModule, Device     |   Provides access to the      |
  |                |                   |                        |   hardware                    |
  +----------------+-------------------+------------------------+-------------------------------+
  |   Create a new |   Core Framework  |   BaseComponent        |   Provides access to the      |
  |   Pipeline     |                   |                        |   observatory services        |
  +----------------+-------------------+------------------------+-------------------------------+
  |                |   Data Processing |   Pipeline, Filter,    |   Defines a reference         |
  |                |   Framework       |   Recipe               |   architecture for data       |
  |                |                   |                        |   processing pipelines        |
  +----------------+-------------------+------------------------+-------------------------------+
  |                |   Persistence     |   ObjectStore,         |   Provides persistence to     |
  |                |   Framework       |   FileStore            |   files and data structures   |
  +----------------+-------------------+------------------------+-------------------------------+
  |   Create a new |   Core Framework  |   BaseComponent        |   Provides access to          |
  |   Panel        |                   |                        |   Observatory Services        |
  +----------------+-------------------+------------------------+-------------------------------+
  |                |   UI Framework    |   Panel, Widget        |   Provides reusable           |
  |                |                   |                        |   visualization components    |
  +----------------+-------------------+------------------------+-------------------------------+
