.. _installation:

Installing the SDK
==================

Development Platform
--------------------


The Observatory Control System (OCS) is designed to be a distributed system with device control components running on real-time computers, connected to common services and user interface components via the control network.

For device control systems, the following operating systems are supported:
    - `Alma Linux 9 <https://almalinux.org/>`_

The following guide is provided to assist with hardware, operating system and third-party software configuration required for running the OCS SDK.

Server Configuration
--------------------

Servers are used for developing, running and testing device control software and core services. When real-time communication
with hardware is required, the real-time kernel should be installed and configured. The following guidelines for creating
a server should be tailored according to its intended purpose.

.. _Operating system:
Operating System
................

1. Install the `Alma Linux <https://almalinux.org/>`_ Operating System.
A `minimal` server installation is sufficient for the use of the GMT SDK.


2. Disable firewall

  .. code-block:: bash

    systemctl disable firewalld
    systemctl stop firewalld

3. Disable SELinux

  .. code-block:: bash

    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0

.. warning::
  Make sure an external firewall protects your server

4. Install minimal development tools

  .. code-block:: bash

    sudo dnf install --enablerepo=crb -y git make cmake ninja-build gcc gcc-c++ gdb clang llvm-toolset lldb elfutils autoconf automake libtool


Real-Time Kernel (Optional)
...........................

The real-time kernel is required for real-time tasks, such as EtherCAT communication.
The following steps should be taken to install the real-time kernel:

1. Install the Real-Time Kernel

  .. code-block:: bash

    KERNEL_RT_VERSION="5.14.0-362.13.1.el9_3" && dnf install -y kernel-rt-${KERNEL_RT_VERSION} kernel-rt-devel-${KERNEL_RT_VERSION}

2. Add users to the **realtime** group, to allow access to the real-time kernel, for example:

  .. code-block:: bash

    sudo usermod -a -G realtime gmto


Development Tools Package List (Recommended)
............................................

A development environment requires a set of tools to build and test software. The following list of packages are
recommended for installation:

1. Install Some Testing Tools

  .. code-block:: bash

    sudo dnf install -y realtime-tests stress-ng perf valgrind

2. Install Other Development Tools

  .. code-block:: bash

    sudo dnf install -y vim tmux screen tig htop rsync wget net-tools pciutils hwloc strace ltrace lsof

Node Installation
.................

1. Install **Node version 20**:

  .. code-block:: bash

    sudo curl -sL https://rpm.nodesource.com/setup_20.x | bash -

  .. code-block:: bash

    sudo dnf install -y nodejs

2. Install necessary node packages:

  .. code-block:: bash

    sudo npm install -g coffeescript webpack webpack-cli raw-loader

. note::

   If you encounter problems installing nodejs, you probably have an older node version activated.
   To change it, run:
   `sudo dnf remove -y nodejs && sudo dnf module reset -y nodejs && sudo dnf module enable -y nodejs:20`
    and then install nodejs again.


MongoDB Configuration (for the core services)
.............................................

1. Add the file ``/etc/yum.repos.d/mongodb-org-6.repo`` with the following content:

  .. code-block:: bash

     [mongodb-org-7.0]
     name=MongoDB Repository
     baseurl=https://repo.mongodb.org/yum/redhat/8/mongodb-org/7.0/x86_64/
     gpgcheck=1
     enabled=1
     gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc

2. Install the necessary packages:

  .. code-block:: bash

    sudo dnf -y install mongodb-org

3. Enable the MongoDB service

  .. code-block:: bash

    sudo systemctl enable mongod
    sudo systemctl start mongod

4. Check that the MongoDB service is up

  .. code-block:: bash

    sudo systemctl status -l mongod


EtherCAT Configuration (Optional)
.................................

EtherCAT is a high-speed Fieldbus communication system used for real-time control. The following configuration steps
should be used as a guide when configuring EtherCAT communications.

A real-time kernel is required for EtherCAT communication. The real-time kernel installation steps are provided above.

For the installation example below, we use the following network interfaces:

  * enp4s0 - EtherCAT Master (Primary)
  * enp5s0 - EtherCAT Master (Backup - Optional, used for redundant topology)

1. Disable the network manager for it:

  .. code-block:: bash

    nmcli connection delete id enp4s0
    nmcli connection reload


2. Edit ``/etc/ethercat.conf`` and set the following configuration options:

  .. code-block:: bash

    MASTER0_DEVICE="enp4s0"
    MASTER0_BACKUP="enp5s0"  # optional, for redundant topology

3. Reboot into the RT Kernel, if you're not in it already.

4. Enable the EtherCAT service

  .. code-block:: bash

    sudo systemctl enable ethercat
    sudo systemctl start ethercat

8. Test the EtherCAT configuration (once the EtherCAT slaves are connected):

  .. code-block:: bash

    ethercat master
    ethercat slaves

If the ``ethercat master`` command does not produce the correct output, ensure that you're currently running the real-time kernel.
If the ``ethercat slaves`` command produces no output, check that the ethernet cable is connected to the correct port as configured above.


Network Time Protocol Configuration
...................................

For general network timekeeping, NTP client software should be installed and configured to synchronize the system clock
with a reliable time source. To check if the system is synchronized with the NTP server, use the ``chronyc sources`` command.

  .. code-block:: bash

    sudo chronyc sources


Software Development Kit (SDK)
------------------------------

The Software Development Kit is distributed as a TAR file and can be downloaded from the GMTO release server.

The SDK should be installed in a **Global GMT Software Location**, defined by the GMT_GLOBAL environment variable
(default value: /opt/gmt).

A **Local Working Directory**, defined by the GMT_LOCAL variable, is used as a unique workspace for individual developers.
The local working directory typically resides underneath the /home/<username> directory.

1. Download the latest SDK distribution:

  .. code-block:: bash

    wget http://52.52.46.32/srv/gmt/releases/sdk/linux/gmt-sdk.tar.gz

2. Extract the TAR file in the /opt directory, into a new folder for the latest release (substitute <releasever> with the actual release version):

  .. code-block:: bash

    sudo mkdir /opt/gmt_release_<releasever>
    sudo tar -xzvf gmt-sdk.tar.gz -C /opt/gmt_release_<releasever>

  where gmt-sdk.tar.gz is the file downloaded in step 1.

3. Create a symbolic link from the **Global GMT Software Location** to the latest release:

  .. code-block:: bash

    sudo ln -sfn /opt/gmt_release_1.10.0 /opt/gmt

4. Create a **Local Working Directory**

  .. code-block:: bash

    mkdir <local_working_dir>

  where ``<local_working_dir>`` is in the current users' home directory, for example, ~/work.
The GMT software modules developed by the user are created in this folder.

5. Add the following lines to your .bash_profile (or .kshrc or .bashrc depending on your preferred shell)

  .. code-block:: bash

    export GMT_GLOBAL=/opt/gmt
    export GMT_LOCAL=<local_working_dir>
    source $GMT_GLOBAL/bin/gmt_env.sh

  This will ensure that the environment variables are correctly configured when opening a new terminal.
Please log out and back in for the changes to take effect.
To configure the environment for the current shell, run the commands manually.

6. Check the values of the environment variables:

  .. code-block:: bash

    gmt_env

7. Install Node Modules

  .. code-block:: bash

    cd $GMT_GLOBAL
    npm install

    cd $GMT_LOCAL
    cp $GMT_GLOBAL/package.json ./
    npm install

  Install global node modules for `Webpack` and `Coffeescript`.

  .. code-block:: bash

    sudo npm install -g coffeescript webpack webpack-cli coffee-loader

8. Initialize the Development Environment:

  .. code-block:: bash

    cd $GMT_LOCAL
    gds init

  The correct folders will be created in the $GMT_LOCAL directory for use when compiling and running modules.

9. Create a **modules** directory in $GMT_LOCAL

  .. code-block:: bash

    cd $GMT_LOCAL
    mkdir modules

10. Create the **bundles.coffee** and **ocs_local_bundle.coffee** files, defining the local modules under development

  These files may be copied from $GMT_GLOBAL and then edited to reflect the developer's configuration.

  .. code-block:: bash

    mkdir $GMT_LOCAL/etc/bundles
    cp $GMT_GLOBAL/etc/bundles/bundles.coffee $GMT_LOCAL/etc/bundles/
    cp $GMT_GLOBAL/etc/bundles/ocs_local_bundle.coffee $GMT_LOCAL/etc/bundles/

  Edit **bundles.coffee** to point to the ocs_local_bundle.coffee file

  .. code-block:: bash

    module.exports =
        ocs_local_bundle:   {scope: "local",  desc: "GMT iSample and HDK bundle"}

  Edit **ocs_local_bundle.coffee** to include the ISample and HDK modules, or other modules that you are working on, for example:

  .. code-block:: bash

     module.exports =
     name:      "local"
     desc:      "List of local development modules"
     elements:
         isample_dcs: { active: true, test: false, developer: 'gmto', domain: 'idcs' }
         hdk_dcs:     { active: true, test: false, developer: 'gmto', domain: 'idcs' }

11. Build all model files from modules in your ocs_local_bundles definition using webpack. For example:

  .. code-block:: bash

    cd $GMT_LOCAL/modules/ocs_hdk_dcs/model
    webpack
    cd $GMT_LOCAL/modules/ocs_isample_dcs/model
    webpack

12. Python frameworks installation: Install Miniconda (or Anaconda)

  .. code-block:: bash

    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda
    echo 'eval "$($HOME/miniconda/bin/conda shell.bash hook)"' >> $HOME/.bashrc

13. Create a conda environment (optional)

  .. code-block:: bash

    conda create -y -n gmt python=3
    conda activate gmt

14. Install dependencies

  .. code-block:: bash

    conda install -y conda-build msgpack-python
    pip install -U cson

15. Link frameworks dir to Anaconda's paths

  .. code-block:: bash

    conda develop "$GMT_GLOBAL/lib/py/"
