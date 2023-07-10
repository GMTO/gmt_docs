.. _mapping_model_to_python:

Mapping between the Model Definition Files and Python source code
-----------------------------------------------------------------

.. _map-python-file-tree:

Python source code file tree structure
......................................

Python generated source files are located under the ``<MODULE_DIR>/src/py``
directory, which has the following structure::

   <MODULE_DIR>/
      |-- ...
      |-- src/
            |-- ...
            |-- bin/
            |    |-- <app_1>
            |    |-- ...
            |    |-- <app_n>
            |-- py/
                  |-- <pk_1_pkg>/
                  |-- ...
                  |-- <pk_n_pkg>/
                  |-- <app_1>.py
                  |-- ...
                  |-- <app_n>.py

<pk_i_pkg>/
    One directory is created for each package defined in the DCS definition
    file of the model. The name of the directory is exactly the same name
    that was given to the package *(note: the suffix of the name should be
    `_pkg`; see the Model Specification Guide document for more details)*.

The structure inside the package directories is as follows::

    <pk_i_pkg>/
        |
        |-- <comp_1>/
        |-- ...
        |-- <comp_n>/

<comp_i>/
    For each component there is a directory where all its source files are
    placed. The name of the directory is the same as the component. See :numref:`map-python-map-component` for more details.

.. note::

    All Python subdirectories must have a `__init__.py` file to be treated as Python packages.
    See https://docs.python.org/3/tutorial/modules.html#packages for more details.


.. _map-python-map-component:

Component mapping
.................

Each Component has its own directory in the file tree of the package it
belongs to, as shown in :numref:`map-python-file-tree`. The Component
directory will have the following contents::

    <pk_i_pkg>/
       |-- ...
       |-- <component_name>
             |-- <component_name>.py
             |-- <component_name>_app.py

The name of the Component directory and the prefix of all the generated
source files inside it is equal to the Component name.

.. _map-python-code-style:

Code style guidelines
.....................

The generated Python code follows the `PEP8`_ style guidelines. Users are advised to follow the same guidelines when
writing their own code. The `black`_ code formatter can be used to automatically format the code to follow the PEP8
and black style guidelines are followed. The `black`_ code formatter can be installed using pip::

    pip install black
