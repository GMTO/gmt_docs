.. _fedora_workstation:

Fedora 28 Workstation
=====================

The ISO file can be downloaded from the Fedora website: 

https://download.fedoraproject.org/pub/fedora/linux/releases/28/Workstation/x86_64/iso/

Alternatively, download the file directly from the terminal:

    .. code-block:: bash

      $ wget https://download.fedoraproject.org/pub/fedora/linux/releases/28/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-28-1.1.iso

Install the operating system on the development machine by either creating a bootable USB drive or via network installation using tools such as Cobbler and Kickstart. The instructions below have been tested on Fedora 28 Workstation running in a Virtual Machine (VirtualVM).

Preparing USB for Installation
..............................

Full instructions for downloading Fedora 28 and preparing various types of boot media in different environments can be found here: 

https://docs.fedoraproject.org/en-US/fedora/f28/install-guide/install/Preparing_for_Installation/

Booting from Prepared USB
.........................

Full instructions for booting from prepared Fedora 28 installation media can be found here: 

https://docs.fedoraproject.org/en-US/fedora/f28/install-guide/install/Booting_the_Installation/

.. warning::
  It is NOT recommended to install Fedora Workstation on the Beckhoff Industrial PC (IPC) that is part of the Hardware Development Kit (HDK).This machine does not have the necessary hardware or firmware for graphical rendering. Device Control components may be run on the IPC using Fedora Server, with a User Interface connecting from a different machine via the network.

  It is also not recommended to install Fedora Workstation on a real-time server used for running the Device Control System. The RT kernel currently in use does not support the necessary graphics drivers.

1. Configure your BIOS to boot from USB

  This step is vendor specific. Please verify instructions using information supplied by the vendor.

  1.1  Insert the USB drive and power up the system

  1.2  Enter the BIOS settings by pressing the <Delete> key.

  1.3  In the Boot panel, select ``Boot Options Priority`` and set ``Boot Option #1`` to the USB drive

  1.4 Select 'Save & Exit' (F4). the system will reboot

2. OS Installation

  .. warning::
    * Your system drive will be reformatted and erased!

  2.1 Once the system is back up, run 'Fedora 28' and select `Install to Hard Drive`.


Installation
............

Follow the on-screen instructions for basic configuration.

1. **Language settings** - English (US)
2. **Keyboard** - English (US)
3. **Time settings** - Select the appropriate Time Zone (for example America/Los_Angeles)
4. **Installation Destination** - Select the appropriate drive. Storage Configuration: Custom
5. **Manual Partitioning** - LVM Partitioning Scheme, File System ext4. Remove /home partition if NFS mounting will be used.

After installation, the system will reboot. Remove the boot drive (USB drive or network mount) and select the default kernel.

6. **User Creation** - Create the default user. The default user for a typical GMT development environment is ``gmto``. This user should have Administrator access.
7. **System Update** - run `sudo dnf update`

.. warning::
  The real-time Linux kernel requires the root partition to be an **ext4** file system. Please ensure that this is configured correctly in the disk partitioning settings.


The following extract from the GMTO kickstart file shows settings used for automated PXE installs:

  .. code-block:: bash

    # -- Installation Parameters ------------------------------------------------------
    install                                       # Install, instead of Upgrade
    reboot                                        # Reboot after installation
    text                                          # Use text mode install
    keyboard us                                   # System keyboard
    lang en_US                                    # System language
    timezone America/Los_Angeles                  # System timezone
    bootloader --location=mbr                     # Bootloader configuration
    clearpart --all --initlabel                   # Partition clearing information
    skipx                                         # Skip X11 configuration

    # -- Security Settings ------------------------------------------------------------
    auth --useshadow --enablemd5                  # Use shadow passwords
    firewall --enabled                            # Firewall configuration
    selinux --disabled                            # SELinux configuration
    rootpw --iscrypted $default_password_crypted  # Root password

    # -- User configuration -----------------------------------------------------------
    user --name=gmto --password=gmto --plaintext

    # -- Disk Partitioning ------------------------------------------------------------
    clearpart --drives=sda                         # Remove existing partitions
    zerombr                                        # Clear the Master Boot Record
    part /boot --label=/boot --asprimary --size=500 --fstype=ext4 --ondisk=sda
    part swap --recommended --ondisk=sda
    part / --label=/ --fstype=ext4 --grow --ondisk=sda


:ref:`[back to top] <fedora_workstation>`
