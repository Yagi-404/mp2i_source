(* Exo 1 *)

let arr_of_ints n =
	let t = Array.make (n + 1) 0 in
	for i = 0 to n do
		t.(i) <- i
	done; t;;

arr_of_ints 42;;

(* Exo 2 *)

let str_to_arr s =
	let arr = Array.make (String.length s) 'a' in
	for i = 0 to (String.length s) - 1 do
		arr.(i) <- s.[i]
	done; arr;;

let arr_to_str a =
	let s = String.make (Array.length a) 'a' in
	for i = 0 to (Array.length a) - 1 do
		s.[i] <- a.(i)
	done; s;;

let pairindex_to_space str =
	let a = (str_to_arr str) in
	for i = 0 to (String.length str) - 1 do
		if (i mod 2) = 0 then a.(i) <- ' '
	done; arr_to_str a;;

pairindex_to_space "Bonjour !!!";;

(* Exo 3 *)

let tab = [|1;2;3|];;
let f = tab.(0);;
let s = tab.(1);;

tab.(0) <- s;;
tab.(1) <- f;;
tab;;

(* Exo 5 not working *)

let rec sum_tab t = let s = 0 in match t with
	| [] -> failwith "Empty"
	| [a] -> s + a
	| a::q -> do s + a; sum_tab q done;;