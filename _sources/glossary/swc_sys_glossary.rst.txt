.. _glossary:

==============================================
Software and Controls Acronyms and Definitions
==============================================



------------
Introduction
------------


This document provides a description of the acronyms and definitions
used in the description of the GMT Software and Controls



--------
Acronyms
--------




Abbreviated terms

.. tabularcolumns:: p{4cm} | p{11cm}

.. list-table::
    :header-rows: 1

    * - Term
      - Definition
    * - *HW*
      - Hardware
    * - *SW*
      - Software
    * - *VO*
      - Virtual Observatory
    * - *SWC*
      - Software and Controls
    * - *EOL*
      - End of Life
    * - *RMS*
      - Root Mean Square
    * - *PDR*
      - Preliminary Design Review
    * - *DRD*
      - Document Requirement Definition
    * - *ICS*
      - Interface Control Document
    * - *TCS*
      - Telescope Control System
    * - *UDP*
      - UDP
    * - *WCS*
      - World Coordinate System
    * - *NIR*
      - Near Infrared
    * - *AIT*
      - Assembly, Integration and Testing
    * - *FAT*
      - Factory Acceptance Testing
    * - *HPFS*
      - High Performance File System





----------------
General Glossary
----------------




GMT Software and Controls Glossary and Definitions.

.. tabularcolumns:: p{4cm} | p{11cm}

.. list-table:: Software and Controls General Glossary
    :header-rows: 1

    * - Term
      - Definition
    * - *field elements*
      - TBD
    * - *control computer*
      - TBD
    * - *plant*
      - TBD
    * - *I/O module*
      - TBD
    * - *Operation console*
      - TBD
    * - *Data reduction pipeline*
      - TBD
    * - *Data analysis pipeline*
      - TBD
    * - *Data reduction recipe*
      - TBD
    * - *Data reduction filter*
      - TBD
    * - *Observing program*
      - TBD
    * - *Observing sequence*
      - TBD




----------------------------
Control Engineering Glossary
----------------------------




GMT Software and Controls Control Engineering Glossary and Definitions. Based on ECSS-E-60A

.. tabularcolumns:: p{4cm} | p{11cm}

.. list-table:: Control engineering Glossary
    :header-rows: 1

    * - Term
      - Definition
    * - *control loop*
      - mechanism to maintain a parameter, or set of parameters, within
        defined limits
    * - *device command*
      - Command that is executed by device hardware
    * - *actuator*
      - mechanical system or device which converts commands from the
        controller into physical effects on the controlled plant
    * - *autonomy*
      - capability of a system to perform its functions in the absence of
        certain resources
    * - *control*
      - function of the controller to derive control commands to match the
        current or future estimated state with the desired state
    * - *control command*
      - output of the controller to the actuator and the sensors (in case of
        sensors with command interfaces)
    * - *control component*
      - element of the control system which is used in part or in total to
        achieve the control objectives
    * - *control feedback*
      - input to the controller from the sensors and the actuators (in case of
        actuators with status feedback)
    * - *control function*
      - group of related control actions (or activities) contributing to
        achieving some of the control objectives. A control function describes
        what the controller does, usually by specifying the necessary inputs,
        boundary conditions and expected outputs
    * - *control mode*
      - temporary operational configuration of the control system implemented
        through a unique set of sensors, actuators and controller algorithms
        acting upon a given plant configuration
    * - *control mode transition*
      - passage or change from one control mode to another
    * - *control performance*
      - quantified capabilities of a controlled system
    * - *control system*
      - part of a controlled system which is designed to give the controlled
        plant the specified control objectives. This includes all relevant
        functions of controllers: sensors and actuators
    * - *control objective*
      - goal that the controlled system is supposed to achieve control
        objectives are issued as requests to the controller, to give the
        controlled plant a specified control performance despite the
        disturbing influences of the environment. Depending on the complexity
        of the control problem, control objectives can range from very low
        level commands to high level mission goals.
    * - *controllability*
      - property of a given plant to be steered from a given state to any
        other given state
    * - *controlled plant*
      - physical system, or one of its parts, which is the target of the
        control system. Synonymous of system under control. The control
        problem is to modify and shape the intrinsic behavior of the plant
        such that it yields the control performance despite its (uncontrolled
        other) interactions with its environment.
    * - *controlled system*
      - control relevant part of a system to achieve the specified control
        objectives. This includes the control system and the controlled plant
    * - *controller*
      - control component designed to give the controlled plant a specified
        control performance. The controller interacts with the controlled
        plant through sensors and actuators. In its most general form, a
        controller can include hardware, software, and human operations. Its
        implementation can be distributed over the space segment and the
        ground segment
    * - *disturbance*
      - physical effect affecting the control performance that can act onto
        all components of the controlled system. ..note:: The source of the
        disturbance can be internal (if generated inside the controlled
        system) or external (if coming from the environment)
    * - *environment*
      - set of external physical effects that interact with the controlled
        system note: The environment can act as disturbance on the plant but
        also on sensors, actuators and the controller
    * - *estimated state*
      - set of variables or parameters describing the controller internal
        knowledge of the controlled system and environment
    * - *estimator*
      - algorithm to determine the current or future state (estimated state)
        of a dynamic system from the measured state
    * - *guidance*
      - function of the controller to define the current or future desired
        state
    * - *implementation*
      - actual implementation of a specific function in terms of algorithms,
        hardware, software or human operations
    * - *mathematical model*
      - mathematical description of the behaviour of the plant, a control
        system component or the environment note: This consists of algorithms,
        formulas and parameters
    * - *measured state*
      - set of variables or parameters derived from physical measurements
        note: This is based on the control feedback or sensors and actuators
    * - *navigation*
      - function of the controller to determine the current or future
        estimated state from the measured state
    * - *observability*
      - property of a given controlled system that enables the complete state
        to be determined describing its dynamics. The observability is
        normally affected by number and location of sensors
    * - *quantization*
      - process by which control system variables are converted into discrete
        finite units. This usually applies to sensor readings and control
        commands towards actuators, and in general, when an analogue-digital
        conversion is used.
    * - *reference state*
      - set of variables or parameters describing the control objectives for a
        controlled system
    * - *robustness*
      - property of a controlled system to achieve the control objectives in
        spite of uncertainties. The uncertainty can be divided into: (1)
        signal uncertainty, when disturbances acting on the controlled system
        are not fully known in advance, (2) model uncertainty, when the
        parameters of the controlled system are not well known. Robustness is
        achieved using suitable control algorithms that act against these
        disturbances or are insensitive to controlled system parameter
        variations (e.g. inertia, stiffness).
    * - *sensor*
      - device that measures states of the controlled plant and provides them
        as feedback inputs to the controller
    * - *simulation model*
      - implementation of a mathematical model in an environment to calculate
        the behaviour of the model
    * - *stability*
      - property that defines the specified static and dynamic limits of a
        system A given dynamic system is not fully defined until the notion of
        stability is precisely mathematically defined according to its
        characteristics and specified behaviour
    * - *state*
      - set of variables or parameters describing the dynamic behaviour of the
        controlled system at a given time. The state is also referred as state
        vector. The state can describe the true, reference, desired, measured
        or estimated behaviour
    * - *true state*
      - set of variables or parameters defining the actual behaviour of the
        controlled system and environment. The true state is not known. In a
        simulation, the true state is the simulated state of the sensors,
        actuators, plant and environment excluding any measurement error of
        the sensors
    * - *fieldbus*
      - TBD
    * - *field element*
      - TBD
    * - *PAC*
      - Process Automation Controller
    * - *DCC*
      - Device Control Computer
    * - *PLC*
      - Programmable Logic Controller
    * - *LLN*
      - Low Latency Network
    * - *EtherCAT*
      - EtherCAT
    * - *Device*
      - TBD
    * - *Workflow*
      - TBD
    * - *CoE*
      - CAN over EtherCAT
    * - *SMF*
      - SWC Modeling Framework
    * - *SDF*
      - System Definition File


.. _n_grams:

-------
N-grams
-------




Combinations of two (digrams), three (trigrams) or four (tetragrams) letters used in GMT descriptors

.. tabularcolumns:: p{4cm} | p{11cm}

.. list-table:: 
    :header-rows: 1

    * - Term
      - Definition
    * - *cs*
      - Control System
    * - *ui*
      - User Interface
    * - *pi*
      - Principal Investigator
    * - *db*
      - Database
    * - *sw*
      - Software
    * - *hw*
      - Hardware
    * - *vo*
      - VO
    * - *tt*
      - Tip/Tilt
    * - *dd*
      - Device Driver
    * - *dp*
      - Data Processing
    * - *hp*
      - Hardpoint
    * - *da*
      - Data Archiving
    * - *qm*
      - Quality Monitoring
    * - *ao*
      - Adaptive Optics
    * - *m1*
      - Primary Mirror
    * - *m2*
      - Secondary Mirror
    * - *m3*
      - Tertiary Mirror
    * - *ph*
      - Phasing
    * - *pk*
      - Pointing Kernel
    * - *ss*
      - Spacecraft Safety System
    * - *as*
      - Aircraft Safety System
    * - *ot*
      - Observing Tools
    * - *ns*
      - Natural Seeing (NS)
    * - *swc*
      - Software and Controls
    * - *cam*
      - Camera
    * - *acq*
      - Acquisition
    * - *daq*
      - Data Acquisition System
    * - *mec*
      - Mechanism Control System ?
    * - *cal*
      - Calibration
    * - *lgc*
      - Logic
    * - *saf*
      - Safety
    * - *dev*
      - Device
    * - *srv*
      - Service
    * - *tel*
      - Telemetry
    * - *log*
      - Logging
    * - *alm*
      - Alarm
    * - *sup*
      - Supervisor
    * - *dir*
      - Director
    * - *pan*
      - UI Panel
    * - *dep*
      - Deployment
    * - *rpt*
      - Report
    * - *prs*
      - Presentation
    * - *pdr*
      - Preliminary Design Review
    * - *doc*
      - Document
    * - *icd*
      - Interface Control Document
    * - *sys*
      - System
    * - *sub*
      - Subsystem
    * - *pkg*
      - Package
    * - *wkf*
      - Workflow
    * - *seq*
      - Sequence
    * - *vis*
      - Visualization
    * - *obs*
      - Observatory/Observation
    * - *fwk*
      - Framework
    * - *req*
      - Requirement
    * - *prj*
      - Project
    * - *eng*
      - Engineering
    * - *sim*
      - Simulator
    * - *ops*
      - Operations
    * - *fat*
      - FAT
    * - *tsk*
      - Task
    * - *pps*
      - Proposal
    * - *act*
      - Actuator
    * - *bom*
      - Bill Of Materials
    * - *wbs*
      - Work Breakdown Structure
    * - *pbs*
      - Product Breakdown Structure
    * - *wfs*
      - Wavefront Sensor
    * - *ngs*
      - Natural Guidestar
    * - *udp*
      - UDP
    * - *nir*
      - NIR
    * - *swt*
      - Switch
    * - *wks*
      - Workstation
    * - *dom*
      - Domestic
    * - *int*
      - International
    * - *ait*
      - AIT
    * - *lic*
      - Licenses
    * - *cli*
      - Command Line Interface
    * - *iom*
      - I/O Module
    * - *pac*
      - Process Automation Controller
    * - *dcc*
      - Device Control Computer (DCC)
    * - *mon*
      - Monitoring
    * - *net*
      - Network
    * - *azt*
      - Azimuth
    * - *tcs*
      - Telescope Control System
    * - *asm*
      - Adaptive Secondary Mirror
    * - *enc*
      - Environment
    * - *fac*
      - Facilities
    * - *fcs*
      - Facility Calibration System
    * - *fsm*
      - Fast Steering Mirror
    * - *gir*
      - Gregorian Instrument Rotator
    * - *iss*
      - Interlock and Safety System
    * - *ocs*
      - Observatory Control System
    * - *wfc*
      - Wavefront Control
    * - *nav*
      - Navigation
    * - *drv*
      - Driver
    * - *wrp*
      - Wrapper
    * - *dpc*
      - Data Processing Computer
    * - *ltc*
      - Laser Traffic Control System
    * - *aco*
      - Active Optics (ACO)
    * - *env*
      - Environment Monitoring
    * - *diag*
      - Diagnostics
    * - *comm*
      - Commissioning
    * - *mngt*
      - Management
    * - *ecat*
      - EtherCAT
    * - *desc*
      - Description
    * - *repo*
      - Repository
    * - *inst*
      - Instrument
    * - *iter*
      - Iteration
    * - *intg*
      - Integration
    * - *temp*
      - Temperature
    * - *proc*
      - Process
    * - *arch*
      - Architecture
    * - *prot*
      - Prototype
    * - *dist*
      - Distribution
    * - *conf*
      - Configuration
    * - *comp*
      - Component
    * - *pers*
      - Persistence
    * - *elev*
      - Elevation
    * - *mngr*
      - Manager
    * - *agws*
      - Acquisition Guiding and Wavefront System
    * - *cadc*
      - Corrector and Atmospheric Dispersion
    * - *ecab*
      - Electronic Cabinet
    * - *lgsa*
      - Laser Guidestar Acquisition
    * - *lgsf*
      - Laser Guidestar Facility
    * - *ltao*
      - Laser Tomography Adaptive Optics
    * - *lgws*
      - LGAO Wavefront Sensor
    * - *ltws*
      - LTAO Wavefront Sensor
    * - *m1es*
      - M1 Edge Sensors
    * - *m2cs*
      - M2 Calibration Stand Sensors
    * - *m2es*
      - M2 Edge Sensors
    * - *ngws*
      - Natural Guide Star Wavefront Sensor
    * - *oiws*
      - On Instrument Wavefront Sensor
    * - *hpfs*
      - High Performace File System
    * - *tele*
      - Telemetry
    * - *mount*
      - Mount
    * - *m2pos*
      - M2 Positioner
    * - *nglao*
      - Natural Guidestar Ground Layer Adaptive Optics
    * - *ngsao*
      - Natural Guidestar Adaptive Optics
    * - *equip*
      - Equipment
    * - *sched*
      - Scheduler
    * - *wfcal*
      - Wavefront Calibration
    * - *stats*
      - Statistics
    * - *super*
      - Supervisor
    * - *gclef*
      - GCLEF
    * - *gmtifs*
      - GMTIFS
    * - *lapack*
      - LAPACK
    * - *comcam*
      - Commissioning Camera
    * - *dev_plan*
      - Subsystem Specification and Development Plan
    * - *domtravel*
      - Domestic Travel
    * - *inttravel*
      - International Travel
    * - *messagepack*
      - MessagePack

.. _class_n_grams:

-------------
Class N-grams
-------------


Combinations of two (digrams), three (trigrams) or four (tetragrams) letters used in GMT
model element names. The are also used to infer a model element class in case
a detailed element definition is provided.

.. tabularcolumns:: p{4cm} | p{11cm}

.. list-table:: 
    :header-rows: 1

    * - Term
      - Definition
    * - *daq*
      - Controller
    * - *pac*
      - Host
    * - *dpc*
      - Host
    * - *dcc*
      - Host
    * - *wks*
      - Host
    * - *iom*
      - IOModuleDef
    * - *wrp*
      - Component
    * - *seq*
      - Sequence
    * - *wkf*
      - Workflow
    * - *srv*
      - Server
    * - *swt*
      - NetworkSwitch
    * - *drv*
      - Driver
    * - *dev*
      - Device
    * - *sys*
      - Subsystem
    * - *pkg*
      - Package
    * - *rpt*
      - Document
    * - *ecab*
      - ECabinet
    * - *ctrl*
      - Controller
    * - *comp*
      - Component
    * - *plan*
      - Plan
    * - *eng*
      - Engineering
    * - *proc*
      - Process
    * - *panel*
      - Panel
    * - *pipeline*
      - Pipeline
    * - *sp*
      - Pipeline
    * - *inttravel*
      - Travel
    * - *domtravel*
      - Travel
    * - *shipping*
      - Shipping
    * - *lic*
      - License
    * - *cabling*
      - Network
    * - *mngt*
      - Management


    * - *app*
      - Application
    * - *dcs*
      - DCS
    * - *cat*
      - Catalog
    * - *lib*
      - Library
    * - *daq*
      - Controller
    * - *eng*
      - Engineering
    * - *pack*
      - Host
    * - *dpc*
      - Host
    * - *dcc*
      - Host
    * - *wks*
      - Host
    * - *iom*
      - IOModule
    * - *cmp*
      - Component
    * - *wrp*
      - Component
    * - *seq*
      - Sequence
    * - *wkf*
      - Workflow
    * - *srv*
      - Server
    * - *swt*
      - NetworkSwitch
    * - *drv*
      - Driver
    * - *dev*
      - Device
    * - *sys*
      - Subsystem
    * - *pkg*
      - Package
    * - *rpt*
      - Document
    * - *doc*
      - Document
    * - *ecab*
      - ECabinet
    * - *ctrl*
      - Controller
    * - *comp*
      - Component
    * - *plan*
      - Plan
    * - *proc*
      - Process
    * - *panel*
      - Panel
    * - *cable*
      - Cable
    * - *super*
      - Supervisor
    * - *adapter*
      - Adapter
    * - *pipeline*
      - Pipeline
    * - *inttravel*
      - Travel
    * - *domtravel*
      - Travel
    * - *shipping*
      - Shipping
    * - *lic*
      - License
    * - *cabling*
      - Network
    * - *mngt*
      - Management


.. raw:: latex

    %Added from template
    \clearpage
    \listoffigures
    \clearpage
    \listoftables
    %Added from template



