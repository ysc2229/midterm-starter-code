open Allocator
open Util

(**********************************************)
(*   A concrete implementation of allocator   *)
(**********************************************)

module AllocatorImpl : Allocator = struct
  (* Feel free to change definitions of the types and functions
     below as you see necessary *)

  type ptr = int

  type elem =
    | Ptr of ptr
    | Int of int
    | Str of string
    | Allocated
    | Free

  type heap = elem array

  let make_heap sz = error "TODO"

  let null h = error "TODO"

  let is_null h p = error "TODO"

  let alloc h size = error "TODO"

  let free h p size = error "TODO"

  let deref_as_ptr h p o = error "TODO"

  let deref_as_int h p o = error "TODO"

  let deref_as_string h p o = error "TODO"

  let assign_ptr h p o v = error "TODO"

  let assign_int h p o v = error "TODO"

  let assign_string h p o v = error "TODO"
end

(**********************************************)
(*              Testing allocator             *)
(**********************************************)

(* Positive test *)

let%test "int ptr preservation" =
  let open AllocatorImpl in
  let hp = make_heap 1000 in
  let ptr = alloc hp 2 in
  assign_int hp ptr 0 42;
  assign_int hp ptr 1 12;
  let res1 = deref_as_int hp ptr 0 in
  let res2 = deref_as_int hp ptr 1 in
  res1 = 42 && res2 = 12

(* Negative test: notice that the error message is ignored *)

let%test "entire array occupied: full heap failure" =
  let open AllocatorImpl in
  let hp = make_heap 2 in
  let ptr = alloc hp 2 in
  assign_int hp ptr 0 42;
  assign_int hp ptr 1 12;
  try
    let _ = alloc hp 1 in
    false
  with _ -> true

(************************************************************************)
(* TODO: Add more tests for strings and pointers, and other operations. *)
(************************************************************************)
