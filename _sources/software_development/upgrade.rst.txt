.. _upgrade:

Upgrade
=======

Open a terminal and execute:

    .. code-block:: bash

      $ sudo dnf upgrade -x kernel* -y gmt* --refresh

Your system is upgraded.

Troubleshooting
---------------

Upgrade procedure hangs (v1.2)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
The "dnf upgrade" command uses the following three repository configuration files:

::

  /etc/yum.repos.d/gmt.repo
  /etc/yum.repos.d/gmt-updates.repo
  /etc/yum.repos.d/gmt-updates-testing.repo

These files currently point to both our internal build server (172.16.10.21) and external build server when looking for the relevant packages.

It seems that the upgrade process may hang on a long timeout when the system is unable to connect to the internal server, instead of immediately trying to update from the external server. To get around this problem, edit the .repo files and remove the internal server URL.

Also check the network connection to confirm that the system can connect to the external build server.

:ref:`[back to top] <upgrade>`
