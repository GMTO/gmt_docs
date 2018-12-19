.. _ui_fwk:

UI Framework
============

.. note::
    The UI framework is currently only supported on MacOS.  Linux support will be available in future releases.

The UI Framework introduces a set of libraries and a windowed application that provides a GUI for the OCS.  The framework handles three primary concerns

* Rendering (drawing) elements to the screen (DOM) 
* Library of re-usable UI components that can be shared across the project
* An App that provides an interface to the OCS

Engineering App
---------------

The engineering application provides a GUI to the OCS model.  It is launched via the command line and it will spawn an OS window that renders the UI.

The UI engineering app uses your local bundles from ``$GMT_LOCAL/etc/bundles`` and allows you to see a visual representation of your model files' input/output ports.  For now, the Engineering app needs to run in MacOS or a Linux Desktop. 

To launch the application, run this in the command line

.. code-block:: bash

    $ navigator

This will launch the GUI as a child process of the CLI application.  To stop the GUI, stop the CLI app with ``CTRL + C``.

Launching Custom panels
^^^^^^^^^^^^^^^^^^^^^^^

The ``navigator`` application can also launch custom panels that are defined in a DCS' `*_vis_pkg` folders.  When defined, it's possible to launch standalone panels with the following parameters

.. code-block:: bash

    $ navigator --panel emf_custom_weather_view --port 9098

The ``--panel`` flag specifies an exported panel in some vis package.  The ``--port`` flag is currently required to avoid port collisions (for now).

The engineering app reserves port ``9199``.  Custom panel launches of the application need to specify a different port for each instance.

Troubleshooting
^^^^^^^^^^^^^^^
* **MacOS - nvm command not found**: If, after installing nvm, the command ``nvm install`` fails with the message, ``command not found``, check the ``~/.bash_profile`` file to ensure that it contains a command for loading nvm. The .bash_profile file should contain the following lines:

  .. code-block:: bash

      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
   
* **Unresponsive UI**: in some case if the UI becomes unresponsive, press ``CMD+R`` to refresh.  If that fails to solve the problem, restart the CLI app.  You can stop the CLI app with ``CTRL+C``.
* **No navigation tree**: the navigation tree is rendered off the local bundles in ``$GMT_LOCAL\etc\bundles``.  The bundles described there need to have been built with webpack.
* **No data**: Ensure that the ports used by the controllers to publish data are accessible through the firewall. The following command should be used on the Device Control Computer to open the applicable range of ports (8122 - 8124):

  .. code-block:: bash

     $ sudo firewall-cmd --add-port=8122-8124/tcp
 

