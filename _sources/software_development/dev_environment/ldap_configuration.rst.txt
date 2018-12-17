.. _ldap_configuration:

User Authentication using LDAP
==============================

Managing user credentials in a centralized server allows developers to log into any development machine without the need to duplicate the configuration for each new machine.

Official Fedora Documentation for setting up a Directory Server using OpenLDAP can be found here: 

https://docs.fedoraproject.org/en-US/fedora/f28/system-administrators-guide/servers/Directory_Servers/index.html

The following instructions are for configuring **development machines** to use the LDAP server on the network and should be seen as an example to be tailored to the actual network it's running on.

1. Install the necessary packages as root

  .. code-block:: bash

    $ dnf install -y openldap-clients sssd

2. Edit ``/etc/openldap/ldap.conf`` and set the following options:

  .. code-block:: bash

    URI ldap://<ldap_server_ip>/
    BASE dc=gmto,dc=org

  where ``<ldap_server_ip>`` is the IP Address of the LDAP server and ``dc=gmto,dc=org`` should reflect the configuration in the LDAP server.

3. Create file ``/etc/sssd/sssd.conf`` and set the following options:

  .. code-block:: bash

    [domain/default]
    id_provider = ldap
    autofs_provider = ldap
    auth_provider = ldap
    chpass_provider = ldap
    ldap_uri = ldap://<ldap_server_id>/
    ldap_search_base = dc=gmto,dc=org
    ldap_id_use_start_tls = False
    ldap_tls_cacertdir = /etc/openldap/certs
    cache_credentials = True
    ldap_tls_reqcert = allow

    [sssd]
    services = nss, pam, autofs
    domains = default

    [nss]
    homedir_substring = /home

  where ``<ldap_server_ip>`` is the IP Address of the LDAP server and ``dc=gmto,dc=org`` should reflect the configuration in the LDAP server.

4. Enable sssd

  .. code-block:: bash

    $ chmod 600 /etc/sssd/sssd.conf
    $ systemctl restart sssd oddjobd
    $ systemctl enable sssd oddjobd

5. Optionally, use LDAP to grant sudo access to developers within a group. This needs to be configured correctly on the LDAP server. For example, if a group has been defined in the LDAP server with name %dev, containing all the developers that may access this machine, add the following line to the ``/etc/sudoers`` file via ``visudo``. This command needs to be run as root.

  .. code-block:: bash

    %dev ALL=(ALL)   ALL

Alternatively, configure sudo access for specific users only.

:ref:`[back to top] <ldap_configuration>`
