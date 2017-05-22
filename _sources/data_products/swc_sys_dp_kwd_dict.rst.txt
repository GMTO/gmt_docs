

=============================================
Software and Controls FITS Keyword Dictionary
=============================================



------------
Introduction
------------



This report provides a list of FITS header keywords used by the Data Processing Subsystem when processing telescope data and generating FITS data products.



--------
Acronyms
--------




----------------------
Standard FITS Keywords
----------------------




Description: 
    Keywords for a basic FITS standard header.  In many cases, the keywords and descriptions are taken verbatim from 'Definition of the Flexible Image Transport System (FITS), Version 3.0'.


.. raw:: latex
  
    \begin{center}


.. tabularcolumns:: | p{11mm} | p{18mm} | >{\raggedright} p{25mm} | p{10mm} | p{12mm} | p{60mm} |

.. list-table:: Standard FITS Keywords Dictionary
    :header-rows: 1

    * - Key
      - Keyword
      - Info
      - Type
      - HDU
      - Description
    * - *author*
      - AUTHOR
      - Author(s) of data
      - String
      - any
      - The value field shall contain a character string identifying who
        compiled the information in the data associated with the header. This
        keyword is appropriate when the data originate in a published paper or
        are compiled from many sources.
    * - *bitpix*
      - BITPIX
      - Bits per data value
      - Integer
      - any
      - The value field shall contain an integer.  The absolute value is used
        in computing the sizes of data structures.  It shall specify the
        number of bits that represent a data value.
    * - *blankkey*
      -         
      - Descriptive comment
      - String
      - any
      - Columns 1-8 contain ASCII blanks. This keyword has no associated
        value.  Columns 9-80 may contain any ASCII text.  Any number of card
        images with blank keyword fields may appear in a header. Blank field
        supplies comments to FITS file, useful for aesthetic purposes to
        provide a break between groups of related keywords in the header.
    * - *blank*
      - BLANK
      - Value used for undefined array elements
      - integer
      - primary
      - This keyword shall be used only in primary array headers or IMAGE
        extension headers with positive values of BITPIX (i.e., in arrays with
        integer data).  Columns 1-8 contain the string, 'BLANK   ' (ASCII
        blanks in columns 6-8).  The value field shall contain an integer that
        specifies the representation of array values whose physical values are
        undefined.  
    * - *bscale*
      - BSCALE
      - Linear factor in scaling equation
      - Float
      - any
      - This keyword shall be used, along with the BZERO keyword, when the
        array pixel values are not the true physical values, to transform the
        primary data array values to the true physical values they represent,
        using the equation: physical_value = BZERO + BSCALE * array_value. 
        The value field shall contain a floating point number representing the
        coefficient of the linear term in the scaling equation, the ratio of
        physical value to array value at zero offset.  The default value for
        this keyword is 1.0.
    * - *bunit*
      - BUNIT
      - Physical units of the array values
      - String
      - any
      - The value field shall contain a character string, describing the
        physical units in which the quantities in the array, after application
        of BSCALE and BZERO, are expressed.   The units of all FITS header
        keyword values, with the exception of measurements of angles, should
        conform with the recommendations in the IAU Style Manual. For angular
        measurements given as floating point values and specified with
        reserved keywords, degrees are the recommended units (with the units,
        if specified, given as 'deg' 
    * - *bzero*
      - BZERO
      - Zero point in scaling equation
      - Float
      - any
      - This keyword shall be used, along with the BSCALE keyword, when the
        array pixel values are not the true physical values, to transform the
        primary data array values to the true values using the equation:
        physical_value = BZERO + BSCALE * array_value. The value field shall
        contain a floating point number representing the physical value
        corresponding to an array value of zero.  The default value for this
        keyword is 0.0.
    * - *comment*
      - COMMENT
      - Descriptive comment
      - String
      - any
      - This keyword shall have no associated value; columns 9-80 may contain
        any ASCII text.  Any number of COMMENT card images may appear in a
        header.
    * - *date*
      - DATE
      - Date of file creation
      - String
      - any
      - The date on which the HDU was created, in the format specified in the
        FITS Standard.  The old date format was 'yy/mm/dd' and may be used
        only for dates from 1900 through 1999.  The new Y2K compliant date
        format is 'yyyy-mm-dd' or 'yyyy-mm-ddTHH:MM:SS[.sss]'.
    * - *datamax*
      - DATAMAX
      - Maximum data value
      - Float
      - any
      - The value field shall always contain a floating point number,
        regardless of the value of BITPIX. This number shall give the maximum
        valid physical value represented by the array, exclusive of any
        special values.
    * - *datamin*
      - DATAMIN
      - Minimum data value
      - Float
      - any
      - The value field shall always contain a floating point number,
        regardless of the value of BITPIX. This number shall give the minimum
        valid physical value represented by the array, exclusive of any
        special values.
    * - *date_obs*
      - DATE-OBS
      - Date of the observation
      - String
      - any
      - The date of the observation, in the format specified in the FITS
        Standard.  The old date format was 'yy/mm/dd' and may be used only for
        dates from 1900 through 1999.  The new Y2K compliant date format is
        'yyyy-mm-dd' or 'yyyy-mm-ddTHH:MM:SS[.sss]'.  
    * - *dobs*
      - DOBSn
      - Date of the observation
      - String
      - any
      - Similar to DATE-OBS except primary keyword for BINTABLE vector and
        pixel list alike.
    * - *end*
      - END
      - Marks the end of the header keywords
      - 
      - any
      - No associated value.  Marks the logical end of the header.  Columns
        9-80 shall be filled with ASCII blanks.
    * - *extlevel*
      - EXTLEVEL
      - Hierarchical level of the extension
      - Integer
      - extension
      - The value field shall contain an integer, specifying the level in a
        hierarchy of extension levels of the extension header containing it. 
        The value shall be 1 for the highest level; levels with a higher value
        of this keyword shall be subordinate to levels with a lower value. If
        the EXTLEVEL keyword is absent, the file should be treated as if the
        value were 1. This keyword is used to describe an extension and should
        not appear in the primary header.
    * - *extend*
      - EXTEND
      - Indicates whether the FITS file contain extensions
      - Boolean
      - primary
      - T or F indicating whether the FITS file is allowed to contain
        conforming extensions following the primary HDU.  This keyword MUST
        NOT appear in XtensionFrame.  Contains a logical value indicating
        whether the FITS file is allowed to contain conforming extensions
        following the primary HDU. This keyword may only appear in the primary
        header and must not appear in an extension header.  If the value field
        is T then there may be conforming extensions in the FITS file
        following the primary HDU.  This keyword is only advisory, so its
        presence with a value T does not require that the FITS file contains
        extensions, nor does the absence of this keyword necessarily imply
        that the file does not contain extensions.
    * - *nextend*
      - NEXTEND
      - The number of standard extensions
      - Integer
      - primary
      - Number of standard extensions
    * - *extname*
      - EXTNAME
      - Name of the extension
      - String
      - extension
      - The value field shall contain a character string, to be used to
        distinguish among different extensions of the same type, i.e., with
        the same value of XTENSION, in a FITS file.  This keyword is used to
        describe an extension and should not appear in the primary header. The
        extension types are: SCI (science image), ERR (error image), DQ (data
        quality image), SAMP (number of sample), TIME (exposure time), EVENTS
        (photon event list), GTI (good time interval), WHT (weight image), CTX
        (context image).
    * - *extver*
      - EXTVER
      - Version of the extension
      - Integer
      - extension
      - The value field shall contain an integer, to be used to distinguish
        among different extensions in a FITS file with the same type and name,
        i.e., the same values for XTENSION and EXTNAME. The values need not
        start with 1 for the first extension with a particular value of
        EXTNAME and need not be in sequence for subsequent values. If the
        EXTVER keyword is absent, the file should be treated as if the value
        were 1.  This keyword is used to describe an extension and should not
        appear in the primary header.
    * - *gcount*
      - GCOUNT
      - Group count
      - Integer
      - extension
      - The value field shall contain an integer that shall be used in any way
        appropriate to define the data structure, consistent with Eq.  5.2 in
        the FITS Standard.  This keyword originated for use in FITS Random
        Groups where it specifies the number of random groups present.  In
        most other cases this keyword will have the value 1.  Must have the
        value 1 in the IMAGE, Table, and BINTABLE standard extensions. 
    * - *groups*
      - GROUPS
      - Indicates random groups structure
      - Boolean
      - extension
      - The value field shall contain the logical constant T. The value T
        associated with this keyword implies that random groups records are
        present.
    * - *history*
      - HISTORY
      - Processing history of the data
      - String
      - any
      - This keyword shall have no associated value; columns 9-80 may contain
        any ASCII text.  The text should contain a history of steps and
        procedures associated with the processing of the associated data.  Any
        number of HISTORY card images may appear in a header.
    * - *instrume*
      - INSTRUME
      - Name of instrument
      - String
      - any
      - The value field shall contain a character string identifying the
        instrument used to acquire the data associated with the header.
    * - *naxis*
      - NAXIS
      - Number of axes
      - Integer
      - any
      - The value field shall contain a non-negative integer no greater than
        999, representing the number of axes in the associated data array. A
        value of zero signifies that no data follow the header in the HDU.  In
        the context of FITS 'TABLE' or 'BINTABLE' extensions, the value of
        NAXIS is always 2.
    * - *naxisn*
      - NAXISn
      - Size along the axis n dimension
      - Integer
      - any
      - The value field of this indexed keyword shall contain a non-negative
        integer, representing the number of elements along axis n of a data
        array.  The NAXISn must be present for all values n = 1,...,NAXIS, and
        for no other values of n. A value of zero for any of the NAXISn
        signifies that no data follow the header in the HDU. If NAXIS is equal
        to 0, there should not be any NAXISn keywords.
    * - *naxis1*
      - NAXIS1
      - Size along the axis 1 dimension
      - Integer
      - any
      - Size along the axis 1 dimension
    * - *naxis2*
      - NAXIS2
      - Size along the axis 2 dimension
      - Integer
      - any
      - Size along the axis 2 dimension
    * - *object*
      - OBJECT
      - Name or type of observed object
      - String
      - any
      - The value field shall contain a character string giving a name or type
        of the object observed.  Often 'TARGNAME' is used for target name, in
        which case 'OBJECT' can be used to specify the object category.
    * - *observer*
      - OBSERVER
      - Observer who acquired the data
      - String
      - any
      - The value field shall contain a character string identifying who
        acquired the data associated with the header.
    * - *origin*
      - ORIGIN
      - Organization responsible for the data
      - String
      - any
      - The value field shall contain a character string identifying the
        organization or institution responsible for creating the FITS file.
    * - *pcount*
      - PCOUNT
      - Parameter Count
      - Integer
      - extension
      - The value field shall contain an integer that shall be used in any way
        appropriate to define the data structure, consistent with Eq. 5.2 in
        the FITS Standard.   This keyword was originated for use with FITS
        Random Groups and represented the number of parameters preceding each
        group. It has since been used in 'BINTABLE' extensions to represent
        the size of the data heap following the main data table.  In most
        other cases its value will be zero.  Must have value of 0 for IMAGE
        and TABLE extensions.  In BINTABLE, the value specifies the number of
        bytes that follow the main data table in the supplemental data area
        called the heap. This keyword is also used in the random groups
        structure to specify the number of parameters preceding each array in
        a group.
    * - *pscaln*
      - PSCALn
      - Parameter scaling factor
      - Float
      - extension
      - This keyword is reserved for use within the FITS Random Groups
        structure.  This keyword shall be used, along with the PZEROn keyword,
        when the nth FITS group parameter value is not the true physical
        value, to transform the group parameter value to the true physical
        values it represents, using the equation, physical_value = PZEROn +
        PSCALn * group_parameter_value.  The value field shall contain a
        floating point number representing the coefficient of the linear term,
        the scaling factor between true values and group parameter values at
        zero offset.  The default value for this keyword is 1.0.
    * - *ptypen*
      - PTYPEn
      - Name of random groups parameter
      - String
      - extension
      - This keyword is reserved for use within the FITS Random Groups
        structure.  The value field shall contain a character string giving
        the name of parameter n.  If the PTYPEn keywords for more than one
        value of n have the same associated name in the value field, then the
        data value for the parameter of that name is to be obtained by adding
        the derived data values of the corresponding parameters.  This rule
        provides a mechanism by which a random parameter may have more
        precision than the accompanying data array elements; for example, by
        summing two 16-bit values with the first scaled relative to the other
        such that the sum forms a number of up to 32-bit precision.
    * - *pzeron*
      - PZEROn
      - Parameter scaling zero point
      - Float
      - extension
      - This keyword is reserved for use within the FITS Random Groups
        structure.  This keyword shall be used, along with the PSCALn keyword,
        when the nth FITS group parameter value is not the true physical
        value, to transform the group parameter value to the physical value. 
        The value field shall contain a floating point number, representing
        the true value corresponding to a group parameter value of zero.  The
        default value for this keyword is 0.0. The transformation equation is
        as follows: physical_value = PZEROn + PSCALn * group_parameter_value.
    * - *referenc*
      - REFERENC
      - Bibliographic reference
      - String
      - any
      - The value field shall contain a character string citing a reference
        where the data associated with the header are published.
    * - *simple*
      - SIMPLE
      - Indicates whether the file conforms to the standard
      - Boolean
      - primary
      - The SIMPLE keyword is required to be the first keyword in the primary
        header of all FITS files. The value field shall contain a logical
        constant with the value T if the file conforms to the standard.  This
        keyword is mandatory for the primary header and is not permitted in
        extension headers.  A value of F signifies that the file does not
        conform to this standard.
    * - *tbcoln*
      - TBCOLn
      - Beginning column number
      - Integer
      - extension
      - The value field of this indexed keyword shall contain an integer
        specifying the column in which field n starts in an ASCII TABLE
        extension.  For tables, The TBCOLn keywords must be present for all
        values n=1 ... TFIELDS, and for no other values of n.  The value
        contains an integer specifying the column in which field n starts. 
        The first column of a row is numbered 1.
    * - *tdimn*
      - TDIMn
      - Dimensionality of the array
      - String
      - extension
      - The value field of this indexed keyword shall contain a character
        string describing how to interpret the contents of field n as a
        multidimensional array, providing the number of dimensions and the
        length along each axis.  The form of the value is not further
        specified by the Standard.  A proposed convention is described in
        Appendix B.2 of the FITS Standard in which the value string has the
        format '(l,m,n...)' where l, m, n,... are the dimensions of the array.

        The data are ordered such that the array index of the first dimension
        given (l) is the most rapidly varying and that of the last dimension
        given is the least rapidly varying.
    * - *tdispn*
      - TDISPn
      - Display format
      - String
      - extension
      - The value field of this indexed keyword shall contain a character
        string describing the format recommended for the display of the
        contents of field n.  If the table value has been scaled, the physical
        value shall be displayed.  All elements in a field shall be displayed
        with a single, repeated format. For purposes of display, each byte of
        bit (type X) and byte (type B) arrays is treated as an unsigned
        integer. Arrays of type A may be terminated with a zero byte.  Only
        the format codes in Table 8.6, discussed in section 8.3.4 of the FITS
        Standard, are permitted for encoding. The format codes must be
        specified in upper case.  If the Bw.m, Ow.m, and Zw.m formats are not
        readily available to the reader, the Iw.m display format may be used
        instead, and if the ENw.d and ESw.d formats are not available, Ew.d
        may be used.  The meaning of this keyword is not defined for fields of
        type P in the Standard but may be defined in conventions using such
        fields.
    * - *telescop*
      - TELESCOP
      - Name of telescope
      - String
      - any
      - The value field shall contain a character string identifying the
        telescope used to acquire the data associated with the header.
    * - *tfields*
      - TFIELDS
      - Number of columns in the table
      - Integer
      - extension
      - The value field shall contain a non-negative integer representing the
        number of fields in each row of a 'TABLE' or 'BINTABLE' extension. 
        The maximum permissible value is 999.
    * - *tformn*
      - TFORMn
      - Column data format
      - String
      - extension
      - The value field of this indexed keyword shall contain a character
        string describing the format in which field n is encoded in a 'TABLE'
        or 'BINTABLE' extension.  The TFORMn keywords must be present for all
        values n=1...TFIELDS, and for no other values of n.
    * - *theap*
      - THEAP
      - Offset to starting data heap address
      - Integer
      - extension
      - The value field of this keyword shall contain an integer providing the
        separation, in bytes, between the start of the main data table and the
        start of a supplemental data area called the heap.  The default value,
        which is also the minimum allowed value, shall be the product of the
        values of NAXIS1 and NAXIS2. This keyword shall not be used if the
        value of PCOUNT is zero.  A proposed application of this keyword is
        presented in Appendix B.1 of the FITS Standard.
    * - *tnulln*
      - TNULLn
      - Value used to indicate undefined table element
      - String
      - extension
      - In ASCII 'TABLE' extensions, the value field for this indexed keyword
        shall contain the character string that represents an undefined value
        for field n.  The string is implicitly blank filled to the width of
        the field. In binary 'BINTABLE' table extensions, the value field for
        this indexed keyword shall contain the integer that represents an
        undefined value for field n of data type B, I, or J.  The keyword may
        not be used in 'BINTABLE' extensions if field n is of any other data
        type.
    * - *tscaln*
      - TSCALn
      - Linear data scaling factor
      - Float
      - extension
      - This indexed keyword shall be used, along with the TZEROn keyword,
        when the quantity in field n does not represent a true physical
        quantity.  The value field shall contain a floating point number
        representing the coefficient of the linear term in the equation,
        physical_value = TZEROn + TSCALn * field_value, which must be used to
        compute the true physical value of the field, or, in the case of the
        complex data types C and M, of the real part of the field with the
        imaginary part of the scaling factor set to zero.  The default value
        for this keyword is 1.0.  This keyword may not be used if the format
        of field n is A, L, or X.
    * - *ttypen*
      - TTYPEn
      - Column name
      - String
      - extension
      - The value field for this indexed keyword shall contain a character
        String, giving the name of field n.  It is recommended that only
        letters, digits, and underscore (hexadecimal code 5F, ('_') be used in
        the name. String comparisons with the values of TTYPEn keywords should
        not be case sensitive.  The use of identical names for different
        fields should be avoided.
    * - *tunitn*
      - TUNITn
      - Column units
      - String
      - extension
      - The value field shall contain a character string describing the
        physical units in which the quantity in field n, after any application
        of TSCALn and TZEROn, is expressed.   The units of all FITS header
        keyword values, with the exception of measurements of angles, should
        conform with the recommendations in the IAU Style Manual. For angular
        measurements given as floating point values and specified with
        reserved keywords, degrees are the recommended units (with the units,
        if specified, given as 'deg').
    * - *tzeron*
      - TZEROn
      - Column scaling zero point
      - Float
      - extension
      - This indexed keyword shall be used, along with the TSCALn keyword,
        when the quantity in field n does not represent a true physical
        quantity.  The value field shall contain a floating point number
        representing the true physical value corresponding to a value of zero
        in field n of the FITS file, or, in the case of the complex data types
        C and M, in the real part of the field, with the imaginary part set to
        zero.  The default value for this keyword is 0.0.  This keyword may
        not be used if the format of field n is A, L, or X.  This indexed
        keyword is used with TSCALn keyword to linearly scale the values in
        the table field n to transform them into physical values using:
        physical_value = TZEROn + TSCALn * field_value.
    * - *xtension*
      - XTENSION
      - Marks beginning of new HDU
      - String
      - extension
      - Required to be the first keyword of all image (XTENSION= 'IMAGE  
        ')and table (XTENSION= 'BINTABLE' or XTENSION= 'TABLE   ') extensions.

        The value field shall contain a character string giving the name of
        the extension type.  This keyword is mandatory for an extension header
        and must not appear in the primary header.  For an extension that is
        not a standard extension, the type name must not be the same as that
        of a standard extension.
    * - *wcsaxes*
      - WCSAXES
      - The number of axes in the WCS description
      - Integer
      - all
      - [integer; default: NAXIS, or larger of WCS indexes i or j]. Number of
        axes in the WCS description. This keyword, if present, must precede
        all WCS keywords except NAXIS in the HDU. The value of WCSAXES may
        exceed the number of pixel axes for the HDU.
    * - *ctypei*
      - CTYPEia
      - Name of the coordinate axis
      - String
      - all
      - The value field shall contain a character string, giving the name of
        the coordinate represented by axis n.  Any coordinate type that is not
        covered by the standard or an officially recognized FITS convention
        shall be taken to be linear.  All non-linear coordinate system names
        must be expressed in ‘4–3’ form: the first four characters specify the
        coordinate type, the fifth character is a hyphen (‘-’), and the
        remaining three characters specify an algorithm code for computing the
        world coordinate value.  Coordinate types with names of less than four
        characters are padded on the right with hyphens, and algorithm codes
        with less than three characters are padded on the right with blanks.
        Algorithm codes should be three characters.
    * - *ctype1*
      - CTYPE1
      - Coordinate type for the x-axis
      - String
      - all
      - Coordinate type for the x-axis
    * - *ctype2*
      - CTYPE2
      - Coordinate type for the y-axis
      - String
      - all
      - Coordinate type for the y-axis
    * - *ictypn*
      - iCTYPn
      - Name of the coordinate axis
      - String
      - extension
      - Similar to CTYPEia except primary keyword for BINTABLE vector.
    * - *ictyn*
      - iCTYna
      - Name of the coordinate axis
      - String
      - extension
      - Alternative keyword for iCTYPn for BINTABLE vector.
    * - *tctypn*
      - TCTYPn
      - Name of the coordinate axis
      - String
      - extension
      - Similar to CTYPEia except primary keyword for pixel list.
    * - *tctyn*
      - TCTYna
      - Name of the coordinate axis
      - String
      - extension
      - Alternative keyword for TCTYPn for pixel list.
    * - *cuniti*
      - CUNITia
      - Units of CRVAL and CDELT
      - String
      - primary
      - Physical units of CRVAL and CDELT for axis i. Note that units should
        always be specified.  Units for celestial coordinate systems defined
        in this Standard must be degrees.
    * - *icunin*
      - iCUNIn
      - Units of CRVAL and CDELT
      - String
      - extension
      - Similar to CUNITia except primary keyword for BINTABLE vector.
    * - *icunn*
      - iCUNna
      - Units of CRVAL and CDELT
      - String
      - extension
      - Same as iCUNIn except alternative keyword for BINTABLE vector.
    * - *tcunin*
      - TCUNIn
      - Units of CRVAL and CDELT
      - String
      - pixel list
      - Similar to CUNITia except primary keyword for pixel list.
    * - *tcunn*
      - TCUNna
      - Units of CRVAL and CDELT
      - String
      - extension
      - Same as iCUNIn except alternative keyword for pixel list.
    * - *crpixj*
      - CRPIXja
      - Coordinate system reference pixel
      - Float
      - primary
      - The value field shall contain a floating point number, identifying the
        location of a reference point along axis n, in units of the axis
        index.  This value is based upon a counter that runs from 1 to NAXISn
        with an increment of 1 per pixel.  The reference point value need not
        be that for the center of a pixel nor lie within the actual data
        array.  Use comments to indicate the location of the index point
        relative to the pixel.
    * - *jcrpxn*
      - jCRPXn
      - Coordinate system reference pixel
      - Float
      - extension
      - Similar to CRPIXja except primary keyword for BINTABLE vector.
    * - *icrpn*
      - jCRPna
      - Coordinate system reference pixel
      - Float
      - extension
      - Same as jCRPXn except alternative keyword for BINTABLE vector.
    * - *tcrpxn*
      - TCRPXn
      - Coordinate system reference pixel
      - Float
      - all
      - Similar to CRPIXja except primary keyword for pixel list.
    * - *tcrpn*
      - TCRPna
      - Coordinate system reference pixel
      - Float
      - extension
      - Same as jCRPXn except alternative keyword for pixel list.
    * - *crvali*
      - CRVALia
      - Coordinate system value at reference pixel
      - Float
      - all
      - The value field shall contain a floating point number, giving the
        value of the coordinate specified by the CTYPEn keyword at the
        reference point CRPIXn. Units must follow the prescriptions of section
        5.3 of the FITS Standard.
    * - *crval1*
      - CRVAL1
      - x-coordinate value at reference pixel
      - Float
      - primary
      - x-coordinate value at reference pixel
    * - *crval2*
      - CRVAL1
      - y-coordinate value at reference pixel
      - Float
      - primary
      - y-coordinate value at reference pixel
    * - *icrvln*
      - iCRVLn
      - Coordinate system value at reference pixel
      - Float
      - extension
      - Similar to CRVALia except primary keyword for BINTABLE vector.
    * - *icrvn*
      - iCRVna
      - Coordinate system value at reference pixel
      - Float
      - extension
      - Alternative keyword for iCRVLn for BINTABLE vector.
    * - *tcrvln*
      - TCRVLn
      - Coordinate system value at reference pixel
      - Float
      - pixel list
      - Similar to CRVALia except primary keyword for pixel list.
    * - *tcrvn*
      - TCRVna
      - Coordinate system value at reference pixel
      - Float
      - pixel list
      - Alternative keyword for iCRVLn for pixel list.
    * - *cdelti*
      - CDELTi
      - Coordinate increment along axis
      - Float
      - primary
      - The value field shall contain a floating point number giving the
        partial derivative of the coordinate specified by the CTYPEn keywords
        with respect to the pixel index, evaluated at the reference point
        CRPIXn, in units of the coordinate specified by  the CTYPEn keyword. 
        These units must follow the prescriptions of section 5.3 of the FITS
        Standard.
    * - *icdltn*
      - iCDLTn
      - Coordinate increment along axis
      - Float
      - extension
      - Similar to CDELTi except primary keyword for BINTABLE vector.
    * - *icden*
      - iCDEna
      - Coordinate increment along axis
      - Float
      - extension
      - Alternative keyword for iCDLTn for BINTABLE vector.
    * - *tcdltn*
      - TCDLTn
      - Coordinate increment along axis
      - Float
      - pixel list
      - Similar to CDELTi except primary keyword for pixel list.
    * - *tcden*
      - TCDEna
      - Coordinate increment along axis
      - Float
      - pixel list
      - Alternative keyword for TCDLTn for pixel list.
    * - *crotai*
      - CROTAi
      - Coordinate system rotation angle
      - Float
      - primary
      - This keyword is used to indicate a rotation from a standard coordinate
        system described by the CTYPEn to a different coordinate system in
        which the values in the array are actually expressed. Rules for such
        rotations are not further specified in the Standard; the rotation
        should be explained in comments. The value field shall contain a
        floating point number giving the rotation angle in degrees between
        axis n and the direction implied by the coordinate system defined by
        CTYPEn.  Further use of this keyword is deprecated, in favor of the
        newer formalisms that use the CDi_j or PCi_j keywords to define the
        rotation.
    * - *icrotn*
      - iCROTn
      - Coordinate system rotation angle
      - Float
      - extension
      - Similar to CROTAi except primary keyword for BINTABLE vector.
    * - *tcrotn*
      - TCROTn
      - Coordinate system rotation angle
      - Float
      - pixel list
      - Similar to CROTAi except primary keyword for pixel list.
    * - *pci_j*
      - PCi_ja
      - Coordinate transformation coefficient
      - Float
      - primary
      - [floating point; defaults: 1.0 when i = j, 0.0 otherwise].  Linear
        transformation matrix between pixel axes j and intermediate coordinate
        axes i. The PCi_j matrix must not be singular.
    * - *ijpcn*
      - ijPCna
      - Coordinate transformation coefficient
      - Float
      - extension
      - Similar to PCi_ja except this is keyword for BINTABLE vector.
    * - *tpcn_k*
      - TPCn_ka
      - Coordinate transformation coefficient
      - Float
      - pixel list
      - Similar to PCi_ja except this is keyword for pixel list.
    * - *tpn_k*
      - TPn_ka
      - Coordinate transformation coefficient
      - Float
      - pixel list
      - Similar to PCi_ja except this is also keyword for pixel list.
    * - *cdi_j*
      - CDi_ja
      - Linear transformation matrix between axes i and j
      - Float
      - primary
      - [floating point; defaults: 0.0, but see below]. Linear transformation
        matrix (with scale) between pixel axes j and intermediate coordinate
        axes i. This nomenclature is equivalent to PCi j when CDELTi is unity.
        The CDi_j matrix must not be singular. Note that the CDi_j formalism
        is an exclusive alternative to PCi_j, and the CDi_j and PCi_j keywords
        must not appear together within an HDU.
    * - *cd1_1*
      - CD1_1
      - Projection of unit vector of axis 1 of one coordinate system with respect to axis 1 of the other coordinate system
      - Float
      - primary
      - When two coordinate axes are rotated with respect to each other, e.g.
        North with respect to x-axis, this keyword gives the projection of
        unit vector of axis 1 (e.g. N) of one system with respect to the axis
        1 (e.g.  x) of the other.
    * - *cd1_2*
      - CD1_2
      - Projection of unit vector of axis 1 of one coordinate system with respect to axis 2 of the other coordinate system
      - Float
      - primary
      - When two coordinate axes are rotated with respect to each other, e.g.
        North with respect to x-axis, this keyword gives the projection of
        unit vector of axis 1 (e.g. N) of one system with respect to the axis
        2 (e.g. y) of the other.
    * - *cd2_1*
      - CD2_1
      - Projection of unit vector of axis 2 of one coordinate system with respect to axis 1 of the other coordinate system
      - Float
      - primary
      - When two coordinate axes are rotated with respect to each other, e.g.
        South with respect to x-axis, this keyword gives the projection of
        unit vector of axis 2 (e.g. S) of one system with respect to the axis
        1 (e.g. x) of the other.
    * - *cd2_2*
      - CD2_2
      - Projection of unit vector of axis 2 of one coordinate system with respect to axis 2 of the other coordinate system
      - Float
      - primary
      - When two coordinate axes are rotated with respect to each other, e.g.
        South with respect to y-axis, this keyword gives the projection of
        unit vector of axis 2 (e.g. S) of one system with respect to the axis
        2 (e.g. y) of the other.
    * - *ijcdn*
      - ijCDna
      - Linear transformation matrix between axes i and j
      - Float
      - extension
      - Similar to CDi_ja except this is keyword for BINTABLE vector.
    * - *tcdn_k*
      - TCDn_ka
      - Linear transformation matrix between axes i and j
      - Float
      - extension
      - Similar to CDi_ja except this is keyword for pixel list.
    * - *tcn_k*
      - TCn_ka
      - Linear transformation matrix between axes i and j
      - Float
      - extension
      - Similar to CDi_ja except this is also a keyword for pixel list.
    * - *pvii_m*
      - PVIi_ma
      - Value for intermediate WCS axis i
      - Float
      - primary
      - [floating point]. Numeric parameter values for intermediate world
        coordinate axis i, where m is the parameter number.  Leading zeros
        must not be used, and m may have only values in the range 0 through
        99, and that are defined for the particular non-linear algorithm.
    * - *ipvn_m*
      - iPVn_ma
      - Value for intermediate WCS axis i
      - Float
      - extension
      - Similar to PVi_ma except this is keyword for BINTABLE vector.
    * - *ivn_m*
      - iVn_ma
      - Value for intermediate WCS axis i
      - 
      - extension
      - This is equivalent to iPVn_ma.
    * - *tpvn_m*
      - TPVn_ma
      - Value for intermediate WCS axis i
      - Float
      - pixel list
      - Similar to PVi_ma except this is keyword for pixel list.
    * - *tvn_m*
      - TVn_ma
      - Value for intermediate WCS axis i
      - Float
      - pixel list
      - This is equivalent to TPVn_ma.
    * - *ivn_x*
      - iVn_Xa
      - Coordinate parameter array
      - Float
      - extension
      - Coordinate parameter array for BINTABLE vector.
    * - *psi_m*
      - PSi_ma
      - Parameters for for intermediate WCS axis i
      - String
      - primary
      - [character]. Character-valued parameters for intermediate world
        coordinate axis i, where m is the parameter number.  Leading zeros
        must not be used, and m may have only values in the range 0 through
        99, and that are defined for the particular non-linear algorithm.
    * - *ipsn_m*
      - iPSn_ma
      - Parameters for for intermediate WCS axis i
      - String
      - extension
      - Sn_ma) Similar to PSi_ma except this is keyword for BINTABLE vector.
    * - *isn_m*
      - iSn_ma
      - Parameters for for intermediate WCS axis i
      - String
      - extension
      - This is equivalent to PSi_ma
    * - *tpsn_m*
      - TPSn_ma
      - Parameters for for intermediate WCS axis i
      - String
      - pixel list
      - Sn_ma) Similar to PSi_ma except this is keyword for pixel list.
    * - *tsn_m*
      - TSn_ma
      - Parameters for for intermediate WCS axis i
      - String
      - pixel list
      - This is equivalent to TPSn_ma
    * - *crderi*
      - CRDERi
      - Random error in coordinate i
      - Float
      - primary
      - [floating point; default: 0.0]. Random error in coordinate i, which
        must be non-negative.
    * - *icrdn*
      - ICRDna
      - Random error in coordinate i
      - Float
      - extension
      - Similar to CRDERi except this is keyword for BINTABLE vector.
    * - *tcrdn*
      - TCRDna
      - Random error in coordinate i
      - Float
      - pixel list
      - Similar to CRDERi except this is keyword for pixel list.
    * - *csyeri*
      - CSYERi
      - Systematic error in coordinate i
      - Float
      - primary
      - [floating point; default: 0.0]. Systematic error in coordinate i,
        which must be non-negative.
    * - *icsyn*
      - ICSYna
      - Systematic error in coordinate i
      - Float
      - extension
      - SYna) Similar to CSYERi except this is keyword for BINTABLE vector.
    * - *tcsyn*
      - TCSYna
      - Systematic error in coordinate i
      - Float
      - pixel list
      - SYna) Similar to CSYERi except this is keyword for pixel list.
    * - *wcstn*
      - WCSTna
      - WCS cross-reference target for BINTABLE vector
      - String
      - extension
      - WCS Cross-reference target for BINTABLE vector
    * - *wcsxn*
      - WCSXna
      - WCS cross-reference for BINTABLE vector
      - String
      - extension
      - WCS Cross-reference for BINTABLE vector
    * - *wcsname*
      - WCSNAMEa
      - Name of the world world coordinate system
      - String
      - primary
      - [character; default for a: ’ ’ (i.e., blank, for the primary WCS, else
        a character A through Z that specifies the coordinate version]. Name
        of the world coordinate system represented by the WCS keywords with
        the suffix a. Its primary function is to provide a means by which to
        specify a particular WCS if multiple versions are defined in the HDU.
    * - *wcsnn*
      - WCSNna
      - Name of the world world coordinate system
      - String
      - extension
      - Similar to WCSNAMEa except this is keyword for BINTABLE vector.
    * - *wcsn*
      - WCSna
      - Name of the world world coordinate system
      - String
      - pixel list
      - Similar to WCSNAMEa except this is keyword for pixel list.
    * - *twcsn*
      - TWCSna
      - Name of the world world coordinate system
      - String
      - pixel list
      - This is equivalent to WCSna.
    * - *radesys*
      - RADESYSa
      - Reference frame of equatorial or ecliptic coordinates
      - String
      - any
      - [character; default: FK4, FK5, or ICRS: see below].  Name of the
        reference frame of equatorial or ecliptic coordinates, whose value
        must be one of those specified in Table 24 of 'FITS Standard'
        document. The default value is FK4 if the value of EQUINOXa < 1984.0,
        FK5 if EQUINOXa >= 1984.0, or ICRS if EQUINOXa is not given.
    * - *radecsys*
      - RADECSYS
      - Reference frame of equatorial or ecliptic coordinates
      - String
      - any
      - The exact same definition as RADESYSa
    * - *raden*
      - RADEna
      - Reference frame of equatorial or ecliptic coordinates
      - String
      - extension
      - Similar to RADESYSa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *equinox*
      - EQUINOXa
      - Equinox of celestial coordinate system
      - Float
      - any
      - The value field shall contain a floating point number giving the
        equinox in years for the celestial coordinate system in which
        positions are expressed. The interpretation of epoch depends upon the
        value of RADESYSa if present:  Besselian if the value is FK4 or
        FK4-NO-E, Julian if the value is FK5; not applicable if the value is
        ICRS or GAPPT.
    * - *equin*
      - EQUIna
      - Equinox of celestial coordinate system
      - Float
      - extension
      - Similar to EQUINOXa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *mjd_obs*
      - MJD-OBS
      - Modified Julian Date of observation
      - Float
      - primary
      - [floating point; default: DATE-OBS if given, other- wise no default].
        Modified Julian Date (JD – 2,400,000.5) of the observation, whose
        value corresponds (by default) to the start of the observation, unless
        another interpretation is explained in the comment field. No specific
        time system (e.g. UTC, TAI, etc.) is defined for this or any of the
        other time-related keywords. It is recommended that the TIMESYS
        keyword, as defined in Appendix B be used to specify the time system.
    * - *mjdobn*
      - MJDOBn
      - Modified Julian Date of observation
      - Float
      - extension
      - Similar to MJD_OBS except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *lonpole*
      - LONPOLEa
      - Longitude relative to celestial north pole
      - Float
      - any
      - [floating point; default: φ0 if δ0 >= θ0, φ0 + 180 deg otherwise].
        Longitude in the native coordinate system of the celestial system’s
        north pole. Normally, φ0 is zero unless a non-zero value has been set
        for PVi 1a, which is associated with the longitude axis. This default
        applies for all values of θ0, including θ0 = 90 deg, although the use
        of non-zero values of θ0 are discouraged in that case.
    * - *lonpn*
      - LONPna
      - Longitude relative to celestial north pole
      - Float
      - extension
      - Similar to LONPOLEa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *latpole*
      - LATPOLEa
      - Latitude relative to celestial north pole
      - Float
      - any
      - [floating point; default: 90 deg, or no default if (θ0, δ0, φp-φ0) =
        (0, 0, ±90 deg)]. Latitude in the native coordinate system of the
        celestial system’s north pole, or equivalently, the latitude in the
        celestial coordinate system of the native system’s north pole.  May be
        ignored or omitted in cases where LONPOLEa completely specifies the
        rotation to the target celestial system.
    * - *latpn*
      - LATPna
      - Latitude relative to celestial north pole
      - Float
      - extension
      - Similar to LATPOLEa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *cnamei*
      - CNAMEia
      - Spectral coordinate description
      - String
      - any
      - [character; default: ’ ’ (i.e. a linear, undefined axis)]. Spectral
        coordinate description which must not exceed 68 characters in length.
    * - *icpnan*
      - ICNAna
      - Spectral coordinate description
      - String
      - extension
      - Similar to CNAMEia except this is keyword for BINTABLE vector.
    * - *tcnan*
      - TCNAna
      - Spectral coordinate description
      - String
      - pixel list
      - Similar to CNAMEia except this is keyword for pixel list.
    * - *restfrq*
      - RESTFRQa
      - Rest frequency of spectral feature of interest
      - Float
      - any
      - [floating point; default: none]. Rest frequency of the of the spectral
        feature of interest. The physical unit must be Hz.
    * - *restfreq*
      - RESTFREQ
      - Rest frequency of spectral feature of interest
      - Float
      - any
      - This keyword is identical to RESTFRQa.
    * - *rfrqn*
      - RFRQna
      - Rest frequency of spectral feature of interest
      - Float
      - extension
      - Similar to RESTFRQa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *restwav*
      - RESTWAVa
      - Vacuum rest wavelength of the spectral feature of interest
      - Float
      - any
      - [floating point; default: none]. Vacuum rest wavelength of the
        spectral feature of interest. The physical unit must be m.
    * - *rwavn*
      - RWAVna
      - Vacuum rest wavelength of the spectral feature of interest
      - Float
      - extension
      - Similar to RWAVna except this is keyword for BINTABLE vector and pixel
        list alike.
    * - *date_avg*
      - DATE-AVG
      - Calendar date of the mid-point of observation
      - String
      - any
      - [character; default: none]. Calendar date of the mid-point of the
        observation, expressed in the same way as the DATE-OBS keyword.
    * - *davgn*
      - DAVGn
      - Calendar date of the mid-point of observation
      - String
      - extension
      - Similar to DATE-AVG except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *mjd_avg*
      - MJD-AVG
      - MJD of the mid-point of the observation
      - Float
      - any
      - [floating point; default: none]. Modified Julian Date (JD –
        2,400,000.5) of the mid-point of the observation.
    * - *mjdan*
      - MJDAn
      - MJD of the mid-point of the observation
      - Float
      - extension
      - Similar to MJD-AVG except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *specsys*
      - SPECSYSa
      - Reference frame of spectral axis coordinate
      - String
      - any
      - [character; default: none]. The reference frame in use for the
        spectral axis coordinate(s). Valid values are given F2W in Table 27 of
        the 'FITS Standard' document.
    * - *specn*
      - SPECna
      - Reference frame of spectral axis coordinate
      - String
      - extension
      - Similar to SPECna except this is keyword for BINTABLE vector and pixel
        list alike.
    * - *ssysobs*
      - SSYSOBSa
      - Constant spectral reference frame over the range of non-spectral WCS
      - 
      - any
      - [character; default: TOPOCENT]. The spectral reference frame that is
        constant over the range of the non-spectral world coordinates. Valid
        values are given in Table 27 of the 'FITS Standard' document.
    * - *sobsn*
      - SOBSna
      - Constant spectral reference frame over the range of non-spectral WCS
      - String
      - extension
      - Similar to SSYSOBSa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *obsgeo_x*
      - OBSGEO-X
      - X-coordinate of geocentric reference frame relative to standard
      - Float
      - any
      - [floating point; default: none].  X-coordinate (in meters) of a
        Cartesian triplet that specifies the location, with respect to a
        standard, geocentric terrestrial reference frame, where the
        observation took place. The coordinate must be valid at the epoch
        MJD-AVG or DATE-AVG.
    * - *obsgxn*
      - OBSGXn
      - X-coordinate of geocentric reference frame relative to standard
      - Float
      - extension
      - Similar to OBSGEO-X except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *obsgeo_y*
      - OBSGEO-Y
      - Y-coordinate of geocentric reference frame relative to standard
      - Float
      - any
      - [floating point; default: none].  Y-coordinate (in meters) of a
        Cartesian triplet that specifies the location, with respect to a
        standard, geocentric terrestrial reference frame, where the
        observation took place. The coordinate must be valid at the epoch
        MJD-AVG or DATE-AVG.
    * - *obsgyn*
      - OBSGYn
      - Y-coordinate of geocentric reference frame relative to standard
      - Float
      - extension
      - Similar to OBSGEO-Y except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *obsgeo_z*
      - OBSGEO-Z
      - Z-coordinate of geocentric reference frame relative to standard
      - Float
      - any
      - [floating point; default: none]. Z-coordinate (in meters) of a
        Cartesian triplet that specifies the location, with respect to a
        standard, geocentric terrestrial reference frame, where the
        observation took place. The coordinate must be valid at the epoch
        MJD-AVG or DATE-AVG.
    * - *obsgzn*
      - OBSGZn
      - Z-coordinate of geocentric reference frame relative to standard
      - Float
      - extension
      - Similar to OBSGEO-Z except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *ssyssrc*
      - SSYSSRCa
      - Reference frame of systemic velocity of observed source
      - Float
      - any
      - [character; default: none]. Reference frame for the value expressed in
        the ZSOURCEa keyword to document the systemic velocity of the observed
        source. Value must be one of those given in Table 27 in the 'FITS
        Standard' document except for SOURCE.
    * - *ssrcn*
      - SSRCna
      - Reference frame of systemic velocity of observed source
      - Float
      - extension
      - Similar to SSYSSRCa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *velosys*
      - VELOSYSa
      - Relative radial velocity between observer and selected standard of rest
      - Float
      - any
      - [floating point; default: none]. Relative radial velocity between the
        observer and the selected standard of rest in the direction of the
        celestial reference coordinate. Units must be m/s. The CUNITia keyword
        is not used for this purpose since the WCS version a might not be
        expressed in velocity units.
    * - *vsysn*
      - VSYSna
      - Relative radial velocity between observer and selected standard of rest
      - Float
      - extension
      - Similar to VELOSYSa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *zsource*
      - ZSOURCEa
      - Redshift of source
      - Float
      - any
      - [floating point; default: none]. Radial velocity with respect to an
        alternative frame of rest, expressed as a unitless redshift (i.e.,
        velocity as a fraction of the speed of light in vacuum).  Used in
        conjunction with SSYSSRCa to document the systemic velocity of the
        observed source.
    * - *zsoun*
      - ZSOUna
      - Redshift of source
      - Float
      - extension
      - Similar to ZSOURCEa except this is keyword for BINTABLE vector and
        pixel list alike.
    * - *velangl*
      - VELANGLa
      - Space velocity vector angle of source
      - Float
      - any
      - [floating point; default:+90.]. In the case of relativistic velocities
        (e.g., a beamed astrophysical jet) the transverse velocity component
        is important. This keyword may be used to express the orientation of
        the space velocity vector with respect to the plane of the sky. See
        Appendix A of reference Greisen et al. (2006) for further details.
    * - *vangn*
      - VANGna
      - Space velocity vector angle of source
      - Float
      - extension
      - Similar to VELANGLa except this is keyword for BINTABLE vector and
        pixel list alike.


.. raw:: latex
  
    \end{center}


.. raw:: latex
  
    \newpage






--------------------------
Supplemental FITS Keywords
--------------------------




Description: 
    Supplemental keywords for FITS headers.  These keywords are not found the FITS Standard.  The keywords and descriptions in some cases are derived, sometimes inherited verbatim, from the 'Introduction to the HST Data Handbooks', Data Handbooks from WFC3, STIS, etc., 'ESO Data Interface Control Document (GEN-SPE-ESO-19400-0794)', and Chandra's 'ASC FITS Designers' Guide ASC-FITS-2.1.0'


.. raw:: latex
  
    \begin{center}


.. tabularcolumns:: | p{11mm} | p{18mm} | >{\raggedright} p{25mm} | p{10mm} | p{12mm} | p{60mm} |

.. list-table:: Supplemental FITS Keywords Dictionary
    :header-rows: 1

    * - Key
      - Keyword
      - Info
      - Type
      - HDU
      - Description
    * - *proposid*
      - PROPOSID
      - Proposal ID
      - String
      - any
      - Proposal ID
    * - *propttln*
      - PROPTTLn
      - Proposal title
      - String
      - any
      - Proposal ID
    * - *pi_coi*
      - PI_COI
      - Names of PI and CO-Is (Initials and Surname)
      - String
      - any
      - (PI-COI) The PI or Co-I's initials followed by his/her surname
    * - *pr_inv_l*
      - PR_INV_L
      - Last name of the principle investigator
      - String
      - any
      - Last name of the principle investigator
    * - *pr_inv_f*
      - PR_INV_F
      - First name of the principle investigator
      - String
      - any
      - First name of the principle investigator
    * - *pr_inv_m*
      - PR_INV_M
      - Middle name of the principle investigator
      - String
      - any
      - Middle name of the principle investigator
    * - *sun_alt*
      - sun_alt
      - Altitude of the sun
      - Float
      - any
      - Altitude of the sun above horizon
    * - *sunangle*
      - SUNANGLE
      - Angle between sun and z-axis
      - Float
      - any
      - Angle between sun and z-axis
    * - *moonangl*
      - MOONANGL
      - Angle between moon and z-axis
      - Float
      - any
      - Angle between moon and z-axis
    * - *refframe*
      - REFFRAME
      - Guide star catalog version
      - String
      - any
      - Guide star catalog version
    * - *time_obs*
      - TIME-OBS
      - UT time of start of observation (hh:mm:ss)
      - String
      - any
      - UT time of start of observation (hh:mm:ss)
    * - *expstart*
      - EXPSTART
      - Exposure start time (Modified Julian Date)
      - Float
      - any
      - Exposure start time (Modified Julian Date)
    * - *expend*
      - EXPEND
      - Exposure end time (Modified Julian Date)
      - Float
      - any
      - Exposure end time (Modified Julian Date)
    * - *exptime*
      - EXPTIME
      - On-detector, open-shutter, integration time (seconds)
      - Float
      - any
      - Provides the integration time in seconds.  Although not a standard
        use, EXPTIME is commonly used to calculate the flux of a source via: 
        Flux = ADU / EXPTIME.  It is advisable to respect this usage.  Under
        this definition, when multiple images are combined into one, EXPTIME
        is sometimes used with NCOMBINE to reflect the type of combining
        operation: if the images are summed then EXPTIME is the total open
        shutter integration, summed over all the sub-exposures, but with
        NCOMBINE=1.  If N subexposures are averaged together into 1, then
        EXPTIME is the average exposure time, and with NCOMBINE = N.  The
        purpose of defining NCOMBINE in this way is to facilitate the
        calculation of image statistics.
    * - *expflag*
      - EXPFLAG
      - Exposure interrupt indicator
      - String
      - any
      - Exposure interrupt indicator
    * - *qualcom1*
      - QUALCOM1
      - Data quality comment 1
      - String
      - any
      - Data quality comment 1
    * - *qualcom2*
      - QUALCOM2
      - Data quality comment 2
      - String
      - any
      - Data quality comment 2
    * - *qualcom3*
      - QUALCOM2
      - Data quality comment 3
      - String
      - any
      - Data quality comment 3
    * - *quality*
      - QUALITY
      - Data quality summary
      - String
      - any
      - Data quality summary
    * - *institut*
      - INSTITUT
      - Institutions of the PI/Co-I
      - String
      - 
      - Institutions of the PI/Co-I
    * - *targname*
      - TARGNAME
      - Target name
      - String
      - any
      - This keyword is more specifically used to define target name, versus
        OBJECT, which might be used to describe target category.  This keyword
        never specifies target category.
    * - *targdesc*
      - TARGDESC
      - Target description
      - String
      - any
      - Target description is used to describe a target more generally than
        its category.
    * - *ra_targ*
      - RA_TARG
      - Right ascension of the target in mean places of equinox
      - Float
      - any
      - Right ascension of the target in mean places of equinox
    * - *dec_targ*
      - DEC_TARG
      - Declination of the target in mean places of equinox
      - Float
      - any
      - Declination of the target in mean places of equinox
    * - *ecl_long*
      - ECL_LONG
      - Ecliptic longitude of target (deg)
      - Float
      - any
      - Ecliptic longitude of target (deg)
    * - *ecl_lat*
      - ECL_LAT
      - Ecliptic latitude of target (deg)
      - Float
      - any
      - Ecliptic latitude of target (deg)
    * - *gal_long*
      - GAL_LONG
      - Galactic longitude of target (deg)
      - Float
      - any
      - Galactic longitude of target (deg)
    * - *gal_lat*
      - GAL_LAT
      - Galactic latitude of target (deg)
      - Float
      - any
      - Galactic latitude of target (deg)
    * - *tequinox*
      - TEQUINOX
      - Equinox of the target
      - Float
      - any
      - Equinox of the target
    * - *rv_helio*
      - rv_helio
      - Target heliocentric radial velocity
      - Float
      - any
      - Target heliocentric radial velocity
    * - *pm_flag*
      - PM_FLAG
      - Does this target have proper motion?
      - true
      - any
      - Does this target have proper motion
    * - *pm_ra*
      - PM_RA
      - Target proper motion in RA
      - Float
      - any
      - Target proper motion in RA
    * - *pm_dec*
      - PM_DEC
      - Target proper motion in DEC
      - Float
      - any
      - Target proper motion in DEC
    * - *pm_eqnx*
      - PM_EQUIN
      - Equinox of target proper motion
      - String
      - any
      - Equinox of target proper motion, from proposal
    * - *parallax*
      - PARALLAX
      - Target parallax
      - Float
      - any
      - Target parallax
    * - *gsn_id*
      - GSn_ID
      - ID of the guide star
      - Float
      - any
      - ID of the guide star
    * - *gsn_ra*
      - GSn_RA
      - Right ascension of the guide stars in mean places of equinox
      - Float
      - any
      - Right ascension of the guide stars in mean places of equinox
    * - *gsn_dec*
      - GSn_DEC
      - Declination of the guide stars in mean places of equinox
      - Float
      - any
      - Declination of the guide stars in mean places of equinox
    * - *gsn_mag*
      - GSn_MAG
      - Guide star magnitude
      - Float
      - any
      - Guide star magnitude
    * - *gsn_filt*
      - GSn_FILT
      - Passband of guide star magnitude
      - String
      - any
      - Passband of guide star magnitude
    * - *gsn_eqnx*
      - GSnEQNOX
      - Equinox of the guidestars
      - Float
      - any
      - Equinox of the guidestars
    * - *gs1_id*
      - GS1_ID
      - ID of the guide star 1
      - Float
      - any
      - ID of the guide star 1
    * - *gs1_ra*
      - GS1_RA
      - Right ascension of the guide star 1 in mean places of equinox
      - Float
      - any
      - Right ascension of the guide star 1 in mean places of equinox
    * - *gs1_dec*
      - GS1_DEC
      - Declination of the guide star 1 in mean places of equinox
      - Float
      - any
      - Declination of the guide star 1 in mean places of equinox
    * - *gs1_mag*
      - GS1_MAG
      - Guide star 1 magnitude
      - Float
      - any
      - Guide star 1 magnitude
    * - *gs1_filt*
      - GS1_FILT
      - Passband of guide star 1 magnitude
      - String
      - any
      - Passband of guide star 1 magnitude
    * - *gs1_eqnx*
      - GS1EQNOX
      - Equinox of the guidestar 1
      - Float
      - any
      - Equinox of the guidestar 1
    * - *gs2_id*
      - GS2_ID
      - ID of the guide star 2
      - Float
      - any
      - ID of the guide star 2
    * - *gs2_ra*
      - GS2_RA
      - Right ascension of the guide star 2 in mean places of equinox
      - Float
      - any
      - Right ascension of the guide star 2 in mean places of equinox
    * - *gs2_dec*
      - GS2_DEC
      - Declination of the guide star 2 in mean places of equinox
      - Float
      - any
      - Declination of the guide star 2 in mean places of equinox
    * - *gs2_mag*
      - GS1_MAG
      - Guide star 2 magnitude
      - Float
      - any
      - Guide star 2 magnitude
    * - *gs2_filt*
      - GS1_FILT
      - Passband of guide star 2 magnitude
      - String
      - any
      - Passband of guide star 2 magnitude
    * - *gs2_eqnx*
      - GS2EQNOX
      - Equinox of the guidestar 2
      - Float
      - any
      - Equinox of the guidestar 2
    * - *gs3_id*
      - GS3_ID
      - ID of the guide star 3
      - Float
      - any
      - ID of the guide star 3
    * - *gs3_ra*
      - GS3_RA
      - Right ascension of the guide star 3 in mean places of equinox
      - Float
      - any
      - Right ascension of the guide star 3 in mean places of equinox
    * - *gs3_dec*
      - GS3_DEC
      - Declination of the guide star 3 in mean places of equinox
      - Float
      - any
      - Declination of the guide star 3 in mean places of equinox
    * - *gs3_mag*
      - GS1_MAG
      - Guide star 3 magnitude
      - Float
      - any
      - Guide star 3 magnitude
    * - *gs3_filt*
      - GS1_FILT
      - Passband of guide star 3 magnitude
      - String
      - any
      - Passband of guide star 3 magnitude
    * - *gs3_eqnx*
      - GS3EQNOX
      - Equinox of the guidestar 3
      - Float
      - any
      - Equinox of the guidestar 3
    * - *gs4_id*
      - GS4_ID
      - ID of the guide star 4
      - Float
      - any
      - ID of the guide star 4
    * - *gs4_ra*
      - GS4_RA
      - Right ascension of the guide star 4 in mean places of equinox
      - Float
      - any
      - Right ascension of the guide star 4 in mean places of equinox
    * - *gs4_dec*
      - GS4_DEC
      - Declination of the guide star 4 in mean places of equinox
      - Float
      - any
      - Declination of the guide star 4 in mean places of equinox
    * - *gs4_mag*
      - GS1_MAG
      - Guide star 4 magnitude
      - Float
      - any
      - Guide star 4 magnitude
    * - *gs4_filt*
      - GS1_FILT
      - Passband of guide star 4 magnitude
      - String
      - any
      - Passband of guide star 4 magnitude
    * - *gs4_eqnx*
      - GS4EQNOX
      - Equinox of the guidestar 4
      - Float
      - any
      - Equinox of the guidestar 4
    * - *pa_v3*
      - PA_V3
      - Position angle of the V3 axis.
      - Float
      - any
      - Position angle of the V3 axis.  The V3-axis vector points toward the
        origin of the instrument aperture (deg), from the center of the focal
        plane; it is analogous to HST PA_V3.
    * - *ra_off*
      - RA_OFF
      - Telescope offset in RA from target position for observation
      - Float
      - any
      - Telescope offset in RA from target position for observation
    * - *dec_off*
      - DEC_OFF
      - Telescope offset in DEC from target position for observation
      - Float
      - any
      - Telescope offset in DEC from target position for observation
    * - *eqnx_off*
      - EQNX_OFF
      - Equinox of the offset, in case different from target equinox
      - Float
      - any
      - Equinox of the offset, in case different from target equinox
    * - *postarg1*
      - POSTARG1
      - Telescope Offset in axis 1 direction (usually x)
      - Float
      - any
      - Telescope Offset in axis 1 direction (usually x)
    * - *postarg2*
      - POSTARG2
      - Telescope Offset in axis 2 direction (usually y)
      - Float
      - any
      - Telescope Offset in axis 2 direction (usually y)
    * - *xoffset*
      - XOFFSET
      - Telescope Offset in X from target position for observation
      - Float
      - any
      - Telescope Offset in X from target position for observation
    * - *yoffset*
      - YOFFSET
      - Telescope Offset in Y from target position for observation
      - Float
      - any
      - Telescope Offset in Y from target position for observation
    * - *totexpt*
      - TOTEXPT
      - Total exposure time
      - Float
      - any
      - Total exposure time
    * - *sci_cat*
      - SCI_CAT
      - Science category (e.g. unresolved stellar pop, galaxy structure.
      - String
      - any
      - Science category (e.g. unresolved stellar pop, galaxy structure.
    * - *sci_kwd*
      - SCI_KWD
      - Scientific keywords (e.g. Black Holes, Galaxy Bulges, Galaxy Formation and Evolution, etc.
      - String
      - any
      - Scientific  keywords (e.g. Black Holes, Galaxy Bulges, Galaxy
        Formation and Evolution, etc.
    * - *timesys*
      - TIMESYS
      - Time system used
      - String
      - any
      - Time system used
    * - *utc*
      - UTC
      - Time in seconds elapsed since midnight of start of exposure
      - Float
      - any
      - Gives the time in seconds elapsed since midnight of the start of the
        exposure as known to TCS.  The time on TCS is synchronized with the
        observatory time system via a dedicated time module.  In practice,
        MJD-OBS, UTC, and LST, provide for a redundant consistency check
        mechanism in case of malfunction.
    * - *lst*
      - LST
      - Local Sidereal Time, in seconds elapsed since midnight of the start of the exposure as known to the TCS.
      - Float
      - any
      - Local Sidereal Time, in seconds elapsed since midnight of the start of
        the exposure as known to the TCS.
    * - *iraf_tlm*
      - IRAF-TLM
      - (IRAF-TLM) Time of last modification
      - String
      - any
      - (IRAF-TLM) Time of last modification
    * - *filename*
      - FILENAME
      - Name of file
      - String
      - any
      - Name of file
    * - *filetype*
      - FILETYPE
      - Type of data found in data file (SCI, CALIB, RAW, etc.)
      - String
      - any
      - Type of data found in data file (SCI, CALIB, RAW, etc.)
    * - *rootname*
      - ROOTNAME
      - Rootname of the observation set
      - String
      - any
      - Rootname of the observation set
    * - *imagetyp*
      - IMAGETYP
      - Type of exposure identifier (e.g. EXT)
      - String
      - any
      - Type of exposure identifier (e.g. EXT)
    * - *primesi*
      - PRIMESI
      - Instrument designated as prime [DELETE?]
      - String
      - any
      - Instrument designated as prime [DELETE?]
    * - *origfile*
      - ORIGFILE
      - Original file name
      - String
      - any
      - Records the original file name, as assigned at the instrument
        workstation.  This is an alternative file name.
    * - *arcfile*
      - ARCFILE
      - Archive file name
      - String
      - any
      - Provides the name under which the file is stored in the archive
    * - *checksum*
      - CHECKSUM
      - Exposure integrity checksum
      - String
      - any
      - Provides a Cyclic Redundant Check (CRC) calculation for each HDU.  It
        uses the ASCII encoded 1's complement algorithm.
    * - *datasum*
      - DATASUM
      - Data integrity checksum
      - String
      - any
      - Gives the checksum calculated for the data sections only. For dataless
        records, this keyword should be set to '0'.
    * - *inherit*
      - INHERIT
      - Indicates whether header of primary HDU is inherited into extensions
      - Boolean
      - primary
      - Used to indicate that the keywords from the header of the primary HDU
        should be inherited into the extension.
    * - *proctime*
      - PROCTIME
      - Pipeline processing time (MJD)
      - Float
      - any
      - Pipeline processing time (MJD)
    * - *obstype*
      - OBSTYPE
      - Observation type - imaging or spectroscopic
      - String
      - any
      - Observation type - imaging or spectroscopic
    * - *obsmode*
      - OBSMODE
      - Operating mode
      - String
      - any
      - Operating mode
    * - *sclamp*
      - SCLAMP
      - Lamp status, NONE or name of lamp which is on
      - String
      - any
      - Lamp status, NONE or name of lamp which is on
    * - *nrptexp*
      - NRPTEXP
      - Number of repeat exposures in set: default 1
      - Integer
      - any
      - Number of repeat exposures in set: default 1
    * - *subarray*
      - SUBARRAY
      - Data from a subarray (T) or full frame (F)
      - Boolean
      - any
      - Data from a subarray (T) or full frame (F)
    * - *detector*
      - DETECTOR
      - Detector name in use
      - String
      - any
      - Detector name in use
    * - *filter*
      - FILTER
      - Filter name selected from filter wheel
      - String
      - any
      - Filter name selected from filter wheel
    * - *filt_id*
      - FILT_ID
      - Filter ID selected from filter wheel
      - String
      - any
      - Filter ID selected from filter wheel
    * - *camera*
      - Camera
      - Camera name or number in use
      - String
      - any
      - Camera name or number in use
    * - *aperture*
      - APERTURE
      - Aperture name
      - String
      - any
      - Aperture name
    * - *aper_fov*
      - APER_FOV
      - Aperture field of view
      - String
      - any
      - Aperture field of view
    * - *focus*
      - FOCUS
      - Instrument focus setting
      - String
      - any
      - Instrument focus setting
    * - *propaper*
      - PROPAPER
      - Aperture specified in an observing proposal
      - String
      - any
      - Aperture specified in an observing proposal
    * - *dirimage*
      - DIRIMAGE
      - Direct image for grism or prism exposure
      - String
      - any
      - Direct image for grism or prism exposure
    * - *niter*
      - NITER
      - Number of exposure iterations
      - Integer
      - any
      - Number of exposure iterations
    * - *nsamp*
      - NSAMP
      - Number of MULTIACCUUM ramp samples
      - Integer
      - any
      - Number of MULTIACCUUM ramp samples
    * - *nread*
      - NREAD
      - Number of MULTIACCUUM initial and final readouts
      - Integer
      - any
      - Number of MULTIACCUUM initial and final readouts
    * - *readout*
      - READOUT
      - Detector readout rate (FAST, SLOW)
      - String
      - any
      - Detector readout rate (FAST, SLOW)
    * - *samp_seq*
      - SAMP_SEQ
      - MULTIACUUM exposure time sequence name
      - String
      - any
      - MULTIACUUM exposure time sequence name
    * - *sampzero*
      - SAMPZERO
      - MULTIACUUM sample time of the zeroth read (sec)
      - Float
      - any
      - MULTIACUUM sample time of the zeroth read (sec)
    * - *subtype*
      - SUBTYPE
      - Size/type of subarray
      - String
      - any
      - Size/type of subarray
    * - *crsplit*
      - CRSPLIT
      - Number of cosmic ray split exposures
      - Integer
      - any
      - Number of cosmic ray split exposures
    * - *cenwave*
      - CENWAVE
      - Proposed central wavelength of spectrum
      - Integer
      - any
      - Proposed central wavelength of spectrum
    * - *dqicorr*
      - DQICORR
      - Flag for data quality check initialization
      - String
      - any
      - Flags for initializing and performing data quality checking procedures
    * - *blevcorr*
      - BLEVCORR
      - Flag for subtracting bias level measured from overscan (UVIS) or reference pixels (IR)
      - String
      - any
      - Flag for subtract bias level measured from overscan (UVIS) or
        reference pixels (IR)
    * - *illmcorr*
      - ILLMCORR
      - Flag for subtracting background illumination
      - String
      - any
      - Flag for subtracting background illumination
    * - *crcorr*
      - CRCORR
      - Flag to combine observations to reject/identify cosmic rays hits
      - String
      - any
      - Flag to combine observations to reject/identify cosmic rays hits
    * - *darkcorr*
      - DARKCORR
      - Flag to subtract dark image
      - String
      - any
      - Flag to subtract dark image
    * - *flatcorr*
      - FLATCORR
      - Flag to apply flat field to data
      - String
      - any
      - Flag to apply flat field to data
    * - *photcorr*
      - PHOTCORR
      - Flag to populate photometric header keywords
      - String
      - any
      - Flag to populate photometric header keywords
    * - *drizcorr*
      - DRIZCORR
      - Flag to apply drizzle processing
      - String
      - any
      - Flag to apply drizzle processing
    * - *nlincorr*
      - NLINCORR
      - Flag to correct for detector non-linearities
      - String
      - any
      - Flag to correct for detector non-linearities
    * - *rptcorr*
      - RPTCORR
      - Flag to combine individual repeat observations
      - String
      - any
      - Flag to combine individual repeat observations
    * - *unitcorr*
      - UNITCORR
      - Flag to convert to count rates (see also BUNIT)
      - String
      - any
      - Flag to convert to count rates (see also BUNIT)
    * - *zsigcorr*
      - ZSIGCORR
      - Flag to apply zero read signal correction
      - String
      - any
      - Flag to apply zero read signal correction
    * - *zoffcorr*
      - ZOFFCORR
      - Flag to subtract MULTIACCUM zero read
      - String
      - any
      - Flag to subtract MULTIACCUM zero read
    * - *atodcorr*
      - ATODCORR
      - Flag to correct for analog to digital conversion errors
      - String
      - any
      - Flag to correct for analog to digital conversion errors
    * - *biascorr*
      - BIASCORR
      - Flag to subtract bias image
      - String
      - any
      - Flag to subtract bias image
    * - *expscorr*
      - EXPSCORR
      - Flag to process individual observations after CR-reject
      - String
      - any
      - Flag to process individual observations after CR-reject
    * - *flshcorr*
      - FLSHCORR
      - Flag to apply post flash correction
      - String
      - any
      - Flag to apply post flash correction
    * - *shadcorr*
      - SHADCORR
      - Flag to apply shutter shading correction
      - String
      - any
      - Flag to apply shutter shading correction
    * - *wavecorr*
      - WAVECORR
      - Flag to use wavecal to adjust wavelength zeropoint
      - String
      - any
      - Flag to use wavecal to adjust wavelength zeropoint
    * - *x1dcorr*
      - X1DCORR
      - Flag to perform 1-D spectral extraction
      - String
      - any
      - Flag to perform 1-D spectral extraction
    * - *backcorr*
      - BACKCORR
      - Flag to perform background subtraction (sky and interorder)
      - String
      - any
      - Flag to perform background subtraction (sky and interorder)
    * - *helcorr*
      - HELCORR
      - Flag to convert to heliocentric wavelengths
      - String
      - any
      - Flag to convert to heliocentric wavelengths
    * - *dispcorr*
      - DISPCORR
      - Flag to apply 2-D dispersion solutions
      - String
      - any
      - Flag to apply 2-D dispersion solutions
    * - *fluxcorr*
      - FLUXCORR
      - Flag to convert to absolute flux units
      - String
      - any
      - Flag to convert to absolute flux units
    * - *ctecorr*
      - CTECORR
      - Flag to correct for CCD charge transfer inefficiency
      - String
      - any
      - Flag to correct for CCD charge transfer inefficiency
    * - *x2dcorr*
      - X2DCORR
      - Flag to rectify 2-D spectral image
      - String
      - any
      - Flag to rectify 2-D spectral image
    * - *imstat*
      - IMSTAT
      - Flag to calculate image statistics
      - String
      - any
      - Flag to calculate image statistics
    * - *bpixtab*
      - BPIXTAB
      - Bad pixel table
      - String
      - extension
      - Bad pixel table
    * - *ccdtab*
      - CCDTAB
      - Detector calibration parameters
      - String
      - any
      - Detector calibration parameters
    * - *crrejtab*
      - CRREJTAB
      - Cosmic ray rejection parameter table
      - String
      - extension
      - Cosmic ray rejection parameter table
    * - *oscntab*
      - OSCNTAB
      - Table containing overscan (UVIS) or reference (IR) pixel locations
      - String
      - any
      - Table containing overscan (UVIS) or reference (IR) pixel locations
    * - *pixrejtab*
      - CRREJTAB
      - Cosmic ray rejection parameters
      - String
      - any
      - Cosmic ray rejection parameters
    * - *darkfile*
      - DARKFILE
      - Superdark image file name
      - String
      - any
      - Superdark image file name
    * - *tdarkfil*
      - TDARKFIL
      - Temperature dependent dark file name
      - String
      - any
      - Temperature dependent dark file name
    * - *pfltfile*
      - PFLTFILE
      - Pixel to pixel flatfield file name
      - String
      - any
      - Pixel to pixel flatfield file name
    * - *dfltfile*
      - DFLTFILE
      - Delta flatfield file name
      - String
      - any
      - Delta flatfield file name
    * - *lfltfile*
      - LFLTFILE
      - Low order flat file
      - String
      - any
      - Low order flat file
    * - *tfltfile*
      - TFLTFILE
      - Temperature dependent flat file
      - String
      - any
      - Temperature dependent flat file
    * - *ffltfile*
      - FFLTFILE
      - Fringe correction flat file
      - String
      - any
      - Fringe correction flat file
    * - *maskfile*
      - MASKFILE
      - Mask image file name
      - String
      - any
      - Mask image file name
    * - *noisefil*
      - NOISEFIL
      - Detector read noise file name
      - String
      - any
      - Detector read noise file name
    * - *nlinfile*
      - NLINFILE
      - Detector nonlinearities file
      - String
      - any
      - Detector nonlinearities file
    * - *graphtab*
      - GRAPHTAB
      - Graph table
      - String
      - any
      - Graph table
    * - *comptab*
      - COMPTAB
      - Components table
      - String
      - any
      - Components table
    * - *idctab*
      - IDCTAB
      - Image distortion correction table
      - String
      - any
      - Image distortion correction table
    * - *phottab*
      - PHOTTAB
      - Photometric throughput table
      - String
      - any
      - Photometric throughput table
    * - *apertab*
      - APERTAB
      - Relative aperture throughput table
      - String
      - any
      - Relative aperture throughput table
    * - *dettab*
      - DETTAB
      - Detector calibration parameters
      - String
      - any
      - Detector calibration parameters
    * - *dgeofile*
      - DGEOFILE
      - Distortion correction image
      - String
      - any
      - Distortion correction image
    * - *mdriztab*
      - MDRIZTAB
      - MultiDrizzle parameter file
      - String
      - any
      - MultiDrizzle parameter file
    * - *driztab*
      - DRIZTAB
      - Drizzle parameter file when not using MultiDrizzle
      - String
      - any
      - Drizzle parameter file when not using MultiDrizzle
    * - *atodtab*
      - ATODTAB
      - Analog to digital correction file
      - String
      - any
      - Analog to digital correction file
    * - *biasfile*
      - BIASFILE
      - Superbias image file name
      - String
      - any
      - Superbias image file name
    * - *flshfile*
      - FLSHFILE
      - Post flash correction file name
      - String
      - any
      - Post flash correction file name
    * - *shadfile*
      - SHADFILE
      - Shutter shading correction file
      - String
      - any
      - Shutter shading correction file
    * - *wavecalf*
      - WAVECALF
      - Wavelength image file name
      - String
      - any
      - Wavelength image file name
    * - *sptrctab*
      - SPTRCTAB
      - Spectrum trace table
      - String
      - any
      - Spectrum trace table
    * - *disptab*
      - DISPTAB
      - Dispersion coefficient table
      - String
      - any
      - Dispersion coefficient table
    * - *lamptab*
      - LAMPTAB
      - Template calibration lamp spectra table
      - String
      - any
      - Template calibration lamp spectra table
    * - *pctab*
      - PCTAB
      - Photometry correction table
      - String
      - any
      - Photometry correction table
    * - *sdctab*
      - SDCTAB
      - 2-D spatial distortion correction table
      - String
      - any
      - 2-D spatial distortion correction table
    * - *xtractab*
      - XTRACTAB
      - Parameters for 1-D spectral extraction tab
      - String
      - any
      - Parameters for 1-D spectral extraction tab
    * - *wcptab*
      - WCPTAB
      - Wavelength calibration parameter table
      - String
      - any
      - Wavelength calibration parameter table
    * - *meanexp*
      - MEANEXP
      - Reference exposure time for parameters
      - Float
      - any
      - Reference exposure time for parameters
    * - *scalense*
      - SCALENSE
      - Multiplicative scale factor applied to noise
      - Float
      - any
      - Multiplicative scale factor applied to noise
    * - *initgues*
      - INITGUES
      - Initial guess method (MIN or MED)
      - String
      - any
      - Initial guess method (MIN or MED)
    * - *skysub*
      - SKYSUB
      - Sky value subtracted (MODE or NONE)
      - String
      - any
      - Sky value subtracted (MODE or NONE)
    * - *skysum*
      - SKYSUM
      - Sky level from the sum of all constituent images
      - Float
      - any
      - Sky level from the sum of all constituent images
    * - *crsigmas*
      - CRSIGMAS
      - Statistical rejection criteria
      - String
      - any
      - Statistical rejection criteria
    * - *crradius*
      - CRRADIUS
      - Rejection propagation radius (pixels)
      - Float
      - any
      - Rejection propagation radius (pixels)
    * - *crthresh*
      - CRTHRESH
      - Rejection propagation threshold
      - Float
      - any
      - TBC
    * - *badinpdq*
      - BADINPDQ
      - Data quality flag bits to reject
      - Integer
      - any
      - Data quality flag bits to reject
    * - *rej_rate*
      - REJ_RATE
      - Rate at which pixels are affected by cosmic rays
      - Float
      - any
      - Rate at which pixels are affected by cosmic rays
    * - *crmask*
      - CRMASK
      - Flag CR-rejected pixels in input files (T/F)
      - Boolean
      - any
      - Flag CR-rejected pixels in input files (T/F)
    * - *mdrizsky*
      - MDRIZSKY
      - Sky value computed by MultiDrizzle
      - 
      - any
      - Sky value computed by MultiDrizzle
    * - *photmode*
      - PHOTMODE
      - Observation configuration mode for photometric calibration
      - String
      - any
      - Observation configuration mode for photometric calibration
    * - *photflam*
      - PHOTFLAM
      - Inverse sensitivity, ergs/cm^2/Ang/electron
      - Float
      - any
      - Inverse sensitivity, ergs/cm^2/Ang/electron
    * - *photfnu*
      - PHOTFNU
      - Inverse sensitivity, Jy*sec/electron
      - Float
      - any
      - Inverse sensitivity, Jy*sec/electron
    * - *photzpt*
      - PHOTZPT
      - Magnitude zero point
      - Float
      - any
      - Magnitude zero point
    * - *photplam*
      - PHOTPLAM
      - Pivot wavelength (Angstroms)
      - Float
      - any
      - Pivot wavelength (Angstroms)
    * - *photbw*
      - PHOTBW
      - RMS bandwidth of filter plus detector (Angstroms)
      - Float
      - any
      - RMS bandwidth of filter plus detector (Angstroms)
    * - *pattern1*
      - PATTERN1
      - Primary pattern type
      - String
      - any
      - Primary pattern type: DITHER-BOX-MIN (4-step sampling), DITHER-LINE
        (2-point sampling) DITHER-LINE-3PT (3-point sampling), DITHER-BOX (4
        point box sampling), GAP-LINE (2-point dithering over interchip gap)
        MOSAIC-LINE (full frame offset that uses single set of guide stars)
    * - *p1_shape*
      - P1_SHAPE
      - Primary pattern shape
      - String
      - any
      - Primary pattern shape
    * - *p1_purps*
      - P1_PURPS
      - Primary pattern purpose
      - String
      - any
      - Primary pattern purpose
    * - *p1_npts*
      - P1_NPTS
      - Number of points in primary pattern
      - Integer
      - any
      - Number of points in primary pattern
    * - *p1_pspac*
      - P1_PSPAC
      - Point spacing for primary pattern (arc-sec)
      - Float
      - any
      - Point spacing for primary pattern (arc-sec)
    * - *p1_lspac*
      - P1_LSPAC
      - Line spacing for primary pattern (arc-sec)
      - Float
      - any
      - Line spacing for primary pattern (arc-sec)
    * - *p1_angle*
      - P1_ANGLE
      - Angle between sides of parallelogram pattern (deg)
      - Float
      - any
      - Angle between sides of parallelogram pattern (deg)
    * - *p1_frame*
      - P1_FRAME
      - Coordinate frame of primary pattern
      - String
      - any
      - Coordinate frame of primary pattern
    * - *p1_orint*
      - P1_ORINT
      - Orientation of pattern to coordinate frame (deg)
      - Float
      - any
      - Orientation of pattern to coordinate frame (deg)
    * - *p1_centr*
      - P1_CENTR
      - Center pattern relative to pointing (yes/no)
      - String
      - any
      - Center pattern relative to pointing (yes/no)
    * - *pattern2*
      - PATTERN2
      - Secondary pattern type
      - String
      - any
      - Primary pattern type: DITHER-BOX-MIN (4-step sampling), DITHER-LINE
        (2-point sampling), DITHER-LINE-3PT (3-point sampling), DITHER-BOX (4
        point box sampling), GAP-LINE (2-point dithering over interchip gap),
        MOSAIC-LINE (full frame offset that uses single set of guide stars)
    * - *p2_shape*
      - P2_SHAPE
      - Secondary pattern shape
      - String
      - any
      - Secondary pattern shape
    * - *p2_purps*
      - P2_PURPS
      - Secondary pattern purpose
      - String
      - any
      - Secondary pattern purpose
    * - *p2_npts*
      - P2_NPTS
      - Number of points in secondary pattern
      - Integer
      - any
      - Number of points in secondary pattern
    * - *p2_pspac*
      - P2_PSPAC
      - Point spacing for secondary pattern (arc-sec)
      - Float
      - any
      - Point spacing for secondary pattern (arc-sec)
    * - *p2_lspac*
      - P2_LSPAC
      - Line spacing for secondary pattern (arc-sec)
      - Float
      - any
      - Line spacing for secondary pattern (arc-sec)
    * - *p2_angle*
      - P2_ANGLE
      - Angle between sides of parallelogram pattern (deg)
      - Float
      - any
      - Angle between sides of parallelogram pattern (deg)
    * - *p2_frame*
      - P2_FRAME
      - Coordinate frame of secondary pattern
      - String
      - any
      - Coordinate frame of secondary pattern
    * - *p2_orint*
      - P2_ORINT
      - Orientation of pattern to coordinate frame (deg)
      - Float
      - any
      - Orientation of pattern to coordinate frame (deg)
    * - *p2_centr*
      - P2_CENTR
      - Center pattern relative to pointing (yes/no)
      - String
      - any
      - Center pattern relative to pointing (yes/no)
    * - *pattstep*
      - PATTSTEP
      - Position number of this point in the pattern
      - Integer
      - any
      - Position number of this point in the pattern
    * - *detamp*
      - DETAMP
      - Detector amplifier readout configuration
      - String
      - any
      - Detector amplifier readout configuration
    * - *detoffst*
      - DETOFFST
      - Commanded detector bias offset
      - String
      - any
      - Commanded detector bias offset
    * - *cmdgain*
      - CMDGAIN
      - Commanded A-to-D conversion gain of detector
      - Float
      - any
      - Commanded A-to-D conversion gain of detector
    * - *detofsab*
      - DETOFSAB
      - Commanded detector bias offset for amps A&amp;B
      - Integer
      - any
      - Commanded detector bias offset for amps A&B
    * - *detofscd*
      - DETOFSCD
      - Commanded detector bias offset for amps C&amp;D
      - Integer
      - any
      - Commanded detector bias offset for amps C&D
    * - *detofsta*
      - DETOFSTA
      - Commanded detector bias offset for amplifier A
      - Integer
      - any
      - Commanded detector bias offset for amplifier A
    * - *detofstb*
      - DETOFSTB
      - Commanded detector bias offset for amplifier B
      - Integer
      - any
      - Commanded detector bias offset for amplifier B
    * - *detofstc*
      - DETOFSTC
      - Commanded detector bias offset for amplifier C
      - Integer
      - any
      - Commanded detector bias offset for amplifier C
    * - *detofstd*
      - DETOFSTD
      - Commanded detector bias offset for amplifier D
      - Integer
      - any
      - Commanded detector bias offset for amplifier D
    * - *atodgain*
      - ATODGAIN
      - Measured analog-to-digital conversion gain
      - Float
      - any
      - Measured analog-to-digital conversion gain
    * - *atodgna*
      - ATODGNA
      - Measured gain for amplifier A
      - Float
      - any
      - Measured gain for amplifier A
    * - *atodgnb*
      - ATODGNB
      - Measured gain for amplifier B
      - Float
      - any
      - Measured gain for amplifier B
    * - *atodgnc*
      - ATODGNC
      - Measured gain for amplifier C
      - Float
      - any
      - Measured gain for amplifier C
    * - *atodgnd*
      - ATODGND
      - Measured gain for amplifier D
      - Float
      - any
      - Measured gain for amplifier D
    * - *rdnoise*
      - RDNOISE
      - Detector readnoise parameter
      - Float
      - any
      - Detector readnoise parameter
    * - *readnsa*
      - READNSA
      - Measured readnoise for amplifier A
      - Float
      - any
      - Measured readnoise for amplifier A
    * - *readnsb*
      - READNSB
      - Measured readnoise for amplifier B
      - Float
      - any
      - Measured readnoise for amplifier B
    * - *readnsc*
      - READNSC
      - Measured readnoise for amplifier C
      - Float
      - any
      - Measured readnoise for amplifier C
    * - *readnsd*
      - READNSD
      - Measured readnoise for amplifier D
      - Float
      - any
      - Measured readnoise for amplifier D
    * - *biasleva*
      - BIASLEVA
      - Bias level for amplifier A
      - Float
      - any
      - Bias level for amplifier A
    * - *biaslevb*
      - BIASLEVB
      - Bias level for amplifier B
      - Float
      - any
      - Bias level for amplifier B
    * - *biaslevc*
      - BIASLEVC
      - Bias level for amplifier C
      - Float
      - any
      - Bias level for amplifier C
    * - *biaslevd*
      - BIASLEVD
      - Bias level for amplifier D
      - Float
      - any
      - Bias level for amplifier D
    * - *det_chp*
      - DET_CHP
      - Detector chip number
      - Integer
      - any
      - Detector chip number
    * - *det_temp*
      - DET_TEMP
      - Detector temperature
      - Float
      - any
      - Detector temperature
    * - *asn_id*
      - ASN_ID
      - Unique identifier assigned to association
      - String
      - any
      - Unique identifier assigned to association
    * - *asn_tab*
      - ASN_TAB
      - Name of the association file
      - String
      - any
      - Name of the association file
    * - *asn_mtyp*
      - ASN_MTYP
      - Role of the member in the association
      - String
      - any
      - Role of the member in the association
    * - *expname*
      - EXPNAME
      - Exposure identifier
      - String
      - extension
      - Exposure identifier
    * - *ltv1*
      - LTV1
      - Offset in X to subsection start
      - Float
      - any
      - Offset in X to subsection start
    * - *ltv2*
      - LTV2
      - Offset in Y to subsection start
      - Float
      - any
      - Offset in Y to subsection start
    * - *ltm1_1*
      - LTM1_1
      - Reciprocal of sampling rate in X
      - Float
      - any
      - Reciprocal of sampling rate in X
    * - *ltm2_2*
      - LTM2_2
      - Reciprocal of sampling rate in Y
      - Float
      - any
      - Reciprocal of sampling rate in Y
    * - *pa_aper*
      - PA_APER
      - Position angle of reference aperture center (deg)
      - Float
      - any
      - Position angle of reference aperture center (deg)
    * - *orientat*
      - ORIENTAT
      - Position angle of image Y-axis (degrees East of North)
      - Float
      - any
      - Position angle of image Y-axis (degrees East of North)
    * - *ra_aper*
      - RA_APER
      - Right ascension of aperture reference position
      - Float
      - any
      - Right ascension of aperture reference position
    * - *dec_aper*
      - DEC_APER
      - Declination of aperture reference position
      - Float
      - any
      - Declination of aperture reference position
    * - *ncombine*
      - NCOMBINE
      - Number of image sets combined, such as during CR rejection, or for any other purpose
      - Integer
      - any
      - Number of image sets combined, such as during CR rejection, or for any
        other purpose.  See EXPTIME description to note how the use of
        NCOMBINE may depend on EXPTIME when summing or averaging over multiple
        sub-exposures into one.  Because there are ambiguities about what
        NCOMBINE may mean, to be more specific about the type of combining
        operation, prefer NCOMBSUM, NCOMBAVG, NCOMBMED, and promote the use of
        NCOMBINE that adheres to the definition given in EXPTIME when used in
        a science data HDU.
    * - *ncombsum*
      - NCOMBSUM
      - Number of image sets combined via summing over N sub-exposures into one final exposure.
      - Integer
      - any
      - Number of image sets combined via summing over N sub-exposures into
        one final exposure.
    * - *ncombavg*
      - NCOMBAVG
      - Number of image sets combined via averaging over N sub-exposures into one final exposure.
      - Integer
      - any
      - Number of image sets combined via averaging over N sub-exposures into
        one final exposure.
    * - *ncombmed*
      - NCOMBMED
      - Number of image sets combined via median combining N sub-exposures into one final exposure.
      - Integer
      - any
      - Number of image sets combined via median combining N sub-exposures
        into one final exposure.
    * - *centera1*
      - CENTERA1
      - Subarray axis 1 center point in unbinned detector pix
      - Integer
      - any
      - Subarray axis 1 center point in unbinned detector pix
    * - *centera2*
      - CENTERA2
      - Subarray axis 2 center point in unbinned detector pix
      - Integer
      - any
      - Subarray axis 2 center point in unbinned detector pix
    * - *sizaxis1*
      - SIZAXIS1
      - Subarray axis 1 size in unbinned detector pixels
      - Integer
      - any
      - Subarray axis 1 size in unbinned detector pixels
    * - *sizaxis2*
      - SIZAXIS2
      - Subarray axis 2 size in unbinned detector pixels
      - Integer
      - any
      - Subarray axis 2 size in unbinned detector pixels
    * - *binaxis1*
      - BINAXIS1
      - Axis 1 bin size in unbinned detector pixels
      - Integer
      - any
      - Axis 1 bin size in unbinned detector pixels
    * - *binaxis2*
      - BINAXIS1
      - Axis 2 bin size in unbinned detector pixels
      - Integer
      - any
      - Axis 2 bin size in unbinned detector pixels
    * - *sampnum*
      - SAMPNUM
      - MULTIACCUM sample number
      - Integer
      - any
      - MULTIACCUM sample number
    * - *samptime*
      - SAMPTIME
      - Total integration time (sec)
      - Float
      - any
      - Total integration time (sec)
    * - *deltatim*
      - DELTATIM
      - Integration time of this sample (sec)
      - Float
      - any
      - Integration time of this sample (sec)
    * - *routtime*
      - ROUTTIME
      - UT time of array readout (MJD)
      - Real
      - any
      - UT time of array readout (MJD)
    * - *ngoodpix*
      - NGOODPIX
      - Number of good pixels
      - Integer
      - any
      - Number of good pixels
    * - *sdqflags*
      - SDQFLAGS
      - Serious data quality flags
      - Integer
      - any
      - Serious data quality flags
    * - *goodmin*
      - GOODMIN
      - Minimum value of good pixels
      - Float
      - any
      - Minimum value of good pixels
    * - *goodmax*
      - GOODMAX
      - Maximum value of good pixels
      - Float
      - any
      - Maximum value of good pixels
    * - *snrmin*
      - SNRMIN
      - Minimum signal-to-noise of good pixels
      - Float
      - any
      - Minimum signal-to-noise of good pixels
    * - *snrmax*
      - SNRMAX
      - Maximum signal-to-noise of good pixels
      - Float
      - any
      - Maximum signal-to-noise of good pixels
    * - *snrmean*
      - SNRMEAN
      - Mean value of signal-to-noise of good pixels
      - Float
      - any
      - Mean value of signal-to-noise of good pixels
    * - *softerrs*
      - SOFTERRS
      - Number of soft error pixels (DQF1)
      - Integer
      - any
      - Number of soft error pixels (DQF1)
    * - *meandark*
      - MEANDARK
      - Average dark level subtracted
      - Float
      - any
      - Average dark level subtracted
    * - *meanblev*
      - MEANBLEV
      - Average bias level subtracted
      - Float
      - any
      - Average bias level subtracted
    * - *meanflsh*
      - MEANFLSH
      - Mean number of counts in post flash exposure
      - Float
      - any
      - Mean number of counts in post flash exposure
    * - *operator*
      - OPERATOR
      - Name of telescope operator
      - String
      - any
      - Name of telescope operator
    * - *focleng*
      - FOCLENG
      - Telescope focal length [m]
      - Float
      - any
      - Telescope focal length [m]
    * - *focscale*
      - FOCSCALE
      - Telescope focal scale [arcsec/mm]
      - Float
      - any
      - Telescope focal scale [arcsec/mm]
    * - *focvalue*
      - FOCVALUE
      - Telescope M2 setting [mm]
      - Float
      - any
      - Telescope M2 setting [mm]
    * - *p_angbeg*
      - P_ANGBEG
      - Parallactic angle at beginning of exposure (deg)
      - Float
      - any
      - Parallactic angle at beginning of exposure (deg)
    * - *p_angend*
      - P_ANGEND
      - Parallactic angle at end of exposure (deg)
      - Float
      - any
      - Parallactic angle at end of exposure (deg)
    * - *trck_ra*
      - TRCK_RA
      - Tracking rate in RA (mas/sec)
      - Float
      - any
      - Tracking rate in RA (mas/sec)
    * - *trck_dec*
      - TRCK_DEC
      - Tracking rate in DEC (mas/sec)
      - Float
      - any
      - Tracking rate in DEC (mas/sec)
    * - *trckstat*
      - TRCKSTAT
      - Tracking status
      - Status
      - any
      - Tracking status
    * - *airmass*
      - AIRMASS
      - Airmass at the center of exposure
      - Float
      - any
      - Airmass at center of exposure, sec(zenith angle)
    * - *airm_beg*
      - AIRM_BEG
      - Airmass at start of exposure
      - Float
      - any
      - Airmass at start of exposure, sec(zenith angle)
    * - *airm_end*
      - AIRM_END
      - Airmass at end of exposure
      - Float
      - any
      - Airmass at end of exposure, sec(zenith angle)
    * - *tel_alt*
      - TEL_ALT
      - Telescope altitude at start (deg) of exposure
      - Float
      - any
      - Telescope altitude at start (deg) of exposure
    * - *tel_az*
      - TEL_AZ
      - Telescope azimuth at start (deg) of exposure
      - Float
      - any
      - Telescope azimuth at start (deg) of exposure
    * - *geo_elev*
      - GEO_ELEV
      - Telescope elevation above sea level [m]
      - Float
      - any
      - Telescope elevation above sea level [m]
    * - *moonphas*
      - MOONPHAS
      - Moon phase
      - Float
      - any
      - Moon phase
    * - *seeing*
      - SEEING
      - Atmospheric seeing
      - Float
      - any
      - Atmospheric seeing
    * - *wind_spd*
      - WIND_SPD
      - Average wind speed during observation [km/hr]
      - Float
      - any
      - Average wind speed during observation [km/hr]
    * - *wind_dir*
      - WIND_SPD
      - Average wind direction during observation [deg]
      - Float
      - any
      - Average wind direction during observation [deg]
    * - *humidity*
      - HUMIDITY
      - Average relative humidity during observation [%]
      - Float
      - any
      - Average relative humidity during observation [%]
    * - *pressure*
      - PRESSURE
      - Average atmospheric pressure during observation [mm]
      - Float
      - any
      - Average atmospheric pressure during observation [mm]
    * - *ambtemp*
      - AMBTEMP
      - Average ambient temperature during observation [C]
      - Float
      - any
      - Average ambient temperature during observation [C]
    * - *ins_id*
      - INS_ID
      - Instrument control software ID
      - String
      - any
      - Instrument control software ID
    * - *ics_vers*
      - ICS_VERS
      - Instrument control software version and installation date
      - String
      - any
      - Instrument control software version and installation date
    * - *adc_stat*
      - ADC_STAT
      - ADC status
      - String
      - any
      - ADC status
    * - *adc_pos*
      - ADC_POS
      - ADC position
      - String
      - any
      - ADC position
    * - *ins_oper*
      - INS_OPER
      - Instrument operator
      - String
      - any
      - Instrument operator
    * - *disp_pa*
      - DISP_PA
      - Disperser, grating or grism, position angle (N=0, E=90) [deg]
      - String
      - any
      - Disperser, grating or grism, position angle (N=0, E=90) [deg]
    * - *disp_nam*
      - GRAT_NAM
      - Name of disperser, grating or grism
      - String
      - any
      - Name of disperser, grating or grism
    * - *disp_id*
      - DISP_ID
      - ID of disperser, grating, or grism.
      - String
      - any
      - Grating ID
    * - *dispers*
      - DISPERS
      - Grating or grism dispersion (Angstrom/mm)
      - Float
      - any
      - Grating or grism dispersion (Angstrom/mm)
    * - *disp_wav*
      - DISP_WAV
      - Disperser, grating or grism, central wavelength (Angstrom)
      - String
      - any
      - Disperser, grating or grism, central wavelength (Angstrom)
    * - *dispaxis*
      - DISPAXIS
      - Dispersion axis: 1= axis 1, 2 = axis 2, none
      - String
      - any
      - Dispersion axis: 1 = axis 2, 2 = axis 2, none
    * - *lamp_id*
      - LAMP_ID
      - Lamp ID
      - String
      - any
      - Lamp ID
    * - *lamp_vol*
      - LAMP_VOL
      - Lamp voltage status
      - Float
      - any
      - Lamp voltage status
    * - *ins_mode*
      - INS_MODE
      - Instrument mode used
      - String
      - any
      - Instrument mode used
    * - *ins_temp*
      - INS_TEMP
      - Instrument temperature (C)
      - Float
      - any
      - Instrument temperature (C)
    * - *ins_optp*
      - INS_OPTP
      - Instrument optical pathway name
      - String
      - any
      - Instrument optical pathway name
    * - *opt_elem*
      - OPT_ELEM
      - Optical element in use
      - String
      - any
      - Optical element in use, e.g. disperser name
    * - *slit_wid*
      - SLIT_WID
      - Slit width [arcsec]
      - Float
      - any
      - Slit width [arcsec]
    * - *slit_len*
      - SLIT_LEN
      - Slit length [arcsec]
      - Float
      - any
      - Slit length [arcsec]
    * - *slit_pa*
      - SLIT_PA
      - Slit position angle [deg]
      - Float
      - any
      - Slit position angle [deg]
    * - *slit_ra*
      - SLIT_RA
      - Slit right ascension [deg]
      - Float
      - any
      - Slit right ascension [deg]
    * - *slit_dec*
      - SLIT_DEC
      - Slit declination [deg]
      - Float
      - any
      - Slit declination [deg]
    * - *sporder*
      - SPORDER
      - Spectral order
      - Integer
      - any
      - Spectral order
    * - *platesc*
      - PLATESC
      - Detector plate scale [arcsec]
      - 
      - any
      - Detector plate scale [arcsec]
    * - *guidsta1*
      - GUIDSTA1
      - Telescope autoguider 1 status
      - String
      - any
      - Telescope autoguider 1 status
    * - *guid_ra1*
      - GUID_RA1
      - Telescope autoguider 1 right ascension
      - Float
      - any
      - Telescope autoguider 1 right ascension
    * - *guid_dc1*
      - GUID_DC1
      - Telescope autoguider 1 declination
      - Float
      - any
      - Telescope autoguider 1 declination
    * - *guidsta2*
      - GUIDSTA2
      - Telescope autoguider 2 status
      - String
      - any
      - Telescope autoguider 2 status
    * - *guid_ra2*
      - GUID_RA2
      - Telescope autoguider 2 right ascension
      - Float
      - any
      - Telescope autoguider 2 right ascension
    * - *guid_dc2*
      - GUID_DC2
      - Telescope autoguider 2 declination
      - Float
      - any
      - Telescope autoguider 2 declination
    * - *guidsta3*
      - GUIDSTA3
      - Telescope autoguider 3 status
      - String
      - any
      - Telescope autoguider 3 status
    * - *guid_ra3*
      - GUID_RA3
      - Telescope autoguider 3 right ascension
      - Float
      - any
      - Telescope autoguider 3 right ascension
    * - *guid_dc3*
      - GUID_DC3
      - Telescope autoguider 3 declination
      - Float
      - any
      - Telescope autoguider 3 declination
    * - *phas_sta*
      - PHAS_STA
      - Telescope phasing camera status
      - String
      - any
      - Telescope phasing camera status
    * - *phas_ra*
      - PHAS_RA
      - Telescope phasing camera right ascension
      - Float
      - any
      - Telescope phasing camera right ascension
    * - *phas_dec*
      - PHAS_DEC
      - Telescope phasing camera declination
      - Float
      - any
      - Telescope phasing camera declination
    * - *obs_pid*
      - OBS_PID
      - Program ID corresponding to observing block
      - String
      - any
      - Program ID corresponding to Observing block
    * - *obs_id*
      - OBS_ID
      - Observing block ID
      - Integer
      - any
      - Observing block ID
    * - *obs_name*
      - OBS_NAME
      - Observing block name
      - String
      - any
      - Observing block name
    * - *obs_grp*
      - OBS_GRP
      - Observing block group (linked blocks)
      - String
      - any
      - Observing block group (linked blocks)
    * - *obs_seqn*
      - OBS_SEQN
      - Sequence number in observing block template
      - Integer
      - any
      - Sequence number in an observing block template
    * - *obset_id*
      - OBSET_ID
      - Observation set ID
      - String
      - any
      - Observation set ID
    * - *tpl_id*
      - TPL_ID
      - Observing template ID
      - Float
      - any
      - Observing template ID
    * - *tpl_name*
      - TPL_name
      - Observing template name
      - String
      - any
      - Observing template name
    * - *tpl_seqn*
      - TPL_SEQN
      - Template sequence number within block
      - Integer
      - any
      - Template sequence number within block
    * - *tpl_nexp*
      - TPL_NEXP
      - Number of exposures within sequence template
      - Integer
      - any
      - Number of exposures within sequence template
    * - *tpl_expn*
      - TPL_EXPN
      - Exposure number within template
      - Integer
      - any
      - Exposure number within template
    * - *dpr_catg*
      - DPR_CATG
      - Data product file, data product category
      - String
      - any
      - Data product file, data product category [TBC]
    * - *dpr_type*
      - DPR_TYPE
      - Data product file, observation type
      - String
      - any
      - Data product file, Observation type [TBC]
    * - *dpr_tech*
      - DPR_TECH
      - Data product file, observation technique
      - String
      - any
      - Gives the technique used for the observation and can take on more than
        one value.  The values should be separated with commas, from general
        to specific. [TBC]
    * - *tlmin*
      - TLMINn
      - Minimum legal values for a column
      - Float
      - extension
      - Minimum legal values for a column
    * - *tlmax*
      - TLMAXn
      - Maximum legal values for a column
      - Float
      - extension
      - Maximum legal values for a column
    * - *pixvalue*
      - PIXVALUE
      - Value of all the pixels in an uniform image
      - Float
      - any
      - When all pixels in an image are of a single value, that value is
        stored as PIXVALUE and the HDU has no binary data section.  The use of
        PIXVALUE is not allowed for a SCI extension.
    * - *tdescn*
      - TDESCn
      - Column description
      - String
      - extension
      - The value field of this indexed keyword contains a character string
        that describes the content of the table column.
    * - *use_date*
      - USE_DATE
      - Use this file for obs taken on or after this date
      - String
      - all
      - Use this file for observations taken on or after the date specified in
        the value field.  This is used e.g. in instrument or calibration
        reference tables.


.. raw:: latex
  
    \end{center}


.. raw:: latex
  
    \newpage






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



