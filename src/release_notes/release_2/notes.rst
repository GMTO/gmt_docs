.. _release_2:

Release 2
=========

Contents of release 2.1.0
--------------------------
Release Notes

This release marks a significant milestone in the project's development, featuring a comprehensive overhaul of the Continuous Integration (CI) and build systems, the introduction of support for new hardware standards, and a host of improvements and bug fixes across the framework. These changes are focused on enhancing reliability, maintainability, and expanding the capabilities of the software.

Major Changes
^^^^^^^^^^^^^

CI/CD and Build System Transformation

The entire CI/CD infrastructure has been modernized to improve efficiency and maintainability.

    Reusable Workflows: The previous monolithic CI configuration has been replaced with a set of modular and reusable GitHub Actions workflows. This allows for more consistent and easier-to-manage builds across all modules and platforms.

    Ansible-Powered Environments: The setup of development and testing environments is now managed by Ansible, ensuring consistent and reproducible configurations. A new workflow has been introduced to build the gmt-os base Docker image.

    Cross-Platform Builds: The build system now officially supports both Linux and macOS, with dedicated workflows and scripts to produce artifacts for each platform.

    Streamlined Release Process: The release process has been automated and simplified. Old scripts and Dockerfiles have been replaced by a more robust system that handles artifact creation, testing, and publication to GitHub Releases.

New Features
^^^^^^^^^^^^

Hardware Integration Standards

    Genicam Support: The control framework (ocs_ctrl_fwk) now includes foundational support for the Genicam standard for cameras. This includes new data types for acquisition control, image formatting, and analog controls, allowing for easier integration with a wide range of scientific and industrial cameras.

    CiA 402 Profile Support: The I/O framework (ocs_io_fwk) has been enhanced with support for the CiA 402 motor control profile, including new types and a state machine behavior for controlling drives that adhere to this standard.

Core Framework Enhancements

    New BaseSupervisor Component: A BaseSupervisor class has been added to the core framework (ocs_core_fwk), providing a standardized base for creating supervisory components and simplifying the implementation of system-wide logic.

    Enhanced Database Query Handling: The DBRequestHandler in the CoffeeScript framework now uses cson for parsing query expressions, improving the robustness and flexibility of database interactions.

    Component Ping Utility: The C++ ComponentProxy now features a ping() method, allowing for easy verification of component reachability and network latency.

Improvements
^^^^^^^^^^^^

Framework and Usability

    Efficient Data Sampling: Core service components in ocs_app_sys now utilize silent sampling modes and defined sampling_policies. This change significantly reduces unnecessary network traffic by only publishing data when it changes or at specified intervals.

    Standardized External Module Builds: The build scripts for all external dependencies (like boost, eigen, and googletest) have been standardized to use clang and a more consistent build process.

    PVT Trajectory Support: The control framework now supports 2D, 3D, and 6D Position-Velocity-Time (PVT) trajectory profiles, expanding its capabilities for complex motion control.

    C++ Test Framework: Many C++ unit tests have been migrated to or updated to use the GTest framework, improving test consistency and reporting.

Documentation and Terminology

    Updated Installation Guide: The SDK installation instructions in the documentation (gmt_docs) have been updated to direct users to the GitHub Releases page, ensuring they always have access to the latest version.

    Terminology Update: The term LGSF (Laser Guidestar Facility) has been consistently updated to LGSS (Laser Guidestar Subsystem) throughout the codebase and documentation to reflect the correct terminology.

Bug Fixes
^^^^^^^^^

    Fixed an issue in the ViewInputStream which now correctly uses a Writable stream instead of a Transform stream.

    Corrected the HealthSupervisingBehavior rate in ocs_app_sys from 1 to 2.

    The C++ ServerProxy result structures for database operations have been updated to accurately reflect the data returned from the server.

    Numerous smaller bug fixes and stability improvements have been implemented across the C++ and Python frameworks, addressing issues with unused imports, incorrect types, and state machine logic.

Deprecations
^^^^^^^^^^^^

    The base_detector_ctrl component has been removed in favor of the new Genicam-based camera control implementation.

    The Host metaclass in the modeling framework has been renamed to Computer. While backward compatibility is maintained where possible, users are encouraged to adopt the new term.


Contents of release 2.0.0
--------------------------

- Dev Framework

  - New build systems

     - NodeJS now uses `esbuild <https://esbuild.github.io>`_

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

  - Updated Nodejs Core Frameworks

        - Nodejs build migrated to esbuild.

        - Tests migrated to node:test library.

        - Add support for decimation on server for WebSocket publishers


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

  - Added UI Framework

    - The UI framework allows developing user interface elements using the `Web Components <https://developer.mozilla.org/en-US/docs/Web/API/Web_components>`_ standard.
    
    - Uses WebSockets to:

          - Comunicate to GMT distributed Components.

          - Subscribe/unsubscribe to events published by Core Services

          - Perform database operations on Core Services

    - Provides default Widgets for rendering of Data IO's, Components, Core Service Streams.

    - Uses `Carbon Web Components <https://web-components.carbondesignsystem.com/?path=/story/introduction-welcome--page>`_ as a fundation Design System.

    - Support the creation of Data Visualizations using `Carbon Charts <https://charts.carbondesignsystem.com/?path=/story/docs--welcome>`_

    - Includes the Navigator app that allows the integration of Visualization Plugins from other GMT Software and Control Subsystems.

    
