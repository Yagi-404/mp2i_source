(* Exercice 1 *)

let n_prod x y = x * y;;
let n_pow  a n = a**n;;

let rec produit x y = match y with
| 0 -> 0
| 1 -> x
| a -> x + produit x (a-1);;

produit 2 30;;

let rec power a n = match n with
| 0 -> 1
| x -> a * power a (x-1);;

power 10 8;;

(* Exercice 2 *)

(* Exercice 4 *)

let rec ligne k =
	 if k>0 then begin
	 	print_string "*";
	 	ligne(k-1)
	 end;;

let rec esc n =
	if n>0 then begin
		esc(n-1);
		ligne n;
		print_string "\n"
	end;;

esc 5;;

(* Exercice 6 *)

let rec dessin i n =
	if i < n then begin
		for j = 1 to n-1 do
			print_char ' '
		done;
		for j = 1 to 2*(i-1) do
			print_char '*'
		done;
		print_char '\n';
		dessin i+1
	end
	in dessin 1;;