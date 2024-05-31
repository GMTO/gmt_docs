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

 

  - Updated Python Core Frameworks 

         - Added the management for Faults, FaultTree, Alarms and AlarmTree

  - Updated C/C++ I/O Framework

    - Added Serial-over-EtherCAT (SoE) support. See the new SoE example in the HDK DCS example.

    - Added support for the new sampling policies and sampling mode.

    - Added step groups to the EtherCAT state machine.

    - Updated etherlab installation to the latest version with a newer RT kernel

    - Created an etherlab installation script

    - Created a global configuration files folder for the EtherCAT I/O modules

    
