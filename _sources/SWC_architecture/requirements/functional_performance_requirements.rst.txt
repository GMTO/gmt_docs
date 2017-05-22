.. _functional_performance_requirements:


*Functional and Performance Requirements*
.........................................

**Operational Requirements**

  For the telescope to meet requirements for science and operational efficiency
  the SWCS needs to safely control, automate and coordinate most subsystems to
  act in parallel or in sequence.

  Operational requirements range from operation modes (classical, queue, etc.),
  to observing modes (AO, natural seeing), to instruments, and efficiency. These
  and other areas and their requirements are summarized below:

  * *Operational Modes* -– Operational modes involve classical, queue, service,
    intherrupt, and remote observing, as required by the OCD and the SRD.
    Technical demands of the science programs often dictate which observing
    modes are the most suited. While most science programs benefit most from
    queue observing, "targets of opportunity" will require interrupt or remote
    observing modes. In contrast, some experimental, pilot, or high risk/high
    reward programs may benefit from classical observing. Operational modes
    affect the efficiency of both observatory operations and science, in terms
    of scheduling flexibility and instrument readiness requirements. In
    addition, the SWCS is required to operate the telescope with a partial
    complement of primary and/or secondary mirrors, which will require
    customized alignment, calibration, and phasing procedures.

  * *Observing Modes* -– The SWCS provides the capability to observe under
    natural seeing without any adaptive optics, as well as diffraction limited
    modes using natural and laser guide star adaptive optics to correct
    wavefront errors in the images delivered to the focal plane. The required
    observing modes are: Natural Seeing (NS), Ground Layer Adaptive Optics
    (GLAO), Natural Guide Star AO (NGSAO), and Laser Tomographic AO (LTAO). For
    details on these AO modes, refer to the Adaptive Optics section in SLPDR.
    The SWCS is required to monitor observing conditions and, as conditions
    change, to provide the capability to switch between different observing
    modes and different optical configurations.

  * *Instrument Operation* -– The OCD requires that instruments mounted at any
    of the ports can be deployed for use on any given night. The instrument
    ports include four Direct Gregorian ports in the GIR, three Folded Ports on
    top of the GIR, one Gravity Invariant station on the azimuth disk, one
    future Instrument Platform station on the non-rotating IP, and two Auxiliary
    Instrument ports on the elevation axis outside of the C-rings. The SWCS
    design provides standardized connections to all science instruments,
    maintain the readiness of all active instruments, and provide the capability
    to operate and switch an active instrument set during the night. Switching
    instruments will require the SWCS to automate the process (inserting or
    removing M3 and corrector-ADC, adjusting focus, etc.), and to monitor that
    different instruments do not interfere or vignette the fields of view.

  * *Availability and Startup* –- The operational state of the observatory and
    equipment must be precisely defined and, at any given moment in time, be
    known due to considerations for operations and safety of the staff and
    sensitive equipment. The Figure below shows the observatory states (off,
    environmentally controlled, standby, on) and processes (cold, warm, and
    standby starts).

    .. figure:: _static/observatory_operational_states.png

        Observatory Operational States

    An off state is when: all power is removed from the system, mechanical
    assemblies are properly parked, enclosure shutters are closed, and the
    software is in an inactive state. An environmentally controlled state is
    achieved when the system has reached its nominal operating temperature or
    pressure. A Standby state is reached when the system has achieved a high
    state of readiness to be used, and calibrations have been performed. An On
    state is achieved when the system has achieved full performance specs and is
    in normal operation.

    In most situations, the SWCS will provide the capability to automatically
    execute start-up and shutdown processes that are initiated, monitored, and
    controlled by an operator. Requirements are specified for the amount of time
    to achieve a certain state for the telescope and the AO system.

  * *Blind Pointing* –- Blind pointing is used to (re)position the telescope to
    within the capture range of the acquisition/guide sensors relying solely on
    the accuracy of the mechanical encoders and flexure tables, without
    referencing a bright star or science target with known coordinates. The SWCS
    is required to provide the capability to initialize and calibrate the
    pointing system from cold start, or on-the-fly, by acquiring a position
    reference target using an acquisition camera. The initial blind pointing
    accuracy for GMT is 10 arcsec RMS, with a goal of 5 arcsec. After initial
    pointing for the night, subsequent blind pointings are required to be better
    than 5 arcsec RMS over the full range of the telescope motion, with a goal
    of 3 arcsec. The SWCS will provide the capability to comply with pointing
    budgets that are allocated and related to software and hardware controls as
    given by GMT Pointing Budget (GMT-SE-REF-00477).

  * *AGWS Pointing* –- After stars are acquired by the AGWS, systematic pointing
    errors typically shrink to a size smaller than the natural seeing FWHM. The
    amount of residual offset errors depends on guide star brightness, location
    in the focal plane, the length of time averaging on the guide sensors, and
    differential flexure between the AGWS and the instrument. The pointing
    accuracy requirements are specified at the intersection of the telescope
    reference optical axis (ROA) and the instrument focal plane. For natural
    seeing, the GMT should achieve pointing accuracy to better than 0.2 arcsec
    at the DG ports, averaged over one second. At the center of a Folded Port
    science instrument, the requirement relaxes to 1 arcsec, to allow for
    relative flexure with M3. Differential flexure between the Telescope ROA and
    the Instrument ROA will add to the AGWS pointing uncertainty. The SWCS will
    provide the capability to calibrate and correct differential flexure between
    the AGWS and/or AO wavefront sensors, using guide sensors in the science
    instruments, and to maintain compliance with pointing budgets given by GMT
    Pointing Budget (GMT-SE-REF-00477).

  * *Tracking, Guiding, and Scanning* -– During science observations, the
    telescope structure, GIR, and guiders will move along specified trajectories
    to track the sky or to guide on objects at sidereal or non-sidereal rates.
    Tracking involves using pre-determined telescope mount and GIR encoder
    motion rates to track the rotation of the sky without a guide star. Guiding,
    in which pointing feedback comes from one or more off-axis guide stars, is
    necessary to compensate for pointing model errors and wind perturbations of
    the telescope structure and optics. When guiding sidereal astronomical
    targets, the AGWS probes are either fixed or may move around the telescope
    optical axis if GIR rotation is disabled. Guiding for non-sidereal targets
    requires the telescope to track along a non-sidereal trajectory, while the
    AGWS probes move along either linear or more complex trajectories. The same
    is true in the NGSAO and LTAO observing modes, in which the AGWS does not
    provide the fundamental pointing reference but is used to control
    field-dependent aberrations. In these modes, either the non-sidereal target
    itself, or an off-axis guide star on the On-Instrument Wavefront Sensor
    (OIWS, which must be steered along the predicted non-sidereal trajectory)
    provides the guiding feedback.  Continuous / Drift Scanning is a
    non-sidereal tracking mode where the telescope moves at a set rate relative
    to sky rotation as the science instrument integrates on the data and reads
    out at a predetermined rate. The SWCS will provide capabilities to track,
    guide, and scan, at sidereal and non-sidereal rates.  The GMT is required to
    guide/track on an object with apparent motion of less than 6 arcsec/min
    (with a goal of 20 arcsec/min) relative to the sky rotation.  The SWCS will
    comply with image quality requirements given by Natural Seeing Image Quality
    Error Budgets (GMT-SE-REF-00145) and AOS IQ Error Budget (GMT-AO-REF-00518)
    under AO observing modes.

    In addition to standard sidereal tracking and guiding modes, the SWCS will
    operate in several other more specialized modes. For certain science
    observations it may be necessary to guide on a science target by holding the
    GIR fixed (e.g., extrasolar planet imaging), up to 60 degrees without
    rotation, or by rotating it at particular rates (e.g., to maintain
    parallactic angle). For continuous, or drift, scan mode, the SWCS will
    provide a guided mode for linear scanning at any specified angle, with a
    drift rate that is selectable up to a maximum, and up to a travel distance
    limited by the guiders.

  * *Offsetting* -– An offset is where the telescope repositions by a small amount
    typically without having to reacquire a guide star. Several variations on
    the theme that are commonly used are "Nodding," "Dithering," and "Step and
    Integrate." The SWCS will provide capabilities to perform offsets of those
    and other types, with varying complexity on the patterns, and to coordinate
    observations after performing offsets. The offset distance has an absolute
    maximum of 3 arcmin. The SWCS will provide the capability to achieve
    relative offsets with overall accuracy requirements that comply with the
    allocations in GMT Pointing Budget (GMT-SE-REF-00477).

  * *Acquisition* -– Target acquisition is used for: telescope guiding, stacking
    the 7 telescope apertures, active optics corrections, adaptive optics
    corrections (natural and laser guide stars), and positioning science
    targets.  The SWCS will provide the capability to select and acquire
    observing targets, with acquisition times that comply with GMT Efficiency
    Budget (GMT-SE-REF-00593).

  * *Guiding and Active Optics* -– After guide star acquisitions, the telescope
    guides and delivers natural seeing corrected images to the instruments
    and/or AO system. During observations, the Active Optics (AcO) use guide
    stars to align the optics, collimate the telescope, and control the mirror
    figure for the primary mirror. The SWCS will enable AcO corrections after
    the end of the telescope slew motion. The SWCS should also allow telescope
    guiding even with AcO disabled. The SWCS will also monitor the active optics
    probe positions to prevent shadowing of the science DG narrow field, as well
    as < 20% of the DG wide field, during observations. Lastly the SWCS will
    monitor, and prevent, potential interference and collisions of the AGWS
    guide probes.

  * *Efficiency* –- Efficiency requirements influence the design of the SWCS by
    affecting the sequence of activities (performed in parallel or in series),
    and the partitions of time or error budgets. All efficiency requirements are
    passed onto, or identified, by the SWCS at Level 5 after other GMT subsystem
    requirements are better refined at Level 4. At Level 3, the SWCS has a
    requirement to later identify and define execution sequences for
    instruments, telescope, and science operations to optimize on-sky observing
    efficiency, so as to comply with GMT Efficiency Budget (GMT-SE-REF-00593).

  * *Calibration* -– Calibration requirements ensure that the system performs
    reliably, accurately, and consistently. The SWCS will provide the capability
    to support the calibration of all subsystems and instruments in active or
    ready state, and the calibration of all wavefront sensors during daytime
    prior to the start of observing. All GMT instrument calibrations must comply
    with GMT Efficiency Budget (GMT-SE-REF-00593). For AO, WFS calibrations
    occur during daytime; the amount of time allocated for calibrations for both
    routine and non-routine operations will be dictated by AO Calibration
    Efficiency Performance Budget document (GMT-AO-REF-00515).

**Thermal Control Requirements**

  Thermal control requirements manage the heat dissipation in the telescope
  chamber. Thermally conditioned electronic cabinets are used to control heat
  dissipation from electronic sources. The SWCS is required to remotely control
  these cabinets to keep their heat dissipation in the telescope chamber to less
  than 10 watts per square meter.

**Architectural Requirements**

  Software architecture pertains to the organizational structure; the components
  and their relationships; the properties of both; and the semantics necessary
  for understanding or reasoning about the system. Software Architectural
  Requirements establish the high level structure of the observatory software
  system. The SWCS Architectural Requirements are divided into and elaborated in
  the sections below.

  * *General* -– General requirements outline the high level command and control
    structure of the SWCS. The software architecture is based on a component
    model organized in a hierarchy of control and supervision. The SWCS will
    provide central control for every subsystem, and the capability to switch
    between central and local control. To facilitate efficiency in maintenance
    and operations, the SWCS must be able to discover, navigate, and access any
    feature provided by a software component, from a central location.

  * *User Profiles* -– To enable users to perform their functional roles, the
    SWCS defines several levels of access, including the telescope operator,
    instrument specialists, AO specialist, and astronomers, with appropriate and
    consistent graphical user interfaces appropriate for each use case.

  * *Telescope Control* -– At Level 3, the telescope control requirements for
    the SWCS remain at high level, requiring that all subsystems have a standard
    behavior, and that the SWCS provides control for all optical and mechanical
    degrees of freedom. The notion of “Control” includes functions like:
    physical control, logic, sensor reading (optical, mechanical, pressure,
    temperature), commands, diagnosis, calibration, safety, configuration,
    monitoring, or fault management. The SWCS is required to contribute to the
    performance of the system to within the error budget allocations. In
    addition, electronic cabinets in the enclosure should contain only equipment
    that requires short electrical connections to field elements. Remote
    input/output modules should be used whenever possible. The SWCS is required
    to use fiber optic cables that provide electrical isolation when needed.

  * *Observatory Operations* -– Observatory operations involve observations
    management and execution, and data management. Briefly:

      Observation Management and Execution -– From the SLR, the SWCS is required
      to provide tools to assist astronomers in the proposal process to define,
      plan, and execute observing programs. The SWCS will facilitate observing
      by implementing sequences that allow astronomers and operators to automate
      complex operations. The SWCS must also provide the capability to schedule
      and manage observatory workflows and tasks, and monitor the observing
      status of programs. Lastly, the SWCS will implement tools to assess and
      validate data quality.

      Data Management –- Data management requirements call for providing: a data
      archive system for collecting, storing, and retrieving all data acquired
      during observations, including metadata, for the lifetime of the
      observatory; methods to generate data bundles (engineering, science,
      calibration, etc.); a method to group, access, and query science,
      engineering, and telemetry data from the engineering archive; and a
      capability to distribute data offsite.

  * *Observatory Services* -– Observatory services include common
    infrastructure, networking, time synchronization, and data storage systems.
    The requirements for those services are briefly:

      Common Services -– Telemetry, system health assessment, log system,
      configuration management and alarm systems are commonly present in all
      subsystems and components. The SWCS will provide centralized capabilities
      to implement and monitor those services. The SWCS will also provide users
      a universal way to gather information, via visualization displays, or an
      ability to search on existing observatory subsystems for the presence of
      software and hardware components, and their available commands.

      Networking –- The SWCS provides the following networking infrastructure to
      support different levels of quality-of-service and scalability: low
      latency control network, ultra- low latency network to enable GMT
      wavefront control modes, high bandwidth bulk and streaming data transfer,
      industrial Ethernet fieldbus; fiber optics connection between electronic
      room and equipment in the enclosure and telescope; and redundant network
      cabling connection between mission critical components.

      Time Synchronization -– Time synchronization is fundamental to observatory
      operations. The SWCS will coordinate the operations of subsystems to
      within time budgets allocated by the SLR. The SWCS will also obtain and
      serve observatory-wide accurate time references.

      Storage –- Storage requirements define the need for different types of
      storage: non- permanent local storage, transient, permanent, and backup.
      Critical engineering data and permanent data backup will exist for the
      lifetime of the observatory. The SWCS will provide a high bandwidth
      storage network for data access.

**Interface Requirements**

  SWCS shall comply with Internal, Telescope, AOS, Instrument, Facilities,
  Enclosure, Interlock and Safety System and System Services interface control
  documents (ICD). The SWCS main interfaces have been identified and the
  corresponding interface control documents are summarized in the Table below.
  The overall strategy for interface specification is described in Sections
  on :ref:`architecture-development` and :ref:`subsystem_specification_and_modeling`.

.. table:: Software and Controls ICDs (sorted by SWCS PBS)

  +-----------------------------+--------------------------------------------------------------------+
  | ICD Number                  | ICD Name                                                           |
  +=============================+====================================================================+
  | GMT-3.0_6.1.1-ICD-00629     | Software and Controls to GMTIFS ICD                                |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.2.1-ICD-00630     | Software and Controls to GMACS ICD                                 |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.2.2-ICD-00631     | Software and Controls to MANIFEST ICD                              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.3.1-ICD-00632     | Software and Controls to G-CLEF ICD                                |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.2-ICD-00594     | Software and Controls to M1 Subsystem ICD                          |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.7.2.6-ICD-00595 | Software and Controls to M2 Positioner Assembly ICD                |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.1-ICD-00596     | Software and Controls to FSM Subsystem ICD                         |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.7.2.7-ICD-00597 | Software and Controls to M2 Baffles ICD                            |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.5-ICD-00600     | Software and Controls to M3 Subsystem ICD                          |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.7-ICD-00539     | Software and Controls to Mount Subsystem ICD                       |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.4-ICD-00599     | Software and Controls to GIR Subsystem ICD                         |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.3-ICD-00598     | Software and Controls to Corrector-ADC Subsystem ICD               |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_4.1.6-ICD-00601     | Software and Controls to Acquisition, Guide and Wavefront          |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_6.6-ICD-00633       | Software and Controls to Facility Calibration System ICD           |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_7.3.4-ICD-00496     | Enclosure Control System to Enclosure Building Control System ICD  |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_7.3.4-ICD-00492     | Software and Controls to Enclosure Building Control System ICD     |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_2.2-ICD-00634       | Software and Controls to GMT Environmental Monitoring Facility     |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_2.1-ICD-00635       | Software and Controls to Interlock and Safety System ICD           |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.1-ICD-00433       | Software and Controls to Adaptive Secondary Mirror System ICD      |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.2.3-ICD-00183     | Software and Controls to VWS Support Subsystem ICD                 |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.2.1-ICD-00436     | Software and Controls to Natural Guide Star WFS Subsystem ICD      |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.2.2-ICD-00437     | Software and Controls to Laser Tomography WFS Subsystem ICD        |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.3-ICD-00435       | Software and Controls to On-Instrument WFS System ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.5.1-ICD-00438     | Software and Controls to Phasing Camera Subsystem ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.5.2-ICD-00434     | Software and Controls to M1 Edge Sensor Subsystem ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.5.3-ICD-00440     | Software and Controls to M2 Edge Sensor Subsystem ICD              |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.6-ICD-00439       | Software and Controls to AO Real Time System ICD                   |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.7-ICD-00252       | Software and Controls to Laser Guide Star Facility ICD             |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.8-ICD-00441       | Software and Controls to AO Calibration System ICD                 |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_5.9-ICD-00442       | Software and Controls to AO Commissioning Camera System ICD        |
  +-----------------------------+--------------------------------------------------------------------+
  | GMT-3.0_2.3.2.2-ICD-00636   | Software and Controls to Electronics Cabinets and Enclosures ICD   |
  +-----------------------------+--------------------------------------------------------------------+

