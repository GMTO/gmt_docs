.. _installation:

Installation
============

The release is provided as a custom Linux distribution that includes:

  * Core operating system (based on Fedora 26)
  * GMT software packages
  * Third-party and development packages required for runtime and development

The kickstart installation automates the process of adapting the release to your
system, effectively providing a turn-key brand new system.

.. ``Note:`` Follow `these instructions <link>`_ for limited support on OS-X.

Procedure
---------

1. Create a bootable USB stick

  1.1 Download the iso image and checksum

    .. code-block:: bash

      $ curl -O http://52.52.46.32/srv/gmt/iso/standalone.iso
      $ curl -O http://52.52.46.32/srv/gmt/iso/standalone.sha512

  1.2 Verify and burn the iso image

  .. warning::
    * The drive needs a minimum 3GB capacity
    * Properly identify your drive's ``device``
    * The entire drive will be erased!


  OSX - with a drive on ``/dev/disk2``

  .. code-block:: bash

    $ shasum -a 512 -c standalone.sha512
    standalone.iso: OK

    $ diskutil list
    $ sudo diskutil unmountDisk /dev/disk2
    $ sudo dd bs=4m if=standalone.iso of=/dev/rdisk2


  Linux - with a drive on ``/dev/sdb``

  .. code-block:: bash

    $ sha512sum -c standalone.sha512
    standalone.iso: OK

    $ sudo umount /dev/sdb*
    $ sudo dd bs=4M if=standalone.iso of=/dev/sdb

2. Configure your BIOS to boot from USB

  This step is vendor specific. On the Beckhoff Industrial PC (IPC) provided
  with the Hardware Development Kit (HDK):

  2.1  Insert the USB drive into the IPC and power up the system

  2.1  Enter the BIOS settings by pressing the <Del> key.

  2.2  In the Boot panel, set Option #1 to [USB Stick].

    .. image:: _static/hdk-bios-usb.png
      :align: center
      :scale: 70 %
      :alt: BIOS boot configuration


  2.3 Select 'Save & Exit'; the system will reboot


3. Factory Reset Installation

  3.1 Once the system is back up, select the 'install' option

  .. warning::
    * Your system drive will be reformated and erased!

  .. warning::
    * For HDK, **do not** use the Beckhoff CFast card with TwinCAT3!

  3.2 Press the <Tab> key. The following options are available:

    * **gmt.tz** sets the system timezone (provided by /usr/share/zoneinfo)

    * **gmt.ecat** sets the interface used by EtherCAT, keep the provided default for HDK


  3.3 Wait until the installation completes.  The system will eventually reboot itself.

  3.4 Remove the USB drive or select the 'local' option

  3.5 Boot the (default) real-time kernel

  Your system is ready.


Sanity Check
------------

*  Basic Ethercat check

  .. code-block:: bash

    $ ethercat master
    $ ethercat slaves


*  Basic MongoDB check

  .. code-block:: bash

    $ systemctl status -l mongod


:ref:`[back to top] <installation>`
