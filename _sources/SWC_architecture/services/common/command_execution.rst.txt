
.. _services-command_execution:

*Command Execution Service*
...........................

The Command Line Interface (CLI) complements the graphic user interfaces used
for both engineering and operations. It provides low-level access to all the
system functionality, and the flexibility often required during testing and
commissioning phases. CLI also provides a way to operate subsystems in early
stages of development, when the UI is still being developed and does not provide
all the functionality. 

The figure below shows a screenshot of the CLI interface used to navigate the
GMT semantic model. More specifically, it shows command-line completion (first
line) and component introspection (fourth line).  The CLI allows scoped name
completion and component introspection. Alias and shortcuts can be defined to
facilitate user interaction.


.. figure:: _static/command-line-service.png

  Command-line Service.  Example of command line completion (first line) and
  component introspection (fourth line)

**Service Capabilities**

  The Command Line Interface components provide the following capabilities:

    * Access to the public interface of any distributed component

    * Advanced debugging and troubleshooting

    * Command completion and introspection enables interactive discovery of
      the system functionality at runtime

    * Support for development and test automation

    * Interactive shell command (gmt command)

    * Access to on-line documentation, introspection and model and metamodel
      semantics.

    * Scripting

    * Batch processing (gds “gmt development system” command)

    * Alias definition to minimize typing long command names and reducing
      typing errors.

**Service Deployment**

  The Command Line Interface can be executed in any of the operation consoles
  on the observatory control network. Given the distributed nature of the
  project it may often be useful to grant access to the CLI tool from the
  operation network so subsystems experts can diagnose a fault condition. For
  safety reasons, CLI sessions in the operation network should only be granted
  specific authorization levels.


