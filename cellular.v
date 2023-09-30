import math
fn (system System) cell_code(i i64) i64 {
	mut sum := i64(0)
	w := system.width
	h := system.hood
	a := i64(system.symbols)
	s := i - h/2
	mut x := i64(0)
	for k in 0..h  {
		x = mod( s + k, w)
		sum += math.powi(a,h - 1 - k)*system.state[x]
	}
	return sum
}



fn mod( x i64, m i64) i64 {
	mut y := x
	for y > m - 1 { y -= m }
	for y < 0 { y += m }
	return y
}
