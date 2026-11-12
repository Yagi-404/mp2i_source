(* Exo 2 *)

let rec maximum l = match l with
| [] -> 0
| [a] -> a
| a::q -> max a (maximum q);;

let max_of_list = maximum [0;2;5;1;9;3];;

(* Exo 3 *)

let rec prodl l = match l with
| [] -> 0.0
| [a] -> a
| a::q -> a *. prodl q;;

let prod_list = prodl [3.;5.];;

(* Exo 4 *)

let rec est_croissant l = match l with
| [] -> failwith "Empty list"
| [a] -> true
| a::b::q -> if a <= b then est_croissant (b::q)
				 else false;;

let c = est_croissant [1;2;3;4;5;6;7;8;9];;