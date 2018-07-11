.. _operating_system:

Operating System: Fedora 26
===========================

The SDK is currently configured to run on the **Fedora 26 Server** Linux Operating System.

  1. Download the ISO file using a `web browser <https://dl.fedoraproject.org/pub/fedora/linux/releases/26/Server/x86_64/iso/>`_ or directly from the terminal:

    .. code-block:: bash

      $ curl -O https://download.fedoraproject.org/pub/fedora/linux/releases/26/Server/x86_64/iso/Fedora-Server-dvd-x86_64-26-1.5.iso

  2. Install the operating system on the development machine by either creating a bootable USB drive or via network installation using tools such as Cobbler and Kickstart. Other options include running Fedora 26 in a Virtual Machine or Docker Containers, however, the use of virtualization and its impact on connecting to actual hardware has not been fully tested.

  .. note::

    Future versions of the SDK could include support for CentOS, RHEL, Scientific Linux and/or MacOS. Fedora has a very short release and support cycle (6 months and 18 months respectively), which is not ideal for a platform that requires significant stability over long periods of time.

  .. toctree::
     :maxdepth: 1

     prep_installation
     boot_installation

:ref:`[back to top] <operating_system>`
