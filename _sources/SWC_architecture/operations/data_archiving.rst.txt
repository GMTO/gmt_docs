.. _data_archiving_system:

Data Archiving System
---------------------

The GMT data archiving system (DAS) manages, stores, and distributes all data
products related to the operations of the observatory. The SWCS requirements as
derived from the System Level are shown in Table 10-41. All the data in the DAS
are maintained on-site at the observatory for operations, and are backed up in
at least one off-site location.

.. table:: SWCS Data Archiving Requirements (Level 3)
 
  +----------------------------+----------------------------------------------------------------+
  | | Title                    | | Statement                                                    |
  +============================+================================================================+
  | | Science and Engineering  | | The SWCS shall provide archival storage for science (raw and |
  | | data storage /archive    | | processed) and engineering data, and the capability to query |
  | | and access               | | and retrieve data.                                           |
  +----------------------------+----------------------------------------------------------------+
  | | User Documentation       | | The SWCS shall provide users with online guides and manuals  |
  | |                          | | for all equipment and facility instrumentation that is used  |
  | |                          | | during routine operations.                                   |
  +----------------------------+----------------------------------------------------------------+
  | | On-Line Context          | | The SWCS shall provide help, reference and user guide        |
  | | Documentation            | | information for users to access in a contextual manner.      |
  +----------------------------+----------------------------------------------------------------+
  | | On-Line documentation    | | The SWCS shall provide all the reference information and     |
  | |                          | | operation manuals to be accessible interactively by users.   |
  +----------------------------+----------------------------------------------------------------+
  | | Technical Documentation  | | The SWCS shall provide technical documentation in the form   |
  | |                          | | of manuals, drawings, and online tools to support operation, |
  | |                          | | maintenance, and repair of all instrument subsystems.        |
  +----------------------------+----------------------------------------------------------------+

The GMT DAS architecture is based on the client-server model where a server
maintains the data, manages their access, and performs processing needed to
complete requests, while clients make requests to the server to access the
archive for searching, retrieving, updating, deleting, or ingesting data. The
DAS is comprised of forward server, global server, trending server, and backup
server. The different servers have the following roles:

  * *Forward Server* -- The forward server manages the Phase I and Phase II
    telescope proposal preparations by astronomers and the TAC process,
    including exposure time calculations/simulations, proposal submission,
    observing design and specification, and proposal management.

  * *Global Server* -- Residing at the core, the global server has general and
    unrestricted access to data stored in the GMT data archive. The role of the
    global server is to manage transactions between different severs and the
    users. Access to the servers from the outside world is via clients that will
    have varying degrees of access to the database, depending on permission
    levels.

  * *Trending Server* -- The trending server organizes time-series data in the
    archive so that observatory applications can use the data to easily monitor,
    diagnose or improve performance behavior.

  * *Backup Server* -- The backup server provides the capability to create
    copies of the archived data to guarantee their integrity.

The DAS will store all operations data, including but not limited to: science,
engineering, facility and environmental repositories, which are discussed below.
Each type of data has a storage duration defined by the SLR, and based on
operation needs. Essential engineering and science data will exist for the
lifetime of the observatory (50 years), while for non-essential data the
duration may vary. However, it is a goal to provide permanent storage for all
engineering data, if feasible and cost effective. The DAS collections include:

  * **Science** -- Required by SCI-1130, the operational data archive stores any
    information produced in direct support of science observations that are
    applied to science data frames, affect their photometric calibrations,
    provide information about the observations, or facilitate the observing
    process. These include calibration images (biases, darks, flats), PSFs,
    off-sky, standard stars, etc. Science data archive also contains observing
    programs, such as proposals, observing setups, instrument configurations,
    observing sequences, observing logs (generated both by users and
    subsystems), exposure time simulations, etc. All science data are
    proprietary up to a specified period of time. The science data archive
    includes a custom area that will allow users to store observational
    configurations that may be recalled or reused in future observing runs. User
    archive collections can be defined as proprietary according to observatory
    data distribution policies. The categories of science data are:

      *Raw* -- Raw data directly from the telescope instruments prior to any
      manipulation or data rescaling. Raw data should have units that are the
      basic counting units of the detector, i.e., usually [electrons] or
      [electrons/ADU]. The images will have instrumental and observing artifacts
      (cosmic rays, hot pixels, dead pixels, dead columns, non-uniform
      illumination patterns) that have not been manipulated in any way.

      *Reduced* -- Data processed through basic data reduction steps, including
      bias, dark, etc., through the point of flatfielding, to account for primary
      instrumental signatures. Reduced images should have a uniform special
      illumination pattern, and corrections for pixel-to- pixel sensitivity
      differences. For spectroscopy, this entails linearizing the data in
      wavelength, spatially on detectors, and flux corrections.

      *Combined* -- Multiple sub-exposures of the same observational block, or
      unit, are combined in an optimal way for the purpose of increasing the
      signal-to-noise; removing cosmic-rays, saturation, bad pixels, etc. For IFU
      data, this involves transforming 2-D spectra into a 3-D data cube. This may
      include mosaic combinations, if doing so is necessary for removing
      instrumental signatures.

      *Calibrated* -- Places combined and/or reduced images onto a flux calibrated
      scale, using standard star observations.

      *High level* -- High-level data products include everything beyond
      calibration, and may be specified by the observer. Examples of high level
      data products are mosaic combinations, object or spectral feature
      extraction, data analysis, etc.

      *Observing Programs* -- Observing programs include Phase I science
      proposals, Phase II observation and instrument definitions, and instrument
      configuration setups.

      *Sequences* -- Observatory-wide sequences of the observations that a user
      may use and modify.

      *Pipeline Parameters* -- Observatory-wide parameters used for data or
      activity pipelines. Scripts: Observatory-wide scripts used for data
      reduction, analysis, or other purposes.

      *Logs* -- Observing and user logs. Observing logs have the same proprietary
      status as the parent data with which they are associated.

      *User Archive* -- User archive stores information about the users, such as
      their contact information, affiliation, proposals, etc. A user archive can
      also store observing notes, templates, scripts, pipeline parameters, data
      and models generated from exposure time calculations, and observing
      sequences that she/he may find useful to recall for future observations. The
      user archive is proprietary and can only be accessed by users and
      observatory personnel with correct permission settings. However, the archive
      can be shared between different users/visitors to allow collaboration when
      the owner grants appropriate permissions.

      *Documentation* -- Instruction manuals for carrying out science
      observations, including: data taking, archival access, remote observing,
      user interfaces, observing procedures, instrument

  * **Engineering** -- Engineering data archive stores information relevant to
    operation and maintenance of hardware and software. Engineering data
    originate from the telescope, science instruments, and other mechanical and
    electrical systems in the observatory, operating, and supporting facilities.
    Examples of engineering data include: telemetry, health status, logs,
    technical manuals, schematics, and other data from the telescope subsystems,
    science instruments, devices, etc. The broad category of engineering data
    includes:

      *Runtime Data* -- During runtime operations, the telescope and instruments
      generate telemetry, detector, and sensor information that are continuously
      and automatically monitored. In particular, telemetry data refers to all
      information that has time stamps. Examples of telemetry data include
      telescope motor encoder positions; instrument shutter status; filter wheel
      position status; AGWS correction rates; interlock and safety states;
      atmospheric seeing, etc. The health and performance of most devices and
      subsystems are monitored without human knowledge or participation. The
      process involves performing automatic analysis, generating operating
      statistics, and finally filtering the information for human operators to
      interpret. All raw and processed runtime data are stored in the
      engineering data archive.

      *Configuration Data* -- Configuration data are critical to the correct
      operation of the observatory. Configuration data include site information
      (elevation, longitude, latitude, etc.), lookup tables for telescope
      pointing, flexure models, coordinate transform matrices, geometric
      correction and transformation parameters, etc. It also includes:
      operational presets that are loaded into all telescope systems for
      initialization upon start-up, resets, or to change configurations during
      runtime operations; default parameters used by instruments, calibration
      pipelines, and sequences.

      *Logs* -- Engineering logs are reports entered by observatory staff
      (technical report, nightly reports, maintenance logs, etc.) or generated
      automatically by the telescope or instruments in the course of operations
      (nightly observational summary report, health status of all subsystems,
      devices, and components, errors). Observing logs are reported by observers
      and telescope operators that summarize the data that were obtained each
      night.

      *Documentation* -- Engineering documentation archive stores manuals,
      technical schematics, engineering notes, for all observatory components
      such as electronics, mechanical parts, devices, sensors, detectors,
      motors, etc.

      *Software* -- Software (code, scripts) that are both contributed by users
      for high level analysis or operations, and native to observatory
      operations are stored in the engineering archive.

      *Hardware* -- Hardware data include the health and status of the
      telescope, AO, all the subsystems, computers, environmental sensors,
      exhaust fans, communication network, observatory alarm systems, building
      and environmental sensors, system logs, etc. For environmental sensors,
      their status and health are part of facility hardware data, whereas the
      sensor readouts, e.g., temperature, wind speed, earthquake magnitude, and
      other weather-related data, are classified as environmental data.

  * **Facility and Environment Data** Facility and environment data support the
    operation of the telescope by monitoring the environment in which the
    telescope operates. Environmental data help to inform safety and enable the
    facility to cope with changing conditions (winds, clouds), and make
    decisions on the observing modes (AO, natural seeing). The data measure the
    conditions both in and outside of the telescope and facility enclosure. The
    categories of Facility environment data include:

      *Weather* -- Cloud coverage, wind speed and direction, humidity,
      temperature, pressure, rain condition. Some of the information is obtained
      from the national weather service stations.

      *Atmospheric* -- Turbulence: The OCD calls for monitoring of the
      atmospheric turbulence and seeing which may be monitored by a
      scintillation sensor.

      *Seismic* -- Earthquake

      *Ambient* -- Enclosure temperature, wind speed and direction, precipitable
      water vapor, dust level, sky brightness

 
