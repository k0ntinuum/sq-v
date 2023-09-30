fn (mut s System) encrypt(p []Glyph) []Glyph {
	k := 512
	mut c:= []Glyph{}
	s.spin(0)
	c = s.flicker_encode(p).clone()
	s.spin(k)
	c = s.flicker_encode(c).clone()
	s.spin(2*k)
	c = s.flicker_encode(c).clone()
	return c
}

fn (mut s System) decrypt(c []Glyph) []Glyph {
	k := 512
	s.state = s.perm_key.clone()
	s.key = s.perm_key.clone()
	mut p:= []Glyph{}
	s.spin(2*k)
	p = s.flicker_decode(c).clone()
	s.spin(k)
	p = s.flicker_decode(p).clone()
	s.spin(0)
	p = s.flicker_decode(p).clone()
	return p
}

fn (mut s System) spin(i int) {
	s.reset()
	for _ in 0..i {
		s.key[mod(i,s.width)] = mod( s.state[mod(i,s.width)],s.symbols)
		s.roll() 
	}
}