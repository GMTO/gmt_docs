.. _laser_ao_operations_safety:

Laser AO Operations Safety
--------------------------

Operating a laser guide star facility has several implications on the overall
operation of the GMT observatory. They include:

  * Safety and regulations. To prevent propagation of the laser beacons onto
    flying aircrafts, satellites, the International Space Station or other
    non-disclosed objects.

  * Observatory policies. To avoid laser light contaminating neighboring
    telescopes field of view.

The SWCS Laser AO Safety Requirement is given by SWC-6881 Safety Standards and
Codes: to comply with safety standards and codes as defined in GMT-SE-REF-00229.

Laser AO Operation Safety involves aircraft, laser traffic, and spacecraft
safety elements, the relations between which are shown in the Figure below. The
subsystems are discussed in the following subsections.

.. _laser_ao_safety_integration:

.. figure:: _static/laser_ao_safety_integration.png

    Integration of the Aircraft, Laser Traffic, and Spacecraft, Safety
    subsystems. (1) LGS targets stored in the Observing database are sent to the
    Laser Clearing house for approval a few days before observation, (2) the
    Scheduler updates the night plan based on LGH clear windows, (3) the
    Sequencer retrieves observation for execution by the TCS, (4) the All-sky
    camera and VITRO systems monitor in real- time safe propagation while the
    Laser Traffic Control System checks the collision likelihood with other
    telescopes and feeds back predictions, (5) alarm shutters the lasers and
    orderly open the AO loops; the sequencer is notified to pause the execution
    until observations can be resumed.

*Aircraft Safety*
.................

**VITRO**

  `The VITRO system
  <http://www.dgac.gob.cl/portalweb/dgac/acercaDeLaDGAC/sistemaAeronauticoNacional/tecnologia>`_
  (Visualización de Tránsito Aéreo Oceánico) shows in real-time a feed of aircraft locations,
  with their altitude, velocity and flight direction, similar the one used by
  air traffic controllers. The VITRO system is available from accredited vendors
  by the Chilean Dirección General de Aeronáutica Civil (DGAC), the Chilean
  equivalent of the Federal Aviation Administration (FAA) in US. GMTO will
  contract with VITRO system vendors to provide the system, and to explore the
  possibility of interfacing with the data feed. This could allow for automation
  of the telescope control system to trigger appropriate alarms and shuttering
  of the laser beacons in the event of an impending collision between a laser
  beam and an aircraft.

**All Sky Cameras, Boresight Cameras**

  Complementary systems (e.g., all-sky and boresight cameras) have been
  successfully deployed by other observatories to provide additional aircraft
  detection redundancy. GMTO will explore deploying similar systems for its
  laser guide star operations. An all-sky camera system takes continuous images
  of the night sky to search for aircrafts, using exposure times that are
  sufficiently long (typically 3s.) for airplanes to leave a trail on the sensor
  image. A data pipeline then processes the images to detect streaks left by
  bright moving objects over consecutive frames. Fitting trajectories to the
  streaks can then help to discard false-positives. The resulting detections
  will be assigned a level of severity depending on the aircraft distance to the
  laser constellation and time to collision, estimated from velocity vectors.
  Alarm severity levels will be handled accordingly by the telescope control
  system or interlock control system, e.g., NOTICE on detection but no collision
  (typically airplanes flying at horizon) WARNING (airplane on course to
  collision) SHUTTER (airplane entered the safety collision cone around the
  laser constellation). An additional possibility is to use a boresight camera
  system, which would work in a similar way, using an IR camera on a smaller
  field of view, and centered on the vicinity of the LGS constellation.

  These auxiliary systems send detection events and alarms to the logging system
  and the telescope control system and/or interlock system for appropriate
  action. For example, audible and visual signals may alert the telescope
  operator when there is a detection, or an automated command may trigger laser
  shuttering when an aircraft is in the critical zone.


*Laser Traffic Safety*
......................

GMT laser guide stars operate at 590 nm and may hinder neighboring sites
observing in that regime. The laser traffic control system (LTCS), originally
deployed by Keck circa 2001, was developed to address the potential for
telescopes to “cross beams” while propagating laser guide stars. The system is
currently deployed at several major observing sites including Mauna Kea, Roque
de los Muchachos, Cerro Pachon, Cerro Paranal, and Haleakala [Summ12]_. The
system is a straightforward way to adapt, configure, deploy and operate
[DOrg12]_.

Distributed among participating telescopes, the LTCS collects pointing data,
laser propagating and laser impact status for all the telescopes. The
information is made available by all the telescopes at predefined URLs. The LTCS
predicts whether beam collision will occur between observatories based on a
geometric model of the telescopes and their pointing field of view. While the
specific pointing data of the telescopes may be proprietary and are thus not
available to the operators, the LTCS has a GUI that informs telescope operators
at once if a beam collision will occur. If crossing is deemed imminent, the LTCS
provides a visual countdown via a “Status and Alarm Summary” screen and will
shutter the laser via the interlock system at the crucial moment. However, if
the observations are not laser sensitive, operators can override the LTCS (with
a phone call confirmation), allowing laser operations to proceed in the area.
The system provides additional capabilities, e.g., time to collision, slew
prediction, etc., allowing tight integration into the TCS and early contingency
planning.


*Spacecraft Safety*
...................

Rules governing satellite avoidance have been described in several
publications10. Basic compliance requires the observatory to send a list of LGS
targets a few days in advance, and to obtain clearance, from the Laser
Clearinghouse (LCH). The process is handled by e-mail using a data format that
can seamlessly integrate into the observatory database, planning tool, and
sequencer.

The LGS targets are stored in the observing database. A few days before an LGS
run an automated process retrieves a list of candidate targets and their
observability window from the database, and then sends a Predictive Avoidance
Request Message (PRM) by email to LCH for approval, following a pre-established
format. The list of targets, processed by the LCH, returns to GMT ahead of the
run in a Predictive Avoidance Message file (PAM) showing the allowed times of
propagation for each requested telescope position. The satellite’s position
should not fall within the laser avoidance cone, which factors in a 0.25 degree
uncertainty (half-angle) for laser pointing plus an additional margin defined by
the LCH. When a satellite passes within the laser avoidance cone, a shutter
window is shown in the PAM. A software tool that updates the observing database
with clearance information ingests this file. The scheduling system accesses the
list of authorized targets and time window to make proper adjustments to the
schedule.

During an observation, the sequencer and the status human-machine interface
(HMI) implement a real-time alarm and a timer that counts down toward laser
shuttering. The Interlock and Safety System would safely shutter the laser
system 10 seconds before an actual shuttering event. At laser shutter, the
sequencer should gracefully stop an LGS observation and, even long before,
inform the observer of alternative observation strategies, e.g., wait if the
window is short, move to another clear target, consult the scheduler for a
better alternative, etc..



