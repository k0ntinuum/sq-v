fn (mut s System) original_encode(p []Glyph) []Glyph {
	s.state = s.perm_key.clone()
	s.key = s.perm_key.clone()
	mut c:= []Glyph{}
	//x := 0
	for i in 0..p.len {
		for _ in 0..s.depth {s.roll()}
		x := s.key[mod(i,s.width)]
		c << mod(s.state[x] + p[i], s.symbols)
		s.state[x] = p[i]
	}
	return c

}

fn (mut s System) original_decode(c []Glyph) []Glyph {
	s.state = s.perm_key.clone()
	s.key = s.perm_key.clone()
	mut d:= []Glyph{}
	//x := 0
	for i in 0..c.len {
		for _ in 0..s.depth {s.roll()}
		x := s.key[mod(i,s.width)]
		d << mod(c[i] - s.state[x], s.symbols)
		s.state[x] = d[i]
	}
	return d
}

