fn test_encode() {
		for i in 0..1 {
			mut s := square_system(2,5)
			p := random_i64_vector(4,2)
			c := s.encode(p)
			d := s.decode(c)
			print_glyph_vector(p)
			print_glyph_vector(c)
			//print_glyph_vector(d)
			if same(p,c) {
				println("FAILURE at ${i}") 
				exit(0)
			}
			println("")
		}

}

fn same(x []Glyph, y []Glyph) bool {
	if x.len != y.len {
		return false
	}
	for i in 0..x.len {
		if x[i] != y[i] { return false}
	}
	return true
}
