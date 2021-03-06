open GT

@type ('a, 'b) t = {x: int; y: string; a: 'a; b: 'b} with show, map, eq, compare, foldl, foldr

class ['a, 'b] print =
  object 
    inherit ['a, unit, unit, 'b, unit, unit, unit, unit] @t
    method value _ _ x y a b = 
      Printf.printf "%d\n" x;
      Printf.printf "%s\n" y; 
      a.fx (); 
      b.fx ()
  end

let _ =
  let cs    = function EQ -> "EQ" | GT -> "GT" | LT -> "LT" in  
  let c x y = if x = y then EQ else if x < y then LT else GT in
  let x = {x=1; y="2"; a="a"; b=`B} in
  let y = {x=1; y="2"; a="3"; b=`B} in
  Printf.printf "x == x: %b\n" (transform(t) (=) (=) (new @t[eq]) x x);
  Printf.printf "x == y: %b\n" (transform(t) (=) (=) (new @t[eq]) x y);
  Printf.printf "compare (x, x) = %s\n" (cs (transform(t) c c (new @t[compare]) x x));
  Printf.printf "compare (x, y) = %s\n" (cs (transform(t) c c (new @t[compare]) x y));
  Printf.printf "compare (y, x) = %s\n" (cs (transform(t) c c (new @t[compare]) y x));
  Printf.printf "%s\n" 
    (transform(t) 
       (fun _ a -> string_of_int a) 
       (fun _ -> function `B -> "`B") 
       (new @t[show])
       ()
       (transform(t) (fun _ x -> int_of_string x) (fun _ x -> x) (new @t[map]) () y)
    );
  transform(t) 
    (fun _ a -> Printf.printf "%s\n" a) 
    (fun _ -> function `B -> Printf.printf "`B\n") 
    (new print) 
    () 
    x
