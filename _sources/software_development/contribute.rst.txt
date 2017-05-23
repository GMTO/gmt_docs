.. _Contribute:

Contribute
==========

Code
----

1. Create a user account on github
2. Contact GMTO staff to be be granted access to our private repositories
3. Fork on github
4. Clone a local copy for development

.. code-block:: bash

   $ man git 


Documentation
-------------

The documentation is built using `Sphinx <http://www.sphinx-doc.org/en/stable/#>`_ and
`reStructuredText <http://www.sphinx-doc.org/en/stable/rest.html>`_ files.
Github uses the branch `gh-pages` to serve the documentation.
Install the dependencies needed to build the documentation and checkout the branch:

.. code-block:: bash

   $ sudo dnf install -y python3-sphinx python3-sphinx_rtd_theme
   $ git checkout -b gh-pages origin/gh-pages

You can review your changes after running `make` on your local copy and iterate:

.. code-block:: bash

   $ vi src/*.rst
   $ make
   $ xdg-open html/index.html

.. note::
   **To submit changes, proceed in two steps:**

   * First, commit your changes to `src`
   * Then, commit the generated files in `html`


.. code-block:: bash
   
   $ git commit src
   $ git commit html -m 'Generated content'

   $ git push origin gh-pages



:ref:`[back to top] <contribute>`
 

