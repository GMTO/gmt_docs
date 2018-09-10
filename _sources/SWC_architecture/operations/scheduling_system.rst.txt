.. _scheduling_system:

Scheduling System
-----------------


The GMT Operation Modes, as given by the Science Requirements [GMTO10]_, will
consist of Queue, Investigator Directed, and Interrupt Observing. The SWCS will
provide tools to support the planning and execution of these modes, described
below. The requirements that flow down to the SWCS are shown here:

.. table:: SWCS Scheduling System Requirements

  +----------------------+------------------------------------------------------------------+
  |   Title              |    Statement                                                     |
  +======================+==================================================================+
  |   Queue Mode         |    Support queue scheduling.                                     |
  +----------------------+------------------------------------------------------------------+
  |   Program Execution  |    Provide observatory staff software for advanced planning of   |
  |   Planning           |    observing programs.                                           |
  +----------------------+------------------------------------------------------------------+
  |   Observation Status |    Provide tools for advanced planning of science programs, and  |
  |   Tracking           |    capabilities to monitor the status of observing programs.     |
  +----------------------+------------------------------------------------------------------+

The observing modes determine how science programs are scheduled for long-term
implementation (night to night, month to month), as well as how the targets are
prioritized during a night:

  * *Investigator Directed* -- In this mode, the science investigators are
    present on-site or at a remote observing location to conduct observations.
    The duration of the program is based on the number of nights used rather
    than the completeness of the program.

    For Investigator Directed programs, the observatory staff puts together a
    long-term schedule taking into account preferences expressed by the PIs in
    their observing proposals. The staff also tries to optimize scheduling based
    on parameters that can be known long in advance, such as proposal ranking,
    moon phase, instrument availability, and the largest window of opportunity
    based upon the RA and DEC ranges of the targets. Once the long- term
    schedule is set, it generally remains fixed throughout an observing
    semester. In this mode, the Scheduling System does not perform scheduling
    automatically. Rather, it provides observatory staff advice, via tools to
    aggregate program information and statistics, sort programs according to
    certain criteria (see below), and produce visualizations to facilitate
    scheduling. During runtime, the observers (PI or Co-PI) have full discretion
    over how to prioritize target scheduling. If desired, observers can also use
    queue scheduling tools to advise them on other sequences of observing,
    factoring in variables that they may wish to consider.

  * *Queue* -- In queue mode, observatory staff members conduct the science
    observations in place of the program PIs and Co-PIs. All queue programs
    enter into a central pool to be rank-ordered for scheduling. The scheduling
    is usually based on individual observations rather than entire programs at
    once, unless the PI requires that the observations be grouped. In contrast
    to Investigator Directed mode, long term queue scheduling can change
    throughout an entire observing cycle because the order of observations
    responds to runtime changes in order to optimize the use of existing
    observing conditions.  The scheduling of the targets is based on a number of
    parameters, including science ranking, seeing condition, sky brightness,
    percentage of completion, and instrument availability, etc. (see below). The
    importance of each parameter is partly based on how closely a runtime
    condition matches the desired condition, e.g., the closer the seeing matches
    the specified value, the higher the priority. However, observations often
    have to account for programmatic variables, e.g., overhead cost, cable wrap,
    program completeness, decreasing or increasing window of opportunity, etc.,
    requiring one to optimize on factors besides the best observing conditions.
    Therefore each parameter also has a weight attached so that the importance
    of one parameter may be adjusted relative to other parameters. The effect of
    changing parameter weights is to instantaneously rearrange the observing
    schedule to prioritize targets whose observing requirements best match both
    demand conditions and extenuating circumstances. Several graphical tools are
    being designed to aid in visualization and reweighting of the observing
    criteria.

  * *Interrupt* -- The Interrupt Mode is used to observe targets of opportunity,
    which may require observers to react quickly to acquire a target that may
    not already exist in the normal observing schedule database. Interrupt Mode
    is usually invoked and granted by an observer on a per-target basis, rather
    than for multiple targets or to usurp a block of time, after which the
    telescope returns to the original program in progress. Because of the
    unpredictability of the Interrupt Mode, no long range scheduling is
    possible. The primary effect on short-term schedules is to delay the
    execution of targets in Queue and Investigator Directed observing.

In short, the purpose of the Scheduling System is to help optimize the
scheduling of the observations so as to:

  * Maximize the amount of time available to use for on-source integrations.

  * Properly match target selection with observing conditions and instruments during queue
    mode.

  * Ensure as many science programs in the queue are successfully executed as possible.

  * Ensure proper balance of observing times between partner institutions.

  * Minimize the amount of overhead times used for slewing between distant
    targets, required instrument switches, etc.

*Ranking Criteria for Observing Program and Runtime Target Selection*
.....................................................................

In the early phases of telescope commissioning and operations, the Scheduling
System of GMT for all the operational modes will be an *advisory system* rather
than an *intelligent scheduler* like ones used with HST, VLT, or Gemini. An
intelligent scheduler typically uses an optimization algorithm (e.g., simulated
annealing, metropolis, genetic) to find a plausible “global-maximum” solution
according to some merit function, by comparing the required observing criteria
(proposal ranking, overhead times, seeing, sky brightness, etc.) with some
existing/known conditions. Each criterion has a weight, a range or dispersion,
or a hard limit, according to the importance of meeting that criterion.

For long term scheduling, known conditions are parameters such as moon phases,
observing window and airmass. During runtime, however, optimizing a schedule
involves responding to conditions during the night. A truly intelligent
algorithm therefore has to be able to respond to on- the-fly scheduling demands
(due to changing conditions), balancing them with longer-term criteria. While
such an algorithm has been used successfully in several observatories, the
largest benefit of doing so comes after gaining considerable knowledge about the
operational “personality” of the system so as to provide rigorous assignment of
weights.

In contrast, an advisory system merely informs the operator about target and
program scheduling, while permitting the operator to adjust the weighting scheme
to respond to run-time observing conditions, thus changing the schedule
on-the-fly. For instance, it may sometimes be more efficient to select a target
closest to the current cluster of observations from different programs, while
sacrificing image quality because doing so still meets the science requirements.
The software may not easily capture such an intention especially if the software
does not accurately model certain parameters, e.g., the overhead times and other
contingencies, and they turn out to be overriding considerations. However, doing
so is possible when an operator has a larger and more nuanced control over the
telescope operation.

The most dynamic approach is to allow for both possibilities, with the advisory
system eventually providing weights to inform the intelligent scheduler, while
also permitting advisory capability during runtime. During the early phases of
the operations, a system will be implemented that only advises the operator
about target and program scheduling, allowing him/her to adjust the weights of
observing parameters, via a visualization interface, accordingly. As the
operational concept evolves, and with better understanding of the system, it
would be feasible to seamlessly enrich the Scheduling System by adding an
automated scheduler as a component in the OPS while retaining the advisory
capability.

The following criteria will be used to sort the priority of the observing
programs and targets to schedule, both for long term and for runtime:

  * *Science program ranking* -- Sort observations by program ranking, which
    usually comes from reviews by the telescope Time Allocation Committee.

  * *Priority rating* -- Priority rating can be assigned to targets of
    opportunity, director’s discretion, high priority targets, time critical
    observations, or based on instrument availability, etc. Priority rating is
    generally under the discretion of observatory staff and director, who may
    consider unforeseen factors that, may override normal scheduling.

  * *Percentage completion* -- For large programs, weigh the observing
    schedule to favor programs based on percentage of completion, e.g., number
    of targets or fields observed relative to the total.

  * *S/N achieved versus required* -- Queue observations sometimes involve
    making multiple passes over the same target, and over non-contiguous times,
    in order to achieve the required S/N. This criterion assigns weights
    according to S/N achieved versus required.

  * *Institutional time share* -- Allow the scheduling system to enforce fair
    share of observing time among all involved institutions.

  * *Airmass* -- Observations may be restricted according to airmass criteria.

  * *Hour angle restrictions* -- The hour angle of observation may be
    restricted due to wind direction, cloud coverage, or cable wrapping
    considerations.

  * *West-East arrangement* -- Higher or lower weights may be given to targets
    that are rising or setting.

  * *Meridian distance* -- Give more weight to targets that are closest to
    transiting the meridian, so as to be observed at the lowest airmass.

  * *Integration time duration* -- Sort targets based on the duration of the
    integration time. The integration time is for the smallest useful unit of
    observation that is defined by the observer.

  * *Total time of observation* -- Sort observations based on the total time,
    including integration, and overheads. Overheads include additional slew
    time, calibration requirements, AO requirements, etc.

  * *Seeing requirement* -- Limit and sort observations based on the seeing
    required by the science program. For some science programs that use AO, it
    may be more useful to place a requirement on the Strehl. During Phase I
    proposal preparation, the PSF simulator module, in conjunction with the
    observation planning tool, will estimate the required seeing to achieve the
    required Strehl, taking into account the location and brightnesses of the
    natural and laser guide stars, relative to the science target.

  * *Sky brightness, IR emissivity* -- Restrict targets based on sky
    brightness criteria.

  * *Instrument availability* -- Limit observations based on instrument
    requirements.

  * *Photometric vs. non-photometric conditions* -- Limit observations based on
    requirements of photometric or non-photometric conditions, which is a binary
    decision.

  * *Proximity of target to current position* -- Sort observations according
    to proximity to current telescope position so as to minimize slew time and
    the settling time of the active optics.

  * *Program coherence* -- Select targets according to how important it is for
    the targets to be observed closely in time vs. distributed over the entire
    semester.


*Subsystem Description*
.......................

The core Scheduling System components will depend on the following components:

  * **Observing Program Server** -- The GMT Observing Program Server facilitates
    the development of the observing proposals (Phase I and Phase II),
    validation, submission and acceptance of the proposals into the observatory
    database. It also manages the distribution of proposals to the TAC for
    review, collects comments from the panel, and releases them to the science
    PIs and Co-PIs. In Phase II, astronomers submit detailed proposals with
    information on targets, guide stars, instrument configuration, observing
    visibility window, etc., and then forward the information to the observatory
    database. For proposals that are granted time by the TAC, the manager helps
    scientists to fully define the observation requirements: configuring
    instruments, selecting guide stars, positioning of science apertures,
    creating observing blocks and sequences, etc. Upon validation, all the
    information will be forwarded to the GMT data archive for scheduling and
    implementation.

  * **Schedule Ranking Server** -- Given a set of criteria and weights, such as
    moon phase, wind direction, observing window, airmass, seeing, etc., the
    schedule ranking server performs rank-ordering of observing programs. The
    importance of each criterion is given by numerical weights. Medium-term and
    long-term programs usually have fixed weights whereas short-term
    observations typically have weights that are adjusted on-the-fly depending
    on changing observing conditions. The ranking informs a human scheduler who
    may choose to accept the ranking, modify it, or ignore it when implementing
    the actual schedule short term, medium term, or long term. Usually schedules
    for classical observing and engineering are fixed once assigned. In
    contrast, the window of queue observing period may be fixed by
    observability, but the runtime schedule is highly dynamic and may be changed
    depending on variable conditions like weather, wind, instrument readiness,
    target-of-opportunity, interrupts, etc.

  * **Long Term Server** -- The long term scheduling server manages schedules on
    time scales longer than a single proposal cycle. Multi-cycle and some
    director discretion times often fall into the regime of long term
    scheduling.

  * **Medium Term Server** -- The medium term scheduling server manages
    schedules on time scales longer than a single week, but shorter than a
    proposal cycle.  Factors that this server may consider are moon phases,
    weather forecast (to the extent possible), engineering time, queue observing
    blocks, long term program blocks, multi-cycle blocks, and director
    discretion. Single cycle programs work, though not exclusively, in this
    regime.

  * **Short Term Server** -- The short term scheduling server manages schedules
    of observations on-the-fly to lengths of a week. Queue scheduling falls
    under this regime. However, observers of Investigator Directed observing
    programs may also use the same server to receive advice for runtime
    decisions.

  * **Calendar Panel** -- A calendar is used to schedule and visualize medium
    and long term observations. An example is shown in :numref:`Figure %s
    <long_term_calendar>`. The display allows managers to visualize according to
    categories of program ID, instrument request, observers, or institutions.
    Selecting a date would bring up a night’s observation schedule and target
    information as known at that time.

  * **Nightly Schedule Panel** -- Several versions of nightly schedule panels
    will likely be made available, depending on the desired information to sort
    on or visualize. An example of a night schedule panel is shown in
    :numref:`Figure %s <target_observation_order>`, :numref:`Figure %s
    <target_observation_airmass>` and :numref:`Figure %s
    <target_track_magnified>`. In these depictions the interest is to arrange
    targets according to their airmass constraints. The schedule can be
    rearranged on the fly interactively by dragging and dropping the bands.
    Gaps in between the bands will take into account estimated overhead time for
    slewing from one target to another, while the bands include overhead times
    estimated for an observing configuration. Users can “drill down” to finer
    grain details (programs -> observing blocks -> individual exposure times,
    etc.) by selecting or zooming in on the visualization.

.. _long_term_calendar:

.. figure:: _static/long_term_calendar.png

    Long-Term Calendar Mockup

.. _target_observation_order:

.. figure:: _static/target_observation_order.png

    Target Observation Order. Global scheduling of the nightly observations is
    shown. The greyed-out region represents the past. Selecting a target band
    brings up details for that observing block. Gaps in between observations
    include estimated overheads required to change from one observation to the
    next. View can be zoomed in, out, or panned.

.. _target_observation_airmass:

.. figure:: _static/target_observation_airmass.png

    Target Observation Order Showing Airmass Tracks. The schedule can be
    rearranged by moving the thick bands relative to one another. Additional
    tracks may be selected and added to the viewer.

.. _target_track_magnified:

.. figure:: _static/target_track_magnified.png

    Magnified View of a Target Track. One can select target tracks to magnify
    and show the individual observing blocks. Observing blocks may be selected
    and modified via an editor spawned from this view, or they may be deleted
    from the observing sequence.
