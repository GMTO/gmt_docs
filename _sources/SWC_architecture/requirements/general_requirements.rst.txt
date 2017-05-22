.. _general_requirements:

*General Requirements*
......................

General Requirements involve: SWCS common standards, environmental and health,
general services, maintenance, documentation, and testing – items which are
required to establish and maintain the baseline health and proper functioning
the observatory at all times that GMTO is in operation. The items are briefly
summarized below.

**Standards Requiremnets**

  Standards Requirements involve SWCS standards that enable the integration of
  software and hardware into a coherent telescope system, whereas data formats
  standards establish common practices for properly expressing and representing
  numerical and science data.

    * *SWCS standards* -– The SWCS standards require that the SWCS establish a
      reference model for a control subsystem, software and hardware standards
      (SWC-REF-00029) and comply with electronic, software (operating systems,
      user interface libraries, distributed system libraries, network,
      databases, etc.), and hardware standards (control computers, PLCs,
      workstations, servers, I/O modules, fieldbuses and network).

    * *Data Formats* -– Data format standards require that the SWCS use SI units,
      that all numerical values which represent physical magnitudes have units,
      that GMT adopt the Flexible Image Transport Systems (FITS) to record
      science observations, that the GMT data be compliant with Virtual
      Observatory standards, and that the SWCS provide a data archive system for
      collecting, storing, and retrieving all raw data and metadata acquired
      during observations for the lifetime of the observatory.

**Health and Safety Requirements**

  To establish a safe working environment, the GMT project adopts industry
  standards presented in the document: GMT Compliance to Regulations, Codes and
  Standards [Sawy12a]_, which the SWCS inheritsa nd complies with as the
  baseline.  The Hazard Analysis process described in Chapter 5.11 of the SLPDR
  identifies safety risks and defines mitigation actions that are allocated to
  GMT subsystems, including the SWCS. The SWCS is required to provide
  capabilities: to continuously monitor performance, status, and health of the
  system; to interface with the Interlock and Safety System; to enhance the
  safety and integrity of the system with software; to include redundant safety
  limits on moving parts that have risk implications for the hardware or
  personnel; and to enable manual interlock override without interference from
  software. However the SWCS is not ultimately responsible for the safety of the
  personnel and the system. The SWCS must also inherit operating limits
  established by Level 2 requirements, such as observing limits for science
  observations that include absolute hardware and software limit-switches. In
  case of central control failure (e.g., in the observatory control system,
  operator console), all critical subsystems will have built-in time-outs.
  Lastly, the SWCS will provide status information for: common operating states,
  alarm conditions, trip conditions and corrective actions, power supply, and
  other items required to operate subsystems from the control room. 

**Environmental Requirements**

  Environmental requirements facilitate the optimal use of the observatory by
  monitoring the atmosphere and weather forecasts to aid observation scheduling,
  planning, and on-the-fly decision making. The requirements protect the
  observatory and instruments actively during adverse weather (lightning, rain,
  and wind storms) and earthquakes by triggering emergency procedures
  automatically or with operator supervision. The electronic and hardware
  components must also be protected passively from moisture, power surges, wind,
  etc.

  The Environmental Requirements stipulate that the GMT will be operated
  centrally from a control room, and that electronic equipment for operating the
  telescope, AO, and instruments will be located in the electronics room. The
  SWCS will provide capabilities: to access weather forecasting; to interface to
  the environment monitoring facility to monitor dust, atmospheric turbulence,
  water vapor, atmospheric seeing, weather conditions; and to record, and make
  accessible, all environmental statistics. In the event of an earthquake, the
  SWCS is designed to survive without structure failure up to a maximum level
  defined in the document on GMT Environmental Conditions [Mait12]_. The SWCS
  will provide capability to execute automated safety procedures to protect
  personnel, the telescope, enclosure, instruments, and electrical systems, in
  the event of loss of power, storms, lightning, and earthquakes.

**Services Requirements**

  Service requirements involve power, electrical grounding, liquid cooling,
  compressed air, nitrogen, helium, communication lines, electronic cabinets, and
  washing services. GMTO will utilize Chilean standard voltages (380V 3-phase and
  220V single phase) and frequency (50 Hz), backed up by on-site emergency power
  generators, and supplied to the telescope through various power distribution
  panels and electronics cabinets installed as part of the telescope systems
  utilities infrastructure. The SWCS hardware (e.g., computers, networking
  equipment) will run off of UPS as per the GMT Common Utilities power budget
  (GMT-SE-REF-00366).
  
    * *Power* -– The requirements for the electrical power systems are defined in
      GMT Electrical Power Systems [Sawy12b]_ and Telescope Common Utilities and
      Equipment [Sawy12c]_.  The SWCS is required to provide cabling
      infrastructure to support safe installation and operation of the GMT control
      system.
  
    * *Grounds* -– In addition to the grounds associated with power feeds to various
      sub-circuits and equipment on the telescope, additional circuits will be
      required to electrically ground the structures of the moving components
      (azimuth disk, Optical Support Structure, and GIR), and other locations to
      isolate noise sensitive equipment. The SWCS equipment will be compatible
      with the GMT power filtering and grounding system, which has been designed
      to minimize electrical interference.
  
    * *Electronics Cabinets* -– According to the document Telescope Common
      Utilities and Equipment8, there are 8 service bays on the GIR that will be
      used for placing 16 electronics cabinets. The IP platform and azimuth
      platform structures will also include an area for locating electronic
      cabinets. The Standard Electronics Cabinets (SEC) includes active heat
      removal for a maximum of 2000 W, and feature remote power on/off control.
      Each SEC provides 2200W of 220V UPS. The SEC maintains the air inside the
      cabinet to an average temperature of ambient ± 2C. The SWCS hardware
      components will be designed to allow adequate installation clearances inside
      the SEC and will provide the local control of the cabinets and the
      integration with the supervisory components of the Observatory Control
      System for global start-stop sequences and health monitoring.

**Reliability and Maintainability Requirements**

  These requirements promote system reliability and facilitate routine
  maintenance. Reliability is achieved by: using high quality components,
  over-specifying or overrating equipment, implementing contamination control,
  using proven design techniques, designing for ease of serviceability, and
  providing adequate spare parts. The SWCS will provide: an engineering mode to
  allow low-level control of components and subsystems; software tools to
  display real-time and long-term performance trends of components and
  subsystems; an ability to correlate time-stamped data with other subsystems.
  The SWCS will also provide equipment, procedures, and safe access, to maintain
  and service all critical components. The SWCS will provide the capability to
  achieve maintenance time requirements per Maintenance Time Budget
  (GMT-SE-DOC-00420). The SWCS will also standardize common components to
  optimize the stock and number of different spare parts.

**Documentation Requirements**

  The SWCS will provide documentation needed to operate, support, and maintain
  the GMT. All SWCS documentation will be accessible, searchable, and
  retrievable on-line. SWCS documentation will also provide access to user
  guides for all equipment and facility instrumentation used during routine
  operations, technical documentation (manuals, drawings), and electronics
  schematics.

**Testing Requirements**

  Testing requirements pertain to testing and verification of the GMT software,
  instruments, and subsystems produced by all the partners and subcontractors
  working with and for the project. The SWCS will develop software modules that
  have automated test procedures, and that support testing for backward
  compatibility. Contractors and procurement suppliers must provide SWCS all
  necessary software and hardware tools for factory acceptance testing.
  Documentation for testing includes information on the version of equipment,
  version of test specification, and version of design specification, for every
  test (unit testing, system and integration, acceptance). The SWCS will
  generate a report that tracks all requirements that are fulfilled,
  unfulfilled, or unverifiable, using a common template. All the software
  components of the SWCS will be subject to a Continuous Integration Process
  with the goal of ensuring interface compatibility before the final
  integration. The Continuous Integration Process will also include automated
  unit and integration testing as the software modules are incrementally
  developed. This process will include all the software components, regardless
  of the organization procuring them.
