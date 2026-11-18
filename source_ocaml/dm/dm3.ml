(* Exo 30 *)

let rec pow (a : int) (b : int) : (int) =
	if b = 0 then 1
	else a * (pow a (b - 1));;

let rec bord (n : int) : (int ref) = 
	assert(n > 0);
	let temp = ref 0 in
	let rep = ref n in
	while !rep > 0 do
		temp := !rep;
		rep := !temp * 2;
	done; temp;;

(* Exo 31 *)

let rec avantdernier (l : 'a list) : ('a) = match l with
	| [] | [_] -> failwith "List too short"
	| [a;_]    -> a
	| a::q     -> avantdernier q;;

(* Exo 32 *)

let rec pairs (l : int list) : int list = match l with
	| [] -> []
	| a::q -> if (a mod 2) = 0 then a::(pairs q) else pairs q;;

let rec demipairs (l : list) : list = match l with
	| [] | [a] -> failwith "List too short"
	| 