.. _fedora_server:

Fedora 28 Server
================

The ISO file can be downloaded from the Fedora website: https://download.fedoraproject.org/pub/fedora/linux/releases/28/Server/x86_64/iso/

Alternatively, download the file directly from the terminal:

    .. code-block:: bash

      $ wget https://download.fedoraproject.org/pub/fedora/linux/releases/28/Server/x86_64/iso/Fedora-Server-dvd-x86_64-28-1.1.iso

Install the operating system on the development machine by either creating a bootable USB drive or via network installation using tools such as Cobbler and Kickstart. Other options include running Fedora 28 in a Virtual Machine or Docker Containers, however, the use of virtualization and its impact on connecting to actual hardware has not been fully tested.

.. warning::
  The real-time Linux kernel requires the root partition to be an **ext4** file system. Please ensure that this is configured correctly in the disk partitioning settings.

Preparing USB for Installation
..............................

Full instructions for downloading Fedora 28 and preparing various types of boot media in different environments can be found here: https://docs.fedoraproject.org/en-US/fedora/f28/install-guide/install/Preparing_for_Installation/index.html

Alternatively, the following command-line instructions may be used on OSX or Linux:

  .. warning::
    * The USB drive needs a minimum capacity of 3GB
    * Ensure that you properly identify the ``device`` assigned to the USB drive
    * The entire USB drive will be erased!

  OSX - with a drive on ``/dev/disk2``

  .. code-block:: bash

    $ diskutil list
    $ sudo diskutil unmountDisk /dev/disk2
    $ sudo dd bs=4m if=Fedora-Server-dvd-x86_64-28-1.1.iso of=/dev/rdisk2


  Linux - with a drive on ``/dev/sdb``

  .. code-block:: bash

    $ sudo umount /dev/sdb*
    $ sudo dd bs=4M if=Fedora-Server-dvd-x86_64-28-1.1.iso of=/dev/sdb


Booting from Prepared USB
.........................

Full instructions for booting from prepared Fedora 28 installation media can be found here: https://docs.fedoraproject.org/en-US/fedora/f28/install-guide/install/Booting_the_Installation/

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

  2.1 Once the system is back up, select the 'Install Fedora 28' option


Installation (Using Anaconda)
.............................

The installation for the Server version of Fedora may be completed using the Anaconda Installer in either Graphical or Text Mode. Full instructions can be found here: https://docs.fedoraproject.org/en-US/fedora/f28/install-guide/install/Installing_Using_Anaconda/

.. note::
  To boot the installer in text mode, add the boot option ``inst.text`` to the command line boot menu and select option 2 (Use text mode) from the subsequent menu. Text mode has some limitations, such as not being able to select a custom partitioning scheme.

Ensure that all items listed are configured appropriately, ready for installation.

  .. image:: images/fedora_anaconda01.png
    :align: center
    :scale: 70 %
    :alt: Installation Menu

1. **Language settings** - English (US)
2. **Time settings** - Select the appropriate Time Zone (for example America/Los_Angeles)
3. **Installation source** - Local media (CD/DVD)
4. **Software Selection** - Default packages are sufficient for now
5. **Installation Destination** - Select the appropriate drive for installation and whether to use the entire drive. Custom partitioning can be configured here as well. The default Partition Scheme to use is LVM. Ensure that the file system is set to ``ext4`` for the RT kernel to work.
6. **Network Configuration** - At least one interface with internet access should be configured
7. **Root Password** - Set a secure root password
8. **User Creation** - Create the default user. The default user for a typical GMT development environment is ``gmto``. This user should have Administrator access.

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

After installation, the system will reboot. Remove the boot drive (USB drive or network mount) and select the default kernel.

:ref:`[back to top] <fedora_server>`
