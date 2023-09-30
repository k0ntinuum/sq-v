fn (mut s System) encode(p []Glyph) []Glyph {
	state := s.state
	key := s.key
	mut c:= []Glyph{}
	for i in 0..p.len {
		x := s.key[mod(i,s.width)]
		for _ in 0..s.depth + x {
			s.roll()
			print_glyph_vector(s.state)
		}
		c << mod(s.state[x] + p[i], s.symbols)
		//for _ in 0..i64(c[i]) {s.roll()}
		s.state[x] = p[i]
		s.key[mod(i,s.width)] = mod(p[i] + s.key[mod(i,s.width)],s.symbols)

		//for _ in 0..i64(c[i]) + x {s.roll()}
	}
	s.state = state
	s.key = key
	return c

}

fn (mut s System) decode(c []Glyph) []Glyph {
	state := s.state
	mut d:= []Glyph{}
	for i in 0..c.len {
		x := s.key[mod(i,s.width)]
		//for _ in 0..i64(c[i]) { s.roll() }
		for _ in 0..s.depth + x {
			s.roll()
			print_glyph_vector(s.state)
		}
		d << mod(c[i] - s.state[x], s.symbols)
		s.state[x] = d[i]
		s.key[mod(i,s.width)] = mod(d[i] + s.key[mod(i,s.width)],s.symbols)
		//for _ in 0..i64(c[i]) + x {s.roll()}
	}
	s.state = state
	return d
}