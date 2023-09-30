import math
struct System {
	pub:
	
	width i64
	hood i64
	symbols i64
	depth i64
	mut:
	key []i64
	state []i64
	head i64
	
}
fn square_system( symbols i64, hood i64) System {
	mut s := System{
		
		width : math.powi(i64(symbols), hood)
		hood : hood
		symbols: symbols
		depth: math.powi(i64(symbols), hood)
		key : random_i64_vector(math.powi(i64(symbols), hood), u64(symbols))
		state : random_i64_vector(math.powi(i64(symbols), hood), u64(symbols))
		head : 0
	}
	s.state  = s.key
	return s
}

fn (system System) print_state() {
	print_glyph_vector(system.state)
} 
fn (system System) print_key() {
	print_glyph_vector(system.key)
}

// fn (mut system System) roll() {
// 	mut v := []Glyph{}
// 	for i in 0..system.state.len {
// 		v << system.key[system.cell_code(i)]
// 	}
// 	system.state = v
// }

fn (mut system System) roll() {
	mut v := []Glyph{}
	for i in 0..system.state.len {
		v << system.key[system.cell_code(i)]
	}
	system.state = v
}



fn (mut s System) demo(n int) {
	s.print_state()
	for _ in 0..n {
		s.roll()
		s.print_state()
	}
	print("\n")
}

fn (mut s System) square_demo() {
	s.print_key()
	print("\n")
	s.print_state()
	for _ in 0..s.depth {
		s.roll()
		s.print_state()
	}
	print("\n")
}
