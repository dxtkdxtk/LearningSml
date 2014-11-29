fun compose(f, g) = fn x => f(g x)

val sqrt_of_abs = Math.sqrt o Real.fromInt o abs

val a = sqrt_of_abs 2

val sorted = fn x => fn y => fn z => z >= y andalso y >= x

val t1 = sorted 7 9 11

fun sorted2 x y z = z >= y andalso y >= x

val t2 = sorted2 1 2 3

fun fold f acc xs = 
  case xs of 
    [] => acc
    | x::xss => fold f (f(acc, x)) xss

fun sum xs = fold (fn (x, y) => x + y) 0 xs

val S = sum [1,2,3,4,5]

