.. _io_fwk_guide:

I/O Framework user guide
========================


EtherCAT
========

According to GMT software architecture, EtherCAT is the only supported fieldbus technology for devices within the
observatory. Any other types of fieldbuses can be supported in case by case basis.

Most DCS applications are required to control mechanical degrees of freedom. The Software and Control Standards specify
the use of the EtherCAT fieldbus. EtherCAT motion drives provided the implementation of motion profiles defined in the
IEC 61800-7-201 standard [IEC61800-7-201]. As in many cases the control function can be offloaded to the motion drives,
the goal of the Device Control Framework is to standardized the representation of the data structures that are used by
the I/O framework to communicate with the motion drives. These data structures are being modeled as DataTypes of
dedicated Hardware Adapter ports.

EtherCAT Diagnostics
--------------------

https://www.ethercat.org/download/documents/EtherCAT_Diagnosis_For_Users.pdf

EtherCAT datagram capture for debugging
---------------------------------------

Since the EtherCAT datagram is a common Ethernet frame, it can be captured by Ethernet packet capture tools. Wireshark
is very useful for troubleshooting EtherCAT communication. It can be downloaded from `here <https://www.wireshark.org/download.html>`_.

Caputuring EtherCAT datagrams requires a capture device that can be connected to the EtherCAT network. Examples of capture devices are:

- An EtherNET switch with port mirroring capabilities (see `example <https://www.kollmorgen.com/sites/default/files/How%20to%20capture%20and%20use%20WireShark%20trace%20data%20with%20EtherCAT%20applications.pdf>`_)

- An Industrial EtherNET multi-channel probe like `ET2000 <https://www.beckhoff.com/en-en/products/i-o/ethercat-development-products/elxxxx-etxxxx-fbxxxx-hardware/et2000.html>`_, from Beckhoff.

- Using a debug interface from the EtherCAT master (see igh EtherCAT master `documentation <https://gitlab.com/etherlab.org/ethercat/-/blob/420e6150f55b71b97a84c64831f4928e0859a0e9/documentation/ethercat_doc.tex#L2915-2969>`_ for details)


EtherCAT hardware adapter
-------------------------

The EtherCAT hardware adapter is a software component that provides the interface between the EtherCAT master and GMT
SDK components. It translates the EtherCAT datagrams into GMT data structures and vice versa.
The EtherCAT hardware adapter is responsible for the EtherCAT master initialization and configuration. It also provides
interfaces for reading and writing PDOs and SDOs.

EtherCAT hardware adapter fieldbus configuration file
-----------------------------------------------------

The EtherCAT hardware adapter is configured using a fieldbus configuration file. The fieldbus configuration file defines
the EtherCAT network topology and the PDOs and SDOs that are used by the EtherCAT devices.

The fieldbus configuration file is a CoffeeScript file that contains the following sections:

Master
^^^^^^

Configures the EtherCAT master. The following parameters can be configured:

- id: The EtherCAT master ID. To be used in another sections to refer to the master.
- rate: The EtherCAT master cycle rate in Hz. Note: the master configuration is not fully implemented yet. See `issue <https://github.com/GMTO/gmt_issues/issues/228>`_.

Example:

.. code-block:: coffeescript

    master:
      id: 0
      rate: 1000

Domains
^^^^^^^

Configures the EtherCAT domains. A domain is a set of EtherCAT devices that are synchronized together, and a master can
have multiple domains. The following parameters can be configured:

- id: The domain ID. To be used in another sections to refer to the domain.
- master: The EtherCAT master ID that the domain belongs to.
- rate_factor: The domain cycle rate factor. The domain cycle rate is calculated as the master rate divided by the rate factor.

Example:

.. code-block:: coffeescript

    domains:
      - id: 0
        master: 1
        rate_factor: 1


EtherNET over EtherCAT (EoE) support
-------------------------------------

The EtherCAT hardware adapter supports the EtherNET over EtherCAT (EoE) protocol. The EoE protocol allows EtherNET devices
in the field to communicate the DCS with the packets encapsulated in EtherCAT datagrams. The IgH EtherCAT master supports
the EoE protocol without any additional configuration required in the EtherCAT hardware adapter.

To use the EoE protocol, a virtual network interface must be created in the DCS. The virtual network interface is created
with following naming convention:

    - eoeXsY: for a slave without an alias address, where X is the master index and Y is the slave's ring position, or

    - eoeXaY: for a slave with a non-zero alias address, where X is the master index and Y is the decimal alias address.

We recommend referencing the EtherCAT slave by its alias address, as it is more robust to changes in the network topology.

The virtual network interfaces can be configured using the NetworkManager tools. The following commands can be used to
create and configure the virtual network interfaces (supposing the virtual network interface is named `eoe0a222` for an
I/O module with alias address 222):

    .. code-block:: bash

        nmcli con add type ethernet ifname eoe0a222 con-name eoe0a222 ip4 10.10.10.1/24 gw4 10.10.10.1

For more reference on the EoE support, see the `IgH EtherCAT master documentation <https://gitlab.com/etherlab.org/ethercat/-/blob/4f529ade671ac60602a72168b368668f39c0855c/documentation/ethercat_doc.tex#L2036-2238>`_.

Serial over EtherCAT (SoE) support
-----------------------------------

The EtherCAT hardware adapter supports the Serial over EtherCAT (SoE) protocol. The SoE protocol allows the creation of pseudo terminal
ports in the DCS that are connected to the EtherCAT network. The EtherCAT hardware adapter supports the SoE protocol
with some additional configuration required in the EtherCAT hardware adapter. An example of the SoE configuration can be found in the
Hardware Development Kit (HDK) DCS example configuration
`example <https://github.com/wschoenell/ocs_hdk_dcs/tree/soe/src/etc/conf/hdk_soe_ctrl_pkg/hdk_soe_ecat_hw_adapter>`_.

SoE configuration
^^^^^^^^^^^^^^^^^

The SoE can be configured in the EtherCAT hardware adapter configuration file on the
`serial_over_ethercat_cfg <https://github.com/GMTO/ocs_hdk_dcs/blob/4bb1cdfa5e64b72c59a3849633da392c5ec2147c/src/etc/conf/hdk_soe_ctrl_pkg/hdk_soe_ecat_hw_adapter/hdk_soe_ecat_hw_adapter_default_conf.coffee#L5-L22>`_
property.


The configurable parameters are:

- `pty_filename`: The pseudo terminal device file name. When the SoE is enabled, the EtherCAT hardware adapter creates a
  pseudo terminal device symbolic link in the DCS. The symbolic link points to the actual pseudo terminal device file.

- `baud_rate`: The baud rate of the device connected to the serial port in the EL6002 terminal.

- `rtscts`: The RTS/CTS flow control. The possible values are `true` or `false`.

- `dataframe`: The data frame of the device connected to the serial port in the EL6002 terminal. The possible values are
  `_7E1`, `_7O1`, `_8N1`, `_8E1`, `_8O1`, `_7N2`, `_7E2`, `_7O2`, `_8N2`, `_8E2`, `_8O2`. Note that the dataframe configuration
  must start with an underscore `_` followed by the number of data bits, the parity bit, and the number of stop bits due to the
  CoffeeScript syntax.

also, the fieldbus configuration has to be updated for the plant configuration in the following way:

- `model file <https://github.com/GMTO/ocs_hdk_dcs/blob/4bb1cdfa5e64b72c59a3849633da392c5ec2147c/model/hdk_soe_ctrl_pkg/hdk_soe_ecat_hw_adapter.coffee#L3>`_

- `fieldbus configuration file <https://github.com/GMTO/ocs_hdk_dcs/blob/4bb1cdfa5e64b72c59a3849633da392c5ec2147c/src/etc/conf/hdk_soe_ctrl_pkg/hdk_soe_ecat_hw_adapter/hdk_soe_ecat_hw_adapter_fieldbus_conf.coffee#L3>`_

Transfer rates
^^^^^^^^^^^^^^
(extracted from EL6002 documentation)

The terminal has a process image of 22 bytes of user data. It possible to transmit or receive these 22 bytes every second cycle at the most.
The data is transferred from the terminal to the controller in the first cycle. In the second cycle, the controller must acknowledge that it has accepted the data.
Therefore, if the cycle time is 10 ms, 50 times 22 bytes can be transmitted per second.
With a set data frame of 8N1, each transmitted byte consists of a start bit, eight data bits and a stop bit. This is equivalent to 10 bits per user byte.
With the above mentioned settings, a continuous data transfer rate of: • 50[1/s]*22[Byte]*10[Bit] = 11000 bps
can be achieved.
The next lower baud rate is 9600 baud. Accordingly, continuous transfer at a maximum baud rate of 9600 can be secured with a cycle time of 10 ms.

Therefore, for a maximum baud rate of 115200bps, the EtherCAT hardware adapter must be configured with a frequency of at least 1050 Hz.


SDOS
----

SDOs can be written to or read from the EtherCAT devices using the following methods:

  .. code-block:: cpp

    write_all_sdos();
    new_sdo_write_async_handler();
