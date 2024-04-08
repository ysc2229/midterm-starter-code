open Util
open Allocator
open SinglyLinkedList
open Queue

(******************************************************)
(*        A queue based on doubly linked lists        *)
(******************************************************)

module HeapSLLQueue (A: Allocator) : Queue = struct
  module SLL = SinglyLinkedList(A)
  open A
  open SLL

  (* Opaque queue type *)
  type t = unit (* TODO: Change it *)

  (*  mk_queue : int -> t *)
  let mk_queue sz = error "TODO"

  (*  is_empty : t -> bool *)
  let is_empty (q:t) : bool = error "TODO"

  (*  is_full : t -> bool *)
  let is_full (q:t) : bool = error "TODO"

  (*  enqueue -> t -> (int * string) -> unit *)
  let enqueue q (k,v) = error "TODO"

  (*  dequeue : t -> (int * string) option *)
  let dequeue (q:t) : (int * string) option = error "TODO"

  (*  queue_to_list : t -> (int * string) list *)
  let queue_to_list (q:t) : (int * string) list = error "TODO"
end

(******************************************************)
(*             Testing heap queue                     *)
(******************************************************)

open AllocatorImpl
module Q = HeapSLLQueue(AllocatorImpl)

open Q

(* let%test "basic queue operations" =
 *   let q = mk_queue 10 in
 *   enqueue q (42, "a");
 *   let e = dequeue q in
 *   e = Some (42, "a") *)

(********************************************)
(* TODO: Add more tests on queue operations *)
(********************************************)

(******************************************************)
(*         Testing heap reclamation                   *)
(******************************************************)

(*

Implement a test that creates a small heap, and then uses it to
allocate and use a queue (by enqueueing and dequeueing), in a way
that the number of nodes the queue has over its lifetime is *larger*
than the capacity of the heap. That is, make sure to use memory
reclamation implemented for doubly-linked lists.

*)

(* let%test "heap reclamation" =
 *   let q = mk_queue 5 in
 *   enqueue q (42, "a");
 *   enqueue q (15, "b");
 *   enqueue q (33, "c");
 *   enqueue q (52, "d");
 *   enqueue q (31, "e");
 *   let e1 = dequeue q in
 *   let e2 = dequeue q in
 *   let e3 = dequeue q in
 *   enqueue q (300, "new");
 *   enqueue q (235, "alloced");
 *   e1 = Some (42, "a") &&
 *   e2 = Some (15, "b") &&
 *   e3 = Some (33, "c") *)
