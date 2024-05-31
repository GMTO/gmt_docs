.. _release_2:

Release 2
=========

Contents of release 2.0.0
-------------------------- 

- Dev Framework

  - New build systems

     - CoffeeScript now uses `esbuild <https://esbuild.github.io>`_

     - C++ uses `Make <https://cmake.org>`_

     - Python uses `setuptools/pip <https://setuptools.pypa.io/>`_

  - `gds build` support for building C++, Coffee and Python using the new build systems.

  - `gds test` improved support for running and collecting code coverage for all the supported languages.



- Core Frameworks 

  - Updated C/C++ Core Framework 

        - Sampling Policies 

              - Added a new 'sampling_policies' property with a set of predefined default sampling policies (silent, standby, norm, debug). 

              - Added a new 'sampling_mode' property that can be used to set the sampling policies for all Component DataIOs. 

              - Added the capability of applying a transform to the sampled data before it is sent to telemetry 

        - Default slices for Service Data Port GET operation 

             - The SD GET operation now allows to inspect also the connectors, behaviors, container and ports. 

             - A SD GET of the State Variables, Faults or Alarms collection will return the value, goal and following mode 

        - core_core_pkg.so library has been renamed as core_lib_pkg.so

        - Build migrated to CMake.
      
        - Tests migrated to use `GoogleTest <https://github.com/google/googletest>`_ library.

  - Updated CoffeeScript Core Frameworks

      - CoffeeScript build migrated to esbuild.

      - CoffeeScript tests migrate to node:test library.


  - Updated Python Core Frameworks 

         - Added the management for Faults, FaultTree, Alarms and AlarmTree

         - Python core package is now called `core_lib_pkg`.

         - Python build now uses setuptools and pip.

         - Python 3.12 is now bundled within the SDK.

         - Python tests migrated to pytest.


  - Updated C/C++ I/O Framework

    - Added Serial-over-EtherCAT (SoE) support. See the new SoE example in the HDK DCS example.

    - Added support for the new sampling policies and sampling mode.

    - Added step groups to the EtherCAT state machine.

    - Updated etherlab installation to the latest version with a newer RT kernel

    - Created an etherlab installation script

    - Created a global configuration files folder for the EtherCAT I/O modules

    
