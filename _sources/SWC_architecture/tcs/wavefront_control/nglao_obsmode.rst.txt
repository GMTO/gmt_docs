.. _tcs-nglao_obsmode:

*Natural-Guidestar Ground Layer Adaptive Optics (NGLAO)*
........................................................

The NGLAO WFC is illustrated in :numref:`Figure %s <nglao_wfcs_block_diagram>`.
It has strong similarities to the Natural Seeing WFC, with four main control
loops operating simultaneously:

  A. The Slow Guiding control loop updates the pointing kernel guiding offsets
     based on low-pass filtered AGWS average tilt measurements.

  B. The NGLAO Wavefront Controller tomographically reconstructs the
     ground-layer wavefront from fast AGWS WFS measurements, and corrects this
     with the ASM.

  C. The Active Optics Wavefront Controller controls field-dependent aberrations
     based on time- averaged AGWS WFS measurements.

  D. The Flexure control loop updates the position of the AGWS probes based on
     On-Instrument Wavefront Sensor measurements (typically tip-tilt only, but
     could also include focus).

The NGLAO Wavefront Controller is a simplified version of the LTAO Wavefront
Controller. The Active Optics Wavefront Controller behavior is a cross between
that in the natural seeing mode and the diffraction-limited AO modes.

.. _nglao_wfcs_block_diagram:

.. figure:: _static/nglao_wfcs_block_diagram.png

    NGLAO Wavefront Control System Simplified Block Diagram

**Component Descriptions**

    The list of the NGLAO WFC components is provided in Table below. Only the
    three components unique to the NGLAO mode are described below.

.. table:: NGLAO Wavefront Control System Components

    +-------------------------+-------------------------------------+----------------+
    | Component Name          | Description Software                | Package        |
    +=========================+=====================================+================+
    | wfc_slow_guide_pipe     | Slow Guiding Pipeline               | wfc_common_pkg |
    +-------------------------+-------------------------------------+----------------+
    | wfc_nglao_ctrl          | NGLAO Wavefront Controller          | wfc_nglao_pkg  |
    +-------------------------+-------------------------------------+----------------+
    | wfc_aco_ctrl            | Active Optics Controller            | wfc_common_pkg |
    +-------------------------+-------------------------------------+----------------+
    | wfc_nglao_recon_srv     | NGLAO Reconstructor Server          | wfc_nglao_pkg  |
    +-------------------------+-------------------------------------+----------------+
    | wfc_aco_recon_srv       | Active Optics Reconstructor Server  | wfc_common_pkg |
    +-------------------------+-------------------------------------+----------------+
    | m1_optics_ctrl          | M1 Optics Controller                | wfc_common_pkg |
    +-------------------------+-------------------------------------+----------------+
    | m2_optics_ctrl          | M2 Optics Controller                | wfc_common_pkg |
    +-------------------------+-------------------------------------+----------------+

**NGLAO Wavefront Controller**

    The NGLAO Wavefront Controller receives input from the AGWS slope processor
    and controls the surface figure of the ASM, including fast tip-tilt. In the
    NGLAO, all four AGWS sensors would generally be configured as 25×25
    Shack-Hartmann wavefront sensors, operating at up to 206 Hz frame rate. The
    ASM figure command derived from each set of AGWS WFS measurements is that
    which minimizes the wavefront error over a given region of the telescope
    focal plane. Mathematically, the reconstruction is implemented as a single
    matrix multiplication and the controller operates in pseudo-open-loop using
    position feedback from the ASM at each step to compute the next command (see
    :numref:`Figure %s <nglao_wfc_block_diagram>`). The details of this
    computation are presented in the AO Preliminary Design Report [Bouc13b]_.

    .. _nglao_wfc_block_diagram:

    .. figure:: _static/nglao_wfc_block_diagram.png

        NGLAO Wavefront Controller Block Diagram

    The NGLAO Wavefront Controller provides the following offloads to the Active
    Optics Wavefront Controller:

      * Average global M2 tip and tilt, to be offloaded to the M2 Positioner

      * The average ASM actuator positions projected onto global Zernike modes
        Z4, Z7, and Z8 (focus and coma). These are used to reposition the ASM.

      * The average ASM actuator positions projected onto M1 segment bending
        modes 1-45. These are sent to the Active Optics Wavefront Controller,
        used to offload any M1 figure errors that have been compensated by the
        ASM.

    The data interfaces of the NGLAO Wavefront Controller are listed in Table
    10-32 [TBA].

**Active Optics Wavefront Controller (NGLAO Mode)**

    The Active Optics Wavefront Controller (*wfc_aco_ctrl*) in the NGLAO mode is
    very similar to the diffraction-limited AO observing modes. All four AGWS
    sensors will generally be configured as 25×25 Shack-Hartmann wavefront
    sensors. The wfc_aco_ctrl component will receive time- averaged slope
    vectors from the AGWS Slope Processor (nominally every 30 s), from which it
    derives the corrections to M1 global tilt, global coma-neutral tilt, and
    segment Zernike modes Z5, Z6, Z9, and Z10. It also receives offloads of the
    ASM global focus and coma, and up to 45 M1 bending modes for each segment.
    These are summed and sent to the M1 and M2 optics controllers.

    Finally, unlike in the other AO modes, the *wfc_aco_ctrl* component may
    receive residual tilt and focus updates from an OIWFS Slope Processor (or
    other instrument-based wavefront measurement), which must be rotated into
    the reference frame of the telescope and used to reposition the AGWS.

**NGLAO Reconstructor Server**

    The NGLAO Reconstructor Server is another key component in this observing
    mode. It computes the minimum variance tomographic reconstructor based on
    telemetry from the AGWS and ASM (to compute the turbulence profile), and
    knowledge of the NGS positions. The input and output ports of the NGLAO
    Reconstructor Server are listed in Table 10-33 [TBA].
