.. _sequencer:

Sequencer
---------

Activities scheduled for execution involve Sequences. Sequencing can greatly
facilitate operational efficiency of highly complex systems whose subsystems
must be orchestrated to operate in parallel or in series. The derived
requirements for the Sequencing system are shown in Table 10-39. A sequence
contains events that must be triggered in order to accomplish an activity (e.g.,
observation execution, instrument switch).

.. table:: SWCS Sequencing Requirements (Level 3)

  +----------------------------+------------------------------------------------------------------+
  |   Title                    |   Statement                                                      |
  +============================+==================================================================+
  |   Sequence Automation      |   Provide the capability to arrange commands in a way that       |
  |                            |   allows users to automate the execution of complex operations.  |
  +----------------------------+------------------------------------------------------------------+
  |   Synchronous Instrument   |   Provide the capability to automate the observing               |
  |   Operation                |   activities that require multiple instruments operating         |
  |                            |   synchronously or simultaneously.                               |
  +----------------------------+------------------------------------------------------------------+
  |   Automated Start-up/      |   Provide the capability to execute start-up and shutdown        |
  |   Shut-down Procedures     |   processes that are initiated and monitored under               |
  |                            |   operator control.                                              |
  +----------------------------+------------------------------------------------------------------+
  |   Observing Mode           |   Provide the capability to switch from one observing            |
  |   Switching                |   mode to another.                                               |
  +----------------------------+------------------------------------------------------------------+
  |   Acquisition Efficiencies |   Provide the capability to complete target acquisition          |
  |   for Observing Modes      |   in Natural Seeing, LTAO, NGSAO, LGSAO, NGLAO, and              |
  |                            |   reacquisition in all modes, within the time budgets            |
  |                            |   specified in the GMT Efficiency Budget                         |
  |                            |   (GMT-SE-REF-00593).                                            |
  +----------------------------+------------------------------------------------------------------+
  |   Telescope Optical        |   Provide the capability to switch from one telescope            |
  |   Configuration Switching  |   optical configuration to another in an automated way           |
  |                            |   for any active instruments.                                    |
  +----------------------------+------------------------------------------------------------------+
  |   Automated Instrument     |   Provide the capability to automate the switching of            |
  |   Switching                |   the active instrument set during the night initiated           |
  |                            |   and monitored by the operator.                                 |
  +----------------------------+------------------------------------------------------------------+

Sequencers are often implemented via a hierarchical pattern: high-level
sequencers control subordinated sequencers and so on. This makes complexity
manageable, because there is only loose coupling between different
subsystems/sequences. However, this approach makes it difficult to ensure that
different threads, which might allow for parallel execution, can synchronize at
different levels of the hierarchy. It also makes it difficult to visualize the
execution status of every subsystem at any given moment in time.

For example, in a science observing sequence, a workflow is stored as a sequence
template in the Observing Sequence Template Database. The workflow stages –
target acquisition, target exposure, image calibration, etc. – are each refined
into sequences of steps. During observing preparation or runtime, a user (an
astronomer or an operator) defines parameters needed to execute the appropriate
commands.

A Sequence template has Rules and Validations. Rules are conditions that have to
be met during the execution of the sequence. They are different from observatory
rules as they are only in place during the execution of the sequence.
Validations ensure conformance between the parameters of the sequence and the
sequence template.

During operations, it is often useful to monitor the status of certain
operations. To aid in the comprehension of the system, a graphical tool allows
editing, visualizing and executing a sequence in a two-dimensional arrangement.
The graphical tool allows direct access to any parameter or command of the
sequence. Any modification can be stored as a snapshot and recalled later. This
feature is especially useful during commissioning. The tool also allows an
operator to retrigger any command directly without the need to re-run or restart
the sequence.

In this approach the sequence is not generated automatically from the Sequence
Definition parameters, as this would require the generator to know about any
arbitrary combination of instrument, AO mode, and telescope observing modes.
Instead, a browser-based observation definition tool is generated specific to
each sequence template, showing what is appropriate for that sequence. The tool
allows the observatory staff to create and commission new sequence templates
that address new or refined observing modes. Doing so does not involve overhead
costs to rewrite a sequence generator or to edit a sequence, which is normally
not operator friendly or human readable, or is error prone. The SWCS runtime
allows access to the software component’s metadata; this enables one to obtain
information about the definition of any command, property or parameter of the
system when creating new sequences.

In order to facilitate the commissioning of observing sequences and to provide
the operators with the flexibility to react to unexpected scenarios during the
execution of an observation, the Sequencer provides the following capabilities:

  * Several sequences can be in execution simultaneously

  * Sequence parameters can be modified in the middle of sequence execution

  * Steps of the sequence can be re executed in an arbitrary order

  * Sequence snapshots allow a modified sequence to be stored as a new sequence
    template

  * The master sequence panel enables visualization of all the sequences being
    executed at the observatory in a given moment. Each sequence has a set of
    resources that are required. Concurrent sequences cannot share resources
    that are exclusive

  * Step by step execution mode

  * Command by command execution mode

  * Support for parallel execution of commands

  * Ability to pause a sequence and re-execute a previous command with a new
    input value

  * Partial re-execution

  * Rules that monitor the state of the system and trigger actions can be
    defined per sequence

  * Default parameters per sequence

:numref:`Figure %s <observatory_operations_entities>` provides a class diagram
of the main components of the observatory operations architecture. The behavior
of predefined operation sequences is captured using Sequence Templates. Examples
of sequences include engineering, diagnostic, calibration or observation tasks,
among others. Sequence templates are stored in a database and are organized
according several categories like “target instrument” or “observing mode.”

.. _observatory_operations_entities:

.. figure:: _static/observatory_operations_entities.png

    Observatory Operation Main Modeling Entities

While sequence templates capture the behavior of the observation, observation
instance parameters of the sequence are captured as *Sequence Definitions*
composed of *Sequence Parameters*. Sequence parameters are created with the
assistance of Observing Tools during Phase I and Phase II. Sequence definitions
are paired with sequence templates and are stored in the Operations Database,
which constitutes the observatory backlog.
