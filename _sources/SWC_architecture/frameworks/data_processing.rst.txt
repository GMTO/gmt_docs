
.. _data_processing_framework:

Data Processing Framework
-------------------------

The Data Processing Framework (DPF) provides support for the development of data
processing pipelines. Specific examples of data processing pipelines include:
statistics (image noise and S/N estimation, sky brightness, seeing estimation,
number of sources), astrometry (computing WCS for imaging detectors), image
matching (coordinate transformation, image registration), data filtering, image
cube construction, data extraction (e.g., IFS wavelength slices), image
manipulation (masking, interpolation), image analysis, PSF creation (AO PSF
simulation), spectral analysis, photometric calibration, spectral reduction,
image reduction, image mosaic creation, etc.

The framework design is based on the Pipes and Filter design pattern. Pipelines
act as wrappers of existing or newly developed data reduction systems and
provide a thin unified interface to the observatory operations software. The
goal of this approach is to reach a balance between the uniform operation and
maintenance of the observatory and the cost of developing new pipelines that are
successors of existing ones.

The table below provides a definition of the main DPF components:

.. table:: Data Processing Framework Component Description

  +------------------+---------------------------------------------------------------------+
  |   Component Name |   Description                                                       |
  +==================+=====================================================================+
  |   Pipeline       |   Collection of Filters and data processing Recipes                 |
  +------------------+---------------------------------------------------------------------+
  |   Filter         |   Elementary processing unit of a data processing pipeline (e.g.,   |
  |                  |   bias or dark filter in a data reduction pipeline). Each Filter    |
  |                  |   has a set of data inputs and outputs and a set of parameters      |
  |                  |   that tailor its behavior. Data inputs and outputs can be streams  |
  |                  |   or files and often capture an intermediate processing step. The   |
  |                  |   Core Framework provides different communication transports (e.g.  |
  |                  |   inproc, ipc, tcp) for flexible and efficient I/O management and   |
  |                  |   deployment.                                                       |
  +------------------+---------------------------------------------------------------------+
  |   Recipe         |   Defines a concrete sequence of connected Filters. Each Recipe     |
  |                  |   has a set of data inputs, data outputs, parameters and            |
  |                  |   validation rules (e.g., an instrument data processing pipeline    |
  |                  |   may define a Recipe for each observing mode that requires a       |
  |                  |   different data reduction strategy). The execution of Recipes      |
  |                  |   will be often triggered during the execution of an observing      |
  |                  |   sequence.                                                         |
  +------------------+---------------------------------------------------------------------+

The Figure below shows the DPF in the context of the definition of an
observation.

.. figure:: _static/data-processing-framework-components.png

   Data Processing Framework Components

Each Pipeline is specified by a set of SDFs that defines the interface of the
Filters and Recipes components making up a pipeline. This interface enables the
operation and integration of all the data pipelines in a uniform way, and
provides the following capabilities:

  * Execution of the corresponding Recipes when the input and calibration data
    are available

  * Instantiation of a quick-look display when requested by the operator

  * Storage of by-products of the pipeline consistently throughout the
    observatory.

The framework includes tools that generate a set of Python interface skeletons
that then act as wrappers of existing or new data pipelines. Skeletons have to
be completed by the pipeline developer.

Multiple implementations of data processing tools and algorithms are available;
some of them are summarized here:

  * *Data Analysis Facilities* - These are fully self-contained (e.g., PyRAF, IRAF)
    packages that come with tools for image display, data manipulation,
    analysis, and scripting, with which many observers are familiar. These
    packages also facilitate the development of high-level tools for instrument
    data reduction and quick-look extraction or analysis.

  * *Numerical Libraries*: Numerical libraries (e.g., LAPACK, ATLAS, FFTW, GSL,
    SciPy) will be the basis for developing software that requires
    high-performance numerical computations.

  * *Data Extraction and Modeling* - Data extraction and modeling tools (e.g.,
    PSFEx, SExtractor, GALFIT) are useful for exposure time calculations during
    proposal preparation. They are also used during runtime operations for
    producing seeing statistics, data summary, astrometry, and to aid the
    monitoring of environmental conditions and data quality.

  * *Positional Astronomy* and *Coordinate Transformation* - These tools (e.g.,
    SLALIB, SCAMP, WCSTools) are commonly used for relating sky coordinates and
    detector coordinates in images and for telescope pointing, for calculating
    spherical geometry, and for aligning imaging or spectroscopic data.

  * *Data Container* - Data containers transform a data type into another type
    (e.g., CFITSIO), or repackage data to be compliant with a standard format
    (e.g., Virtual Observatory).

  * *Data Visualization* - These tools (e.g., SAOImage JS9, WebGL) facilitate
    visualization of operational data, such as line or scatter plots; reduced,
    imaging, spectroscopy, or integral- field, data; exposure time calculation,
    and runtime observing displays.

  * *Telescope Pointing Kernel* and *Pointing Analysis* - TCSpk and TPoint will
    be the primary tools used for computing telescope pointing models,
    generating pointing demands, and performing pointing analysis to remove
    pointing errors due to flexure, alignment errors, or mechanical
    imperfections.

The Software and Controls Handbook defines a set of requirements (e.g.,
operating system compatibility, hardware acceleration) that have to be met by
the data reduction packages and libraries used in the implementation of the data
processing pipelines.
