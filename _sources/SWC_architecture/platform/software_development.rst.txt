
.. _software_development_platform:

Software Development Platform
-----------------------------

The Toolchain or Software Development Kit (SDK) includes all the required
resources to develop the GMT software.  These resources include:

  * Workstation operating system.  The workstation operating system shall be Linux.

  * Programming languages.  The programming languages that can be used in the
    GMT software development are:

    * ANSI C++ for general application programming in the LCU platform and for
      performance sensitive application in the workstation deployment platform.

    * ANSI C for driver programming in the LCU programming platform.

    * Python for data pipelines.

    * Coffescript/Javascript for graphical programing and general applications
      in the workstation deployment platform.

    * IEC 61131-3 for PLC embedded applications.

  * C/C++ Compilers.  The C/C++ compilers to be used in the workstation
    deployment platform shall be: GNU g++ version 4.2 or above.  The C/C++
    compilers to be used in the real-time deployment platform shall be: GNU g++
    version 4.2 or above.

  * Javascript Virtual Machine.  The Javascript virtual machine to be used in
    the workstation deployment platform shall be Google V8.  The V8 virtual
    machine is available as part of the node.js system

  * Coffescript compiler.  Javascript code shall be generated using the
    coffescript compiler.

  * Distributed Programming environment.  Distributed applications that are not
    performance sensitive shall be developed using the node.js system.

  * Python interpreter.  Python programs shall be compatible with Python version
    TBD.

  * The Figure below provides a summary of the GMT software development platform.

.. figure:: _static/software_platform.png

   GMT Software Platform Summary

