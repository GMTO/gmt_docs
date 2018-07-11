.. _anaconda_install:

Installing Using Anaconda
=========================

The installation for the Server version of Fedora may be completed using the Anaconda Installer in either Graphical or Text Mode. Full instructions can be found here: https://docs.fedoraproject.org/f26/install-guide/install/Installing_Using_Anaconda.html

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

:ref:`[back to top] <anaconda_install>`
