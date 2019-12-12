.. _upgrade:

Upgrade
=======

Upgrading from v1.5 to v1.6+
----------------------------

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
