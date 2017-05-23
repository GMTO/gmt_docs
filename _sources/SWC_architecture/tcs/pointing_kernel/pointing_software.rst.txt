
*Telescope Pointing Software Libraries*
.......................................

The TCS pointing and tracking control will be built around a core set of
software libraries: TCSpk [Wall12a]_, SLALIB [Wall12b]_, and tpk [Terr06]_,
which are used on many telescopes currently in operation, e.g.,
Magellan, Keck, GTC, VLT, Gemini, and LBT. The software libraries provide the
following functionalities:

  * *SLALIB* [Wall12b]_ – A library of over 200 functions in ANSI C for
    positional astronomy, SLALIB comprises functions and numerical methods that
    calculate spherical trigonometry, vectors and matrices, and coordinate and
    time transformations required to achieve milliarcsecond pointing accuracy to
    celestial targets. Key examples of positional astronomy computations and
    transformations performed by SLALIB include:

    * Celestial –
      catalog coordinates such as FK4, FK5, galactic, geocentric
      coordinates, ICRS, proper motion, target proper motion, parallax, and
      radial velocity.

    * Terrestrial –
      atmospheric refraction, diurnal aberrations, precession and
      nutation, mean place to apparent and observed place, focal plane
      astrometry.

    * Time –
      time systems (UTC, GST, LAST, etc.), calendar, epochs, ephemerides

    SLALIB supports both IAU 2000/2006 precession-nutation and Earth rotation
    models in both classical (equinox-based) and Conventional International Origin
    forms. Details of the celestial coordinate systems used by the TCS and the
    transformation flow going from user specified celestial coordinates to
    observed directions are discussed below.

  * *TCSpk* [Wall12a]_ – A library of roughly 70 functions in ANSI C makes up
    the TCS Pointing Kernel (TCSpk), around which the TCS is designed. The TCSpk
    library provides modular functions that can be assembled in flexible ways to
    implement telescope pointing patterns and strategies, and that place few
    constraints on the design and potential capabilities of the TCS. TCSpk
    interfaces with SLALIB for positional astronomy calculations so that the
    complexities of transforming coordinates are transparent to the designer.
    TCSpk also interfaces with TPOINT for calculating pointing corrections.

  * *tpk* [Terr06]_ – The Telescope Pointing Kernel (tpk) is a C++ library of
    classes that is layered on top of TCSpk and SLALIB to create virtual
    telescopes (see below) for the mount, rotators, guiders, instruments, etc.,
    and to produce encoder angle demands that point the telescope, and that
    position rotator and guiders based on inputs from the virtual telescopes.

  * *TPOINT* [Wall94]_ – Software for analyzing telescope pointing, TPOINT helps
    to assess and measure misalignments and flexures in the telescope and
    instruments.  Data produced by TCSpk / tpk interface directly with TPOINT
    for analysis, while collimation and flexure errors measured by TPOINT can
    directly feed back into TCSpk / tpk to reduce pointing errors.
