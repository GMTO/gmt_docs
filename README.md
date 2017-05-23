This repository contains the Software and Controls documentation as source files and generated content.

The .rst files used to generate documentation are stored on the `master` branch. The generated HTML and PDF files are stored on the `gh-pages` branch and hosted at https://gmto.github.io/gmt_docs/html/.

Software & Controls Documentation
=================================
Over the lifetime of the GMT Project, the SWC team will generate various forms of documentation for various different audiences. We follow [Agile principles](https://www.agilealliance.org/agile101/12-principles-behind-the-agile-manifesto/) and therefore value working code over comprehensive documentation, but we also recognize the power of efficient collaboration, knowledge sharing and transparency. 

## Locations

1. **[DocuShare](https://docushare.gmto.org/docushare/dsweb/View/Collection-7787)**

    This is the primary location for project documentation and archiving.

2. **[GMT Software and Controls Home](https://gmto.github.io/gmt_docs/html/)**

    Online documentation for Software Development teams and other users interacting with the software. The html files are generated from [reStructuredText](http://docutils.sourceforge.net/rst.html) files using [Sphinx](http://www.sphinx-doc.org/en/stable/) and hosted on GitHub. Source files as well as generated HTML files can be found in this repository.
    
    While the website served on GitHub will contain the latest documentation changes, stable documentation related to the current software release can be found on the [AWS Mirror](http://52.52.46.32/).

3. **[Wiki](https://github.com/GMTO/gmt_docs/wiki)**

    The Wiki contains quick links to important locations, meeting notes and other useful tips and tricks. Information that is central to the design, development or maintenance of GMT software or project management should NOT be documented in the wiki, but rather in [DocuShare](https://docushare.gmto.org/docushare/dsweb/View/Collection-7787).


## Contributing to Online Documentation - Simple
In order to contribute to online documentation, follow these instructions:

1. Fork the `GMTO/gmt_docs` repository to create a personal copy: `<username>/gmt_docs`.

2. Clone the `<username>/gmt_docs` repository to your development machine.

3. Edit .rst files or add new ones.

4. Build HTML files locally (see list of dependencies below)
    ```
    cd gmt_docs
    make clean
    make html
    ```
    This will generate an `html` folder containing the .html files and related resources. To view the pages, open a web browser and go to `file:///<path>/<to>/<repositories>/gmt_docs/html/index.html`.

5. Commit changes to the local repository and push to the remote fork
    ```
    git add .
    git commit -m "commit message"
    git push origin
    ```
    Only source files will be comitted. Jenkins will create the official HTML pages once the changes have been merged into `GMTO/gmt_docs`.  

6. Create a Pull Request on GitHub to incorporate the changes into `GMTO/gmt_docs:master`.

## Contributing to Online Documentation - Advanced
If you are planning on making extensive changes to documentation and would like to build and host the documentation on your personal fork before incorporating the changes back into `GMTO/gmt_docs:master`, follow these instructions:

1. Fork the `GMTO/gmt_docs` repository to create a personal copy: `<username>/gmt_docs`.

2. Clone the `<username>/gmt_docs` repository to your development machine. For simplicity, I'll assume it was cloned directly into the home directory.
    ```
    cd ~/
    git clone https://github.com/<username>/gmt_docs
    ```
3. Create a new directory called `gmt_docs_build` in the same directory as the gmt_docs repository. Then create a second clone of gmt_docs within this new directory and call it `html`.
    ```
    cd ~/
    mkdir gmt_docs_build
    cd gmt_docs_build
    git clone https://github.com/<username>/gmt_docs html
    ```
4. Checkout and switch to the `gh-pages` branch on the html repository
    ```
    cd html
    git checkout -b gh-pages remotes/origin/gh-pages
    ```
    The repositories are now set up to that `gmt_docs` contain the source files and `gmt_docs_build` contain the generated content.

5. Edit .rst files or add new ones within the `gmt_docs` repo.
    ```
    cd ../../gmt_docs/
    ```

6. Build HTML files locally with the `jenkins` target (see list of dependencies below).
    ```
    make jenkins
    ```
    The files are built *from* the `gmt_docs` directory, but generated content will be stored *in* the `gmt_docs_build/html` directory. To view the pages on your development machine, open a web browser and go to `file:///<path>/<to>/<repositories>/gmt_docs_build/html/index.html`. This target will also build PDF files, but more on that later.

7. Commit changes on `master` branch to the local repository and push to the remote fork
    ```
    git add .
    git commit -m "commit message"
    git push origin master
    ```
    Only source files should be comitted on the `master` branch. Jenkins will create the official HTML pages once the changes have been merged into `GMTO/gmt_docs`. 
    
8. Commit changes to generated content on the `gh-pages` branch from within the `gmt_docs_build/html` folder. These commits are good for checking generated content online, but should not be merged into the `GMTO/gmt_docs` repository as Jenkins will overwrite the changes on the next build.
    ```
    cd ../gmt_docs_build/html/
    git add .
    git commit -m "generated content"
    git push origin gh-pages
    ```

9. Set up the remote fork `<username>/gmt_docs` to host GitHub Pages. On Github.com, go to `Settings` -> `GitHub Pages` and set `Source` to "gh-pages branch". Wait a few minutes for the website to be hosted and go to the link shown, typically `https://<username>.github.io/gmt_docs/`

10. When you're satisfied with the changes, create a pull request from the fork's `master` branch to the upstream `master` branch.

## Contributing to PDF Documentation
PDF documentation can be generated from the SWC model files. Jenkins will be responsible for creating and storing PDF files whenever the model files change, but in order to build the PDF files locally, follow these instructions:

1. Fork the `GMTO/gmt_model` repository to create a personal copy: `<username>/gmt_model`.

2. Clone the `<username>/gmt_model` repository to your development machine. For simplicity, I'll assume it was cloned directly into the home directory.
    ```
    cd ~/
    git clone https://github.com/<username>/gmt_model
    ```
3. Follow steps 1 - 4 in the section above on "Contributing to Online Documentation - Advanced". This will clone the `gmt_docs` repo and a parallel one for generated PDF files called `gmt_docs_build`. These folders need to be in the same directory as the `gmt_model` repository. For example:
```
    ~/
     |-- gmt_model/
     |     |-- docs/
     |     |__ ... 
     |
     |-- gmt_docs/
     |     |-- src/
     |     |-- docs/
     |     |__ ...  
     |
     |__ gmt_docs_build/
           |__ html/
                 |-- latex/
                 |-- pdf/
                 |__ ...
```
4. Build the latest coffee files in the `gmt_model` directory (see list of dependencies below)
    ```
    cd ~/gmt_model/
    make build
    ```
    
5. Build the PDF files from within the `gmt_docs` directory using the `jenkins` target.
    ```
    cd ~/gmt_docs/
    make jenkins
    ```
    The files are built *from* the `gmt_docs` directory, but generated content will be stored *in* the `gmt_docs_build/html/pdf` directory. The Jenkins target will copy all necessary resources from the gmt_model directory, generate the .rst files using the `gds` commandline tool and lastly generate the latex and PDF files from the .rst files. (Note: It may be necessary to edit the `gmt_docs/Makefile` to use `gdsd` instead of `gds` to make it work locally.)
    
6. Optional: The PDF files can be generated directly in the `gmt_docs` repository by using `make latexpdf` instead of `make jenkins`. This circumvents the need for the gmt_docs_build directory, but still requires the `gmt_model` repository to be in the same folder as the `gmt_docs` repository. Please ensure that the generated files do not get added to the master branch.

6. If any changes were made to .rst files in the `gmt_docs` repository, commit these changes and push to the remote fork
    ```
    git add .
    git commit -m "commit message"
    git push origin master
    ```
    Only source files should be comitted on the `master` branch. Jenkins will create the official HTML and PDF files once the changes have been merged into `GMTO/gmt_docs`.
    
## Dependencies
The following packages and libraries are required to generate HTML and/or PDF files on your local development machine:

### Mac OSX
* Download and install [Node.js](https://nodejs.org/en/download/) if not already installed
* Download and install [MacTex](https://tug.org/mactex/mactex-download.html)
* Run 
    ```
    npm install
    sudo -H python -m pip install sphinx
    sudo -H python -m pip install sphinx-autobuild
    sudo -H python -m pip install sphinx_rtd_theme
    sudo -H python -m pip install sphinxcontrib-blockdiag
    sudo -H python -m pip install sphinxcontrib-websupport
    sudo -H python -m pip install vulcanize
    ```
    
### Linux
* Run 
    ```
    sudo dnf install nodejs texlive latexmk
    sudo -H npm install
    sudo -H pip install --upgrade pip 
    sudo -H python -m pip install sphinx
    sudo -H python -m pip install sphinx-autobuild
    sudo -H python -m pip install sphinx_rtd_theme
    sudo -H python -m pip install sphinxcontrib-blockdiag
    sudo -H python -m pip install sphinxcontrib-websupport
    sudo -H python -m pip install vulcanize
    ```
