fn (mut s System) roll_encode(p []Glyph) []Glyph {
	s.state = s.perm_key.clone()
	s.key = s.perm_key.clone()
	mut c:= []Glyph{}
	for i in 0..p.len {
		x := s.key[mod(i,s.width)]
		//for _ in 0..s.depth + x {
		for _ in 0..x + 2 {
			s.roll()
			print_glyph_vector(s.state)
		}
		c << mod(s.state[x] + p[i], s.symbols)
		s.state[x] = p[i]
		s.key[mod(i,s.width)] = mod(p[i] + s.key[mod(i,s.width)],s.symbols)

		for _ in 0..i64(c[i]) + x {s.roll()}
	}
	return c

}

fn (mut s System) roll_decode(c []Glyph) []Glyph {
	s.state = s.perm_key.clone()
	s.key = s.perm_key.clone()
	mut d:= []Glyph{}
	for i in 0..c.len {
		x := s.key[mod(i,s.width)]
		//for _ in 0..s.depth + x {
		for _ in 0..x + 2 {
			s.roll()
			print_glyph_vector(s.state)
		}
		d << mod(c[i] - s.state[x], s.symbols)
		s.state[x] = d[i]
		s.key[mod(i,s.width)] = mod(d[i] + s.key[mod(i,s.width)],s.symbols)
		for _ in 0..i64(c[i]) + x {s.roll()}
	}
	return d
}