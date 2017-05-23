
.. _tcs-requirements:

Requirements on TCS, Pointing, Tracking & Guiding
-------------------------------------------------

The requirements governing the TCS and telescope motion control flow several
levels down from the System Level to the SWCS level(s).  Broadly, the
requirements of the TCS address: initial blind pointing accuracy, pointing
accuracy, tracking modes, continuous scan, pointing offsets, acquisition and
reacquisition and, finally, special requirements on the active optics, with
details to follow below.


.. table:: Initial Blind Pointing Requirements (Level 3)

  +-----------------------+------------------------------------------------------------------------------+
  | | Title               | | Statement                                                                  |
  +=======================+==============================================================================+
  | | Initialization for  | | Provide the capability to initialize and calibrate the telescope pointing  |
  | | Target Acquisition  | | system from a cold start by acquiring a position reference star with a     |
  | |                     | | target acquisition camera.                                                 |
  +-----------------------+------------------------------------------------------------------------------+
  | | Telescope Initial   | | Provide the capability to perform blind pointing from cold start with      |
  | | Blind Pointing      | | pointing accuracy required by the Pointing Budget (GMT-SE-REF-00477).      |
  | | Accuracy            | |                                                                            |
  +-----------------------+------------------------------------------------------------------------------+
  | | Blind Pointing      | | Provide the capability to perform blind pointing after start-of-the-night  |
  | | Accuracy            | | encoder initialization with pointing accuracy required by the Pointing     |
  | |                     | | Budget (GMT-SE-REF-00477).                                                 |
  +-----------------------+------------------------------------------------------------------------------+

**Blind pointing** relies entirely on the mechanical positional accuracy of the
telescope encoder systems on the telescope axes and lookup tables to slew the
telescope to the desired sky [α, δ] or mount [Az, El] coordinates. Blind
pointing occurs in open loop (active optics and adaptive optics), and is used to
position the telescope to within the capture range of the AGWS in the GIR, with
which to achieve higher accuracy pointing and guiding on targets. Typically, an
initial blind pointing is performed once in the beginning of the night to remove
systematic errors due to temperature and flexure, so as to establish a nominal
pointing origin, and fine-tune the initial pointing model for the night.
Subsequent blind pointing checks may be required throughout the night to achieve
the higher precision.

After the telescope positions a target to within the capture range of the AGWS
via blind pointing, the four probes of the GIR will reposition to acquire guide
stars in the telescope focal plane, which improves the pointing to sub-arcsecond
accuracy. The fine pointing accuracy requirements are referenced to, and
measured at, the center of the field of view delivered to the science
instruments located at either the direct Gregorian or folded ports, under
natural seeing. To meet the requirements for fine pointing, it is necessary to
correct for the physical offsets and differential flexure between the science
instrument and the telescope via the pointing model.

**Telescope tracking** keeps a celestial coordinate position fixed in the field
of view, by rotating the telescope elevation, azimuth, and GIR axes. Tracking
uses look-up tables that account for mount errors and relative flexure between
the telescope structure and the instrument.

Several tracking modes will be implemented: Sidereal, non-sidereal, GIR fixed
rotator, GIR field, GIR parallactic, and GIR fixed pupil. Non-sidereal tracking
is used for scanning or for solar system targets where the AGWS and the OIWS
track at the sidereal rate while the telescope mount guides on the science
target to maintain its position fixed in the science detector reference frame.

.. table:: Tracking Mode requirements (Level 3)

  +--------------------------+-------------------------------------------------------------------+
  | | Title                  | | Statement                                                       |
  +==========================+===================================================================+
  | | Sidereal Tracking      | | Support tracking and guiding at sidereal rate in all observing  |
  | |                        | | modes.                                                          |
  +--------------------------+-------------------------------------------------------------------+
  | | Non-Sidereal Tracking  | | Support tracking and guiding on an object itself.               |
  +--------------------------+-------------------------------------------------------------------+
  | | GIR Fixed Rotator      | | Provide capability to track objects in fixed GIR mode.          |
  | | Tracking               | |                                                                 |
  +--------------------------+-------------------------------------------------------------------+
  | | GIR Field Tracking     | | Provide capability to track while the GIR rotates to maintain a |
  | |                        | | fixed offset relative to the cardinal directions.               |
  +--------------------------+-------------------------------------------------------------------+
  | | GIR Parallactic Angle  | | Provide tracking mode where the GIR rotates to maintain a fixed |
  | | Tracking               | | parallactic angle.                                              |
  +--------------------------+-------------------------------------------------------------------+


**Guiding** operates in closed loop, using the positions of guide stars on
the AGWS or On-Instrument Wavefront Sensor (OIWFS) to make slight adjustments to
maintain much more accurate telescope positions, removing the effects of wind
buffeting, mechanical errors, time-dependent flexures, or other perturbations.
Guiding adjustments are small corrections on top of the telescope sky-tracking
rate. GMT will use four guide-probes in the AGWS to sense pointing and guiding
errors in three axes (elevation, azimuth, and rotation in GIR).

.. table:: Pointing Accuracy Requirements (Level 3)

  +--------------------------+-----------------------------------------------------------------------+
  | | Title                  | | Statement                                                           |
  +==========================+=======================================================================+
  | | Telescope Pointing     | | Provide the capability to point the field of a DG science           |
  | | Accuracy at the DG     | | instrument, under natural seeing, with an overall accuracy that     |
  | | Ports                  | | complies with the Pointing Budget (GMT-SE-REF-00477).               |
  +--------------------------+-----------------------------------------------------------------------+
  | | SWC Telescope          | | Provide the capability to point the field of an FP science          |
  | | Pointing Accuracy at   | | instrument, under natural seeing, with an overall accuracy that     |
  | | the Folded Ports       | | complies with Pointing Budget (GMT-SE-REF-00477).                   |
  +--------------------------+-----------------------------------------------------------------------+
  | | Differential Flexure   | | Provide the capability to correct the differential flexure between  |
  | | Correction             | | the AGWS and/or AO Wavefront Sensors and the Science Instruments,   |
  | |                        | | using internal guide sensors provided by Science Instruments, and   |
  | |                        | | to comply with the GMT Pointing Budget (GMT-SE-REF-00477).          |
  +--------------------------+-----------------------------------------------------------------------+


**Scanning** is an observing technique to obtain imaging or spectroscopy
data over an area of the sky by allowing the telescope pointing to drift at a
constant rate relative to the sky motion. During scanning, depending on the
science goal, the science detectors may be synchronized and read out
continuously to minimize image smearing, or they may stay in continuous
integration. In continuous scanning mode, the AGWS continuously tracks guide
stars to maintain mirror figure and pointing accuracy.  However, as the guide
stars may move outside the guider field during integration, the pointing kernel
is responsible for finding and reacquiring guide stars somewhere in the field
seamlessly and automatically.

.. table:: Continuous Scan Requirements (Level 3)

  +----------------------+-----------------------------------------------------------------------+
  | | Title              | | Statement                                                           |
  +======================+=======================================================================+
  | | Continuous Scan    | | Provide guiding for linear scanning of target at a fixed position   |
  | | Guide Mode         | | angle while continuously reading out data.                          |
  +----------------------+-----------------------------------------------------------------------+
  | | Continuous Scan    | | The maximum continuous scan rate is limited by the non-sidereal     |
  | | Rate               | | tracking rate.                                                      |
  +----------------------+-----------------------------------------------------------------------+
  | | Continuous Scan    | | The maximum continuous scan distance is limited by the travel       |
  | | Distance           | | distance of the autoguiders.                                        |
  +----------------------+-----------------------------------------------------------------------+
  | | Coordination of    | | The SWCS will coordinate the operation of continuous scan and       |
  | | Continuous Scans   | | science instrument operations.                                      |
  +----------------------+-----------------------------------------------------------------------+
 

**Offsets** are used during observing to reposition the science
detector relative to the pointing origin of the telescope. Offsetting is used
for many purposes, such as to obtain sky observations, to position objects onto
a slit or aperture, to create mosaic observations, etc.

.. table:: Offset Requirements (Level 3)

  +-----------------------+-----------------------------------------------------------------------+
  | | Title               | | Statement                                                           |
  +=======================+=======================================================================+
  | | Offset Distance     | | Provide the capability to perform telescope offsets, limited by     |
  | |                     | | guide star changes, and an absolute maximum radius of 3 arcmin.     |
  +-----------------------+-----------------------------------------------------------------------+
  | | Seeing-Limited      | | Provide the capability to perform telescope offsets with an         |
  | | Offset Accuracy     | | accuracy given by SLR-4100 under seeing-limited operation, and      |
  | |                     | | comply with Pointing Budget (GMT-SE-REF-00477).                     |
  +-----------------------+-----------------------------------------------------------------------+
  | | Diffraction Limited | | Provide the capability to perform telescope offsets with an         |
  | | Offset Accuracy     | | accuracy given by SLR-4110 under diffraction-limited operation,     |
  | |                     | | and comply with Pointing Budget (GMT-SE-REF-00477).                 |
  +-----------------------+-----------------------------------------------------------------------+
  | | Seeing-Limited      | | After a telescope offset, provide the capability to deliver seeing- |
  | | Offset Dwell Time   | | limited images that meet the image quality budget after at least a  |
  | |                     | | 45 second dwell time.                                               |
  +-----------------------+-----------------------------------------------------------------------+
  | | Coordination of     | | Provide the capability to coordinate offsetting of telescope and    |
  | | Offsets and Data    | | operation of science data collection.                               |
  | | Collection          | |                                                                     |
  +-----------------------+-----------------------------------------------------------------------+
  | | Offset Efficiency   | | Provide capability to execute offsets in less than the amount of    |
  | |                     | | time specified in the GMT Efficiency Budget document (GMT-          |
  | |                     | | SE-REF-00593).                                                      |
  | |                     | | Note: The offset tie is for unlocking guide system, making the      |
  | |                     | | move, and re-engaging the guiders                                   |
  +-----------------------+-----------------------------------------------------------------------+


The **telescope pointing kernel**, in cooperation with the WFCS system, performs
telescope pointing, tracking, acquisition, and guiding. There are requirements
for the different observing modes (natural seeing, LTAO, NGSAO).  In the event
that the active optics system is disabled, the pointing kernel is required to
continue telescope guiding and tracking.

.. table:: Active Optics Requirements (Level 3)

  +----------------------+-----------------------------------------------------------------------+
  | | Title              | | Statement                                                           |
  +======================+=======================================================================+
  | | AGWS Setup Time    | | Provide capability to set up the AGWS in less than the amount       |
  | |                    | | of time specified by the GMT Efficiency Budget (GMT-SE-             |
  | |                    | | REF-00593) after the telescope is in position and the sensor        |
  | |                    | | probes are deployed.                                                |
  +----------------------+-----------------------------------------------------------------------+
  | | AGWS Probe         | | Provide the capability to position the AGWS probes anywhere         |
  | | Position Time      | | in their patrol area in less than the amount of time specified      |
  | |                    | | by the GMT Efficiency Budget (GMT-SE-REF-00593).                    |
  +----------------------+-----------------------------------------------------------------------+
  | | AO Acquisition     | | Provide the capability to complete target acquisition, at the end   |
  | | Efficiency         | | of Active Optics acquisition/setup, in less than the amount of      |
  | |                    | | time specified by the GMT Efficiency Budget (GMT-SE-REF- 00593).    |
  +----------------------+-----------------------------------------------------------------------+
  | | AO Re-acquisition  | | Provide the capability to re-acquire a natural guide star, after    |
  | | After Opening NGS  | | opening the NGS loop, in less than the amount of time specified     |
  | | Loop               | | by the GMT Efficiency Budget (GMT-SE-REF-00593).                    |
  +----------------------+-----------------------------------------------------------------------+
  | | LTAO Re-           | | Provide the capability to re-acquire LGS guide stars in the         |
  | | acquisition of LGS | | LTAO mode after opening the LGS loop in less than the amount        |
  | | after open loop    | | of time specified by the GMT Efficiency Budget (GMT-SE-             |
  | |                    | | REF-00593).                                                         |
  +----------------------+-----------------------------------------------------------------------+
  | | NGLAO NGS Re-      | | Provide the capability to re-acquire NGS guide star in NGLAO        |
  | | acquisition after  | | mode, after opening the NGS loop in less than the amount of         |
  | | open loop          | | time specified by the GMT Efficiency Budget (GMT-SE-REF-            |
  | |                    | | 00593).                                                             |
  +----------------------+-----------------------------------------------------------------------+
  | | SWC Active         | | Actively control the optical system to obtain the best image        |
  | | Correction         | | quality performance and comply with Natural Seeing Image            |
  | |                    | | Quality Error Budgets (GMT-SE-REF-00145)                            |
  +----------------------+-----------------------------------------------------------------------+
  | | Tracking in AcO    | | Provide capability to track when the guiders and active optics      |
  | | Disabled Mode      | | disabled. [Goal to track with guiders enabled, but AcO disabled]    |
  +----------------------+-----------------------------------------------------------------------+
  | | AcO Setup Time     | | Provide the capability to complete the set up and configuration     |
  | |                    | | of active optics after telescope slew in less than the amount       |
  | |                    | | of time specified by the GMT Efficiency Budget (GMT-SE-REF-         |
  | |                    | | 00593).                                                             |
  +----------------------+-----------------------------------------------------------------------+

