fn test_encode() {
	text_length := 32
	symbols := 2
	hood := 7
	rounds := 16

		for i in 0..1 {
			mut s := square_system(symbols,hood)
			p := random_i64_vector(text_length,u64(symbols))
			// c := s.encode(p)
			// d := s.decode(c)
			// c := s.original_encode(p)
			// d := s.original_decode(c)
			
			// c := s.flicker_encode(p)
			// d := s.flicker_decode(c)
			c := s.encrypt(p,rounds)
			d := s.decrypt(c,rounds)
			println("")
			print_glyph_vector(s.key)
			println("")
			print_glyph_vector(p)
			print_glyph_vector(c)
			print_glyph_vector(d)
			print("${same(p,c):-4 }/${text_length:4}")

			if same(p,c) == text_length {
				println("\nFAILURE at ${i}") 
				exit(0)
			}
			println("")
		}

}

fn same(x []Glyph, y []Glyph) int {
	mut count := 0
	if x.len != y.len {
		return -1
	}
	for i in 0..x.len {
		if x[i] == y[i] { count += 1 }
	}
	return count
}
