
let rec rev l =
        match l with
        | [] -> []
        | a::q -> (rev q)@[a];;

let rec for_all p l =
        match l with
        | [] -> true
        | x::q -> p x && for_all p q;;

let rec exists p l =
        match l with
        | [] -> false
        | x::q -> p x || exists p q;;

let rec mem x l =
        match l with
        | [] -> false
        | y::q -> x=y || mem x q;;

let rec map f l =
        match l with
        | [] -> []
        | a::q -> (f a)::(map f q);;

let rec iter fu l =
        match l with
        | [] -> ()
        | a::q -> fu a ; iter fu q;;

let rec filter p (l : 'a list) = 
        match l with
        | [] -> []
        | a::q ->
                if (p a) then
                        a::(filter p q)
                else
                        filter p q;;

let rec fold_right f l ini =
        match l with
        | [] -> ini
        | a::q -> f a (fold_right f q ini);;

let rec fold_left f ini l = 
        match l with
        | [] -> ini
        | a::q -> fold_left f (f ini a) q;;

let print_int_list l =
        List.iter (fun i -> print_int i) l;;

(* Pareillement pour les autres types *)

let for_all_fl l f =
        List.fold_left (fun acc a -> acc && (f a)) true l;;

let rec ints (n : int) (l : int list) : int list = match n with
        | 0 -> []
        | a -> a::(ints (a-1) l);;
