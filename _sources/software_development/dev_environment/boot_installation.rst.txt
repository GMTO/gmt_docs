.. _boot_installation:

Booting the Installation
========================

Full instructions for booting from prepared Fedora 26 installation media can be found here: https://docs.fedoraproject.org/f26/install-guide/install/Booting_the_Installation.html

The following instructions are applicable to the HDK:

1. Configure your BIOS to boot from USB

  This step is vendor specific. On the Beckhoff Industrial PC (IPC) provided
  with the Hardware Development Kit (HDK):

  1.1  Insert the USB drive into the IPC and power up the system

  1.2  Enter the BIOS settings by pressing the <Del> key.

  1.3  In the Boot panel, set Option #1 to [USB Stick].

    .. image:: ../_static/hdk-bios-usb.png
      :align: center
      :scale: 70 %
      :alt: BIOS boot configuration


  1.4 Select 'Save & Exit'; the system will reboot

2. OS Installation

  .. warning::
    * Your system drive will be reformatted and erased! For HDK, **do not** use the Beckhoff CFast card with TwinCAT3!

  2.1 Once the system is back up, select the 'Install Fedora 26' option


:ref:`[back to top] <boot_installation>`
