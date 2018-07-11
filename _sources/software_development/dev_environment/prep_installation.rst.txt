.. _prep_installation:

Preparing for Installation
==========================

Full instructions for downloading Fedora 26 and preparing various types of boot media in different environments can be found here: https://docs.fedoraproject.org/f26/install-guide/install/Preparing_for_Installation.html

Alternatively, the following command-line instructions may be used on OSX or Linux:

  .. warning::
    * The USB drive needs a minimum capacity of 3GB
    * Ensure that you properly identify the ``device`` assigned to the USB drive
    * The entire USB drive will be erased!


  OSX - with a drive on ``/dev/disk2``

  .. code-block:: bash

    $ diskutil list
    $ sudo diskutil unmountDisk /dev/disk2
    $ sudo dd bs=4m if=Fedora-Server-dvd-x86_64-26-1.5.iso of=/dev/rdisk2


  Linux - with a drive on ``/dev/sdb``

  .. code-block:: bash

    $ sudo umount /dev/sdb*
    $ sudo dd bs=4M if=Fedora-Server-dvd-x86_64-26-1.5.iso of=/dev/sdb

:ref:`[back to top] <prep_installation>`
