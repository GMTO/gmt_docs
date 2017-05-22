
.. _distributed_communications:

Distributed Communications - Middleware
---------------------------------------

In a distributed control system the use of middleware enables communication
between different components deployed in different processes or computers. This
makes middleware software pervasive. A middleware agnostic architecture allows
the decoupling of applications from the specific implementation. The SWCS
communication requirement is given by SWC-6879, Communication Protocols: SWCS
shall define a set of software protocols and APIs that allow the communication
with the required performance between different components.

ZeroMQ is used for communications between distributed components, chosen for its
desirable features. Given that the project is in early stages and that the
infrastructure software is likely to continue evolving, this selection can be
revised in the future as fitting. Front–end software deployed in a browser uses
WebSockets to communicate with the rest of the distributed components. The
serialization/deserialization of transmitted data packages is accomplished using
`MessagePack <http://msgpack.org/>`_.

GMT is developing several prototypes to validate the use of these technologies.
These prototypes include the use of `NoSQL
<http://en.wikipedia.org/wiki/NoSQL>`_ databases like Mongodb, scripting
languages like `Coffeescript <http://en.wikipedia.org/wiki/CoffeeScript>`_, user
interface libraries based on HTML5 and SVG like `d3.js <http://d3js.org>`_,
event-driven environments like node.js or high performance middleware libraries
like zeromq, MessagePack or ProtocolBuffers.
