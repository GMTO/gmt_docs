
.. _tcs-pointing_kernel:

Pointing Kernel
---------------

The telescope pointing kernel (Figure :ref:`below <figure-tel_pointing_kernel>`)
is the subsystem that performs essential services to point the telescope to a
desired sky location, to track the sky rotation, and to provide fine guiding on
a target. The outputs of the pointing kernel are mechanical encoder values that
are used to command repositioning of the mount and the instrument rotator (blue
boxes in :ref:`Figure below <figure-tel_pointing_kernel>`). The GMT pointing
kernel is built on the *TCSpk* [Wall12a]_, *tpk* [Terr06]_, and *SLALIB*
[Wall12b]_, packages developed by TPoint Software.  The pointing kernel:

  * Predicts the mount encoder angles required to image a specific coordinate on
    the sky to a given location in the focal plane

  * Provides accurate mapping of the World Coordinate System (WCS). For example
    to enable mapping of celestial coordinates onto locations in the
    focal-plane, and vice versa, using *SLALIB* [Wall12b]_ to account for
    atmospheric refraction, pressure, temperature, Earth’s precession, nutation,
    light deflection, etc.

  * Enables telescope tracking and autoguiding

  * Allows rapid repositioning of the telescope to transfer an imaging field
    from one focal plane (e.g., an acquisition device) onto another (e.g.,
    instrument detector), thereby enabling fast dithering and precise blind
    positioning onto slits and fibers

  * Allows multiple coordinate systems to be active at the same time allowing,
    for example, tracking of a planet while guiding on a star

  * Handles autoguiding in an integrated way, with differential refraction and
    atmospheric dispersion being taken care of at a system level

These features will be available in all natural seeing and AO observing modes.

.. _figure-tel_pointing_kernel:

.. figure:: _static/tcs-pointing-kernel.png

   Telescope Pointing Kernel


The telescope pointing kernel is composed of three primary components: Target
Server, Supervisor, and Virtual Telescopes. The functions of each component are
briefly described:

  * Target Server (*pk_target_server*) – The Target Server is the high level
    server telling the telescope where in the sky or at which targets to aim. It
    possesses high-level knowledge about the science program being observed,
    i.e., the science targets, the guide stars needed to perform an observation,
    and the desired pointing location on an instrument. The server takes as
    inputs an observing definition (e.g., observing templates produced from the
    Phase 2 proposal) and object catalogs, and produces a set of coordinates to
    send to the pointing kernel supervisor for implementation. For telescope
    dithering, the target server receives and interprets the dithering strategy
    to provide coordinates to reposition the telescope.

  * Supervisor (*pk_supervisor*) – Most components (e.g., subsystems and devices)
    involved in telescope pointing, tracking, and guiding, merely act on the
    data and instructions provided to them without regard to the overall
    purpose.  However if, for example, the WFCS fails to acquire a guide star,
    or a guide star moves outside the guide field (for guiding on a non-sidereal
    target) a supervisor must decide on a corrective course of action. The
    pointing kernel supervisor provides the intelligence to decide what actions
    to take in the event of success or failure in acquisition and guiding. In
    addition, the pointing kernel supervisor implements the pointing model;
    maintains the context for slow, medium and fast guiding and tracking
    calculations; and manages which virtual telescopes are active at any given
    time.

  * Virtual Telescopes (*vt*) – A central concept in TCSpk is the “Virtual
    Telescope”, which takes as input a desired coordinate and performs the
    detailed transformations necessary to make accurate telescope pointing a
    transparent process. As viewed from the perspective of end-users and
    software control interfaces, the virtual telescope therefore appears like a
    perfect telescope. The virtual telescope relates three pieces of information
    necessary to position the telescope: the mount directional pointing [Az,
    El], the location of an image in an instrument focal plane [x, y], and the
    celestial coordinate of a target [α, δ]. Knowing two out of the three
    quantities, the virtual telescope can predict the third. The virtual
    telescope enables one to position a target fixed at any location and
    orientation on an instrument, accounting for the rotator angle. There is at
    least one virtual telescope assigned to each focal station that has an
    instrument. Each instrument can have multiple virtual telescopes that have
    different pointing origins to allow fast dithering, accurate positioning of
    a target onto a slit or fiber aperture, and other purposes. The virtual
    telescope generates mechanical demands to the mount encoders to reposition
    the telescope.

.. toctree::
    :maxdepth: 1

    pointing_kernel/pointing_software
    pointing_kernel/workflow
    pointing_kernel/coordinate_transformation
    pointing_kernel/virtual_telescope
