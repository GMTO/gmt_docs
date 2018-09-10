
.. _IO_framework:

I/O Framework
-------------

The I/O Framework (IOF) provides the infrastructure to develop observatory
compliant Device Controllers based on EtherCAT technology. The Section on
:ref:`field_device_interface` provides a more detailed description of EtherCAT.
The IOF provides the following capabilities:

  * Tools to assist developers with the definition of their application’s I/O.

  * Templates that can be reused or extended based on reference definitions and
    implementations.

  * Standard environment to build, test and deploy systems.

  * Abstraction layers to keep underlying 3rd party software packages
    transparent, and hide the complexity and low-level implementation details.

  * Tools to assist with prototyping, testing, debugging and validation during
    all the steps of the development process.

  * Scripting capabilities and a command line interface for rapid development.

*Terminology*
.............

A *Device* is a real world, physical entity representing the system under
control.  A *device controller* is a standard software component (see the
:ref:`following section<device_control_framework>`). The device controller
relays input and output signals to control hardware devices.  An *IOModule* is
a hardware independent representation of an I/O module terminal whereas the
*IOModuleDriver* provides the hardware dependent implementation, e.g., due to
vendor specific electronics implementation. An IO module terminal is a
real-world electronics component built into a hardware device assembly.

.. figure:: _static/framework-overview.png

   Framework Overview

While particular hardware assemblies may rely on highly specialized controllers
(e.g., cameras, deformable mirrors) a substantial number of hardware assemblies
can be identified in the telescope design that rely on a limited set of
fundamental generic :ref:`building blocks<tcs-degrees_of_freedom>`. These
primitive I/O modules can be grouped into generic families:

  * Digital Input and Output modules

  * Analog Input and Output modules

  * Position Measurement modules

  * Motion control modules

  * Communication modules, e.g., Serial or Ethernet – often used to bridge more
    integrated systems

More specialized modules, e.g., Pulse Width signal output, Thermocouple input,
etc., extend from this general classification.

The I/O Framework is decomposed into layers. A bootstrap layer handles
configuration and setup of the environment using SDFs. A runtime layer provides
the hooks between the bootstrapped environment and the application development
environment. The framework is logically structured into a hardware abstract
layer e.g., an *IOModule* instance of digital output family, and a hardware
dependent layer, e.g., a vendor specific unit. Although the scope of the
currently envisioned framework is really targeted at EtherCAT, other technology
can be interfaced using the same architecture.

*Fieldbus Communication*
........................

**EtherCAT Master**

  The principles of EtherCAT fieldbus communication are presented in more
  details in Section on :ref:`field_device_interface`. The EtherCAT technology
  group (ETG) provides an ANSI-C reference implementation for EtherCAT master.
  The GMT I/O Framework relies on third party software to provide this
  communication layer. Different commercial and open-source implementations
  have been evaluated [Bec12a]_ to find which solution better suited the needs
  of GMT, and to understand commonalties between different solutions.

  The current baseline uses the EtherCAT Master (ECM) from IgH, an open source
  package from the IgH EtherLab tool suite. The IgH EtherCAT master is implemented
  as a Linux kernel module and provides an API to configure and operate the
  EtherCAT fieldbus. The API is available in user space and kernel space for
  development.

  The IgH implementation also provides a generic network driver that will function
  independently of the computer network hardware, using the Linux kernel network
  stack. This approach proves very flexible but suitable for rates typically less
  than 1 kHz. Specialized drivers are also provided for a couple of popular
  network interface (Intel e100/e1000, Broadcom). Those bypass the network stack
  and allow faster and more deterministic responses, up to 5-10 kHz cycle time
  from our lab evaluation.

**ECM Driver**

  The IgH EtherCAT master handles all aspects of the communication protocol and
  state transitions. Beyond that, it does not impose any particular philosophy
  or mode of operation. The GMT I/O Framework builds on top of the EtherCAT
  master to provide isolation from third-party specific implementations and a
  common pattern reused by all the GMT applications.

  The ECM Driver is the main component of the I/O framework; it provides the
  following capabilities:

    * Interfaces with the EtherCAT master implementation and exposes a
      predefined operation pattern.

    * Exposes status information via the `sysfs
      <http://en.wikipedia.org/wiki/Sysfs>`_ file system.

    * Exposes an API to configure the application process maps and I/O modules.
      The interface is available from both user-space using `ioctl
      <http://en.wikipedia.org/wiki/Ioctl>`_ and kernel space.

    * Exposes a top level r/w debug level flag accessible through `procfs
      <http://en.wikipedia.org/wiki/Procfs>`_

    * Holds the field bus configuration in terms of I/O module terminals
      topology and configuration.

  The EtherCAT fieldbus communication follows a master/slaves paradigm. The
  fieldbus is daisy chained and the protocol uses a simple addressing mechanism
  based on each slave (i.e., I/O module terminal) position on the bus. The ECM
  Driver component holds a list of *IOModules* to represent this arrangement.
  IOModules are described in next section.



*I/O Module Terminals*
......................

**EtherCAT Slaves**

  EtherCAT Slave Controllers (ESC) provide an EtherCAT Slave Information file
  (ESI), an I/O module terminal description document in XML format. Information
  about the module functionality and settings is provided by the ESI. Slave
  specific information (manufacturer, product information, profile, object,
  process data, sync or non-sync, sync manager setting) is registered to the ESI
  file in XML format.

  ESI files are used by the I/O Framework to define the application network
  information (ENI) e.g., process data structures and initialization commands.
  The ESI file is defined by the ETG.2000 EtherCAT Slave Information
  specification. The structure of an ESI file is defined in the EtherCATInfo.xsd
  XML schema document, available from ETG.2001 EtherCAT Slave Information
  annotations.

**ECG I/O Modules**

  An *IOModule* is a base component from the I/O framework used to represent an
  EtherCAT slave controller. I/O Module terminals are fully resolved by their
  vendor identifier, product code, and revision number. The ETG group assigns
  EtherCAT technology partners and vendors unique vendor identifiers. The I/O
  framework provides tools to automatically generate *IOModule* components from
  the slaves ESI definition. The components follow a naming convention for
  convenience.

  *IOModules* are registered to the ECM Driver using this naming convention and
  their location on the fieldbus. They expose Process Data Object (PDO) as block
  of memory. The I/O framework generates a mapping of the PDO map to different
  target programing languages, currently C/C++ and Python.

  The following code blocks below together show an example of an I/O Module PDO
  Mapping in C/C++ and Python:

  .. code-block:: c++
     :caption: I/O Module PDO Mapping (C/C++)

     struct bh_el7041_00130000_sm3 {
         uint8_t x1a01_6000_01 :1; // (ro) ENC Status - Status__Latch C valid
         uint8_t x1a01_6000_02 :1; // (ro) ENC Status - Status__Latch extern valid
         uint8_t x1a01_6000_03 :1; // (ro) ENC Status - Status__Set counter done
         uint8_t x1a01_6000_04 :1; // (ro) ENC Status - Status__Counter underflow
         uint8_t x1a01_6000_05 :1; // (ro) ENC Status - Status__Counter overflow
         uint8_t :2;
         uint8_t x1a01_6000_08 :1; // (ro) ENC Status - Status__Extrapolation stall
         uint8_t x1a01_6000_09 :1; // (ro) ENC Status - Status__Status of input A
         ...
         uint32_t x1a06_6020_11;   // (ro) POS Status - Actual position
         int16_t x1a06_6020_21;    // (ro) POS Status - Actual velocity
         uint32_t x1a06_6020_22;   // (ro) POS Status - Actual drive time
     } __attribute__ ((packed));

  .. code-block:: python
     :caption: I/O Module PDO Mapping (Python)

     class bh_el7041_00130000_sm3 (Structure) :
       _pack_ = 1
       _fields_ = [
         ('x1a01_6000_01', c_uint8, 1), # (ro) ENC Status - Status__Latch C valid
         ('x1a01_6000_02', c_uint8, 1), # (ro) ENC Status - Status__Latch extern valid
         ('x1a01_6000_03', c_uint8, 1), # (ro) ENC Status - Status__Set counter done
         ('x1a01_6000_04', c_uint8, 1), # (ro) ENC Status - Status__Counter underflow
         ('x1a01_6000_05', c_uint8, 1), # (ro) ENC Status - Status__Counter overflow
         ('_________pad0', c_uint8, 2),
         ('x1a01_6000_08', c_uint8, 1), # (ro) ENC Status - Status__Extrapolation stall
         ('x1a01_6000_09', c_uint8, 1), # (ro) ENC Status - Status__Status of input A
         ...
         ('x1a06_6020_11', c_uint32),   # (ro) POS Status - Actual position
         ('x1a06_6020_21', c_int16),    # (ro) POS Status - Actual velocity
         ('x1a06_6020_22', c_uint32),   # (ro) POS Status - Actual drive time
       ]


Once registered to the ECM Driver, each *IOModule* instance exposes status
information and its PDO mapping via the sysfs file system.

The Table below shows an ECG I/O Module sysfs (EL7041 at position 10):

.. table::  ECG I/O Module *sysfs* (EL7041 at position 10)

  +------------------------------------+----------+------------------------------------------------+
  |    sysfs                           |    Type  |    Description                                 |
  +====================================+==========+================================================+
  |    iom/dev10_EL7041/al_state       |    int   |    Application Layer state 0:INIT, 1:PREOP,    |
  |                                    |          |    2:SAFEOP, 3:OP)                             |
  +------------------------------------+----------+------------------------------------------------+
  |    iom/dev10_EL7041online          |    int   |    IO Module online state                      |
  +------------------------------------+----------+------------------------------------------------+
  |    iom/dev10_EL7041operational     |    int   |    IO Module operational flag                  |
  +------------------------------------+----------+------------------------------------------------+
  |    iom/dev10_EL7041/1a01_6000_01   |    bit   |    (ro) ENC Status – Status Latch C valid      |
  +------------------------------------+----------+------------------------------------------------+
  |    iom/dev10_EL7041/1a01_6000_02   |    bit   |    (ro) ENC Status – Status Latch extern valid |
  +------------------------------------+----------+------------------------------------------------+


*Process Image*
...............

**EtherCAT Frames**

    The ECM Driver handles the registration of all the *IOModules* and their
    mapping into EtherCAT frames. EtherCAT frames are cyclically sent and
    received by the master at the base frame rate defined by a “freq” parameter.
    The I/O framework allows mapping of certain regions of the I/O modules at
    multiple of the base rate, i.e., those PDO only update every n-th frames of
    the nominal rate. The complete process image contained in the EtherCAT frame
    can be thus split into separate logical regions.

**ECM Domains**

    An ECM Domain is a base component of the I/O framework used to represent a
    sub region of an EtherCAT frame updating at a given rate. The rate is a
    fraction of the nominal rate and currently supports power of two values,
    i.e., x1, x2, x4, ... x128. During system initialization, ECM Domains are
    initially defined and *IOModules* register their PDO mapping into those
    domains.

    In its simplest form, an application may simply consist of a unique domain,
    which will be used by all the modules and contains the complete process
    image that updates at the nominal (x1) base rate. Once registered to the ECG
    Master, each ECG Domain instance exposes status information and its fraction
    of the process image via the sysfs file system.

    The Table below shows an example of the Process Map sysfs:

.. table::  Process Map *sysfs*

  +----------------------------+-----------+------------------------------------------------------+
  | sysfs                      | Type      |  Description                                         |
  +============================+===========+======================================================+
  | pmap/dom00/data            | bytes[]   |  Domain process image memory map (mmap)              |
  +----------------------------+-----------+------------------------------------------------------+
  | pmap/dom00/domain_size     | int       |  Number of bytes in data                             |
  +----------------------------+-----------+------------------------------------------------------+
  | pmap/dom00/wc_state        | int       |  Working counter state (0: complete, 1: incomplete)  |
  +----------------------------+-----------+------------------------------------------------------+
  | pmap/dom00/working_counter | int       |  Working counter value                               |
  +----------------------------+-----------+------------------------------------------------------+


*Bootstrap Process*
...................

The framework provides all the capability to configure and bootstrap a new
application. The process can be done programmatically at different level:
kernel, user-space C/C++, python – in decreasing order of complexity.

The framework provides an API to configure Service Data Objects (SDO) and
Distributed Clock (DC) settings for each IO Module. Details are not presented
here but essentially consist of straightforward ioctl binding as listed in the
previous section. The resulting API provides seamless integration with the GMT
modeling framework and fosters the automatic generation of bootstrap components
based on model application definitions. Once bootstrapped, the I/O framework
cyclically runs the complete EtherCAT stack.

The code (Python) below shows an example of an Application Bootstrap:

  .. code-block:: python

     from gmt import ecx
     from gmt.ecx import nth, acc

     # acquire master
     m = ecx.master(0)

     # register domains
     dinp = m.domain_register(0, nth.x1, acc.ro)
     dout = m.domain_register(1, nth.x1, acc.wo)

     # register devices
     m.device_register('bh_ek1100_00110000', 0)
     m.device_register('bh_el2202_00100000', 1)
     m.device_register('km_akd_00000002', 2, inp = dinp, out=dout)

     # activate @ 1 kHz
     m.activate(1000)

*Runtime Components*
....................

The I/O framework provides additional runtime components to interface with the
bootstrapped application.

**ECM Fieldbus**

  The ECM Fieldbus component is a front end to the kernel spaces components. In
  particular, ECM:

    * Runs the EtherCAT stack cyclically, taking over from the free-wheeling ECM
      Driver.

    * Checks health of the different kernel components, e.g., ECM Driver link
      up, slaves responding, I/OModule’s al_state, ECG domain’s working_counter,
      etc. and raises appropriate alarms.

    * Arbitrates access to the process maps in between cycle.

**ECM I/O Drivers**

  ECM I/O Drivers provide reference implementations for the control of their I/O
  Modules. The I/O drivers interact with the ECM Driver to access the I/O module
  process maps in a synchronized way. I/O Drivers can be very simple, e.g., a
  digital output driver that only needs to set a bit in the I/O module process
  map, or more involved, e.g., implement CiA402 motion profile state machine.

  The ECG I/O Drivers essentially allow hiding the low level details of control,
  and enforcing data synchronization when accessing the fieldbus.

**BaseDeviceController**

  The BaseDeviceController component is part of the :ref:`device_control_framework`
  and provides a base implementation for all GMT components implementing a
  Device Controller. The components provide:

  • An environment holding the *IOModules*, *IODrivers* and *Fieldbus*
    instances, and access to those components.

  • Adapters to Observatory Services, e.g., logging, telemetry, alarms, etc..

  • Adapters to middleware to expose commands, process data, etc. to the rest of
    the control system.

  The framework provides an API for developers to build their own application,
  and python binding for rapid prototyping, testing, and validation.


  The code (Python) below shows an example of an Application Runtime:

  .. code-block:: python

     from gmt import ecx

     # load application
     app = ecx.load('demo')

     # lookup component
     km = app.lkup('demo://dev/km_akd')

     # device control
     def when_done(status): pass
     km.init()
     km.datum()
     km.move(42, when_done)
