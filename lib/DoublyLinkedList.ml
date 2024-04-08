open Util
open Allocator

(******************************************************)
(* A doubly linked list parameterised by an allocator *)
(******************************************************)

module DoublyLinkedList (A: Allocator) = struct
  open A

  type dll_node = unit (* TODO: Change me! *)

  let mk_node heap i s = error "TODO"

  let prev heap (n : dll_node) = error "TODO"

  let next heap (n : dll_node) = error "TODO"

  let int_value heap (n : dll_node) = error "TODO"

  let string_value heap (n : dll_node) = error "TODO"

  let insert_after heap (n1 : dll_node) (n2 : dll_node) = error "TODO"

  (* Should free the corresponding memory *)
  let remove heap n = error "TODO"

  let print_from_node heap n = error "TODO"
end

(**********************************************)
(*              Testing DLL                   *)
(**********************************************)

open AllocatorImpl

(* Concrete allocator *)
module DLLImpl = DoublyLinkedList(AllocatorImpl)

open DLLImpl

let%test "basic node manipulation" =
  let heap = AllocatorImpl.make_heap 10 in
  let n1 = mk_node heap 1 "a"
  and n2 = mk_node heap 2 "b" in
  insert_after heap n1 n2;
  let n = next heap n1 in
  let i = int_value heap n in
  let s = string_value heap n in
  i = 2 && s = "b"

let%test "basic node manipulation: check other node" =
  let heap = AllocatorImpl.make_heap 10 in
  let n1 = mk_node heap 1 "a"
  and n2 = mk_node heap 2 "b" in
  insert_after heap n1 n2;
  let n = prev heap n2 in
  let i = int_value heap n in
  let s = string_value heap n in
  i = 1 && s = "a"

(************************************************************************)
(*        TODO: Add more tests for different DLL operations             *)
(************************************************************************)
