

====================================================
Software and Controls Data Product Specifications II
====================================================



------------
Introduction
------------



This report provides a list of the FITS data product files produced by the Data Processing Subsystem.



--------
Acronyms
--------


.. -----------------------------------------------------------------------------


-----------------------------
FITS-Standard Data Containers
-----------------------------


.. .............................................................................


Primary HDU (PHDU)
==================



Description: 
    This is a basic model that defines the primary header data unit, or
    PHDU, of a FITS container.  This model creates an empty storage
    container.

Format:      
    Position attribute 'pos' defines the order in the FITS header, where
    -1 is the last position, while 0 specifies no particular location. 
    The last keyword in the header must be END, i.e. 'pos: -1'.

File:        
    <inst>_phdu.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Primary HDU: Basic FITS Primary Header Data Unit
    :header: "#", "Keyword", "Value", "HDU"
    
    "1", "simple", "true", "phdu"
    "2", "bitpix", "8", "phdu"
    "3", "naxis", "2", "phdu"
    "4", "naxis1", "0", "phdu"
    "5", "naxis2", "0", "phdu"
    "-1", "end", "", "phdu"

.. raw:: latex
  
    \end{center}
    \newpage




Extension HDU: Image
====================



Description: 
    This is a basic model that defines an empty FITS storage container for
    an image extension.  This base 'image' defines an area of 1024 columns
    and 1024 rows Position attribute 'pos' defines the order in the FITS
    header, where -1 is the last position, while 0 specifies no particular
    location.

Format:      
    The header keywords must follow the order shown, i.e. the first
    keyword must be XTENSION = 'IMAGE   ', the second BITPIX = 16, and so
    on.  The last keyword in the header must be END.

File:        
    <inst>_bimg.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Extension HDU: Basic FITS Image Extension
    :header: "#", "Keyword", "Value", "HDU"
    
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "2", "bitpix", "8", "phdu"
    "3", "naxis", "2", "phdu"
    "4", "naxis1", "0", "phdu"
    "5", "naxis2", "0", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "-1", "end", "", "phdu"
    "1", "simple", "true", "phdu"

.. raw:: latex
  
    \end{center}
    \newpage




Extension HDU: ASCII Table
==========================



Description: 
    This is a basic model that defines an empty FITS storage container for
    an ASCII table extension.  An ASCII table can store catalogues and
    tables of data.  Each row of the table has a fixed length of ASCII
    characters, divided into columns by TBCOLn.  This base 'table' defines
    an area of ASCII text that has one column which is 80 characters wide
    and 100 rows deep. Position attribute 'pos' defines the order in the
    FITS header, where -1 is the last position, while 0 specifies no
    particular location.

Format:      
    The header keywords must follow the order shown, i.e. the first
    keyword must be XTENSION = 'TABLE   ', the second BITPIX = 16, and so
    on.  The last keyword in the header must be END.

File:        
    <inst>_atbl.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Extension HDU: Base ASCII Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "4", "extend", "true", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "2", "bitpix", "8", "phdu"
    "3", "naxis", "2", "phdu"
    "4", "naxis1", "0", "phdu"
    "5", "naxis2", "0", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tbcol1", "1", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "-1", "end", "", "phdu"
    "1", "simple", "true", "phdu"

.. raw:: latex
  
    \end{center}
    \newpage




Extension HDU: Binary Table
===========================



Description: 
    This is a basic model that defines an empty FITS storage container for
    an binary table extension.  This base 'table' defines storage for 1
    column and 100 rows of integers, where each row has 1024 bytes in
    width.  Position attribute 'pos' defines the order in the FITS header,
    where -1 is the last position, while 0 specifies no particular
    location.

Format:      
    The header keywords must follow the order shown, i.e. the first
    keyword must be XTENSION = 'BINTABLE', the second BITPIX = 16, and so
    on.  The last keyword in the header must be END.

File:        
    <inst>_btbl.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Extension HDU: Basic Binary Table Extension
    :header: "#", "Keyword", "Value", "HDU"
    
    "4", "extend", "true", "phdu"
    "1", "xtension", "BINTABLE", "hdu1"
    "2", "bitpix", "8", "phdu"
    "3", "naxis", "2", "phdu"
    "4", "naxis1", "0", "phdu"
    "5", "naxis2", "0", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "9", "ttype1", "Col", "hdu1"
    "10", "tform1", "1024I", "hdu1"
    "11", "tunit1", "Counts", "hdu1"
    "-1", "end", "", "phdu"
    "1", "simple", "true", "phdu"

.. raw:: latex
  
    \end{center}
    \newpage



.. -----------------------------------------------------------------------------


----------------------------
Common Data Product Patterns
----------------------------


.. .............................................................................


Base Exposure Primary HDU (PHDU)
================================



Description: 
    This is a basic model that specifies baseline headers that are found
    in an GMT exposure.  This ought to be inherited by all imaging and
    spectroscopy exposures.

Format:      
    TBC

File:        
    <inst>_phdu.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Primary HDU: Base Exposure
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "date", "", "phdu"
    "0", "iraf_tlm", "", "phdu"
    "0", "nextend", "", "phdu"
    "0", "origin", "", "phdu"
    "0", "rootname", "", "phdu"
    "0", "filename", "", "phdu"
    "0", "filetype", "", "phdu"
    "0", "telescop", "GMT", "phdu"
    "0", "instrume", "", "phdu"
    "0", "equinox", "", "phdu"
    "0", "proposid", "", "phdu"
    "0", "pr_inv_l", "", "phdu"
    "0", "pr_inv_f", "", "phdu"
    "0", "pr_inv_m", "", "phdu"
    "0", "targname", "", "phdu"
    "0", "object", "", "phdu"
    "0", "ra_targ", "", "phdu"
    "0", "dec_targ", "", "phdu"
    "0", "tequinox", "", "phdu"
    "0", "expname", "", "phdu"
    "0", "date_obs", "", "phdu"
    "0", "time_obs", "", "phdu"
    "0", "expstart", "", "phdu"
    "0", "expend", "", "phdu"
    "0", "exptime", "", "phdu"
    "0", "nrptexp", "", "phdu"
    "0", "crsplit", "", "phdu"
    "0", "qualcom1", "", "phdu"
    "0", "qualcom2", "", "phdu"
    "0", "qualcom3", "", "phdu"
    "0", "quality", "", "phdu"
    "0", "postarg1", "", "phdu"
    "0", "postarg2", "", "phdu"
    "0", "eqnx_off", "", "phdu"
    "0", "obstype", "", "phdu"
    "0", "obsmode", "", "phdu"
    "0", "photmode", "", "phdu"
    "0", "sclamp", "", "phdu"
    "0", "lamp_id", "", "phdu"
    "0", "lamp_vol", "", "phdu"
    "0", "subarray", "F", "phdu"
    "0", "detector", "", "phdu"
    "0", "cmdgain", "", "phdu"
    "0", "opt_elem", "", "phdu"
    "0", "propaper", "", "phdu"
    "0", "aperture", "", "phdu"
    "0", "aper_fov", "", "phdu"
    "0", "filter", "", "phdu"
    "0", "cenwave", "", "phdu"
    "0", "detamp", "", "phdu"
    "0", "atodgain", "", "phdu"
    "0", "rdnoise", "", "phdu"
    "0", "detoffst", "", "phdu"
    "0", "platesc", "", "phdu"
    "0", "centera1", "", "phdu"
    "0", "sizaxis1", "", "phdu"
    "0", "sizaxis2", "", "phdu"
    "0", "binaxis1", "", "phdu"
    "0", "binaxis2", "", "phdu"
    "0", "bpixtab", "", "phdu"
    "0", "darkfile", "", "phdu"
    "0", "pfltfile", "", "phdu"
    "0", "dfltfile", "", "phdu"
    "0", "lfltfile", "", "phdu"
    "0", "ffltfile", "", "phdu"
    "0", "phottab", "", "phdu"
    "0", "apertab", "", "phdu"
    "0", "ccdtab", "", "phdu"
    "0", "atodtab", "", "phdu"
    "0", "biasfile", "", "phdu"
    "0", "shadfile", "", "phdu"
    "0", "crrejtab", "", "phdu"
    "0", "wavecal", "", "phdu"
    "0", "sptrctab", "", "phdu"
    "0", "disptab", "", "phdu"
    "0", "lamptab", "", "phdu"
    "0", "sdctab", "", "phdu"
    "0", "xtractab", "", "phdu"
    "0", "pctab", "", "phdu"
    "0", "wcptab", "", "phdu"
    "0", "itdstab", "", "phdu"
    "0", "asn_id", "", "phdu"
    "0", "asn_tab", "", "phdu"
    "0", "meanexp", "", "phdu"
    "0", "scalense", "", "phdu"
    "0", "initgues", "", "phdu"
    "0", "skysub", "", "phdu"
    "0", "crsigmas", "", "phdu"
    "0", "crradius", "", "phdu"
    "0", "crthresh", "", "phdu"
    "0", "badinpdq", "", "phdu"
    "0", "rej_rate", "", "phdu"
    "0", "crmask", "", "phdu"
    "0", "pattern1", "", "phdu"
    "0", "p1_shape", "", "phdu"
    "0", "p1_purps", "", "phdu"
    "0", "p1_npts", "", "phdu"
    "0", "p1_pspac", "", "phdu"
    "0", "p1_lspac", "", "phdu"
    "0", "p1_angle", "", "phdu"
    "0", "p1_frame", "", "phdu"
    "0", "p1_orint", "", "phdu"
    "0", "p1_centr", "", "phdu"
    "0", "propttl1", "", "phdu"
    "0", "obset_id", "", "phdu"
    "0", "targdesc", "", "phdu"
    "0", "pm_flag", "", "phdu"
    "0", "parallax", "", "phdu"
    "0", "pm_ra", "", "phdu"
    "0", "pm_dec", "", "phdu"
    "0", "pm_equin", "", "phdu"
    "0", "pa_v3", "", "phdu"
    "0", "airmass", "", "phdu"
    "0", "gs1_ra", "", "phdu"
    "0", "gs1_dec", "", "phdu"
    "0", "gs1_mag", "", "phdu"
    "0", "gs1_filt", "", "phdu"
    "0", "gs1_eqnx", "", "phdu"
    "0", "gs2_ra", "", "phdu"
    "0", "gs2_dec", "", "phdu"
    "0", "gs2_mag", "", "phdu"
    "0", "gs2_filt", "", "phdu"
    "0", "gs2_eqnx", "", "phdu"
    "0", "gs3_ra", "", "phdu"
    "0", "gs3_dec", "", "phdu"
    "0", "gs3_mag", "", "phdu"
    "0", "gs3_filt", "", "phdu"
    "0", "gs3_eqnx", "", "phdu"
    "0", "gs4_ra", "", "phdu"
    "0", "gs4_dec", "", "phdu"
    "0", "gs4_mag", "", "phdu"
    "0", "gs4_filt", "", "phdu"
    "0", "gs4_eqnx", "", "phdu"
    "0", "proctime", "", "phdu"
    "0", "history", "", "phdu"

.. raw:: latex
  
    \end{center}
    \newpage




Base Exposure Extension HDU (EHDU)
==================================



Description: 
    This is a basic model that specifies baseline headers that are found
    in an GMT exposure.  This ought to be inherited by all imaging and
    spectroscopy exposures.

Format:      
    

File:        
    <inst>_ehdu.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Extension HDU: Base Exposure
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "extname", "", "ehdu"
    "0", "extver", "", "ehdu"
    "0", "iraf_tlm", "", "ehdu"
    "0", "inherit", "", "ehdu"
    "0", "expname", "", "ehdu"
    "0", "bunit", "", "ehdu"
    "0", "asn_mtyp", "", "ehdu"
    "0", "wcsaxes", "", "ehdu"
    "0", "crpix1", "", "ehdu"
    "0", "crpix2", "", "ehdu"
    "0", "crval1", "", "ehdu"
    "0", "crval2", "", "ehdu"
    "0", "ctype1", "", "ehdu"
    "0", "ctype2", "", "ehdu"
    "0", "cd1_1", "", "ehdu"
    "0", "cd1_2", "", "ehdu"
    "0", "cd2_1", "", "ehdu"
    "0", "cd2_2", "", "ehdu"
    "0", "ltv1", "", "ehdu"
    "0", "ltv2", "", "ehdu"
    "0", "ltm1_1", "", "ehdu"
    "0", "ltm2_2", "", "ehdu"
    "0", "ra_aper", "", "ehdu"
    "0", "dec_aper", "", "ehdu"
    "0", "pa_aper", "", "ehdu"
    "0", "dispaxis", "", "ehdu"
    "0", "cunit1", "", "ehdu"
    "0", "cunit2", "", "ehdu"
    "0", "orientat", "", "ehdu"
    "0", "sunangle", "", "ehdu"
    "0", "moonangl", "", "ehdu"
    "0", "sun_alt", "", "ehdu"
    "0", "refframe", "", "ehdu"
    "0", "date_obs", "", "ehdu"
    "0", "time_obs", "", "ehdu"
    "0", "expstart", "", "ehdu"
    "0", "expend", "", "ehdu"
    "0", "exptime", "", "ehdu"
    "0", "expflag", "", "ehdu"
    "0", "rv_helio", "", "ehdu"
    "0", "pattstep", "", "ehdu"
    "0", "ncombine", "", "ehdu"
    "0", "ngoodpix", "", "ehdu"
    "0", "sdqflags", "", "ehdu"
    "0", "goodmin", "", "ehdu"
    "0", "goodmax", "", "ehdu"
    "0", "snrmin", "", "ehdu"
    "0", "snrmax", "", "ehdu"
    "0", "snrmean", "", "ehdu"
    "0", "softerrs", "", "ehdu"
    "0", "meandark", "", "ehdu"
    "0", "meanblev", "", "ehdu"
    "0", "sporder", "", "ehdu"

.. raw:: latex
  
    \end{center}
    \newpage




Base Calibration Reference Table (CRT)
======================================



Description: 
    This is a basic model that specifies baseline headers for GMT
    calibration reference tables.

Format:      
    

File:        
    <inst>_crt.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Extension HDU:  Base Calibration Reference Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "simple", "T", "phdu"
    "0", "bitpix", "8", "ehdu"
    "0", "naxis", "2", "ehdu"
    "0", "extend", "T", "phdu"
    "0", "filename", "", "phdu"
    "0", "telescop", "GMT", "phdu"
    "0", "instrume", "", "phdu"
    "0", "date", "", "phdu"
    "0", "filetype", "", "phdu"
    "0", "use_date", "", "phdu"
    "0", "descrip", "", "phdu"
    "0", "aperture", "", "phdu"
    "0", "cenwave", "", "phdu"
    "0", "end", "", "ehdu"
    "0", "xtension", "BINTABLE", "ehdu"
    "0", "naxis1", "", "ehdu"
    "0", "naxis2", "", "ehdu"
    "0", "pcount", "0", "ehdu"
    "0", "gcount", "1", "ehdu"
    "0", "tfields", "", "ehdu"
    "0", "extname", "", "ehdu"
    "0", "extver", "1", "phdu"
    "0", "inherit", "T", "ehdu"

.. raw:: latex
  
    \end{center}
    \newpage



.. -----------------------------------------------------------------------------


--------------------------------------------
Calibration and Reference File Data Products
--------------------------------------------



Bias Frame (BIA)
================



Description: 
    This is an image of the electronic zeropoint-level of an instrument,
    obtained with all light sources turned off, the detector shutter
    closed, and zero-second (or shortest possible) integration time.
    Usually, multiple (>10) bias images are taken at the beginning and/or
    end of the night and combined into one image. The file for the
    combined bias frame has the 'bia' suffix; pre-combined bias frames
    have a 'raw' suffix.  The combined bias image is removed from the
    science images, usually as the first step in the data reduction.

Format:      
    For both a single and multi-chip detector, the combined bias image is
    stored as an multi-extension file, with each set corresponding to each
    detector chip.  If it is possible to change the binning mode of a
    detector, the binning factors are given by BINAXIS1 and BINAXIS2
    header parameters.  The bias image [SCI] and the error array [ERR]
    have raw detector data units (DN), such that GAIN * DN = electrons.

File:        
    <inst>_bia.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Bias Frame
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "BIAS", "phdu"
    "0", "extname", "BIAS", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "DN", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Dark Frame (DRK)
================



Description: 
    This image records the dark-current signal of an instrument, obtained
    with ambient light turned off, the detector shutter closed. 
    Typically, multiple dark exposures are taken at the beginning and/or
    end of the night, using different integration time settings.  After
    subtracting out the bias, the individual dark images are combined into
    one and normalized to 1 second. The file for the combined dark frame
    has the “drk” suffix; pre-combined dark frames have a “raw” suffix. 
    When applying dark correction to a science image, the combined dark
    image is scaled to the exposure time of the science image and removed,
    usually either as the second (after bias subtraction) or third (after
    overscan correction, if relevant) step in the data reduction.

Format:      
    A combined dark image is stored as an MEF of the type shown in Figure
    5-1 for an optical/UV detector, and Figure 5 2 for a NIR detector. 
    When it is possible to change the binning mode of a detector, the
    binning factors are given by BINAXIS1 and BINAXIS2 header parameters. 
    The dark image [SCI] and the error array [ERR] have raw detector data
    units per second (DN/sec), such that GAIN * DN = electrons/sec, for
    both UVIS and IR images.  The header keyword EXPTIME = 1 is set to
    indicate the normalization.

    Two flags in the [DQ] extension that potentially are present are 16
    (hot pixels) and 128 (bad reference pixels, for IR detectors). Other,
    more permanent flags, e.g. dead and unstable pixels, should be stored
    in the bad pixel table (suffix “BPX”) file.  IR detectors – For IR
    detectors, the SAMP and the TIME image extensions (see Figure 5 2) are
    used to calculate the total exposure times (TIME * SAMP) at each
    pixel. The SAMP extension gives the total number of retained input
    samples after image combination, and is an image.  The TIME extension
    gives the total open shutter exposure time at that readout sequence
    and is a single value for all pixels, thus the exposure time is stored
    as a PIXVALUE keyword value and not as EXPTIME (=1.0).

    NUMEXPOS is intended for NIR MEF, where the keyword in the phdu
    contains the number of sets.

    PIXVALUE is used for the TIME extension, for image exposure time.

    SAMP_SEQ, for NIR data, name the sampling sequence for a MULTIACCUM
    readout.

File:        
    <inst>_drk.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Dark Frame
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "DARK", "phdu"
    "0", "extname", "DARK", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "numexpos", "", "phdu"
    "0", "bunit", "DN/s", "phdu"
    "0", "pixvalue", "", "ehdu"
    "0", "exptime", "1", "ehdu"
    "0", "samp_seq", "", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Dome Flat Field (DFL)
=====================



Description: 
    The dome-flat is an image that records the pixel-to-pixel response of
    a detector, using a bright artificial light source in the dome to
    provide the illumination.  Dome flats contain wavelength-dependent
    information about the uniformity of the detector response.  After bias
    and dark subtraction, the combined dome flat is divided into the
    science images for calibration. 

Format:      
    A combined dome image is stored as an MEF of the type shown in Figure
    5-1 for all optical/UV and NIR detectors, with only a single set of
    extension HDUs.  The suffix “DFL” is used only for combined flat;
    individual raw flatfield images have the “RAW” suffix.

    The median of the pixel value distribution is normalized to 1.

File:        
    <inst>_dfl.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Dome Flat Field Frame
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "DOME FLAT", "phdu"
    "0", "extname", "FLT", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "DN", "phdu"
    "0", "lamp_id", "", "phdu"
    "0", "lamp_vol", "", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Night Sky Flat Field (NFL)
==========================



Description: 
    A night-sky flatfield is an image that records the pixel-to-pixel
    response of a detector using sky observations. Night-sky flatfields
    contain wavelength-dependent information about the uniformity of the
    detector response.  They are similar to twilight-sky flats (or
    “twiflats,” suffix TFL, Appendix B.01f), except they are taken in the
    middle of the night rather than near sunrise or sunset for twiflats. 
    The images used to combine night-sky flats may sometimes be intended
    for other purposes, such as science images themselves.  Often,
    night-sky flats are observed immediately surrounding the intended
    science images.  Night-sky and twi-flats may be derived using
    different data processing procedures.  After bias and dark
    subtraction, the combined flat is divided into the science images for
    calibration.

Format:      
    A combined night-sky flatfield image is stored as an MEF of the type
    shown in Figure 5-1 for all optical/UV and NIR detectors, with only a
    single set of extension HDUs.  The suffix “NFL” is used only for
    combined flat; individual raw flatfield images have the “RAW” suffix.

    Median of the pixel value distribution is normalized to 1.

File:        
    <inst>_nfl.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Night-Sky Flat Field Frame
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "NIGHT SKY FLAT", "phdu"
    "0", "extname", "FLT", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "DN", "phdu"
    "0", "lamp_id", "", "phdu"
    "0", "lamp_vol", "", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Twilight Flat Field (TFL)
=========================



Description: 
    A twilight sky-flat (or 'twiflats') is an image that records the
    pixel-to-pixel response of a detector using sky observations. Twiflats
    contain wavelength-dependent information about the uniformity of the
    detector response, and by definition are taken close to sunset or
    sunrise.  The distinction between night-sky flatfield, dome flats, and
    twiflats should be made clear, as different data processing procedures
    are sometimes involved. After bias and dark subtraction, the combined
    flat is divided into the science images for calibration.

Format:      
    A combined twiflat image is stored as a multi-extension file for all
    optical/UV and NIR detectors, with only a single set of extension
    HDUs.  The suffix 'TFL' is used only for combined flat; individual raw
    flatfield images have the 'RAW' suffix.

File:        
    <inst>_tfl.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Twilight Flat Field Frame
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "TWILIGHT SKY FLAT", "phdu"
    "0", "extname", "FLT", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "DN", "phdu"
    "0", "lamp_id", "", "phdu"
    "0", "lamp_vol", "", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Background Illumination Pattern (ILM)
=====================================



Description: 
    This is an image of spatially variable background illumination
    pattern.  Correcting for the background pattern involves dividing the
    illumination image from data.  When the signal is low, the background
    illumination pattern file is sometimes constructed using multiple
    (potentially science) images with object rejection, or by smoothing
    the background illumination pattern image.  Details of image
    combination and smoothing are stored under the header keyword HISTORY,
    or potentially in a data processing trailer file.

Format:      
    A background illumination file is stored as an MEF of the type shown
    in Figure 5 1 for all optical/UV and NIR detectors.  The suffix “ILM”
    is used only for combined illumination file; individual raw flatfield
    images have the “RAW” suffix.

File:        
    <inst>_ilm.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Background Illumination Pattern Frame
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "ILLUMINATION PATTERN", "phdu"
    "0", "extname", "ILM", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "DN", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Bad Pixel Mask (MSK)
====================



Description: 
    This is an image of all known, long-term, bad pixels for a detector. 
    It is an image counterpart the “Bad Pixel Table (BPX)” discussed in
    Appendix B.02b.  Transient hot pixels or cosmic rays detected during
    data reduction are stored in the data quality extension (DQ) of an
    MEF, or in the dark current reference file (file suffix “DRK”),
    depending on the purpose.  The pixel values correspond to the data
    quality file as shown in Table 5-2.

Format:      
    The coordinate origin of the bad pixel image is at the lower left
    corner after trimming the overscan region.  The types of bad pixels
    recorded and their code values are: 

    4 – dead pixels
    8 – deviant zeroth read (NIR) or bad pixel in bias (UVIS)
    32 – unstable (NIR)
    512 – bad in flatfield 

    These values are reflected in the data quality extensions during data
    processing.

File:        
    <inst>_msk.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Bad Pixel Mask Frame
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "STATIC BAD PIXEL MASK", "phdu"
    "0", "extname", "MSK", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Post Flash Image (FLS)
======================



Description: 
    A post-flash image corrects for the signal added to CCD exposures
    after a post-flash procedure. Correcting for post-flash signal
    involves: scaling the reference image in exposure time and gain to the
    science image, followed by image subtraction.

Format:      
    A post-flash reference is an MEF of the same FITS data structure,
    image dimension and binning factor, as the science image.  Like the
    raw science image, it consists of both the physical and virtual
    overscan regions.

File:        
    <inst>_fls.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Post Flash Image
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "POST FLASH", "phdu"
    "0", "extname", "FLS", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "DN", "phdu"
    "0", "detamp", "", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Analog to Digital Table (A2D)
=============================



Description: 
    This table provides a more detailed account of the A-to-D gain of a
    detector, i.e. number of actual counts (electrons) for each detected
    count (ADU) in an image, than provided in the image header keyword
    GAIN.  This table is useful when the actual, measured, gain of a
    detector drifts with respect to an independent variable (REF_NAME),
    such as the exposure time, despite the nominal GAIN setting.  The
    values of the independent variable are stored in the REF_VALUE array
    while the corresponding actual gain values are in ATOD.

Format:      
    

File:        
    <inst>_a2d.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Analog-to-Digital Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "ANALOG TO DIGITAL", "phdu"
    "0", "extname", "A2D", "ehdu"
    "1", "xtension", "BINTABLE", "hdu1"
    "9", "ttype1", "Col", "hdu1"
    "10", "tform1", "1024I", "hdu1"
    "0", "tdisp1", "A4", "ehdu"
    "11", "tunit1", "Counts", "hdu1"
    "0", "ttype2", "CMDGAIN", "ehdu"
    "0", "tform2", "I2", "ehdu"
    "0", "tdisp2", "I2.1", "ehdu"
    "0", "tunit2", "Integer", "ehdu"
    "0", "ttype3", "DETCHIP", "ehdu"
    "0", "tform3", "I1", "ehdu"
    "0", "tdisp3", "I1.1", "ehdu"
    "0", "ttype4", "NELEM", "ehdu"
    "0", "tform4", "I2", "ehdu"
    "0", "tdisp4", "I2.1", "ehdu"
    "0", "ttype5", "REF_NAME", "ehdu"
    "0", "tform5", "A12", "ehdu"
    "0", "tdisp5", "A12", "ehdu"
    "0", "ttype6", "REF_VALUE", "ehdu"
    "0", "tform6", "I2", "ehdu"
    "0", "tdisp6", "I2.1", "ehdu"
    "0", "ttype7", "ATODGAIN", "ehdu"
    "0", "tform7", "F5.2", "ehdu"
    "0", "tdisp7", "F5.2", "ehdu"
    "0", "ttype8", "DATESTAMP", "ehdu"
    "0", "tform8", "A10", "ehdu"
    "0", "tdisp8", "A10", "ehdu"
    "0", "ttype9", "TIMESTAMP", "ehdu"
    "0", "tform9", "A12", "ehdu"
    "0", "tdisp9", "A12", "ehdu"
    "0", "ttype10", "DESCRIP", "ehdu"
    "0", "tform10", "A67", "ehdu"
    "0", "tdisp10", "A67", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Bad Pixel Table (BPX)
=====================



Description: 
    A bad pixel table contains a list on all known, long-term, bad pixels
    for a detector.  This is the table counterpart of the “Static Bad
    Pixel Image (MSK)” discussed in Appendix B.01i. Transient hot pixels
    or cosmic rays detected during data reduction are stored in the data
    quality extension (DQ) of an MEF, or in the dark current reference
    file (file suffix “DRK”), depending on the purpose.

Format:      
    

File:        
    <inst>_bpx.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Bad Pixel Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "BAD PIXEL", "phdu"
    "0", "extname", "BPX", "ehdu"
    "1", "xtension", "BINTABLE", "hdu1"
    "9", "ttype1", "Col", "hdu1"
    "10", "tform1", "1024I", "hdu1"
    "0", "tdisp1", "A4", "ehdu"
    "0", "ttype2", "XPOS", "ehdu"
    "0", "tform2", "I5", "ehdu"
    "0", "tdisp2", "I5.1", "ehdu"
    "0", "ttype3", "YPOS", "ehdu"
    "0", "tform3", "I5", "ehdu"
    "0", "tdisp3", "I5.1", "ehdu"
    "0", "ttype4", "VALUE", "ehdu"
    "0", "tform4", "I4", "ehdu"
    "0", "tdisp4", "I4.1", "ehdu"
    "0", "ttype5", "DESCRIP", "ehdu"
    "0", "tform5", "A67", "ehdu"
    "0", "tdisp5", "A67", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "11", "tunit1", "Counts", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Detector Characteristics Table (DCT)
====================================



Description: 
    A detector can have several readout modes, distinguished by readout
    speed, gain, bias level, binning factor settings, which an observer
    may manually set to optimize observations.  Each readout mode is
    associated with a set of calibrated values in gain, bias level,
    readnoise, saturation level, etc..  For example, faster readout speeds
    usually result in higher readnoise.  This master table stores
    information that maps a selected readout mode setting with measured
    performance parameters.

Format:      
    In the FITS table, each row corresponds to a readout  configuration. 
    Each row is uniquely specified by the following  parameters: the
    readout amplifiers configuration (AMPCONFIG), the  detector chip
    (DETCHIP), speed of the readout (RDSPEED),  commanded gain (CMDGAIN),
    commanded bias (CMDBIAS), and chip  binning factors (BINAXIS1,
    BINAXIS2), as well as the date and  time stamps (DATESTAMP,
    TIMESTAMP).  The actual measured  parameters for the readout modes are
    the bias levels (BIASA  through BIASD), gain (ATODGNA through
    ATODGND), and readnoise  (RDNOISEA through RDNOISED). 

    Table B-18 show an example where a detector chip is read out by 4 
    amplifiers (A-D), each amplifier reading out one quadrant.  The  AMPX
    and AMPY keywords indicate the dividing rows and columns of  the
    quadrants.  For example, For a 4096x4096 pixels in area,  AMPX=2049
    and AMPY=2049 indicate that the first quadrant runs  from rows and
    columns 1-2048, while the fourth quadrant runs from  2049-4096 rows
    and columns.

File:        
    <inst>_dct.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Detector Characteristics Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "DETECTOR CHARACTERISTICS", "phdu"
    "0", "extname", "DCT", "phdu"
    "9", "ttype1", "Col", "hdu1"
    "10", "tform1", "1024I", "hdu1"
    "0", "tdisp1", "A4", "ehdu"
    "0", "ttype2", "DETCHIP", "ehdu"
    "0", "tform2", "I1", "ehdu"
    "0", "tdisp2", "I1.1", "ehdu"
    "0", "ttype3", "RDSPEED", "ehdu"
    "0", "tform3", "A4", "ehdu"
    "0", "tdisp3", "A4", "ehdu"
    "0", "ttype4", "CMDGAIN", "ehdu"
    "0", "tform4", "I2", "ehdu"
    "0", "tdisp4", "I2.1", "ehdu"
    "0", "ttype5", "CMDBIASA", "ehdu"
    "0", "tform5", "F5", "ehdu"
    "0", "tdisp5", "F5.2", "ehdu"
    "0", "ttype6", "CMDBIASB", "ehdu"
    "0", "tform6", "F5", "ehdu"
    "0", "tdisp6", "F5.2", "ehdu"
    "0", "ttype7", "CMDBIASC", "ehdu"
    "0", "tform7", "F5", "ehdu"
    "0", "tdisp7", "F5.2", "ehdu"
    "0", "ttype8", "CMDBIASD", "ehdu"
    "0", "tform8", "F5", "ehdu"
    "0", "tdisp8", "F5.2", "ehdu"
    "0", "ttype9", "BINAXIS1", "ehdu"
    "0", "tform9", "I2", "ehdu"
    "0", "tdisp9", "I2.1", "ehdu"
    "0", "ttype10", "BINAXIS2", "ehdu"
    "0", "tform10", "I2", "ehdu"
    "0", "tdisp10", "I2.1", "ehdu"
    "0", "ttype11", "BIASA", "ehdu"
    "0", "tform11", "F5", "ehdu"
    "0", "tdisp11", "F5.2", "ehdu"
    "0", "ttype12", "BIASB", "ehdu"
    "0", "tform12", "F5", "ehdu"
    "0", "tdisp12", "F5.2", "ehdu"
    "0", "ttype13", "BIASC", "ehdu"
    "0", "tform13", "F5", "ehdu"
    "0", "tdisp13", "F5.2", "ehdu"
    "0", "ttype14", "BIASD", "ehdu"
    "0", "tform14", "F5", "ehdu"
    "0", "tdisp14", "F5.2", "ehdu"
    "0", "ttype15", "ATODGNA", "ehdu"
    "0", "tform15", "F5", "ehdu"
    "0", "tdisp15", "F5.2", "ehdu"
    "0", "ttype16", "ATODGNB", "ehdu"
    "0", "tform16", "F5", "ehdu"
    "0", "tdisp16", "F5.2", "ehdu"
    "0", "ttype17", "ATODGNC", "ehdu"
    "0", "tform17", "F5", "ehdu"
    "0", "tdisp17", "F5.2", "ehdu"
    "0", "ttype18", "ATODGND", "ehdu"
    "0", "tform18", "F5", "ehdu"
    "0", "tdisp18", "F5.2", "ehdu"
    "0", "ttype19", "RDNOISEA", "ehdu"
    "0", "tform19", "F5", "ehdu"
    "0", "tdisp19", "F5.2", "ehdu"
    "0", "ttype20", "RDNOISEB", "ehdu"
    "0", "tform20", "F5", "ehdu"
    "0", "tdisp20", "F5.2", "ehdu"
    "0", "ttype21", "RDNOISEC", "ehdu"
    "0", "tform21", "F5", "ehdu"
    "0", "tdisp21", "F5.2", "ehdu"
    "0", "ttype22", "RDNOISED", "ehdu"
    "0", "tform22", "F5", "ehdu"
    "0", "tdisp22", "F5.2", "ehdu"
    "0", "ttype23", "AMPA", "ehdu"
    "0", "tform23", "I6", "ehdu"
    "0", "tdisp23", "I6.1", "ehdu"
    "0", "ttype24", "AMPB", "ehdu"
    "0", "tform24", "I6", "ehdu"
    "0", "tdisp24", "I6.1", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "BINTABLE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "11", "tunit1", "Counts", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Cosmic Ray Rejection Parameter (CRR)
====================================



Description: 
    This table contains the parameters used to identify pixels affected by
    cosmic-rays (CR) when observed data images are split into multiple
    sub-exposures for the purpose.  The affected pixels are marked for
    rejection in the data quality (DQ) extension of individual frames. 
    The identification process begins by median-combining or minimum
    thresholding a list of CR-split images (FILTSCHEME) to estimate the
    background sky level (SKYSUB) and noise (SCALENSE) values.  Those
    pixels above a certain threshold value given by CRTHRESH and CRSIGMAS
    are identified as being cosmic-ray hit.  If CRMASK is set to ‘Y’, then
    the CR-hit pixels take on values given by BADINDPDQ in the DQ
    extension of the affected image.  If CRRADIUS is specified, then
    neighboring pixels are also identified as being affected.

Format:      
    

File:        
    <inst>_crr.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Cosmic Ray Rejection Parameters
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "COSMIC RAY REJECTION", "phdu"
    "0", "extname", "CRR", "phdu"
    "1", "xtension", "BINTABLE", "hdu1"
    "9", "ttype1", "Col", "hdu1"
    "10", "tform1", "1024I", "hdu1"
    "0", "tdisp1", "I1.1", "ehdu"
    "0", "ttype2", "CRSPLIT", "ehdu"
    "0", "tform2", "I2", "ehdu"
    "0", "tdisp2", "I2.1", "ehdu"
    "0", "ttype3", "MEANEXP", "ehdu"
    "0", "tform3", "I2", "ehdu"
    "0", "tdisp3", "I2.1", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "11", "tunit1", "Counts", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Image Distortion Coefficients (IDC)
===================================



Description: 
    This reference table contains information on geometric distortion
    models for generic imaging detectors.  More specifically, the table
    contains coefficients and values for a polynomial that maps the
    coordinates from a raw image (distorted) to an undistorted space and
    vice versa.

Format:      
    The format for the image distortion coefficient table is shown in
    Table B-22.  The header keyword NORDER indicates the order of the
    polynomial and the number of coefficients used in the transformation.

File:        
    <inst>_idc.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Image Distortion Coefficients
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "DISTORTION COEFFICIENTS", "phdu"
    "0", "extname", "IDC", "phdu"
    "1", "xtension", "BINTABLE", "hdu1"
    "0", "norder", "", "ehdu"
    "0", "parity", "", "ehdu"
    "9", "ttype1", "Col", "hdu1"
    "10", "tform1", "1024I", "hdu1"
    "0", "tdisp1", "I1.1", "ehdu"
    "0", "ttype2", "DIRECTION", "ehdu"
    "0", "tform2", "I2", "ehdu"
    "0", "tdisp2", "I2.1", "ehdu"
    "0", "ttype3", "FILTER", "ehdu"
    "0", "tform3", "A10", "ehdu"
    "0", "tdisp3", "A10", "ehdu"
    "0", "ttype4", "XSIZE", "ehdu"
    "0", "tform4", "I5", "ehdu"
    "0", "tdisp4", "I5.1", "ehdu"
    "0", "tunit4", "pixel", "ehdu"
    "0", "tdesc4", "Raw image size in X-direction", "ehdu"
    "0", "ttype5", "YSIZE", "ehdu"
    "0", "tform5", "I5", "ehdu"
    "0", "tdisp5", "I5.1", "ehdu"
    "0", "tunit5", "pixel", "ehdu"
    "0", "tdesc5", "Raw image size in Y-direction", "ehdu"
    "0", "ttype6", "XREF", "ehdu"
    "0", "tform6", "F10", "ehdu"
    "0", "tdisp6", "F10.6", "ehdu"
    "0", "tunit6", "pixel", "ehdu"
    "0", "tdesc6", "X position of reference point", "ehdu"
    "0", "ttype7", "YREF", "ehdu"
    "0", "tform7", "F10", "ehdu"
    "0", "tdisp7", "F10.6", "ehdu"
    "0", "tunit7", "pixel", "ehdu"
    "0", "tdesc7", "Y position of reference point", "ehdu"
    "0", "ttype8", "THETA", "ehdu"
    "0", "tform8", "F10", "ehdu"
    "0", "tdisp8", "F10.6", "ehdu"
    "0", "tunit8", "arcsec", "ehdu"
    "0", "tdesc8", "Scale of square corrected pixel", "ehdu"
    "0", "ttype9", "V2REF", "ehdu"
    "0", "tform9", "F10", "ehdu"
    "0", "tdisp9", "F10.6", "ehdu"
    "0", "tunit9", "arcsec", "ehdu"
    "0", "tdesc9", "V2 position of reference point [Axis name TBC]", "ehdu"
    "0", "ttype10", "V3REF", "ehdu"
    "0", "tform10", "F10", "ehdu"
    "0", "tdisp10", "F10.6", "ehdu"
    "0", "tunit10", "arcsec", "ehdu"
    "0", "tdesc10", "V3 position of reference point [Axis name TBC]", "ehdu"
    "0", "ttype11", "CX10", "ehdu"
    "0", "tform11", "F10.6", "ehdu"
    "0", "tdisp11", "F10.6", "ehdu"
    "0", "tdesc11", "Distortion coefficients for X position", "ehdu"
    "0", "ttype12", "CX11", "ehdu"
    "0", "tform12", "F10.6", "ehdu"
    "0", "tdisp12", "F10.6", "ehdu"
    "0", "tdesc12", "Distortion coefficients for X position", "ehdu"
    "0", "ttype13", "CY10", "ehdu"
    "0", "tform13", "F10.6", "ehdu"
    "0", "tdisp13", "F10.6", "ehdu"
    "0", "tdesc13", "Distortion coefficients for Y position", "ehdu"
    "0", "ttype14", "CY11", "ehdu"
    "0", "tform14", "F10.6", "ehdu"
    "0", "tdisp14", "F10.6", "ehdu"
    "0", "tdesc14", "Distortion coefficients for Y position", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "11", "tunit1", "Counts", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage






Photometric Calibration (PHT)
=============================



Description: 
    This reference file contains photometry keywords and calibrated
    values:  PHOTMODE, PHOTFLAM, PHOTFNU, PHOTZPT, PHOTPLAM, PHOTBW for an
    instrument camera and filter combination used in an observation.  If
    the science image has units in [DN sec-1], multiplying the pixel value
    by PHOFLAM or PHOTFNU yields absolute source fluxes in [ergs sec^-1
    cm^-2 Ang^-1] or [Jy], respectively.

Format:      
    The photometry parameters file consists the columns shown in Table
    B-26.  The PHOTMODE string is a comma-separated string of: instrument
    name, camera name/number, and filter or grating name. The HISTORY
    keyword in the HDU header or a trailer file contains detailed
    information on the calibration files used to derive the photometric
    parameters.

File:        
    <inst>_pht.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Photometric Calibration
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "PHOTOMETRIC CALIBRATION", "phdu"
    "0", "extname", "PHT", "ehdu"
    "1", "xtension", "BINTABLE", "hdu1"
    "9", "ttype1", "Col", "hdu1"
    "10", "tform1", "1024I", "hdu1"
    "0", "tdisp1", "A19", "ehdu"
    "0", "tdesc1", "Instrument observing mode", "ehdu"
    "0", "ttype2", "PHOTFLAM", "ehdu"
    "0", "tform2", "E10", "ehdu"
    "0", "tdisp2", "E10.5", "ehdu"
    "0", "tunit2", "ergs/cm^2/Ang/DN", "ehdu"
    "0", "tdesc2", "Inverse sensitivity", "ehdu"
    "0", "ttype3", "PHOTFNU", "ehdu"
    "0", "tform3", "E10", "ehdu"
    "0", "tdisp3", "E10.5", "ehdu"
    "0", "tunit3", "Jy sec DN^-1", "ehdu"
    "0", "tdesc3", "Inverse sensitivity", "ehdu"
    "0", "ttype4", "PHOTPLAM", "ehdu"
    "0", "tform4", "E10", "ehdu"
    "0", "tdisp4", "E10.5", "ehdu"
    "0", "tunit4", "Angstrom", "ehdu"
    "0", "tdesc4", "Inverse sensitivity", "ehdu"
    "0", "ttype5", "PHOTBW", "ehdu"
    "0", "tform5", "E10", "ehdu"
    "0", "tdisp5", "E10.5", "ehdu"
    "0", "tunit5", "Angstrom", "ehdu"
    "0", "tdesc5", "Bandwidth", "ehdu"
    "0", "ttype6", "PHOTZPT", "ehdu"
    "0", "tform6", "E10", "ehdu"
    "0", "tdisp6", "E10.5", "ehdu"
    "0", "tunit6", "mag", "ehdu"
    "0", "tdesc6", "Photometric zeropoint", "ehdu"
    "0", "ttype7", "DATESTAMP", "ehdu"
    "0", "tform7", "A10", "ehdu"
    "0", "tdisp7", "A10", "ehdu"
    "0", "tdesc7", "Date stamp", "ehdu"
    "0", "ttype8", "TIMESTAMP", "ehdu"
    "0", "tform8", "A12", "ehdu"
    "0", "tdisp8", "A12", "ehdu"
    "0", "tdesc8", "Time stamp", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "11", "tunit1", "Counts", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Aperture Throughput Table (APT)
===============================



Description: 
    This is a table containing the wavelength-dependent transmission of
    each aperture with respect to a nominated reference aperture.

Format:      
    The columns consist of: Aperture ID, number of elements in the
    throughput array, wavelength array, array of system throughput at
    corresponding wavelength, pedigree (datestamp) of reference data, and
    description.  The suffix 'APT' is used to denote the file type.

File:        
    <inst>_apt.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Aperture Throughput Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "APERTURE THROUGHPUT TABLE", "phdu"
    "0", "obstype", "SPECTROSCOPIC", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "0", "extname", "APT", "ehdu"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "0", "tdisp1", "A19", "ehdu"
    "0", "tdesc1", "Aperture name", "ehdu"
    "0", "ttype2", "NELEM", "ehdu"
    "0", "tform2", "I6", "ehdu"
    "0", "tdisp2", "I6.1", "ehdu"
    "0", "tunit2", "", "ehdu"
    "0", "tdesc2", "Number of data points in throughput array", "ehdu"
    "0", "ttype3", "WAVELENGTH", "ehdu"
    "0", "tform3", "E12", "ehdu"
    "0", "tdisp3", "E12.7", "ehdu"
    "0", "tunit3", "Angstrom", "ehdu"
    "0", "tdesc3", "Reference wavelength array", "ehdu"
    "0", "ttype4", "THROUGHPUT", "ehdu"
    "0", "tform4", "F6", "ehdu"
    "0", "tdisp4", "F6.4", "ehdu"
    "0", "tunit4", "percent", "ehdu"
    "0", "tdesc4", "Total system throughput at each wavelength", "ehdu"
    "0", "ttype5", "DATESTAMP", "ehdu"
    "0", "tform5", "A67", "ehdu"
    "0", "tdisp5", "A67", "ehdu"
    "0", "tunit5", "date", "ehdu"
    "0", "tdesc5", "Date stamp", "ehdu"
    "0", "ttype6", "DESCRIP", "ehdu"
    "0", "tform6", "A67", "ehdu"
    "0", "tdisp6", "A67", "ehdu"
    "0", "tdesc6", "Description of reference data", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "80", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "tbcol1", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




.. -----------------------------------------------------------------------------

------------------------------------
Science and Operations Data Products
------------------------------------



Raw Data (RAW)
==============



Description: 
    This is the first FITS data product produced by the DPS after
    receiving data from an instrument, where the data are in their
    unprocessed image state.  To arrive at this stage, the DPS:

        • Packaged the raw instrument data stream into FITS binary data  
          format,

        • Parsed the telemetry stream to obtain meta data and to assign FITS
          header information,

        • Created a FITS file with the “raw” suffix, without regard to   how the
          data would subsequently be used,

    At this stage, the file suffix does not yet reflect the intended
    purpose of the data.  The purpose is only apparent after additional
    data processing when another suffix (e.g. “bia”, “drk”, “dfl”, etc.)
    would replace the “raw” suffix.  The raw FITS file is stored
    permanently into the data archive.

Format:      
    The default file format for an UVIS CCD is shown in Figure 5-1 and
    discussed in Section 5.2.3, whereas for an NIR array, the format is
    shown in Figure 5-2 of Section 5.2.4.

File:        
    <inst>_raw.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Raw Data
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "RAW", "phdu"
    "0", "extname", "RAW", "phdu"
    "0", "obstype", "IMAGING", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "0", "bunit", "DN", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Wavelength Calibration Exposure (WAV)
=====================================



Description: 
    This is an image containing 2-D spectral lines as observed from a
    spectral calibration light source, where the spectrum is dispersed
    along one dimension while spatial information is along the other
    dimension.  This file is used to determine the wavelength solution of
    a corresponding science data spectral image.  The spatial and
    dispersion directions might not necessarily be perfectly orthogonal,
    nor aligned with the detector pixel directions.

Format:      
    The 2-D lamp spectral image is stored as a multi-extension file. The
    suffix 'WAV' is used to denote the file type.

File:        
    <inst>_wav.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Wavelength Calibration Exposure
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "WAVELENGTH CALIBRATION SPECTRAL IMAGE", "phdu"
    "0", "extname", "WAV", "phdu"
    "0", "obstype", "SPECTROSCOPIC", "phdu"
    "0", "filter", "CLEAR", "phdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "1024", "hdu1"
    "5", "naxis2", "1024", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "1", "xtension", "IMAGE", "hdu1"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Template Calibration Lamp Spectra Table (LMP)
=============================================



Description: 
    The template calibration table contains spectra of the calibration
    lamp obtained at different operating voltage levels.  These spectra
    are used to create template spectra or images, from which wavelength
    corrections can be determined, and wavelength solution determined.

Format:      
    The lamp spectral calibration table is stored as a multi-extension
    file.  The suffix 'LMP' is used to denote the file type.

File:        
    <inst>_lmp.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Template Calibration Lamp Spectra Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "TEMPLATE CAL LAMP SPECTRA TABLE", "phdu"
    "0", "obstype", "SPECTROSCOPIC", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "0", "extname", "LMP", "ehdu"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "0", "tdisp1", "A20", "ehdu"
    "0", "tdesc1", "Name of calibration lamp that is on", "ehdu"
    "0", "ttype2", "LAMPVOLT", "ehdu"
    "0", "tform2", "F6", "ehdu"
    "0", "tdisp2", "F6.2", "ehdu"
    "0", "tunit2", "voltage", "ehdu"
    "0", "tdesc2", "Spectral calibration lamp voltage setting", "ehdu"
    "0", "ttype3", "NELEM", "ehdu"
    "0", "tform3", "I10", "ehdu"
    "0", "tdisp3", "I10", "ehdu"
    "0", "tunit3", "", "ehdu"
    "0", "tdesc3", "Number of data points in spectrum", "ehdu"
    "0", "ttype4", "Flux", "ehdu"
    "0", "tform4", "F8", "ehdu"
    "0", "tdisp4", "F8.4", "ehdu"
    "0", "tunit4", "counts", "ehdu"
    "0", "tdesc4", "Lamp flux", "ehdu"
    "0", "ttype5", "DATESTAMP", "ehdu"
    "0", "tform5", "A67", "ehdu"
    "0", "tdisp5", "A67", "ehdu"
    "0", "tdesc5", "Date stamp", "ehdu"
    "0", "ttype6", "DESCRIP", "ehdu"
    "0", "tform6", "A67", "ehdu"
    "0", "tdisp6", "A67", "ehdu"
    "0", "tdesc6", "Description of reference data", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "80", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "tbcol1", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage






Jitter File (JIF)
=================



Description: 
    This data product contains information on how the telescope behaved
    during an observation.  Observation log files, sometimes called
    “jitter” files, record telemetries on pointing, jitter, guiding,
    open-loop tracking, laser operations, etc., during an observation. 
    Observation log files are produced by the DPS; the information to
    produce the log files come by way of querying different data sources: 
    the acquisition and guiding wavefront sensors, the mount control
    system, the telescope control system, on-instrument wavefront sensor,
    science instruments, etc.. Observation log files share the same
    rootname (Figure 6-2) as the main observation data except with the
    suffixes “_jit” or “_jif” (see Table 6-4). 

    The exact contents of this file is TBD, but generally speaking, this
    file contains a 2-D histogram of time-averaged telescope pointing
    excursion during an observation, stored in an image format.  The
    amount of time averaging depends on the source of the data and the
    observing mode (natural seeing vs. adaptive optics) involved.  The
    FITS header contains keywords providing information regarding the file
    structure, observation details, background light, telescope control
    system, jitter summary, problem flags, and warnings.  The header
    values for extension 1+ will inherit keywords from the primary HDU.

Format:      
    Content TBD

File:        
    <inst>_jif.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Telescope Jitter Image
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "JITTER HISTOGRAM", "phdu"
    "0", "extname", "JIF", "phdu"
    "0", "xtension", "IMAGE", "ehdu"

.. raw:: latex
  
    \end{center}
    \newpage




Telescope Jitter File (JIT)
===========================




Aperture Description Table (APD)
================================



Description: 
    The aperture description table describes the geometries of the
    apertures (size, orientation) and their offsets (in arcsec) from a
    reference position.

Format:      
    Each row of the table contains the aperture name, size (length and
    width) of the aperture, offset from the center of aperture to the
    center of a reference (which is named in the header), and the
    orientation of the aperture's y-axis relative to a coordinate system
    that is fixed to the, ground, the telescope, or the instrument
    rotator, depending on the mounting location [TBD].

File:        
    <inst>_apd.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Aperture Description Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "APERTURE DESCRIPTION TABLE", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "0", "extname", "APT", "ehdu"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "0", "tdisp1", "A20", "ehdu"
    "0", "tdesc1", "Name of aperture", "ehdu"
    "0", "ttype2", "WIDTH1", "ehdu"
    "0", "tform2", "F8", "ehdu"
    "0", "tdisp2", "F8.5", "ehdu"
    "0", "tunit2", "arcsec", "ehdu"
    "0", "tdesc2", "Width along axis 1", "ehdu"
    "0", "ttype3", "WIDTH2", "ehdu"
    "0", "tform3", "F8", "ehdu"
    "0", "tdisp3", "F8.5", "ehdu"
    "0", "tunit3", "arcsec", "ehdu"
    "0", "tdesc3", "Width along axis 2", "ehdu"
    "0", "ttype4", "ANGLE", "ehdu"
    "0", "tform4", "F10", "ehdu"
    "0", "tdisp4", "F10.3", "ehdu"
    "0", "tunit4", "degrees", "ehdu"
    "0", "tdesc4", "Orientation of long or y-axis of aperture", "ehdu"
    "0", "ttype5", "OFFSET1", "ehdu"
    "0", "tform5", "F12", "ehdu"
    "0", "tdisp5", "F12.5", "ehdu"
    "0", "tunit5", "", "ehdu"
    "0", "tdesc5", "Offset from reference position in axis 1", "ehdu"
    "0", "ttype6", "OFFSET2", "ehdu"
    "0", "tform6", "F12", "ehdu"
    "0", "tdisp6", "F12.5", "ehdu"
    "0", "tunit6", "", "ehdu"
    "0", "tdesc6", "Offset from reference position in axis 2", "ehdu"
    "0", "ttype7", "DATESTAMP", "ehdu"
    "0", "tform7", "A67", "ehdu"
    "0", "tdisp7", "A67", "ehdu"
    "0", "tdesc7", "Date stamp", "ehdu"
    "0", "ttype8", "DESCRIP", "ehdu"
    "0", "tform8", "A67", "ehdu"
    "0", "tdisp8", "A67", "ehdu"
    "0", "tdesc8", "Description of reference data", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "80", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "tbcol1", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




2D_Spectrum_Distortion_Correction_Table (SDC)
=============================================



Description: 
    This table consists of a set of WCS information used to rectify and
    linearize observed spectra in a 2-D image.  Each set of WCS
    corresponds to a spectral order for a long slit spectrum, spectrum
    aperture ID for an integral field or multi-slit/fiber spectral image.

Format:      
    The columns of the table are:  optical element, central wavelength,
    spectral order, the pixel position of the center of the spectrum, and
    the WCS information of the output rectified spectra.

File:        
    <inst>_sdc.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: 2D Spectrum Distortion Correction
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "2-D SPECTRUM DISTORTION CORRECTION TABLE", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "0", "extname", "SDC", "ehdu"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "0", "tdisp1", "A20", "ehdu"
    "0", "tdesc1", "Spectroscopic element in the grating wheel", "ehdu"
    "0", "ttype2", "CENWAVE", "ehdu"
    "0", "tform2", "F8", "ehdu"
    "0", "tdisp2", "F8.2", "ehdu"
    "0", "tunit2", "Angstrom", "ehdu"
    "0", "tdesc2", "Central wavelength", "ehdu"
    "0", "ttype3", "SPORDER", "ehdu"
    "0", "tform3", "I3", "ehdu"
    "0", "tdisp3", "I3", "ehdu"
    "0", "tunit3", "", "ehdu"
    "0", "tdesc3", "Spectral order", "ehdu"
    "0", "ttype4", "APERTURE", "ehdu"
    "0", "tform4", "A20", "ehdu"
    "0", "tdisp4", "A20", "ehdu"
    "0", "tunit4", "", "ehdu"
    "0", "tdesc4", "Spectral aperture ID", "ehdu"
    "0", "ttype5", "WCENTER", "ehdu"
    "0", "tform5", "F10", "ehdu"
    "0", "tdisp5", "F10.3", "ehdu"
    "0", "tunit5", "pixel", "ehdu"
    "0", "tdesc5", "Nominal pixel (along dispersion direction) corresponding to center of spectrum", "ehdu"
    "0", "ttype6", "NPIX1", "ehdu"
    "0", "tform6", "I5", "ehdu"
    "0", "tdisp6", "I5", "ehdu"
    "0", "tunit6", "pixel", "ehdu"
    "0", "tdesc6", "Number of axis 1 pixels in rectified image", "ehdu"
    "0", "ttype7", "NPIX2", "ehdu"
    "0", "tform7", "I5", "ehdu"
    "0", "tdisp7", "I5", "ehdu"
    "0", "tdesc7", "Number of axis 1 pixels in rectified image", "ehdu"
    "0", "ttype8", "CRPIX1", "ehdu"
    "0", "tform8", "I5", "ehdu"
    "0", "tdisp8", "I5", "ehdu"
    "0", "tunit8", "pixel", "ehdu"
    "0", "tdesc8", "Axis 1 coordinate a reference pixel in rectified image", "ehdu"
    "0", "ttype9", "CRPIX2", "ehdu"
    "0", "tform9", "I5", "ehdu"
    "0", "tdisp9", "I5", "ehdu"
    "0", "tunit9", "pixel", "ehdu"
    "0", "tdesc9", "Axis 2 coordinate a reference pixel in rectified image", "ehdu"
    "0", "ttype10", "CRVAL1", "ehdu"
    "0", "tform10", "F10", "ehdu"
    "0", "tdisp10", "F10.3", "ehdu"
    "0", "tunit10", "Angstrom", "ehdu"
    "0", "tdesc10", "Axis 1 value at reference pixel in rectified image", "ehdu"
    "0", "ttype11", "CRVAL2", "ehdu"
    "0", "tform11", "F12", "ehdu"
    "0", "tdisp11", "F12.5", "ehdu"
    "0", "tunit11", "arcsec", "ehdu"
    "0", "tdesc11", "Axis 2 value at reference pixel in rectified image", "ehdu"
    "0", "ttype12", "CDELT1", "ehdu"
    "0", "tform12", "F8", "ehdu"
    "0", "tdisp12", "F8.4", "ehdu"
    "0", "tunit12", "Angstrom/pixel", "ehdu"
    "0", "tdesc12", "Axis 1 pixel spacing in rectified image", "ehdu"
    "0", "ttype13", "CDELT2", "ehdu"
    "0", "tform13", "F8", "ehdu"
    "0", "tdisp13", "F8.5", "ehdu"
    "0", "tunit13", "arcsec/pixel", "ehdu"
    "0", "tdesc13", "Axis 2 pixel spacing in rectified image", "ehdu"
    "0", "ttype14", "DATESTAMP", "ehdu"
    "0", "tform14", "A67", "ehdu"
    "0", "tdisp14", "A67", "ehdu"
    "0", "tdesc14", "Date stamp", "ehdu"
    "0", "ttype15", "DESCRIP", "ehdu"
    "0", "tform15", "A67", "ehdu"
    "0", "tdisp15", "A67", "ehdu"
    "0", "tdesc15", "Description of reference data", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "80", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "tbcol1", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




Dispersion Coefficients Table (DSP)
===================================



Description: 
    This table consists of dispersion coefficients of a nominal,
    calibrated, dispersion solution, to apply to extracted 1-D spectra.

Format:      
    The columns of the table are:  optical element (e.g. grating), central
    wavelength, spectral order, aperture ID, reference aperture name, and
    coefficients to a dispersion function.

File:        
    <inst>_dsp.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: Dispersion Coefficients Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "DISPERSION COEFFICIENTS TABLE", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "0", "extname", "DSP", "ehdu"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "0", "tdisp1", "A20", "ehdu"
    "0", "tdesc1", "Spectroscopic element in the grating wheel", "ehdu"
    "0", "ttype2", "CENWAVE", "ehdu"
    "0", "tform2", "F8", "ehdu"
    "0", "tdisp2", "F8.2", "ehdu"
    "0", "tunit2", "Angstrom", "ehdu"
    "0", "tdesc2", "Central wavelength", "ehdu"
    "0", "ttype3", "SPORDER", "ehdu"
    "0", "tform3", "I3", "ehdu"
    "0", "tdisp3", "I3", "ehdu"
    "0", "tunit3", "", "ehdu"
    "0", "tdesc3", "Spectral order", "ehdu"
    "0", "ttype4", "APERTURE", "ehdu"
    "0", "tform4", "A20", "ehdu"
    "0", "tdisp4", "A20", "ehdu"
    "0", "tunit4", "", "ehdu"
    "0", "tdesc4", "Spectral aperture ID", "ehdu"
    "0", "ttype5", "REF_APER", "ehdu"
    "0", "tform5", "A12", "ehdu"
    "0", "tdisp5", "A12", "ehdu"
    "0", "tunit5", "", "ehdu"
    "0", "tdesc5", "Name of reference aperture", "ehdu"
    "0", "ttype6", "WCENTER", "ehdu"
    "0", "tform6", "F10", "ehdu"
    "0", "tdisp6", "F10.3", "ehdu"
    "0", "tunit6", "pixel", "ehdu"
    "0", "tdesc6", "Nominal pixel (along dispersion direction) corresponding to center of spectrum", "ehdu"
    "0", "ttype7", "NCOEFF", "ehdu"
    "0", "tform7", "I2", "ehdu"
    "0", "tdisp7", "I2", "ehdu"
    "0", "tdesc7", "Number of coefficients in dispersion solution", "ehdu"
    "0", "ttype8", "COEFF", "ehdu"
    "0", "tform8", "E10", "ehdu"
    "0", "tdisp8", "E10.7", "ehdu"
    "0", "tunit8", "", "ehdu"
    "0", "tdesc8", "Dispersion solution coefficients", "ehdu"
    "0", "ttype9", "DATESTAMP", "ehdu"
    "0", "tform9", "A67", "ehdu"
    "0", "tdisp9", "A67", "ehdu"
    "0", "tdesc9", "Date stamp", "ehdu"
    "0", "ttype10", "DESCRIP", "ehdu"
    "0", "tform10", "A67", "ehdu"
    "0", "tdisp10", "A67", "ehdu"
    "0", "tdesc10", "Description of reference data", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "80", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "tbcol1", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




1D Spectrum Trace Table (1DT)
=============================



Description: 
    This table defines the spectral trace prior to extracting 1-D
    spectrum.  If a spectrum is dispersed mostly along the x-axis, then
    the table consists of y-displacements of the spectrum as a function of
    x that defines the spectral trace.

Format:      
    The dispersion column consists: Optical element, central wavelength,
    aperture ID for multi-fiber/slit spectra, the reference position of
    the aperture on a 2-D spectral image, spectral order, and an array of
    y-displacements of the spectrum as a function of nominal dispersion
    position (often x-position).

File:        
    <inst>_1dt.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: 1D Spectrum Trace Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "2-D SPECTRUM DISTORTION CORRECTION TABLE", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "0", "extname", "1DT", "ehdu"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "0", "tdisp1", "A20", "ehdu"
    "0", "tdesc1", "Spectroscopic element in the grating wheel", "ehdu"
    "0", "ttype2", "CENWAVE", "ehdu"
    "0", "tform2", "F8", "ehdu"
    "0", "tdisp2", "F8.2", "ehdu"
    "0", "tunit2", "Angstrom", "ehdu"
    "0", "tdesc2", "Central wavelength", "ehdu"
    "0", "ttype3", "APERTURE", "ehdu"
    "0", "tform3", "A20", "ehdu"
    "0", "tdisp3", "A20", "ehdu"
    "0", "tunit3", "", "ehdu"
    "0", "tdesc3", "Spectral aperture ID", "ehdu"
    "0", "ttype4", "SPORDER", "ehdu"
    "0", "tform4", "I3", "ehdu"
    "0", "tdisp4", "I3", "ehdu"
    "0", "tunit4", "", "ehdu"
    "0", "tdesc4", "Spectral order", "ehdu"
    "0", "ttype5", "A1CENTER", "ehdu"
    "0", "tform5", "F10", "ehdu"
    "0", "tdisp5", "F10.3", "ehdu"
    "0", "tunit5", "pixel", "ehdu"
    "0", "tdesc5", "Nominal pixel (along dispersion direction) corresponding to wavelength center of spectrum", "ehdu"
    "0", "ttype6", "A2CENTER", "ehdu"
    "0", "tform6", "F10", "ehdu"
    "0", "tdisp6", "F10.4", "ehdu"
    "0", "tunit6", "pixel", "ehdu"
    "0", "tdesc6", "Nominal pixel corresponding to spatial center of spectrum", "ehdu"
    "0", "ttype7", "A2DISPL", "ehdu"
    "0", "tform7", "F10", "ehdu"
    "0", "tdisp7", "F10.4", "ehdu"
    "0", "tunit7", "", "ehdu"
    "0", "tdesc7", "Spectral displacement along axis 2", "ehdu"
    "0", "ttype8", "DATESTAMP", "ehdu"
    "0", "tform8", "A67", "ehdu"
    "0", "tdisp8", "A67", "ehdu"
    "0", "tdesc8", "Date stamp", "ehdu"
    "0", "ttype9", "DESCRIP", "ehdu"
    "0", "tform9", "A67", "ehdu"
    "0", "tdisp9", "A67", "ehdu"
    "0", "tdesc9", "Description of reference data", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "80", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "tbcol1", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage




1D Spectral Extraction Parameter Table (1DX)
============================================



Description: 
    This table describes the science and background extraction apertures
    and the functions used in extractions.

Format:      
    The extraction apertures are defined by the height of the box
    (EXTRSIZE, BK1SIZE, BK2SIZE), the extraction algorithm (XTRACALG,
    polynomial function), and functional coefficients (SLTCOEFF,
    BKTCOEFF).

File:        
    <inst>_1dx.fits

.. raw:: latex
  
    \begin{center}

.. tabularcolumns:: | p{1cm} | p{2cm} | p{4cm} | p{1cm} |

.. csv-table:: Data Product HDU: 1D Spectral Extraction Parameter Table
    :header: "#", "Keyword", "Value", "HDU"
    
    "0", "filetype", "1-D SPECTRAL EXTRACTION PARAMETER TABLE", "phdu"
    "1", "xtension", "TABLE", "hdu1"
    "0", "extname", "1DX", "ehdu"
    "0", "ttype1", "TEXT", "hdu1"
    "0", "tform1", "A80", "hdu1"
    "0", "tdisp1", "A20", "ehdu"
    "0", "tdesc1", "Spectroscopic element in the grating wheel", "ehdu"
    "0", "ttype2", "CENWAVE", "ehdu"
    "0", "tform2", "F8", "ehdu"
    "0", "tdisp2", "F8.2", "ehdu"
    "0", "tunit2", "Angstrom", "ehdu"
    "0", "tdesc2", "Central wavelength", "ehdu"
    "0", "ttype3", "APERTURE", "ehdu"
    "0", "tform3", "A20", "ehdu"
    "0", "tdisp3", "A20", "ehdu"
    "0", "tunit3", "", "ehdu"
    "0", "tdesc3", "Spectral aperture ID", "ehdu"
    "0", "ttype4", "SPORDER", "ehdu"
    "0", "tform4", "I3", "ehdu"
    "0", "tdisp4", "I3", "ehdu"
    "0", "tunit4", "", "ehdu"
    "0", "tdesc4", "Spectral order", "ehdu"
    "0", "ttype5", "EXTRSIZE", "ehdu"
    "0", "tform5", "F8", "ehdu"
    "0", "tdisp5", "F8.3", "ehdu"
    "0", "tunit5", "pixel", "ehdu"
    "0", "tdesc5", "Height of spectrum extraction box", "ehdu"
    "0", "ttype6", "NCOEFFSL", "ehdu"
    "0", "tform6", "I3", "ehdu"
    "0", "tdisp6", "I3", "ehdu"
    "0", "tunit6", "", "ehdu"
    "0", "tdesc6", "Number of coefficients in solution to slit tilt correction", "ehdu"
    "0", "ttype7", "SLTCOEFF", "ehdu"
    "0", "tform7", "E8", "ehdu"
    "0", "tdisp7", "E8.6", "ehdu"
    "0", "tunit7", "", "ehdu"
    "0", "tdesc7", "Spectrum extraction coefficients", "ehdu"
    "0", "ttype8", "BK1SIZE", "ehdu"
    "0", "tform8", "F8", "ehdu"
    "0", "tdisp8", "F8.3", "ehdu"
    "0", "tunit8", "pixel", "ehdu"
    "0", "tdesc8", "Height of background extraction box 1", "ehdu"
    "0", "ttype9", "BK2SIZE", "ehdu"
    "0", "tform9", "F8", "ehdu"
    "0", "tdisp9", "F8.3", "ehdu"
    "0", "tunit9", "pixel", "ehdu"
    "0", "tdesc9", "Height of background extraction box 2", "ehdu"
    "0", "ttype10", "BK1OFFST", "ehdu"
    "0", "tform10", "F8", "ehdu"
    "0", "tdisp10", "F8.3", "ehdu"
    "0", "tunit10", "pixel", "ehdu"
    "0", "tdesc10", "Offset of background extraction box 1 from spectrum", "ehdu"
    "0", "ttype11", "BK2OFFST", "ehdu"
    "0", "tform11", "F8", "ehdu"
    "0", "tdisp11", "F8.3", "ehdu"
    "0", "tunit11", "pixel", "ehdu"
    "0", "tdesc11", "Offset of background extraction box 2 from spectrum", "ehdu"
    "0", "ttype12", "NCOEFFBK", "ehdu"
    "0", "tform12", "I3", "ehdu"
    "0", "tdisp12", "I3", "ehdu"
    "0", "tunit12", "", "ehdu"
    "0", "tdesc12", "Number of coefficients in solution to slit tilt correction", "ehdu"
    "0", "ttype13", "BKTCOEFF", "ehdu"
    "0", "tform13", "E8", "ehdu"
    "0", "tdisp13", "E8.6", "ehdu"
    "0", "tunit13", "", "ehdu"
    "0", "tdesc13", "Background extraction coefficients", "ehdu"
    "0", "ttype14", "BACKORD", "ehdu"
    "0", "tform14", "I3", "ehdu"
    "0", "tdisp14", "I3", "ehdu"
    "0", "tunit14", "", "ehdu"
    "0", "tdesc14", "Order of polynomial fit to background", "ehdu"
    "0", "ttype15", "XTRACALG", "ehdu"
    "0", "tform15", "A20", "ehdu"
    "0", "tdisp15", "A20", "ehdu"
    "0", "tdesc15", "Extraction algorithm to use", "ehdu"
    "0", "ttype16", "DATESTAMP", "ehdu"
    "0", "tform16", "A67", "ehdu"
    "0", "tdisp16", "A67", "ehdu"
    "0", "tdesc16", "Date stamp", "ehdu"
    "0", "ttype17", "DESCRIP", "ehdu"
    "0", "tform17", "A67", "ehdu"
    "0", "tdisp17", "A67", "ehdu"
    "0", "tdesc17", "Description of reference data", "ehdu"
    "1", "simple", "true", "phdu"
    "2", "bitpix", "16", "hdu1"
    "3", "naxis", "2", "hdu1"
    "4", "naxis1", "80", "hdu1"
    "5", "naxis2", "100", "hdu1"
    "-1", "end", "", "hdu1"
    "4", "extend", "true", "phdu"
    "6", "pcount", "0", "hdu1"
    "7", "gcount", "1", "hdu1"
    "8", "tfields", "1", "hdu1"
    "0", "tbcol1", "1", "hdu1"

.. raw:: latex
  
    \end{center}
    \newpage



.. -----------------------------------------------------------------------------

----------
References
----------




.. raw:: latex

    %Added from template
    \clearpage
    \listoffigures
    \clearpage
    \listoftables
    %Added from template



