(*********************************************)
(*     Useful functions and data types       *)
(*********************************************)

(* ----------  Week 01 functions  ---------- *)

(* Raise an error with a message m *)

let error m = Failure m |> raise

(* Extract a value from an option *)

let get_exn o = match o with
  | Some e -> e
  | _ -> error "Empty option!"

(*  Auxiliary functions on lists *)

let rec remove_first ls n =
  if n <= 0 then ls
  else match ls with
    | [] -> []
    | h :: t -> remove_first t (n-1)

let is_suffix xs ls =
  let n1 = List.length xs in
  let n2 = List.length ls in
  let diff = n2 - n1 in
  if diff < 0 then false
  else
    let ls_tail = remove_first ls diff in
    ls_tail = xs

(* ----------  Week 02 functions  ---------- *)

let is_min ls min =
  List.for_all (fun e -> min <= e) ls

let print_offset _ =
  Printf.printf "  "

(* ----------  Week 03 functions  ---------- *)

(* Measuring execution time *)

let time f x =
  let t = Sys.time () in
  let fx = f x in
  Printf.printf "Execution elapsed time: %f sec\n" (Sys.time () -. t);
  fx
