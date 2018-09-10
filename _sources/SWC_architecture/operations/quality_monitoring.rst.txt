.. _quality_monitoring System:

Quality Monitoring System
-------------------------

The Quality Monitoring System (QMS) provides capabilities to enforce the
correctness of the observing process. The purpose of the QMS is thus to:

  * Ensure that observing programs produced by science investigators during
    Phase I and II proposal preparation stages do not have errors, meet all
    requirements for implementation, and do not demand that the system perform
    in inefficient or unsafe ways.

  * Watch to ensure that the observing conditions (seeing, sky brightness, etc.)
    during observation meet the target conditions required by observing programs.

  * Ensure that the quality of the science data meets target conditions for
    producing useful science, and that the data are free of abnormal
    instrumental artifacts.

The above are derived from the Science and System Level Requirements shown here:

.. table:: SWCS Quality Monitoring Requirements (Level 3)

  +----------------------------+-----------------------------------------------------------+
  |   Title                    |   Statement                                               |
  +============================+===========================================================+
  |   Diagnostic Software      |   The SWCS shall provide software tools for displaying    |
  |                            |   real- time and long term trends in the performance of   |
  |                            |   individual components/subsystems and to correlate that  |
  |                            |   information with time-stamped data from other           |
  |                            |   subsystems.                                             |
  +----------------------------+-----------------------------------------------------------+
  |   Engineering Data System  |   The SWCS shall provide an engineering data system to    |
  |                            |   monitor the health of all subsystems critical to the    |
  |                            |   functioning and performance of the observatory.         |
  +----------------------------+-----------------------------------------------------------+
  |   Product Quality          |   The SWCS shall provide software tools to assess the     |
  |   Assessment               |   quality of observation data products.                   |
  +----------------------------+-----------------------------------------------------------+
  |   Monitoring of water      |    The SWCS shall provide the capability to monitor       |
  |   vapor, atmospheric       |    during the night atmospheric turbulence, water vapor,  |
  |   seeing, weather          |    atmospheric seeing, and weather conditions.            |
  |   conditions,              |                                                           |
  |   environmental statistics |                                                           |
  +----------------------------+-----------------------------------------------------------+

The Quality Monitoring System comprises a server, and visualization and
sequencing packages, like other subsystems under the OPS domain. There are three
categories that the QMS oversees the management of:

  * *Observations* -- Observational quality monitoring impacts on-sky data
    collection. For science the QMS ensures that the observing conditions and
    observational data meet design criteria given in the science program
    proposals. It also ensures that alarms triggered during observations do not
    impact the science data quality. For operations, data quality monitoring
    feeds information back to the TCS to improve the operations of the AGWS,
    NGS, and LGS. Observational data monitoring involves such tasks as
    performing statistical analysis on data to measure: instrument bias and dark
    current levels, noise and sky background level parameters, the roundness and
    size of the seeing, saturation of the stars and the science targets, hot and
    dead pixel statistics and location, instrument background and noise pattern,
    flux levels of known stars given their known brightness, telescope pointing
    origin, uniformity of detector response, etc. Part of observational quality
    monitoring may rely on visual inspection, especially for science data. The
    :ref:`data_processing_system` provides automated pipelines to extract basic
    information from images, and the Observing Tools package provides basic
    tools for quick look analysis, to facilitate data quality monitoring.

  * *Proposals* -- The proposal system monitors Phase I and Phase II telescope
    proposals to ensure that they contain proper information and that the
    program can be implemented. This is especially important for queue or remote
    observing where entire programs need to be fully complete and ready for
    execution by the end of the process. The generic monitoring task for both
    phases is to make sure all the required information fields contain valid
    content. In Phase I, the system checks to make sure that there is
    information on targeting, instruments, filters, restrictions in observing
    window and conditions (sky brightness, seeing, etc.). The system also checks
    to make sure that the strategies can be implemented, especially with respect
    to the availability of AGWS and natural guide stars near to their science
    targets, and that the observing configuration can achieve the Strehl
    requirement needed for the science goals. In Phase II, observers specify
    detailed information for observing blocks and on-source integration
    strategies, including sub-exposures, dithering strategies, mosaic, offsets,
    etc. The monitoring system ensures that the entries are correct, and that
    the strategies can be performed without violating guide star, observing
    window, airmass, and other constraints. In general, proposal quality
    monitoring is passive, i.e. not involving human operators, but may involve
    observatory scientists to review and give explicit approval, or to implement
    more specialized and technically challenging observations.

  * *Subsystems* -- Subsystems quality monitoring involves monitoring the health
    of the telescope, instruments, enclosure, facility, and environmental
    systems.  Quality monitoring may either be either passive or active. Active
    participation by an operator is usually only required for intervention, or
    analysis after-the-fact during engineering servicing. Under normal operating
    conditions, system monitoring is mostly transparent to the operator except
    via visualization displays that summarize the status of various subsystems.
    The QMS, however, can access data telemetry (data that are time-stamped)
    from subsystems indicating the overall states of their devices and
    components.  Different types of data processing
    (:ref:`data_processing_system`) are involved in monitoring telemetry. Most
    information deemed healthy will simply be recorded into archive without
    further processing. For time variable and operationally useful or sensitive
    data such as telemetry for telescope pointing, device temperature, wind
    speed, seeing profile, etc., the data will be further processed or analyzed
    to produce visualization or other useful information.  The QMS may then
    compare the results against nominal baselines or trajectories that are
    established for each device or for the observatory. Information on wind gust
    and direction may, for example, be integrated graphically into the
    observational situation awareness display (:numref:`Figure %s
    <all_sky_camera>`). In unusual situations, large drifts in telescope
    pointing over time may trigger warnings that get logged for further analysis
    by the daytime engineering crew. The discovery by the monitoring software
    that guiding corrections need to be made may trigger warnings to update the
    telescope pointing model, and allow for temporary adjustments.

    In normal circumstances, monitoring results are time stamped and stored into
    the database for future reference. However, in critical circumstances, the
    results from monitoring analysis may trigger alarms that call for immediate
    attention.  One of the useful concepts of the QMS is the ability to select
    those subsystems to more closely monitor, and to interactively develop,
    using graphical tools, on-the-fly analysis procedures. This allows operators
    the capability to turn any telemetry information of any subsystem or device
    instantaneously into runtime visualization displays that may be more closely
    monitored, or that may be correlated with the telemetry of other parameters.
