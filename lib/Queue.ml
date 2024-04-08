open Util
open Allocator
open DoublyLinkedList

(* A queue interface *)
module type Queue = sig
  type t
  val mk_queue : int -> t
  val is_empty : t -> bool
  val is_full :  t -> bool
  val enqueue :  t -> (int * string) -> unit
  val dequeue :  t -> (int * string) option
  val queue_to_list : t -> (int * string) list
end


(******************************************************)
(*        A queue based on doubly linked lists        *)
(******************************************************)

module HeapDLLQueue (A: Allocator) : Queue = struct
  module DLL = DoublyLinkedList(A)
  open A
  open DLL

  (* Opaque queue type *)
  type t = unit (* Change me! *)

  let mk_queue sz = error "TODO"

  let is_empty q = error "TODO"

  let is_full q = error "TODO"

  let enqueue q (k, v) = error "TODO"

  let dequeue q = error "TODO"

  let queue_to_list q = error "TODO"
end

(******************************************************)
(*             Testing heap queue                     *)
(******************************************************)

open AllocatorImpl
module Q = HeapDLLQueue(AllocatorImpl)

open Q

let%test "basic queue operations" =
  let q = mk_queue 10 in
  enqueue q (42, "a");
  let e = dequeue q in
  e = Some (42, "a")

(* TODO: Add more tests *)

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

let%test "heap reclamation: enqueue N > 2 items on size 2 queue" =
  false (* TODO *)
