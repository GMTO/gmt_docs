.. _upgrade:

Upgrade
=======

Upgrading from v1.8 to v1.9
---------------------------

1. Download the latest SDK distribution:

  .. code-block:: bash

    sudo wget http://52.52.46.32/srv/gmt/releases/sdk/linux/gmt-sdk.tar.gz


2. Extract the TAR file in the /opt directory, into a new folder for the latest release:

  .. code-block:: bash

    sudo mkdir /opt/gmt_release_1.9.0
    sudo tar -xzvf gmt-sdk.tar.gz -C /opt/gmt_release_1.9.0

5. Update the symbolic link from the **Global GMT Software Location** to the latest release:

  .. code-block:: bash

    sudo ln -sfn gmt_release_1.9.0 /opt/gmt

6. Check all applicable environment variables

  .. code-block:: bash

    gmt_env

7. Optional: Install the Python Frameworks following items 12 to 15 on the :ref:`installation <installation>` page.

To create the user working development environment, please
follow the instructions on the :ref:`installation <installation>` page.


Upgrading from v1.7 to v1.8
---------------------------

Multiple versions of the SDK software may be installed on the same system, with
the version currently in use reflected by the $GMT_GLOBAL environment variable.

1. Upgrade NodeJS from version 10 (used on SDK < v1.7) to version 12.

  .. code-block:: bash

    $ sudo dnf remove -y nodejs
    $ sudo dnf module reset -y nodejs
    $ sudo dnf module enable -y nodejs:12
    $ sudo dnf install -y nodejs

2. If you are using the RT kernel, temporarily remove ssh from the list of update packages
   (see :ref:`installation <installation>` page for more info)

  .. code-block:: bash

    $ sudo echo "exclude=openssh* libssh*" >> /etc/dnf/dnf.conf


3. Download the latest SDK distribution:

  .. code-block:: bash

    $ sudo wget http://52.52.46.32/srv/gmt/releases/sdk/linux/gmt-sdk.tar.gz


4. Extract the TAR file in the /opt directory, into a new folder for the latest release:

  .. code-block:: bash

    $ sudo mkdir /opt/gmt_release_1.8.0
    $ sudo tar -xzvf gmt-sdk.tar.gz -C /opt/gmt_release_1.8.0

5. Update the symbolic link from the **Global GMT Software Location** to the latest release:

  .. code-block:: bash

    $ sudo ln -sfn gmt_release_1.8.0 /opt/gmt

6. Check all applicable environment variables

  .. code-block:: bash

    $ gmt_env

To create the user working development environment, please
follow the instructions on the :ref:`installation <installation>` page.


Upgrading from v1.5 to v1.6 and v1.7
------------------------------------

Multiple versions of the SDK software may be installed on the same system, with
the version currently in use reflected by the $GMT_GLOBAL environment variable.

1. Download the latest SDK distribution:

  .. code-block:: bash

    $ sudo wget http://52.52.46.32/srv/gmt/releases/sdk/linux/gmt-sdk.tar.gz

  for the server version of the SDK, or

  .. code-block:: bash

    $ sudo wget http://52.52.46.32/srv/gmt/releases/sdk/macos/gmt-ui.tar.gz

  for the workstation version.

2. Extract the TAR file in the /opt directory, into a new folder for the latest release:

  .. code-block:: bash

    $ sudo mkdir /opt/gmt_release_1.7.0
    $ sudo tar -xzvf gmt-sdk.tar.gz -C /opt/gmt_release_1.7.0

3. Update the symbolic link from the **Global GMT Software Location** to the latest release:

  .. code-block:: bash

    $ sudo ln -sfn gmt_release_1.7.0 /opt/gmt

4. Check all applicable environment variables

  .. code-block:: bash

    $ gmt_env

To create the user working development environment, please
follow the instructions on the :ref:`installation <installation>` page.

Upgrading from v1.5 to v1.6
---------------------------

Please follow the instructions on the :ref:`SDK 1.6 migration guide <sdk_1_6_migration_guide>` page in order to migrate the code and the structure of the modules to the new formats.

Upgrading from v1.4 to v1.5
---------------------------

Because version 1.5 is built for Fedora 28, upgraded from Fedora 26, it is recommended to use the instructions on the :ref:`installation` page to install on a clean system.

Multiple versions of the SDK software may be installed on the same system, with the version currently in use reflected by the $GMT_GLOBAL environment variable.

1. Download the latest SDK distribution:

  .. code-block:: bash

    $ sudo wget http://52.52.46.32/srv/gmt/releases/sdk/linux/gmt-sdk-1.5.0.tar.gz

  for the server version of the SDK, or

  .. code-block:: bash

    $ sudo wget http://52.52.46.32/srv/gmt/releases/sdk/macos/gmt-ui-1.5.0.tar.gz

  for the workstation version.

2. Extract the TAR file in the /opt directory, into a new folder for the latest release:

  .. code-block:: bash

    $ sudo mkdir /opt/gmt_release_1.5.0
    $ sudo tar -xzvf <gmt-tar.gz> -C /opt/gmt_release_1.5.0

  where <gmt-tar.gz> is the file downloaded in step 1.

3. Update the symbolic link from the **Global GMT Software Location** to the latest release:

  .. code-block:: bash

    $ sudo ln -sfn gmt_release_1.5.0 /opt/gmt

4. Check all applicable environment variables

  .. code-block:: bash

    $ gmt_env

These instructions assume that a working development environment has been set up before. To follow all steps for creating a new development environment, please follow the instructions on the :ref:`installation` page.

:ref:`[back to top] <upgrade>`
