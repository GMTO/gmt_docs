.. _installation:

Installing the SDK
==================

Required Hardware
-----------------

Minimum hardware requirements for development machines:

  * Intel Pentium 4 or higher, 2 GHz CPU
  * 1 GB Memory
  * 20 GB Hard drive

Typical GMT OCS development machine specs:

  * Intel Xeon E3 or higher, 3.2 GHz CPU
  * 4 - 8 GB Memory
  * 120 - 250 GB Hard drive

Development Platform
--------------------

The development platform is no longer distributed as a standalone ISO file. Instead, the following guide is provided to assist with hardware, operating system and third-party software configuration required for running the OCS SDK. Some key areas, such as disk partitioning, user authentication and NFS mounting of home directories, depend on individual factors at each partner institution and should therefore be considered examples only.

Benefits of this approach versus distributing the complete ISO include the ability to support different network, hardware and software platforms used for software development by different partner institutions, as well as allowing for separate upgrade schedules for the Development Platform and Software Development Kit without affecting ongoing subsystem software development.

.. note::

   At GMTO, these instructions are formalized using Kickstart files and installed via the network using tools such as Cobbler. The GMTO DevOps team can provide assistance in setting up a similar system for development at partner institutions, if required.


Operating System
................

The SDK is currently configured to run on the **Fedora 26 Server** Linux Operating System.

  1. The ISO file can be downloaded from the Fedora website: https://download.fedoraproject.org/pub/fedora/linux/releases/26/Server/x86_64/iso/

    Alternatively, download the file directly from the terminal:

    .. code-block:: bash

      $ curl -L -O https://download.fedoraproject.org/pub/fedora/linux/releases/26/Server/x86_64/iso/Fedora-Server-dvd-x86_64-26-1.5.iso

  2. Install the operating system on the development machine by either creating a bootable USB drive or via network installation using tools such as Cobbler and Kickstart. Other options include running Fedora 26 in a Virtual Machine or Docker Containers, however, the use of virtualization and its impact on connecting to actual hardware has not been fully tested.

    .. toctree::
       :maxdepth: 1

       dev_environment/prep_installation
       dev_environment/boot_installation
       dev_environment/anaconda_install

Repository Configuration
........................

Some required RPMs are built by GMTO and need to be downloaded from the GMTO Yum Repository, currently hosted on Amazon Web Services.

To add the GMT repositories:

1. Add the file ``/etc/yum.repos.d/gmt.repo`` with the following content:

  .. code-block:: bash

    [gmt]
    name=GMT $releasever - $basearch
    baseurl=http://52.52.46.32/srv/gmt/yum/stable/$releasever/
    gpgcheck=0
    enabled=1

2. Add the file ``/etc/yum.repos.d/gmt-updates.repo`` with the following content:

  .. code-block:: bash

    [gmt-updates]
    name=GMT $releasever - $basearch - Updates
    baseurl=http://52.52.46.32/srv/gmt/yum/updates/$releasever/
    gpgcheck=0
    enabled=1

Advanced System Configuration
.............................

In a distributed computing environment, used by multiple developers, it is very convenient to use a centralized LDAP server for User Authentication and automatically mount /home directories from a network drive. The LDAP and NFS server configuration is network-dependent. The following instructions can be used as guidelines when configuring individual development machines to make use these services, if available.

  .. note::

    This configuration is currently optional. The alternative is to add users manually and manage permissions locally on each development machine.

  .. toctree::
     :maxdepth: 1

     dev_environment/ldap_configuration
     dev_environment/nfs_configuration

Package List
............

The following RPM packages should be installed by an Administrative user for use in the development environment:

1. Install Common OS Utilities

  .. code-block:: bash

    $ sudo dnf install -y xorg-x11-xauth urw-fonts wget net-tools pciutils
    $ sudo dnf install -y strace rpl bash-completion sed

2. Install Development Tools

  .. code-block:: bash

    $ sudo dnf install -y autoconf automake cmake elfutils gcc gdb libtool
    $ sudo dnf install -y cpp cscope ctags gc gcc-c++ gcc-gdb-plugin glibc-devel
    $ sudo dnf install -y glibc-headers kernel-headers libstdc++-devel
    $ sudo dnf install -y flex git libcurl-devel
    $ sudo dnf install -y python3-sphinx python3-sphinx_rtd_theme

3. Install OCS Dependencies

  .. code-block:: bash

    $ sudo dnf install -y rdma librdmacm-devel
    $ sudo dnf install -y boost-devel freeopcua freeopcua-devel

Node Installation
.................

1. Download and install **Node version 8**

  .. code-block:: bash

    $ curl -sL https://rpm.nodesource.com/setup_8.x | sudo bash -
    $ sudo dnf install -y nodejs

2. Install necessary node packages:

  .. code-block:: bash

    $ sudo npm install -g coffeescript webpack webpack-cli raw-loader

MongoDB Configuration
.....................

1. Install the necessary packages:

  .. code-block:: bash

    $ sudo dnf install -y mongodb mongodb-server

2. Configure the firewall

  .. code-block:: bash

    $ sudo firewall-offline-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 27017 -j ACCEPT

2. Enable the MongoDB service

  .. code-block:: bash

    $ sudo systemctl enable mongod
    $ sudo systemctl start mongod

3. Check that the MongoDB service is up

  .. code-block:: bash

    $ sudo systemctl status -l mongod

Infiniband Configuration (optional)
...................................

Infiniband is a low-latency networking communications protocol that requires specialized hardware. The following configuration steps should be used as a guide when configuring Infiniband communications.

1. Install the neccessary packages

  .. code-block:: bash

    $ sudo dnf install -y infiniband-diags opensm libmlx4

2. Edit ``/etc/rdma/mlx4.conf`` and add the following line:

  .. code-block:: bash

    01:00.0 auto auto

3. Find the interface used for Infiniband and edit the corresponding configuration file (for example ``/etc/sysconfig/network-scripts/ifcfg-ib0``) to set the following options:

  .. code-block:: bash

    DEVICE=ib0
    ONBOOT=yes
    TYPE=Infiniband
    BOOTPROTO=none
    IPADDR=<ib_ip_address>
    NETMASK=<ib_netmask>

  where ``<ib_ip_address>`` is the static IP Address associated with the Infiniband network interface and ``<ib_netmask>`` is the netmask used for the infiniband subnet.

4. Enable Infiniband Services

  .. code-block:: bash

    $ sudo systemctl enable opensm
    $ sudo systemctl enable rdma

Ethercat Configuration
.................................

EtherCAT is a high-speed fieldbus communication system used for real-time control. The following configuration steps should be used as a guide when configuring EtherCAT communications.

1. Install the real-time kernel and relevant packages

  .. code-block:: bash

    $ sudo dnf install -y --nogpgcheck kernel-3.14.73-rt78.x86_64 ethercat-devel

2. Select the Ethernet interface to be used for EtherCAT communication (e.g. enp4s0) and edit the corresponding configuration file (e.g. ``/etc/sysconfig/network-scripts/ifcfg-enp4s0``) to set the following options:

  .. code-block:: bash

    BOOTPROTO=none
    ONBOOT=no

3. Check the Hardware Address of the selected EtherCAT network interface

  .. code-block:: bash

    $ ifconfig

4. Edit ``/etc/ethercat.conf`` and set the following configuration option:

  .. code-block:: bash

    MASTER0_DEVICE="<mac_address>"

  where ``<mac_address>`` is the hardware address associated with the Ethercat network interface.

5. Edit ``/usr/lib/systemd/system/ethercat.service`` and uncomment the following line:

  .. code-block:: bash

    Before=network.service

6. Enable the Ethercat service

  .. code-block:: bash

    $ sudo systemctl enable ethercat
    $ sudo systemctl start ethercat

7. Reboot into the RT Kernel if you're not in it already.

8. Test the Ethercat configuration

  .. code-block:: bash

    $ ethercat master
    $ ethercat slaves

If the "ethercat master" command does not produce the correct output, ensure that you're currently running the real-time kernel. If the "ethercat slaves" command produces no output, check that the ethernet cable is connected to the correct port as configured above.

Real-time Configuration (optional)
..................................

1. Edit ``/etc/security/limits.d/99-realtime.conf`` and add the following options:

  .. code-block:: bash

    @realtime - rtprio 99
    @realtime - memlock unlimited

2. Add a new group and add the "gmto" user to it.

  .. code-block:: bash

    $ sudo groupadd -f -g 2001 realtime
    $ sudo usermod --groups realtime gmto

Network Time Protocol Configuration
...................................

For general network timekeeping, use NTP, unless Precision Time Protocol is required.

1. Install the necessary packages:

  .. code-block:: bash

    $ sudo dnf install -y chrony

2. Enable the NTP Service

  .. code-block:: bash

    $ sudo systemctl enable chronyd


Precision Time Protocol Configuration (optional)
................................................

1. Install the necessary packages:

  .. code-block:: bash

    $ sudo dnf install -y linuxptp

2. Edit ``/etc/ptp4l.conf`` and add the following options:

  .. code-block:: bash

    [global]
    slaveOnly       1
    verbose         1
    time_stamping   software
    summary_interval 6
    [enp3s0]

where ``[enp3s0]`` should be set to the interface to use for PTP.

3. Edit ``/etc/sysconfig/phc2sys`` and add the following options:

  .. code-block:: bash

    OPTIONS="-a -r -u 60"

4. Edit ``/etc/sysconfig/ptp4l`` and add the following options:

  .. code-block:: bash

    OPTIONS="-f /etc/ptp4l.conf -i enp3s0"

5. Configure access through the firewall

  .. code-block:: bash

    $ sudo firewall-offline-cmd --direct --add-rule ipv4 filter INPUT 0 -p udp --dport 319:320 -j ACCEPT

6. Enable the ptp service

  .. code-block:: bash

    $ sudo systemctl enable ptp4l


Software Development Kit (SDK)
------------------------------

The Software Development Kit is distributed as a TAR file and can be downloaded from the GMTO release server.

The SDK should be installed in a **Global GMT Software Location**, defined by the GMT_GLOBAL environment variable (default value: /opt/gmt). A **Local Working Directory**, unique for each individual developer (GMT_LOCAL). The local working directory typically resides underneath the /home/<username> directory.

1. Create the **Global GMT Software Location**:

  .. code-block:: bash

    $ sudo mkdir /opt/gmt

2. Download the latest SDK distribution and install in the **Global GMT Software Location**:

  .. code-block:: bash

    $ sudo wget -P /opt/gmt http://52.52.46.32/srv/gmt/releases/sdk/linux/gmt-sdk-1.4.1.tar.gz
    $ cd /opt/gmt
    $ sudo tar -xvzf gmt-sdk-1.4.1.tar.gz

3. Create a **Local Working Directory**

  .. code-block:: bash

    $ mkdir <local_working_dir>

where ``<local_working_dir>`` is in the current users' home directory, typically /home/<username>/<path_to_working_dir>. The GMT software modules developed by the user are created in this folder.

4. Add the following lines to your .profile (or .kshrc or .bashrc depending on your preferred shell)

  .. code-block:: bash

    $ export GMT_GLOBAL=/opt/gmt
    $ export GMT_LOCAL=<local_working_dir>
    $ source $GMT_GLOBAL/bin/gmt_env.sh

This will ensure that the environment variables are correctly configured when opening a new terminal. Please log out and back in for the changes to take effect. To configure the environment for the current shell, run the commands manually.

5. Check the values of the environment variables:

  .. code-block:: bash

    $ gmt_env

6. Initialize the Development Environment:

  .. code-block:: bash

    $ cd $GMT_LOCAL
    $ gds init

The correct folders will be created in the $GMT_LOCAL directory for use when compiling and running modules.

Ensure that the **bundles.coffee** and **ocs_local_bundle.coffee** files exist, copying them from $GMT_GLOBAL if need be.

.. code-block:: bash

  $ mkdir $GMT_LOCAL/etc/bundles
  $ cp $GMT_GLOBAL/etc/bundles/bundles.coffee $GMT_LOCAL/etc/bundles/
  $ cp $GMT_GLOBAL/etc/bundles/ocs_local_bundle.coffee $GMT_LOCAL/etc/bundles/

Edit bundles.coffee to point to the ocs_local_bundle.coffee file

.. code-block:: bash

  module.exports =
    ocs_local_bundle:   {scope: "local",  desc: "GMT iSample and HDK bundle"}

Edit ocs_local_bundle.coffee to include the isample and HDK modules

.. code-block:: bash

    module.exports =
    name:      "local"
    desc:      "List of local development modules"
    elements:
        isample_dcs: { active: true, test: false, developer: 'gmto', domain: 'idcs' }
        hdk_dcs:     { active: true, test: false, developer: 'gmto', domain: 'idcs' }

Install local Node Modules

.. code-block:: bash

   $ cd $GMT_LOCAL
   $ cp $GMT_GLOBAL/package.json ./
   $ npm install

Finally, create the **modules** directory

.. code-block:: bash

    $ cd $GMT_LOCAL
    $ mkdir modules


:ref:`[back to top] <installation>`
