.. _nfs_configuration:

Mounting Home Directories using NFS
===================================

In a distributed computing environment used by multiple developers, it is useful to be able to automatically mount /home directories from a network drive so that development files can be easily transferred from one machine to another.

The following instructions are for configuring **development machines** to use available NFS directories on the network and should be seen as an example to be tailored to the actual network it's running on.

1. Install the necessary packages

  .. code-block:: bash

    $ sudo dnf install -y nfs-utils

2. Create an export directory

  .. code-block:: bash

    $ mkdir /export

3. Add the following line to the ``/etc/fstab`` file:

  .. code-block:: bash

    <nfs_ip>:/export/home /home nfs noauto,nofail,x-systemd.automount,x-systemd.requires=network-online.target,x-systemd.device-timeout=1,timeo=14,noacl 0 0

  where ``<nfs_ip>`` is the IP Address of the server where the home directories are stored.


:ref:`[back to top] <nfs_configuration>`
