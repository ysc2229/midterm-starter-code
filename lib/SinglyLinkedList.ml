open Util
open Allocator

(******************************************************)
(* A singly linked list parameterised by an allocator *)
(*           Only for teams of size 3                 *)
(******************************************************)

module SinglyLinkedList (A: Allocator) = struct
  open A

  type sll_node = unit (* TODO: Change me *)

  let mk_node heap i s : sll_node = error "TODO"

  (*  In SLL, prev does not exist *)
  (*  next : A.heap -> sll_node -> sll_node *)
  let next heap (n : sll_node) : sll_node = error "TODO"

  (*  int_value : A.heap -> sll_node -> int *)
  let int_value heap (n : sll_node) : int = error "TODO"

  (*  string_value : A.heap -> sll_node -> string *)
  let string_value heap (n : sll_node) : string = error "TODO"

  (*  insert_after : A.heap -> sll_node -> sll_node -> unit *)
  let insert_after heap (n1 : sll_node) (n2 : sll_node) : unit = error "TODO"

  (*  reverse : A.heap -> sll_node -> sll_node *)
  let reverse heap (hd_node: sll_node) : sll_node = error "TODO"

  (*  remove : A.heap -> sll_node -> sll_node -> unit *)
  let remove heap n hd_node : unit = error "TODO"

  (*  print_from_node : A.heap -> sll_node -> unit *)
  let print_from_node heap (n:sll_node) : unit = error "TODO"
end

(**********************************************)
(*              Testing SLL                   *)
(**********************************************)

open AllocatorImpl

(* Concrete allocator *)
module SLLImpl = SinglyLinkedList(AllocatorImpl)

open SLLImpl

(* let%test "basic node manipulation" =
 *   let heap = make_heap 10 in
 *   let n1 = mk_node heap 1 "a"
 *   and n2 = mk_node heap 2 "b" in
 *   insert_after heap n1 n2;
 *   let n = next heap n1 in
 *   let i = int_value heap n in
 *   let s = string_value heap n in
 *   i = 2 && s = "b" *)

(*************************)
(* TODO: Add more tests. *)
(*************************)
