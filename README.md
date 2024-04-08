# Midterm Project

The midterm project is dedicated to implementing and using data structures
for dynamic memory allocation and reclamation.

As before, submit your solution to this assignment by creating a
[tagged release on GitHub](https://help.github.com/en/github/administering-a-repository/creating-releases)
and providing a link to it on Canvas.

## Building this Project

To build the project and run all the tests, simply execute `make
clean; make` from the command line, and you should be good to go. A
number of failing test reports will indicate missing implementation
parts that you will have to provide.

## Your Tasks

The detailed description of the task setup for the project is given at
the following web page:

https://ysc2229.github.io/midterm.html

The described tasks should be implemented in the corresponding templates
files provided in the folder `lib` of the project. Make sure to check
the `*Util.ml` files for helper functions that are already
implemented and feel free to implement more machinery if necessary.

As before portion of this assignment's total score is reserved for
better testing. Passing basic functionality tests will reward you with
some points; however you are also expected to write any additional
tests you deem necessary. In the case of this project, make sure that
you cover your functionality extensively with tests, paying attention
to the suggestions in the comments given in the files.

1. [Teams of 2 and 3] Implement the heap allocator module in the file
   `AllocatorImpl.ml`. Consult the module type signature in the file
   `Allocator.ml`, paying attention to the comments. You implementation _must_
   adhere to this signature. Add implementation-agnostic tests for your
   allocator. Here are some hints on how to organise your implementation:

   * It is up to you how to implement the "heap" structure, but you
     absolutely *may not* use OCaml's `ref` type in any capacity. The
     heap structure should internally keep track of "free" memory
     segments; you can use an OCaml list (or lists) of for tracking
     free slots in "memory" arrays.

   * All interaction with the heap by the client applications (e.g.,
     Doubly-Linked Lists) should be done by means of using functions
     from the signature of Allocator module, i.e., without referring
     to the concrete contents of its implementation.

   * Ordinary pointers can be implemented as integers (although the
     clients of the module may not know it).

   * You will have to figure out how to "dispatch" pointers when they
     are dereferenced (via `deref_as_*` functions). That is, you will
     have to determine whether a given pointer p points to another
     pointer, integer, or a string in order to chose the correct
     array. Devise a discipline to discriminate the pointers into
     those three categories based on their value.

   * It is worth investing time into coming up with good memory
     reclamation algorithms, which will determine, where the "next"
     pointer is going to be allocated in the heap, therefore,
     maximising its usage.

   * Check the negative test `"entire array occupied"` in `AllocatorImpl.ml` to
     understand the interaction between allocation and the size of the heap.

2. [Teams of 2 and 3] In the file `DoublyLinkedList.ml` implement a DLL
   structure to store pairs of values of type `int` and `string`,
   correspondingly, so it would rely on the allocator-provided heap. Make sure
   to use memory reclamation for freeing the heap, when removing list nodes.
   Check the available tests for the intended use and don't forget to add your
   own.

3. [Teams of 2 and 3] In the file `Queue.ml` implement the specialised queue
   structure based on doubly-linked lists, implemented via allocators. Check the
   tests for how it can be used, and add your own. Specifically, add a tests
   that constructs a queue and populates/depopulates it in a way that the number
   of element the queue sees during its lifetime is larger than the allotted
   heap's capacity, thereby testing the memory reclamation logic.

4. [Teams of 3 only] Implement a singly-linked list structure following the
   signature in the file `SinglyLinkedList.ml`, structure to store pairs of
   values of type `int` and `string`, correspondingly, so it would rely on the
   allocator-provided heap. Make sure that the commented tests pass and add your
   own.

5. [Teams of 3 only] Implement a "functional" queue in the file `SLLQueue.ml`,
   which uses _two singly-linked lists_ (implemented previously) to manage its
   head and tail. Make sure that the commented tests pass and add your own.

## Remarks

* All implementations of the allocator will be cross-tested against each other
  tests, as well as on our own hidden test suite. You can get an idea of what
  kind of tests are expected to pass by looking at the template files.

* Make sure you don't over-specialise tests for your implementation of the
  allocator (i.e., don't make assumptions about specific layout of the memory or
  "reserved" addresses or mention specific error messages). Over-specialisation
  for your implementation makes tests suitable only for your case. See examples
  of good test cases in `AllocatorImpl.ml`.

* To work on the project in parallel in a team of two or three, think how to
  divide the tasks. Since the allocator is an obvious bottleneck, I suggest you
  start by first using the "mock" version of the allocator that uses OCaml's
  `ref` instead of an array-based heap. (See `MockAllocator.ml` for what that
  looks like.) This way, the team members who work on the data
  structures can start building on this allocator, and eventually "switch" to
  the proper version, which uses arrays.

* Even though this is a team project, I will be also checking the amount of
  individual contributions to the implementation on GitHub. Students who have
  not contributed to the implementation in a meaningful way will be penalised.

**Good luck!**
