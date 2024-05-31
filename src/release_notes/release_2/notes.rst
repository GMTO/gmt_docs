.. _release_2: 

  

Release 2 

========= 

  

Contents of release 2.0.0 

-------------------------- 

  

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

 

  - Updated Python Core Frameworks 

         - Added the management for Faults, FaultTree, Alarms and AlarmTree