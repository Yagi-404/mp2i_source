(*
DM n°3

Léandro Laurent--Aquino

Le 22/11/2026
*)

(* Exo 30 *)

let rec pow (a : int) (b : int) : (int) =
	if b = 0 then 1
	else a * (pow a (b - 1));;

let rec bord (n : int) : (int ref) = 
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

let demipairs (l : int list) : int list = 
	let lst = pairs l in

	let rec alt (keeps : bool) (li_pairs : int list) : int list = match li_pairs with
	| [] -> []
	| a::q -> 
	if keeps then 
		a :: alt false q 
	else 
		alt true q

	in alt true lst;;

(* Exo 33 *)

let changements (l : int list) : int =
	match l with
		| [] | [_] -> 0
		| a::q ->
			let count = ref 0 in
			let maximum = ref a in
			let rec counts (c:int ref) (m:int ref) (li:int list) : unit =
				match li with
					| [] -> ()
					| b::r -> if b > !m then begin
						c := !c + 1;
						m := a
					end; counts c m r;
				in counts count maximum l;
			!count;;

(* Exo 34 *)

let bp (l: 'a list) : int =
	let sorted = List.sort compare l in
	
	let rec counter ((li : 'a list), (srt : 'a list)): int = match (li, srt) with
		| ([],[]) -> 0
		| (hns :: ns, hs :: s) -> let iseq = if hns = hs then 1 else 0 in
			iseq + counter (ns, s)
		| (_,_) -> failwith "Invalid arguments"
	in counter (l, sorted);;

(* Exo 35 *)

let duel ((l : 'a list), (m : 'a list)) : bool =
	let rec delta ((l : 'a list), (m : 'a list)) : int = match (l,m) with
		| ([],[]) -> 0
		| (a::q, b::r) -> let dt =
			if a > b then 1
			else if a < b then -1
			else 0 in dt + delta (q,r);
		| (_,_) -> failwith "Invalid args"
		in (delta (l,m)) > 0;;
	
(* Exo 36 *)

let nbchf (n : int) : int =
	let rec getchfs (k : int) (chfs : int list) : int list =
		if k = 0 then chfs
		else getchfs (k/10) ((k mod 10)::chfs)
	in List.length (getchfs n []);;

(* Exo 37 *)

let rec to_li (n : int) : int list = match n with
	| 0 -> []
	| a -> (a mod 10)::(to_li (n/10));;

let rec to_int (l : int list) : int = match l with
	| [] -> failwith "nil"
	| [d] -> d
	| a::q -> (a * (pow 10 (List.length q))) + to_int q;;

let rec reverse (l : int list) (a : int list) : int list =
	match l with
	| [] -> a
	| b::q -> reverse q (b::a);;

let entrezeros (n : int) : int =
	let listed = reverse (to_li n) [] in
	let rec parse (counter : int) (l : int list) (rep : int list) : int list =
		match counter with
		| 2 -> reverse rep []
		| count ->
			match l with
			| [] -> [0]
			| 0::q -> parse (count + 1) q rep
			| a::q ->
				if count = 0 then
					parse count q rep
				else 
					parse count q (a::rep)
	in to_int (parse 0 listed []);;

(* Exo 38 *)

let maxentrezeros (n : int) : int =
	let listed = reverse (to_li n) [] in
	let max x y = if x > y then x else y in
	let rec parse (l : int list) (cur : int) (maxl : int) : int =
		match l with
		| [] -> max cur maxl
		| 0::q -> parse q 0 maxl
		| a::q -> parse q (a + (cur*10)) (max (a + cur*10) maxl)
	in parse listed 0 0;;

(* Tests *)

bord 2;;
avantdernier [1;2;3];; (* 2 *)
demipairs [1;2;3;4;5;6;7;8;9];; (* [2;6] *)
changements [1;2;3];; (* 2 *)
changements [];;
changements [1];;
bp [1;2;3];; (* 3 *)
bp [3;2;1];; (* 1 *)
duel ([5;6],[2;3]);; (* true *)
nbchf 123;; (* 3 *)
entrezeros 3024501;; (* 245 *)
entrezeros 42;; (* 0 *)
maxentrezeros 10321032201;; (* 322 *)
maxentrezeros 0;; (* 0 *)