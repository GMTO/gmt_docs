.. _upgrade:

Upgrade
=======

As an alternative to installing the Operating System and associated packages from scratch, tho following procedure can be followed to upgrade an existing version 1.3 system to version 1.4. Please refer to the :ref:`installation` page for help in configuring individual services.

Upgrading from v1.3 to 1.4
--------------------------

Uninstall Old GMT packages
..........................

1. Uninstall existing GMT packages and all their dependencies

  .. code-block:: bash

    $ sudo dnf remove -y gmt* gmtx*

Repository Configuration
........................

Some required RPMs are built by GMTO and need to be downloaded from the GMTO Yum Repository, currently hosted on Amazon Web Services.

Ensure that the GMT repositories are correctly configured:

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
    $ dnf install -y nodejs

2. Install necessary node packages:

  .. code-block:: bash

    $ npm install -g coffeescript webpack webpack-cli raw-loader

Software Development Kit (SDK)
------------------------------

The Software Development Kit is distributed as a TAR file and can be downloaded from the GMTO release server.

The SDK should be installed in a **Global GMT Software Location**, defined by the GMT_GLOBAL environment variable (default value: /opt/gmt). A **Local Working Directory**, unique for each individual developer (GMT_LOCAL). The local working directory typically resides underneath the /home/<username> directory.

1. Create the **Global GMT Software Location** 

  .. code-block:: bash

    $ mkdir /opt/gmt

2. Download the latest SDK distribution and install in the **Global GMT Software Location**:

  .. code-block:: bash

    $ wget -P /opt/gmt http://52.52.46.32/srv/gmt/releases/sdk/linux/gmt-sdk-1.4-0.tar.gz
    $ cd /opt/gmt
    $ sudo tar -xvzf gmt-sdk-1.4.0.tar.gz

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

:ref:`[back to top] <upgrade>`
