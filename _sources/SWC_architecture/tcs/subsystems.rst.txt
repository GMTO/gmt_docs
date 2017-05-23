
.. _tcs-subsystems:

Subsystems
----------

The previous section introduces the concept of Device Control Subsystems.  The
:ref:`Figure below <figure-tcs_subsystems_overview>` shows the TCS device
control subsystems, organized in functional categories. Each subsystem includes
the required software packages as described in :ref:`architecture-modules`.

.. _figure-tcs_subsystems_overview:

.. figure:: _static/tcs-subsystems-overview.png

   TCS Subsystems Overview

The description of TCS device control subsystems is included in the sections
describing the corresponding system under control in the System Level PDR.  The
Table below shows a list of these sections. Since this overview document can
only convey a limited detail, some design features have been omitted. However
they are available in the subsystem level preliminary design review documents.


.. table:: Index of TCS Subsystems References in System Level PDR

  +-------------------------------------------------+--------------------------------------------+
  | TCS Control Subsystem                           | Reference Section                          |
  +=================================================+============================================+
  | Pointing Kernel                                 | 10.3.2.4 Pointing Kernel                   |
  +-------------------------------------------------+--------------------------------------------+
  | Wavefront Control System                        | 10.3.2.5 Wavefront Control System          |
  +-------------------------------------------------+--------------------------------------------+
  | Enclosure Control System                        | 7.7.6 Controls                             |
  +-------------------------------------------------+--------------------------------------------+
  | Facilities Control System                       | 7.7.6 Controls                             |
  +-------------------------------------------------+--------------------------------------------+
  | Mount Control System                            | 6.6.7 Mount Control System                 |
  +-------------------------------------------------+--------------------------------------------+
  | GIR Control System                              | 6.6.7 GIR Control System                   |
  +-------------------------------------------------+--------------------------------------------+
  | M1 Control System                               | 6.7.7 Primary Mirror Control System        |
  +-------------------------------------------------+--------------------------------------------+
  | M2 Positioner Control System                    | 6.8.3 M2 Positioner Control System         |
  +-------------------------------------------------+--------------------------------------------+
  | FSM Control System                              | 6.8.5 FSM Control System                   |
  +-------------------------------------------------+--------------------------------------------+
  | M3 Control System                               | 6.9.4 M3 Controls                          |
  +-------------------------------------------------+--------------------------------------------+
  | AGWS Control System                             | 6.11.5 AGWS Control System                 |
  +-------------------------------------------------+--------------------------------------------+
  | Facility Calibration Control System             | 8.7 Calibration Systems                    |
  +-------------------------------------------------+--------------------------------------------+
  | ASM Control System                              | 8.3.5 Software Design                      |
  +-------------------------------------------------+--------------------------------------------+
  | LTAO Wavefront Sensor Control System            | 8.5.3 Laser Tomography Wavefront Sensor    |
  +-------------------------------------------------+--------------------------------------------+
  | NGAO Wavefront Sensor Control System            | 8.5.2 Natural Guide Star Wavefront Sensor  |
  +-------------------------------------------------+--------------------------------------------+
  | On-Instrument Wavefront Sensor Control System   | 8.5.4 On-Instrument Wavefront Sensor       |
  +-------------------------------------------------+--------------------------------------------+
  | Laser Acquisition Control System                | 8.4.4.2 Control System                     |
  +-------------------------------------------------+--------------------------------------------+
  | Laser Guide Star Unit Control System            | 8.4.4.1 Control System                     |
  +-------------------------------------------------+--------------------------------------------+
  | Phasing Camera Control System                   | 8.6.1 Phasing Camera                       |
  +-------------------------------------------------+--------------------------------------------+
  | M1 Edge Sensors Control System                  | 8.6.2 M1 Edge Sensors                      |
  +-------------------------------------------------+--------------------------------------------+
  | M2 Edge Sensors Control System                  | 8.6.3 M2 Edge Sensors                      |
  +-------------------------------------------------+--------------------------------------------+
  | AO Calibration Stand Control System             | 8.7.1 M2 Calibration Facility              |
  +-------------------------------------------------+--------------------------------------------+
  | AO Interferometer Control System                | 8.7.5 AO Calibration Interferometer        |
  +-------------------------------------------------+--------------------------------------------+
  | Environmental Control System                    | 5.4.2.3 Environmental Monitoring Facility  |
  +-------------------------------------------------+--------------------------------------------+
  | ISS Control System                              | 5.11.5 Interlock and Safety System         |
  +-------------------------------------------------+--------------------------------------------+
  | Electronic Cabinet Control System               | 5.4.2.1 Standard Electronics Cabinets      |
  +-------------------------------------------------+--------------------------------------------+

