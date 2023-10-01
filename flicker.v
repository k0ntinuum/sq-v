fn (mut s System) flicker_encode(p []Glyph) []Glyph {
	// s.state = s.perm_key.clone()
	// s.key = s.perm_key.clone()

	mut c:= []Glyph{}
	//println("")
	//print_glyph_vectors(s.state, s.key,0)
	for i in 0..p.len {
		s.roll()
		c << mod(s.state[0] + p[i], s.symbols)
		x := s.state[mod(i,s.width)]
		s.key[mod(i,s.width)] = mod(c[i] + p[i] + s.key[mod(i,s.width)],s.symbols)
		s.state[mod(i,s.width)] =  mod(s.state[mod(i,s.width)] + p[i],s.symbols)
		//s.state[mod(i,s.width)] = p[i]
		//print_glyph_vectors(s.state, s.key,int(mod(i,s.width)))
	}
	// s.state = s.perm_key.clone()
	// s.key = s.perm_key.clone()
	return c
}

fn (mut s System) flicker_decode(c []Glyph) []Glyph {
	// s.state = s.perm_key.clone()
	// s.key = s.perm_key.clone()
	mut p:= []Glyph{}
	//println("D")
	//print_glyph_vectors(s.state, s.key,0)
	for i in 0..c.len {
		s.roll()
		p << mod(c[i] - s.state[0], s.symbols)
		x := s.state[mod(i,s.width)]
		s.key[mod(i,s.width)] = mod(c[i] + p[i] + s.key[mod(i,s.width)],s.symbols)
		s.state[mod(i,s.width)] =  mod(s.state[mod(i,s.width)] + p[i],s.symbols)
		//s.state[mod(i,s.width)] = p[i]
		//print_glyph_vectors(s.state, s.key,int(mod(i,s.width)))
	}
	// s.state := state
	// s.key := key
	return p
}