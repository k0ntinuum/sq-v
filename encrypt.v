fn (mut s System) encrypt(p []Glyph, r int) []Glyph {
	mut c:= []Glyph{}
	c = p.clone()
	print_block_vector(c)
	for i in 0..r {
		s.spin(i)
		c = s.flicker_encode(c).clone()
		c.reverse_in_place()
		print_block_vector(c)
	}
	return c
}

fn (mut s System) decrypt(c []Glyph, r int) []Glyph {
	println("")
	mut p:= []Glyph{}
	p = c.clone()
	//print_block_vector(p)
	for i in 0..r {
		//s.spin(i)
		s.spin(r - i - 1)
		p.reverse_in_place()
		p = s.flicker_decode(p).clone()
		//print_block_vector(p)
		//print_glyph_vectors(s.state, s.key,0)
	}
	return p
}

fn (mut s System) spin(i int) {
	s.reset()
	for _ in 0..i * s.width {
		s.key[mod(i,s.width)] = mod( s.state[mod(i,s.width)] + s.key[mod(i,s.width)] ,s.symbols)
		s.roll() 
	}
}